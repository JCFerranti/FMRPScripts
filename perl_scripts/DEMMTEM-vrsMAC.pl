#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               #
#Ribeirao Preto,16 de janeiro de 2007                                                                                                                                         #
#versao 1.0                                                                                                                                                                                       #
# A teoria parao desenvolvimento desta ferramenta foi retirada da tese de doutorado de André Luiz Mendes Matos        #
# "Criação de um mapa voxel por voxel da distribuição espacial da transferencia de magnetização na suabstância          #
#                                                     Branca do cérebro humano de adultos normais"                                                                    #
#                                                   							                                                                           #
#                                                    - Análise do histograma do MTR da substância branca e cinzenta                                       #
#                                                    - Análise Golobal - mapas: média, desvio padrão, z-score                                                      #
#####################################################################
#@NAME       : DEMMT.pl
#@INPUT      : 
#@OUTPUT     : mapa_medio_MTR.mnc,mapa_medio_white_matter.mnc,mapa_medio_gray_matter.mnc,<mrs_id>_mt.mnc, and <mrs_id>_nnr.txt
#@RETURNS    : 
#@DESCRIPTION: Criação de um mapa voxel por voxel da distribuição espacial da transferencia de magnetização na suabstância Branca do cérebro humano.

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
	print RELATDADOS " ,Relaxo, , MT \r";
    print RELATDADOS "nome,Media,Desvio Padrão, Media, Desvio Padrão \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$mediasrelaxoWM[$c].",".$desviorelaxoWM[$c].",".$mediasmtWM[$c].",".$desviomtWM[$c]."\r";
	  $c=$c+1;
	}
open(RELATDADOS, "> dados_Relaxo_MT_GM.txt");
    $tam =@nomes;
	print RELATDADOS " ,Relaxo, , MT \r";
    print RELATDADOS "nome,Media,Desvio Padrão, Media, Desvio Padrão \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$mediasrelaxoGM[$c].",".$desviorelaxoGM[$c].",".$mediasmtGM[$c].",".$desviomtGM[$c]."\r";
	  $c=$c+1;
	}
	
open(RELATDADOS, "> dados_Relaxo_MT_Lt1.txt");
    $tam =@nomes;
	print RELATDADOS " ,Relaxo, , MT \r";
    print RELATDADOS "nome,Media,Desvio Padrão, Media, Desvio Padrão \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$mediasrelaxoLt1[$c].",".$desviorelaxoLt1[$c].",".$mediasmtLt1[$c].",".$desviomtLt1[$c]."\r";
	  $c=$c+1;
	}
	
open(RELATDADOS, "> dados_Relaxo_MT_Lt2.txt");
    $tam =@nomes;
	print RELATDADOS " ,Relaxo, , MT \r";
    print RELATDADOS "nome,Media,Desvio Padrão, Media, Desvio Padrão \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$mediasrelaxoLt2[$c].",".$desviorelaxoLt2[$c].",".$mediasmtLt2[$c].",".$desviomtLt2[$c]."\r";
	  $c=$c+1;
	}
	
&analise_global;
#=============================================================================
sub Processamento
{print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
  print "\n\n".$pastas[0]."\n\n";
 @d1 = glob("./*_d1.mnc.gz");
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
  print"\n\n 1ª etapa de 6) MTR...\n\n";
  $sh-> mincmath(" -const2 1 2 -segment ".$PrimNome."_".$ano.$mes.$dia."_0_2003_02_14_bayes.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_licor.mnc");#-bas
  #$sh-> mincmath(" -const2 2 2 -segment ".$PrimNome."_".$ano.$mes.$dia."_0_2003_02_14_bayes.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_background.mnc");
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
 print "\n min: ".$min."\n";
 
 $ruido = ($max+$min)/2;
  $sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.xfm");
  $sh->mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transformation ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.xfm");
  #$sh->mincmath(" -pd -const ".$ruido." ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
  $sh->mincmath(" -pd -const ".$ruido." ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
 
 print"\n\n 2ª etapa de 6) Obtendo máscaras de substância branca e da substância cinzenta...\n\n";
 $sh-> mincmath(" -const2 4 4 -segment ".$PrimNome."_".$ano.$mes.$dia."_0_2003_02_14_bayes.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc");
 #Mascara de substância cinzenta
 $sh-> mincmath(" -const2 3 3 -segment ".$PrimNome."_".$ano.$mes.$dia."_0_2003_02_14_bayes.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc");
 $sh-> mincmath(" -const2 5 5 -segment ".$PrimNome."_".$ano.$mes.$dia."_0_2003_02_14_bayes.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t1.mnc");
 $sh-> mincmath(" -const2 6 6 -segment ".$PrimNome."_".$ano.$mes.$dia."_0_2003_02_14_bayes.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t2.mnc");
 # erosão
 print"\n\n 3ª etapa de 6) Erodindo máscaras...\n\n";
 $sh->mincmorph(" -erosion ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_erosion_white_matter.mnc");
 $sh->mincmorph(" -erosion ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_erosion_gray_matter.mnc");
 
 #coregistro 
 $sh->gzip(" ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc");
 $sh->gzip(" ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc");
 $sh->gzip(" ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
 print"\n\n 4ª etapa de 6) Fazendo o coregistro das máscaras com a imagem de MTR...\n\n";
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter ".$PrimNome."_".$ano.$mes.$dia."_mt");
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter ".$PrimNome."_".$ano.$mes.$dia."_mt");
 #segmentação
 print"\n\n 5ª etapa  de 6) Segmentando...\n\n";
 $sh->mincmath(" -mult ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter_res.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_seg_white_mt1.mnc");   
 $sh->mincmath(" -mult ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter_res.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_seg_gray_mt1.mnc");
 $sh->gunzip(" ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc.gz");
 $sh->gunzip(" ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc.gz");
 $sh->gunzip(" ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t1.mnc.gz");
 $sh->gunzip(" ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t2.mnc.gz");
 $sh->gunzip(" ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz");
 #extração de dados e o histograma do MT das substância cinzenta e branca
 print"\n\n 6ª etapa  de 6) Extraindo informações das imagens...\n\n";
 $sh->mincstats(" -integer_histogram -histogram ".$PrimNome."_".$ano.$mes.$dia."_histogram_white_matter.txt ".$PrimNome."_".$ano.$mes.$dia."_seg_white_mt1.mnc > ".$PrimNome."_".$ano.$mes.$dia."_info_white_matter.txt");
 $sh->mincstats(" -integer_histogram -histogram ".$PrimNome."_".$ano.$mes.$dia."_histogram_gray_matter.txt ".$PrimNome."_".$ano.$mes.$dia."_seg_gray_mt1.mnc > ".$PrimNome."_".$ano.$mes.$dia."_info_gray_matter.txt");
 #*************************************************************
 $sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_erosion_white_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerW.xfm");
 $sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_erosion_gray_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerG.xfm"); 
 $sh->mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerw.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_erosion_white_matter.mnc -transformation ".$PrimNome."_".$ano.$mes.$dia."_mttoerW.xfm");
 $sh->mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerg.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_erosion_gray_matter.mnc -transformation ".$PrimNome."_".$ano.$mes.$dia."_mttoerG.xfm");
 #segmentação
 print"\n\n 5ª etapa  de 6) Segmentando...\n\n";
 $sh->mincmath(" -mult ".$PrimNome."_".$ano.$mes.$dia."_erosion_white_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerw.mnc ".$PrimNome."_".$ano.$mes.$dia."_seg_white_mt.mnc");   
 $sh->mincmath(" -mult ".$PrimNome."_".$ano.$mes.$dia."_erosion_gray_matter.mnc ".$PrimNome."_".$ano.$mes.$dia."_mttoerg.mnc ".$PrimNome."_".$ano.$mes.$dia."_seg_gray_mt.mnc");
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
 
	 $sh->rm(" *.xfm");
	 $sh->rm(" *grid_0.mnc");
	 #relaxo
	 $sh->mkdir(" Analise_mt_relaxo");
	print "\n\n".$pastas[0]."\n\n";
	$sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_mt.mnc ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
     $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e1.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e1.mnc.gz");
     $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e2.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e2.mnc.gz");
	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc");
	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc");
	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t1.mnc ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t1.mnc");
	 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t2.mnc ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t2.mnc");
  	 chdir("Analise_mt_relaxo");
	 print"\n\n Gerando Relaxo...\n\n";
	 print "\n\n".$pastas[0]."\n\n";
	 print"\n\n 1° Passo) Iniciando RelaxoN...\n\n";
     require "/usr/local/mrs/scripts/relaxon.pl";
     &main; 
     $sh->mv(" relaxom.mnc ./".$PrimNome."_relaxo.mnc");
     $sh->mv(" density.mnc ./".$PrimNome."_density.mnc"); 
     $sh->gzip(" *.mnc");
	 print "\n\n".$pastas[0]."\n\n";
# Análises MT e Relaxo 
  print"\n\n Obtendo dados da Relaxo e do MT...\n\n";
 #Subtsancia branca
 $sh->res(" ".$PrimNome."_relaxo ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter");
 $sh->mincstats(" -mean ".$PrimNome."_relaxo_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_WM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_WM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_relaxo_res.mnc.gz");
 
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_mt ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_WM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_white_matter.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_WM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz");
  push(@mediasrelaxoWM,$media_relaxo_WM);
  push(@mediasmtWM,$media_mt_WM);
  push(@desviorelaxoWM,$desvio_relaxo_WM);
  push(@desviomtWM,$desvio_mt_WM);
  
 #Subtsancia cinzenta
 $sh->res(" ".$PrimNome."_relaxo ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter");
 $sh->mincstats(" -mean ".$PrimNome."_relaxo_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_GM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_GM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_relaxo_res.mnc.gz");
 
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_mt ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_GM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_gray_matter.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_GM = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz");
  
  push(@mediasrelaxoGM,$media_relaxo_GM);
  push(@mediasmtGM,$media_mt_GM);
  push(@desviorelaxoGM,$desvio_relaxo_GM);
  push(@desviomtGM,$desvio_mt_GM);
  
 #Subtsancia lesoes_t1
 $sh->res(" ".$PrimNome."_relaxo ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t1");
 $sh->mincstats(" -mean ".$PrimNome."_relaxo_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t1.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Lt1 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev  ".$PrimNome."_relaxo_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t1.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_Lt1 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_relaxo_res.mnc.gz");
 
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_mt ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t1");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t1.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_Lt1 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t1.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_Lt1 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz");
  
  push(@mediasrelaxoLt1,$media_relaxo_Lt1);
  push(@mediasmtLt1,$media_mt_Lt1);
  push(@desviorelaxoLt1,$desvio_relaxo_Lt1);
  push(@desviomtLt1,$desvio_mt_Lt1);
  
 #Subtsancia lesoes_t2
 $sh->res(" ".$PrimNome."_relaxo ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t2");
 $sh->mincstats(" -mean ".$PrimNome."_relaxo_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t2.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Lt2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t2.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_Lt2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 #$sh->rm(" ".$PrimNome."_relaxo_res.mnc.gz");
 
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_mt ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t2");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t2.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_Lt2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_0_lesoes_t2.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_Lt2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 #$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_mt_res.mnc.gz");
  push(@mediasrelaxoLt2,$media_relaxo_Lt2);
  push(@mediasmtLt2,$media_mt_Lt2);
  push(@desviorelaxoLt2,$desvio_relaxo_Lt2);
  push(@desviomtLt2,$desvio_mt_Lt2);
 # $sh->rm(" *_res.mnc.gz"); 
  chdir("..");

  chdir(".."); 

}

sub analise_global
{chdir("analise_da_amostra");
 print"\n-- Análise da Amostra --\n";
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
 print RELATDADOS "média = $media\r";
 print RELATDADOS "desvio_padrão = $stddev\r";
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

