#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               #
#Ribeirao Preto,16 de janeiro de 2007                                                                                                                                         #
#versao 1.0                                                                                                                                                                                       #
# 
#####################################################################
#@NAME       : 
#@INPUT      : 
#@OUTPUT     : 
#@RETURNS    : 
#@DESCRIPTION: C

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
  
  }   
  $NomePastaAnter = $NomePasta;
  shift(@pastas ); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
  
 }

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
 
 
 print "\n\n Primeiro nome: $PrimNome \n\n";
  print "\n\n".$pastas [0]."\n\n";
#******************************Processamento das imegens********************************
  
  print"\n\n Iniciando Processamento...\n\n";
  
#**************************************************************************************
  #---> Gerando a Imagem de MTR
  print"\n\n 1ª etapa de 6) MTR...\n\n";
 
  $sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.xfm");
  $sh->mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transformation ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.xfm");
  
  $sh->mincmath(" -pd -const 15 ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
 
 print"\n\n Gerando Difusão...\n\n";
	 ###############################################################
	 print"\n\n Iniciando Dparaeperp...\n\n";
 #Variáveis Globais
 #variáveis dependentes da sequencia!Em caso de mudança de protocolo verificar
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
 
 print "\n\n Normalização das imagens...((DIso e FA) = (Valor na imagem * RS + RI)/1000)\n\n";
	
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
	
print "\n\n Difusão Perpendicular (Dperp=Diso.*(1-FA./sqrt(3-2*FA.^2));)\n\n";
	# Calculo da equação((1-FA/sqrt(3-2*FA.^2))
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
	
	print "\n\n Difusão paralela (Dpara=3*Diso-2*Dperp) \n\n";
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
	
  	 chdir("Analise_mt_relaxo");
	 print"\n\n Gerando Relaxo...\n\n";
	 print "\n\n".$pastas[0]."\n\n";
	 print"\n\n 1° Passo) Iniciando RelaxoN...\n\n";
     require "/usr/local/bic/scripts/relaxon.pl";
     &main; 
     $sh->mv(" relaxom.mnc ./".$PrimNome."_relaxo.mnc");
     $sh->mv(" density.mnc ./".$PrimNome."_density.mnc"); 
     $sh->gzip(" *.mnc");

  chdir("..");

  chdir(".."); 

}




