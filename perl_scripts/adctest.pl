#!/usr/bin/perl 

###############################################################
#Autor:Carlos Garrido Salmon e Rodrigo Pessini
#Ribeirao Preto,09 de dezembro de 2011      #
#versao 1 
###############################################################
#####################################################################
#@NAME       : Vertebral_disc_difusao.pl
#@INPUT      : 
#@OUTPUT     : Vertebral_ADC.txt 
#@RETURNS    : 
#@DESCRIPTION: Extração dos dados de ADC em 5 discos vertebrais.

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();


#***********************************************************Main************************************************************


print "\n*********************************************************************\n";
print "\n Starting Process...\n";
print "\n-- Please wait --\n";
@pastas = glob("./*");							# Guarda no ponteiro pastas as pastas no diretorio corrente
$NomePastaAnter="";							# Inicialização vazia da variavel NomePastaAnter
$teste = @pastas ;							# Guarda na variavel teste o numero de pastas
$contador=0;								# Inicialização nula da variavel contador
while($contador != $teste)						# Ciclo variando pelas diferentes pastas
{									# Inicio do ciclo das pastas
  $arquivo = $pastas[0];						# Guarda na variavel arquivo o nome da primeira pasta
  $Start = index($arquivo,"./") + 2;					# Operacao para escolher exatamente o nome
  $NomePasta = substr($arquivo,$Start);					# Define a variavel NomePasta como o nome da primeira pasta na lista
  if($NomePasta ne $NomePastaAnter)					# Condicional verificando que as variaveis NomePastaAnterior e NomePasta sao diferentes
  {  									# Inicio da condicional de NomePasta	
    print "\n ==================================================== \n"; 
    print "Patient name: ".$NomePasta."\n";				# Visualiza o nomde do paciente como pasta
	&Processamento;							# Executa a sob-routina Processamento para cada paciente
   }   									# Fim da condicional de NomePasta		
  $NomePastaAnter = $NomePasta;						# Re-define a variavel NomePastaAnterior com a atual
  shift(@pastas ); 							# Retira o primeiro elemento da lista
  $contador=$contador+1;						# Incremento do contador
}									# Fim do ciclo das pastas			


#***********************************************************Geração de arquivos de resultado***************************************************
 $tam =@nomes;								# Guarda na variavel teste o numero de nomes

#**************Resultados de ADC*************************************
 

 open(RELATDADOS, "> Vertebral_ADC.txt");				# Abertura de arquivo para salvar dados de ADC
 print RELATDADOS "name; ADC_DL5S1 (mm²/s); ±DP(mm²/s); ADC_DL4L5 (mm²/s); ±DP(mm²/s); ADC_DL3L4 (mm²/s); ±DP(mm²/s); ADC_DL2L3 (mm²/s); ±DP(mm²/s); ADC_DL1L2 (mm²/s); ±DP(mm²/s); ADC_DX (mm²/s); ±DP(mm²/s)\n";
 $c=0;
 print "Nomes: ".$nomes."\n"; 
 while($c != $tam)
	{  
         print "Escrevendo resultados: \n"; 
	 print RELATDADOS $nomes[$c].";".$ADC_DL5S1_mean[$c].";".$ADC_DL5S1_DP[$c].";".$ADC_DL4L5_mean[$c].";".$ADC_DL4L5_DP[$c].";".$ADC_DL3L4_mean[$c].";".$ADC_DL3L4_DP[$c].";".$ADC_DL2L3_mean[$c].";".$ADC_DL2L3_DP[$c].";".$DADC_L1L2_mean[$c].";".$DADC_L1L2_DP[$c].";".$ADC_DX_mean[$c].";".$ADC_DX_DP[$c]."\n";
	 $c=$c+1;
	}


#********************************************Processamento******************************************************
sub Processamento   							# Inicio de sub-rotina de processamento
{
 chdir($NomePasta);							# Definindo NomePasta como sub-diretorio corrente
 @vector = glob("./*_adc*"); 
 $file = $vector[0];
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
 $Stop = index($NomePasta,"_".$ano);
 #$PrimNome = substr($NomePasta,0,$Stop);
 $PrimNome = $NomePasta;
 $lbl = $NomePasta . "_adc_lbl";
 $sh->rm(" mincheader.txt");
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 #$PrimNome = $PrimNome."_".$ano.$mes.$dia;
 print "FileName: ".$PrimNome."\n"; 
 
#************************Estimativa do ADC***************************************************
 $sh->res($lbl,$PrimNome."_adc");  				# coregistra label com mapa adc


#************************Media em Disco DL5S1**********************************************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_DL5S1_mean = substr($temp1,0,rindex($temp1," "));
 print "DL5S1_mean: ".$ADC_DL5S1_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_DL5S1_mean,$ADC_DL5S1_mean);
#************************Desvio padrao em Disco DL5S1**************************************************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_DL5S1_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_DL5S1_DP,$ADC_DL5S1_DP);
#************************Media em Disco DL4L5********************************************************** 
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_DL4L5_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_DL4L5_mean,$ADC_DL4L5_mean);
#************************Desvio padrao em Disco DL4L5**************************************************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_DL4L5_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_DL4L5_DP,$ADC_DL4L5_DP);
#************************Media em Disco DL3L4********************************************************** 
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_DL3L4_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_DL3L4_mean,$ADC_DL3L4_mean);
#************************Desvio padrao em Disco DL3L4************************************************** 
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_DL3L4_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_DL3L4_DP,$ADC_DL3L4_DP);
#************************Media em Disco DL2L3********************************************************** 
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_DL2L3_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_DL2L3_mean,$ADC_DL2L3_mean);
#************************Desvio padrao em Disco DL2L3************************************************** 
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_DL2L3_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_DL2L3_DP,$ADC_DL2L3_DP); 					
#************************Media em Disco DL1L2********************************************************** 
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_DL1L2_mean = substr($temp1,0,rindex($temp1," "));
 print "DL1L2_mean: ".$ADC_DL1L2_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_DL1L2_mean,$ADC_DL1L2_mean);
 print "DL1L2_mean: ".$ADC_DL1L2_mean."\n";
#************************Desvio padrao em Disco DL1L2************************************************** 
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_DL1L2_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_DL1L2_DP,$ADC_DL1L2_DP);
 print "DL1L2_DP: ".$ADC_DL1L2_DP."\n";
#************************Media em Disco X********************************************************** 
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_DX_mean = substr($temp1,0,rindex($temp1," "));
 print "DX_mean: ".$ADC_DX_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_DX_mean,$ADC_DX_mean);
 print "DX_mean: ".$ADC_DX_mean."\n";
#************************Desvio padrao em X************************************************** 
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_DX_DP = substr($temp1,0,rindex($temp1," "));
 print "DX_DP: ".$ADC_DX_DP."\n";
 $sh->rm("volume1.txt");
 push(@ADC_DX_DP,$ADC_DX_DP);
 print "DX_DP: ".$ADC_DX_DP."\n"; 					

#*********************Fim da estimativa do ADC*************************************************








 chdir("..");							# Deixa no diretorio inicial		
}								# Fim do programa principal


