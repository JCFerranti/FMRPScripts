#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               #
#Ribeirao Preto,16 de janeiro de 2007                                                                                                                                         #
#versao 1.0                                                                                                                                                                                       #
# A teoria parao desenvolvimento desta ferramenta foi retirada da tese de doutorado de Andr� Luiz Mendes Matos        #
# "Cria��o de um mapa voxel por voxel da distribui��o espacial da transferencia de magnetiza��o na suabst�ncia          #
#                                                     Branca do c�rebro humano de adultos normais"                                                                    #
#                                                   							                                                                           #
#                                                    - An�lise do histograma do MTR da subst�ncia branca e cinzenta                                       #
#                                                    - An�lise Golobal - mapas: m�dia, desvio padr�o, z-score                                                      #
#####################################################################
#@NAME       : DEMMT.pl
#@INPUT      : 
#@OUTPUT     : mapa_medio_MTR.mnc,mapa_medio_white_matter.mnc,mapa_medio_gray_matter.mnc,<mrs_id>_mt.mnc, and <mrs_id>_nnr.txt
#@RETURNS    : 
#@DESCRIPTION: Cria��o de um mapa voxel por voxel da distribui��o espacial da transferencia de magnetiza��o na suabst�ncia Branca do c�rebro humano.

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************


print "\n*********************************************************************\n";

print "\n Iniciando Processo...\n";
print "\n-- Por favor aguarde --\n";

@pastas = glob("./*");
$NomePastaAnter="";
$teste = @pastas ;
$contador=0;
mkdir("analise_da_amostra");
while($contador != $teste)
{
  $arquivo = $pastas[0];
  $Start = index($arquivo,"./") + 2;
  $NomePasta = substr($arquivo,$Start);
  if($NomePasta ne $NomePastaAnter)
  {  
	print "\n ======================================================================= \n";
    print "O nome do paciente eh: ".$NomePasta."\n";
	&Processamento;
	$sh->mv(" $arquivo/".$PrimNome."_".$ano.$mes.$dia."_mttoicm.mnc ./analise_da_amostra");
	#$sh->mv(" $arquivo/".$PrimNome."_".$ano.$mes.$dia."_mt_nonbackground.mnc ./analise_da_amostra");
	$sh->mv(" $arquivo/".$PrimNome."_".$ano.$mes.$dia."_mtwhitetoicm.mnc ./analise_da_amostra");
	$sh->mv(" $arquivo/".$PrimNome."_".$ano.$mes.$dia."_mtgraytoicm.mnc ./analise_da_amostra");
      
  }   
  $NomePastaAnter = $NomePasta;
  shift(@pastas ); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
  
 }

open(RELATDADOS, "> dados_Relaxo_MT_WM.txt");
    $tam =@nomes;
	print RELATDADOS " ,Relaxo, , MT,,Dpara,,Dperp \r";
    print RELATDADOS "nome,Media,Desvio Padr�o, Media, Desvio Padr�o,Media, Desvio Padr�o, Media, Desvio Padr�o \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$mediasrelaxoWM[$c].",".$desviorelaxoWM[$c].",".$mediasmtWM[$c].",".$desviomtWM[$c].",".$mediasDparaWM[$c].",".$desvioDparaWM.",".$mediasDperpWM[$c].",".$desvioDperpWM."\r";
	  $c=$c+1;
	}
open(RELATDADOS, "> dados_Relaxo_MT_GM.txt");
    $tam =@nomes;
	print RELATDADOS " ,Relaxo, , MT \r";
    print RELATDADOS "nome,Media,Desvio Padr�o, Media, Desvio Padr�o \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$mediasrelaxoGM[$c].",".$desviorelaxoGM[$c].",".$mediasmtGM[$c].",".$desviomtGM[$c]."\r";
	  $c=$c+1;
	}
open(RELATDADOS, "> dados_Relaxo_MT_Lt.txt");
    $tam =@nomes;
	print RELATDADOS " ,Relaxo, , MT ,,Dpara,,Dperp \r";
    print RELATDADOS "nome,Media,Desvio Padr�o, Media, Desvio Padr�o,Media, Desvio Padr�o, Media, Desvio Padr�o \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$mediasrelaxoLt1[$c].",".$desviorelaxoLt1[$c].",".$mediasmtLt1[$c].",".$desviomtLt1[$c].",".$mediasDparaL[$c].",".$desvioDparaL.",".$mediasDperpL[$c].",".$desvioDperpL."\r";
	  $c=$c+1;
	}	
	
&analise_global;
#=============================================================================
sub Processamento
{print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
  print "\n\n".$pastas[0]."\n\n";
 @d1 = glob("./*_0_mpr.mnc.gz");
 $file = $d1[0];
 $sh->mincheader(" $file > mincheader.txt ");
 $linha = $sh->grep(" dicom_0x0008:el_0x0020 mincheader.txt");
  $te1 = substr($linha,rindex($linha,"=")+2);
  $Stop = rindex($te1,'"');
  $te = substr($te1,0,$Stop);
  $start = index($te,'"')+1;
  $stop = index($te,'"')+4;
  $ano = substr($te,$start,$stop);
  $Start = index($te,'"')+5;
  $Stop = index($te,$ano)+1;
  $mes = substr($te,$Start,$Stop);
  $start = index($te,'"')+7;
  $stop = index($te,'"')+9;
  $dia = substr($te,$start,$stop);
 
 $Stop = index($NomePasta,"_");
 $NomePaciente = substr($NomePasta,0,$Stop);
 $Stop = index($NomePasta,"_".$ano);
 $PrimNome = substr($NomePasta,0,$Stop);
 $sh->rm(" mincheader.txt");
 
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 print "\n\n Primeiro nome: $PrimNome \n\n";
  print "\n\n".$pastas [0]."\n\n";
#******************************Processamento das imegens********************************
  
  print"\n\n Iniciando Processamento...\n\n";
  
#**************************************************************************************
  #---> Gerando a Imagem de MTR
  print"\n\n 1� etapa de 6) MTR...\n\n";
  $sh-> mincmath(" -const2 1 1.99 -segment ".$NomePaciente."_classified_s_lesao.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_licor.mnc");#-bas
  #$sh-> mincmath(" -const2 2 2 -segment ".$NomePaciente."_classified_s_lesao.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_background.mnc");
  $sh-> mincmath(" -const2 16 999999 -nsegment ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_background.mnc");
  $sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_0_licor.mnc ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_licor2d1.xfm");
  #$sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_0_background.mnc ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_back2d1.xfm"); 
  $sh->mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_0_licor.mnc ".$PrimNome."_".$ano.$mes.$dia."_licor2d1.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transformation ".$PrimNome."_".$ano.$mes.$dia."_licor2d1.xfm");
  $sh->mincstats(" -max ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_background.mnc -mask_binvalue 1 > info_back.txt");
  $sh->mincstats(" -min ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_licor2d1.mnc -mask_binvalue 1 > info_licor.txt");

  
  $tag1 = $sh->grep(" Max info_back.txt");
  $temp1 = substr($tag1,rindex($tag1,":")+16);
  $max = substr($temp1,0,rindex($temp1," "));
  print "\n Max: ".$max."\n";
 
 $tag1 = $sh->grep(" Min info_licor.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+16);
 $min = substr($temp1,0,rindex($temp1," "));
 #$min = 8;
 print "\n min: ".$min."\n";
 
 $ruido = ($max+$min)/2;
  $sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.xfm");
  $sh->mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transformation ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.xfm");
  
  $sh->mincmath(" -pd -const ".$ruido." ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
 
 print"\n\n 2� etapa de 6) Obtendo m�scaras de subst�ncia branca e da subst�ncia cinzenta...\n\n";
 $sh-> mincmath(" -const2 3 3.99 -segment ".$NomePaciente."_classified_s_lesao.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc");
 #Mascara de subst�ncia cinzenta
 $sh-> mincmath(" -const2 2 2.99 -segment ".$NomePaciente."_classified_s_lesao.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc");

 # eros�o
 #print"\n\n 3� etapa de 6) Erodindo m�scaras...\n\n";
 #$sh->mincmorph(" -erosion ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_erosion_white_matter.mnc");
# $sh->mincmorph(" -erosion ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_erosion_gray_matter.mnc");
 
 #coregistro 
 print"\n\n 4� etapa de 6) Fazendo o coregistro das m�scaras com a imagem de MTR...\n\n";
 $sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerW.xfm");
 $sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerG.xfm"); 
 $sh->mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerw.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc -transformation ".$PrimNome."_".$ano.$mes.$dia."_mttoerW.xfm");
 $sh->mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerg.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc -transformation ".$PrimNome."_".$ano.$mes.$dia."_mttoerG.xfm");
 
 #segmenta��o
 print"\n\n 5� etapa  de 6) Segmentando...\n\n";
 $sh->mincmath(" -mult ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerw.mnc ".$PrimNome."_".$ano.$mes.$dia."_seg_white_mt.mnc");   
 $sh->mincmath(" -mult ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerg.mnc ".$PrimNome."_".$ano.$mes.$dia."_seg_gray_mt.mnc");
 #$sh->gunzip(" ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes.mnc.gz");
 #extra��o de dados e o histograma do MT das subst�ncia cinzenta e branca
 print"\n\n 6� etapa  de 6) Extraindo informa��es das imagens...\n\n";
 $sh->mincstats(" -integer_histogram -histogram ".$PrimNome."_".$ano.$mes.$dia."_histogram_white_matter.txt ".$PrimNome."_".$ano.$mes.$dia."_seg_white_mt.mnc > ".$PrimNome."_".$ano.$mes.$dia."_info_white_matter.txt");
 $sh->mincstats(" -integer_histogram -histogram ".$PrimNome."_".$ano.$mes.$dia."_histogram_gray_matter.txt ".$PrimNome."_".$ano.$mes.$dia."_seg_gray_mt.mnc > ".$PrimNome."_".$ano.$mes.$dia."_info_gray_matter.txt");
 #*************************************************************
#linear
 $sh->mritotal(" -verbose -nonlinear ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d1_nl.xfm");
 
 $sh-> mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoicm.mnc -like /usr/local/mni/share/mni_autoreg/average_305.mnc -transformation ".$PrimNome."_".$ano.$mes.$dia."_d1_nl.xfm");
 #white===============================================================================
 
 $sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz /usr/local/mni/share/mni_autoreg/average_305.mnc ".$PrimNome."_".$ano.$mes.$dia."_d1_ln.xfm");
 $sh->mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d1_ln.mnc -like /usr/local/mni/share/mni_autoreg/average_305.mnc -transformation ".$PrimNome."_".$ano.$mes.$dia."_d1_ln.xfm");
 
  $sh->minctracc(" -nonlinear -source_lattice -identity -est_center ".$PrimNome."_".$ano.$mes.$dia."_d1_ln.mnc /usr/local/mni/share/mni_autoreg/average_305.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt_parte1.xfm");    
 $sh-> mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_d1_ln.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt_parte1.mnc -like /usr/local/mni/share/mni_autoreg/average_305.mnc -transformation ".$PrimNome."_".$ano.$mes.$dia."_mt_parte1.xfm");

 $sh->minctracc(" -nonlinear -source_lattice -identity -est_center ".$PrimNome."_".$ano.$mes.$dia."_mt_parte1.mnc /usr/local/mni/share/mni_autoreg/average_305.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt_parte3.xfm");    
 $sh-> mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_mt_parte1.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt_parte3.mnc -like /usr/local/mni/share/mni_autoreg/average_305.mnc -transformation ".$PrimNome."_".$ano.$mes.$dia."_mt_parte3.xfm");
 
 $sh->minctracc(" -nonlinear -source_lattice -identity -est_center ".$PrimNome."_".$ano.$mes.$dia."_mt_parte3.mnc /usr/local/mni/share/mni_autoreg/average_305.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt_parte4.xfm");    

 $sh-> mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_seg_white_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_mtwhitetoicm.mnc -like /usr/local/mni/share/mni_autoreg/average_305.mnc -transformation ".$PrimNome."_".$ano.$mes.$dia."_mt_parte4.xfm");
 $sh-> mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_seg_gray_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_mtgraytoicm.mnc -like /usr/local/mni/share/mni_autoreg/average_305.mnc -transformation ".$PrimNome."_".$ano.$mes.$dia."_mt_parte4.xfm"); 
 print "\n\n".$pastas[0]."\n\n";
 
 print"\n\n Gerando Difus�o...\n\n";
	 print "\n\n".$pastas[0]."\n\n";
	 print"\n\n 1� Passo) Iniciando Dparaeperp_main...\n\n";
     #require "/usr/local/mni/scripts/Dparaeperp_main.pl";
     #&main; 
	  ###############################################################
	print"\n\n Iniciando Dparaeperp...\n\n";
 #Vari�veis Globais
 #vari�veis dependentes da sequencia!Em caso de mudan�a de protocolo verificar
 $RSfa = 0.24169922;
 $RSd=0.93925461173;
 $RI = 0;
 
 print"\n\n obtendo imagens...\n\n";
 
 @dMap = glob("./*_dMap.mnc.gz");
 @faMap = glob("./*_faMap.mnc.gz");
 $sh->gunzip($dMap[0]);
 $sh->gunzip($faMap[0]);
 @dMap = glob("./*_dMap.mnc");
 @faMap = glob("./*_faMap.mnc");
 
 print "\n\n Normaliza��o das imagens...((DIso e FA) = (Valor na imagem * RS + RI)/1000)\n\n";
	
	print "\n\nNormalizando o dMap\n";
	 $sh->mincmath(" -const ".$RSd." -mult ".$dMap[0]." dMap_mult.mnc");
	 $sh->mincmath(" -const ".$RI." -add dMap_mult.mnc dMap_add.mnc");
	 $sh->mincmath(" -const 1000 -div dMap_add.mnc dMap_normalizada.mnc");
	 $sh->rm("dMap_mult.mnc");
	 $sh->rm("dMap_add.mnc");
	 
	print "\n\n Normalizando o faMap\n";
	 $sh->mincmath(" -const ".$RSfa." -mult ".$faMap[0]." faMap_mult.mnc");
	 $sh->mincmath(" -const ".$RI." -add faMap_mult.mnc faMap_add.mnc");
	 $sh->mincmath(" -const 1000 -div faMap_add.mnc faMap_normalizada.mnc");
	 $sh->rm("faMap_mult.mnc");
	 $sh->rm("faMap_add.mnc");
	
print "\n\n Difus�o Perpendicular (Dperp=Diso.*(1-FA./sqrt(3-2*FA.^2));)\n\n";
	# Calculo da equa��o((1-FA/sqrt(3-2*FA.^2))
	#Calculo do  termo (sqrt(3-2*FA.^2))	
		#FA.^2
		$sh->mincmath("-square faMap_normalizada.mnc fa_exp.mnc");
		#2*FA.^2
		$sh->mincmath("-const 2 -mult fa_exp.mnc 2_fa_exp.mnc");
		#3-(2*FA.^2)
		$sh->mincmath("-const 3 -sub 2_fa_exp.mnc 3_2_fa_exp1.mnc");
		$sh->mincmath("-const -1 -mult 3_2_fa_exp1.mnc 3_2_fa_exp.mnc");
		#sqrt(3-2*FA.^2)	
		$sh->mincmath("-sqrt 3_2_fa_exp.mnc sqrt_3_2_fa_exp.mnc");
	
	$sh->rm("fa_exp.mnc");
	$sh->rm("2_fa_exp.mnc");
	$sh->rm("3_2_fa_exp1.mnc");
	$sh->rm("3_2_fa_exp.mnc");
	
	#fa/sqrt(3-2*FA.^2)
    $sh->mincmath(" -div faMap_normalizada.mnc sqrt_3_2_fa_exp.mnc result.mnc");
	#(1-FA./sqrt(3-2*FA.^2))
	$sh->mincmath("-const 1 -sub result.mnc result2.mnc");
    #Calculo da  Dperp
	$sh->mincmath("-mult dMap_normalizada.mnc result2.mnc result3.mnc");
	$sh->mincmath("-const -1 -mult result3.mnc Dperp.mnc");
	
	$sh->rm("sqrt_3_2_fa_exp.mnc");
	$sh->rm("result.mnc");
	$sh->rm("result2.mnc");
	$sh->rm("result3.mnc");
	
	print "\n\n Difus�o paralela (Dpara=3*Diso-2*Dperp) \n\n";
    #3*dMap
	$sh->mincmath("-const 3 -mult dMap_normalizada.mnc 3_dmap.mnc");
	#2*Dperp
	$sh->mincmath("-const 2 -mult Dperp.mnc 2_dperp.mnc");
	#Dpara
	$sh->mincmath("-sub 3_dmap.mnc 2_dperp.mnc Dpara.mnc");
    
	$sh->rm("3_dmap.mnc");
	$sh->rm("2_dperp.mnc");
		
	$sh->gzip("Dpara.mnc");
	$sh->gzip("Dperp.mnc");
print"\n\n Trabalho finalizado...\n\n";
 ###############################################################
	 
	 $sh->rm(" *.xfm");
	 $sh->rm(" *grid_0.mnc");
	 #relaxo
	 $sh->mkdir(" Analise_mt_relaxo");
	
	print "\n\n".$pastas[0]."\n\n";

	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
	 $sh->mv(" ./Dperp.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_Dperp.mnc.gz");
	 $sh->mv(" ./Dpara.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_Dpara.mnc.gz");
     $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e1.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e1.mnc.gz");
	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e2.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e2.mnc.gz");
	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e3.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e3.mnc.gz");
	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e4.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e4.mnc.gz");
	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e5.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e5.mnc.gz");
	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc");
	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc");
	 $sh->mv(" ./".$NomePaciente."_0_lesoes.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_lesoes.mnc.gz");

  	 chdir("Analise_mt_relaxo");
	 print"\n\n Gerando Relaxo...\n\n";
	 print "\n\n".$pastas[0]."\n\n";
	 #print"\n\n 1� Passo) Iniciando RelaxoN...\n\n";
     #require "/usr/local/mni/scripts/relaxon.pl";
     #&main; 
     #$sh->mv(" relaxom.mnc ./".$PrimNome."_relaxo.mnc");
     #$sh->mv(" density.mnc ./".$PrimNome."_density.mnc"); 
     $sh->gzip(" *.mnc");
	 print "\n\n".$pastas[0]."\n\n";
# An�lises MT e Relaxo 
  print"\n\n Obtendo dados do MT...\n\n";
#Subtsancia branca
  
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter ".$PrimNome."_".$ano.$mes.$dia."_mt ");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_WM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_WM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter_res.mnc.gz");
  
  #Dparalelo
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter ".$PrimNome."_Dpara ");
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_WM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_Dpara_WM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter_res.mnc.gz");
  
  #Dperpendicular
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter ".$PrimNome."_Dperp ");
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_WM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_Dperp_WM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter_res.mnc.gz"); 
  
  push(@mediasmtWM,$media_mt_WM);
  
  push(@desviomtWM,$desvio_mt_WM);
  
  push(@mediasDparaWM,$media_Dpara_WM);
  push(@mediasDperpWM,$media_Dperp_WM);
  push(@desvioDparaWM,$desvio_Dpara_WM);
  push(@desvioDperpWM,$desvio_Dperp_WM);
 
 
 
 #Subtsancia cinzenta
  
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter ".$PrimNome."_".$ano.$mes.$dia."_mt ");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_GM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_GM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter_res.mnc.gz");
  
 
  push(@mediasmtGM,$media_mt_GM);
 
  push(@desviomtGM,$desvio_mt_GM);

  $sh->rm(" *_res.mnc.gz"); 
   
   #lesoes_t1
 
 
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes ".$PrimNome."_".$ano.$mes.$dia."_mt");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_Lt1 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_Lt1 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_res.mnc.gz");
  
  #Dparalelo
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes ".$PrimNome."_Dpara ");
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_L = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_Dpara_L = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_res.mnc.gz");
  
  #Dperpendicular
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes ".$PrimNome."_Dperp ");
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_L = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_Dperp_L = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_res.mnc.gz"); 
  
 
  push(@mediasmtLt1,$media_mt_Lt1);
 
  push(@desviomtLt1,$desvio_mt_Lt1);
    
  push(@mediasDparaL,$media_Dpara_L);
  push(@mediasDperpL,$media_Dperp_L);
  push(@desvioDparaL,$desvio_Dpara_L);
  push(@desvioDperpL,$desvio_Dperp_L);
  chdir("..");

  chdir(".."); 

}

sub analise_global
{
 chdir("analise_da_amostra");
 print"\n-- An�lise da Amostra --\n";
 print"Processando ...................";
 #@lista_de_arq_mt = glob("./*_mt_nonbackground.mnc");
 @lista_de_arq_mt = glob("./*_mttoicm.mnc");
 $linha_mtr = join(" ",@lista_de_arq_mt);
 #$sh->mincaverage(" -sdfile DesvPad_MTR.mnc ".$linha_mtr." mapa_medio_MTR.mnc");
 $sh->minccalc(" -expfile /bin/average.exp ".$linha_mtr." mapa_medio_MTR.mnc");
 @lista_de_arq_white = glob("./*_mtwhitetoicm.mnc");
 $linha_white = join(" ",@lista_de_arq_white);
 #$sh->mincaverage(" -sdfile DesvPad_white_matter.mnc ".$linha_white." mapa_medio_white_matter.mnc");
 $sh->minccalc(" -expfile /bin/average.exp ".$linha_white." mapa_medio_white_matter.mnc");
 
 @lista_de_arq_gray = glob("./*_mtgraytoicm.mnc");
 $linha_gray = join(" ",@lista_de_arq_gray);
 #$sh->mincaverage(" -sdfile DesvPad_white_matter.mnc ".$linha_white." mapa_medio_white_matter.mnc");
 $sh->minccalc(" -expfile /bin/average.exp ".$linha_gray." mapa_medio_gray_matter.mnc");

 $sh-> mincmath(" -const2 0 1 -nsegment mapa_medio_white_matter.mnc mapa_white_bin.mnc");
 $sh->mincstats(" -mean -stddev -floor 5 mapa_medio_MTR.mnc -mask mapa_white_bin.mnc -mask_binvalue 1 > dados.txt");
 $tag = $sh->grep(" Mean dados.txt");
 $temp = substr($tag,rindex($tag,":")+15);
 $media = substr($temp,0,rindex($temp," "));
 print "\n media: ".$media;
 
 $sh-> mincmath(" -const2 0 1 -nsegment mapa_medio_gray_matter.mnc mapa_gray_bin.mnc");
 $sh->mincstats(" -mean -stddev -floor 5 mapa_medio_MTR.mnc -mask mapa_gray_bin.mnc -mask_binvalue 1 > dados2.txt");
 $tag = $sh->grep(" Mean dados2.txt");
 $temp = substr($tag,rindex($tag,":")+15);
 $media2 = substr($temp,0,rindex($temp," "));
 print "\n media: ".$media2;
 
 $tag = $sh->grep(" Stddev dados.txt");
 $temp = substr($tag,rindex($tag,":")+13);
 $stddev = substr($temp,0,rindex($temp," "));
 print "\n stddev: ".$stddev."\n";
 
 $tag = $sh->grep(" Stddev dados2.txt");
 $temp = substr($tag,rindex($tag,":")+13);
 $stddev2 = substr($temp,0,rindex($temp," "));
 print "\n stddev2: ".$stddev2."\n";
 
 open(RELATDADOS, "> dados_analise");
 print RELATDADOS "m�dia = $media\r";
 print RELATDADOS "desvio_padr�o = $stddev\r";
 #Mapa z-score
 $sh->mincmath(" -const ".$media." -sub mapa_medio_MTR.mnc numerador_w.mnc");
 $sh->mincmath(" -const ".$media2." -sub mapa_medio_MTR.mnc numerador_g.mnc");
 $sh->mincmath(" -const ".$stddev." -div numerador_w.mnc z-score_white.mnc");
 $sh->mincmath(" -const ".$stddev2." -div numerador_g.mnc z-score_gray.mnc");
 $sh->rm("numerador_w.mnc");
 $sh->rm("numerador_g.mnc");
 $sh->mincstats(" -integer_histogram -histogram histogram_mapa_medio.txt mapa_medio_MTR.mnc > info_mapa_medio.txt");
 $sh->mincstats(" -integer_histogram -histogram histogram_mean_white_matter.txt mapa_medio_white_matter.mnc > info_mean_white_matter.txt");
 $sh->mincstats(" -integer_histogram -histogram histogram_mean_gray_matter.txt mapa_medio_gray_matter.mnc > info_mean_gray_matter.txt"); 
 
 $sh->gzip(" *.mnc");
 print "\n PROCESSAMENTO FINALIZADO \n";
 
 chdir("..");
}

