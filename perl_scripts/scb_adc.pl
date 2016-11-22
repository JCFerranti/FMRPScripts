#!/usr/bin/perl 

###############################################################
#Autor:Carlos Garrido Salmon, Rodrigo Pessini e Rafael Reis
#Ribeirao Preto,24 de setembro de 2012      #
#versao 1 
###############################################################
#####################################################################
#@NAME       : Vertebral_disc_difusao.pl
#@INPUT      : 
#@OUTPUT     : Disc_ADC.txt 
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
 

 open(RELATDADOS, "> SBC_ADC.txt");				# Abertura de arquivo para salvar dados de ADC
 print RELATDADOS "name; ADC_L5-EPI (mm²/s); ±DP(mm²/s); ADC_L5-SBCI (mm²/s); ±DP(mm²/s); ADC_L5-EPS (mm²/s); ±DP(mm²/s); ADC_L5-SBCS (mm²/s); ±DP(mm²/s); ADC_L4-EPI (mm²/s); ±DP(mm²/s); ADC_L4-SBCI (mm²/s); ±DP(mm²/s); ADC_L4-EPS (mm²/s); ±DP(mm²/s); ADC_L4-SBCS (mm²/s); ±DP(mm²/s); ADC_L3-EPI (mm²/s); ±DP(mm²/s); ADC_L3-SBCI(mm²/s); ±DP(mm²/s); ADC_L3-EPS (mm²/s); ±DP(mm²/s); ADC_L3-SBCS (mm²/s); ±DP(mm²/s); ADC_L2-EPI (mm²/s); ±DP(mm²/s); ADC_L2-SBCI (mm²/s); ±DP(mm²/s); ADC_L2-EPS (mm²/s); ±DP(mm²/s); ADC_L2-SBCS (mm²/s); ±DP(mm²/s); ADC_L1-EPI (mm²/s); ±DP(mm²/s); ADC_L1-SBCI (mm²/s); ±DP(mm²/s); ADC_L1-EPS (mm²/s); ±DP(mm²/s); ADC_L1-SBCS (mm²/s); ±DP(mm²/s)\n";
 $c=0;
 print "Nomes: ".$nomes."\n"; 
 while($c != $tam)
	{  
         print "Escrevendo resultados: \n"; 
	 print RELATDADOS $nomes[$c].";".$ADC_L5EPI_mean[$c].";".$ADC_L5EPI_DP[$c].";".$ADC_L5SBCI_mean[$c].";".$ADC_L5SBCI_DP[$c].";".$ADC_L5EPS_mean[$c].";".$ADC_L5EPS_DP[$c].";".$ADC_L5SBCS_mean[$c].";".$ADC_L5SBCS_DP[$c].";".$ADC_L4EPI_mean[$c].";".$ADC_L4EPI_DP[$c].";".$ADC_L4SBCI_mean[$c].";".$ADC_L4SBCI_DP[$c].";".$ADC_L4EPS_mean[$c].";".$ADC_L4EPS_DP[$c].";".$ADC_L4SBCS_mean[$c].";".$ADC_L4SBCS_DP[$c].";".$ADC_L3EPI_mean[$c].";".$ADC_L3EPI_DP[$c].";".$ADC_L3SBCI_mean[$c].";".$ADC_L3SBCI_DP[$c].";".$ADC_L3EPS_mean[$c].";".$ADC_L3EPS_DP[$c].";".$ADC_L3SBCS_mean[$c].";".$ADC_L3SBCS_DP[$c].";".$ADC_L2EPI_mean[$c].";".$ADC_L2EPI_DP[$c].";".$ADC_L2SBCI_mean[$c].";".$ADC_L2SBCI_DP[$c].";".$ADC_L2EPS_mean[$c].";".$ADC_L2EPS_DP[$c].";".$ADC_L2SBCS_mean[$c].";".$ADC_L2SBCS_DP[$c].";".$ADC_L1EPI_mean[$c].";".$ADC_L1EPI_DP[$c].";".$ADC_L1SBCI_mean[$c].";".$ADC_L1SBCI_DP[$c].";".$ADC_L1EPS_mean[$c].";".$ADC_L1EPS_DP[$c].";".$ADC_L1SBCS_mean[$c].";".$ADC_L1SBCS_DP[$c]. "\n";
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


#************************Media em Cartilagem Terminal Inferior Vértebra 5********************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L5EPI_mean = substr($temp1,0,rindex($temp1," "));
 print "L5EPI_mean: ".$ADC_L5EPI_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L5EPI_mean,$ADC_L5EPI_mean);
#************************Desvio padrao Cartilagem Terminal Inferior Vértebra 5*****************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L5EPI_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L5EPI_DP,$ADC_L5EPI_DP); 		
#************************Media em Osso Subcondral Inferior Vértebra 5**************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L5SBCI_mean = substr($temp1,0,rindex($temp1," "));
 print "L5SBCI_mean: ".$ADC_L5SBCI_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L5SBCI_mean,$ADC_L5SBCI_mean);
#************************Desvio padrao Osso Subcondral Inferior Vértebra 5*********************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L5SBCI_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L5SBCI_DP,$ADC_L5SBCI_DP); 
#************************Media em Cartilagem Terminal Superior Vértebra 5*********************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L5EPS_mean = substr($temp1,0,rindex($temp1," "));
 print "L5EPS_mean: ".$ADC_L5EPS_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L5EPS_mean,$ADC_L5EPS_mean);
#************************Desvio padrao Cartilagem Terminal Superior Vértebra 5*****************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L5EPS_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L5EPS_DP,$ADC_L5EPS_DP); 		
#************************Media em Osso Subcondral Superior Vértebra 5**************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L5SBCS_mean = substr($temp1,0,rindex($temp1," "));
 print "L5SBCS_mean: ".$ADC_L5SBCS_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L5SBCS_mean,$ADC_L5SBCS_mean);
#************************Desvio padrao Osso Subcondral Superior Vértebra 5*********************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L5SBCS_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L5SBCS_DP,$ADC_L5SBCS_DP); 
#************************Media em Cartilagem Terminal Inferior Vértebra 4********************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L4EPI_mean = substr($temp1,0,rindex($temp1," "));
 print "L4EPI_mean: ".$ADC_L4EPI_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L4EPI_mean,$ADC_L4EPI_mean);
#************************Desvio padrao Cartilagem Terminal Inferior Vértebra 4*****************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L4EPI_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L4EPI_DP,$ADC_L4EPI_DP); 		
#************************Media em Osso Subcondral Inferior Vértebra 4**************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 6 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L4SBCI_mean = substr($temp1,0,rindex($temp1," "));
 print "L4SBCI_mean: ".$ADC_L4SBCI_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L4SBCI_mean,$ADC_L4SBCI_mean);
#************************Desvio padrao Osso Subcondral Inferior Vértebra 4*********************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 6 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L4SBCI_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L4SBCI_DP,$ADC_L4SBCI_DP); 
#************************Media em Cartilagem Terminal Superior Vértebra 4*********************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L4EPS_mean = substr($temp1,0,rindex($temp1," "));
 print "L4EPS_mean: ".$ADC_L4EPS_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L4EPS_mean,$ADC_L4EPS_mean);
#************************Desvio padrao Cartilagem Terminal Superior Vértebra 4*****************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L4EPS_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L4EPS_DP,$ADC_L4EPS_DP); 		
#************************Media em Osso Subcondral Superior Vértebra 4**************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L4SBCS_mean = substr($temp1,0,rindex($temp1," "));
 print "L4SBCS_mean: ".$ADC_L4SBCS_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L4SBCS_mean,$ADC_L4SBCS_mean);
#************************Desvio padrao Osso Subcondral Inferior Vértebra 4*********************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L4SBCS_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L4SBCS_DP,$ADC_L4SBCS_DP); 
#************************Media em Cartilagem Terminal Inferior Vértebra 3********************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 9 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L3EPI_mean = substr($temp1,0,rindex($temp1," "));
 print "L3EPI_mean: ".$ADC_L3EPI_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L3EPI_mean,$ADC_L3EPI_mean);
#************************Desvio padrao Cartilagem Terminal Inferior Vértebra 3*****************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 9 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L3EPI_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L3EPI_DP,$ADC_L3EPI_DP); 		
#************************Media em Osso Subcondral Inferior Vértebra 3**************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 10 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L3SBCI_mean = substr($temp1,0,rindex($temp1," "));
 print "L3SBCI_mean: ".$ADC_L3SBCI_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L3SBCI_mean,$ADC_L3SBCI_mean);
#************************Desvio padrao Osso Subcondral Inferior Vértebra 3*********************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 10 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L3SBCI_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L3SBCI_DP,$ADC_L3SBCI_DP); 
#************************Media em Cartilagem Terminal Superior Vértebra 3*********************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 11 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L3EPS_mean = substr($temp1,0,rindex($temp1," "));
 print "L3EPS_mean: ".$ADC_L3EPS_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L3EPS_mean,$ADC_L3EPS_mean);
#************************Desvio padrao Cartilagem Terminal Superior Vértebra 3*****************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 11 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L3EPS_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L3EPS_DP,$ADC_L3EPS_DP); 		
#************************Media em Osso Subcondral Superior Vértebra 3**************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 12 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L3SBCS_mean = substr($temp1,0,rindex($temp1," "));
 print "L3SBCS_mean: ".$ADC_L3SBCS_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L3SBCS_mean,$ADC_L3SBCS_mean);
#************************Desvio padrao Osso Subcondral Inferior Vértebra 3*********************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 12 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_DL3SBCS_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L3SBCS_DP,$ADC_L3SBCS_DP);
#************************Media em Cartilagem Terminal Inferior Vértebra 2********************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 13 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L4EPI_mean = substr($temp1,0,rindex($temp1," "));
 print "L2EPI_mean: ".$ADC_L2EPI_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L2EPI_mean,$ADC_L2EPI_mean);
#************************Desvio padrao Cartilagem Terminal Inferior Vértebra 2*****************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 13 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L2EPI_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L2EPI_DP,$ADC_L2EPI_DP); 		
#************************Media em Osso Subcondral Inferior Vértebra 2**************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 14 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L2SBCI_mean = substr($temp1,0,rindex($temp1," "));
 print "L2SBCI_mean: ".$ADC_L2SBCI_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L2SBCI_mean,$ADC_L2SBCI_mean);
#************************Desvio padrao Osso Subcondral Inferior Vértebra 2*********************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 14 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L2SBCI_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L2SBCI_DP,$ADC_L2SBCI_DP); 
#************************Media em Cartilagem Terminal Superior Vértebra 2*********************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 15 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L2EPS_mean = substr($temp1,0,rindex($temp1," "));
 print "L2EPS_mean: ".$ADC_L2EPS_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L2EPS_mean,$ADC_L2EPS_mean);
#************************Desvio padrao Cartilagem Terminal Superior Vértebra 2*****************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 15 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L2EPS_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L2EPS_DP,$ADC_L2EPS_DP); 		
#************************Media em Osso Subcondral Superior Vértebra 2**************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 16 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L2SBCS_mean = substr($temp1,0,rindex($temp1," "));
 print "L2SBCS_mean: ".$ADC_L2SBCS_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L2SBCS_mean,$ADC_L2SBCS_mean);
#************************Desvio padrao Osso Subcondral Inferior Vértebra 2*********************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 16 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L2SBCS_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L2SBCS_DP,$ADC_L2SBCS_DP);
#************************Media em Cartilagem Terminal Inferior Vértebra 1********************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 17 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L1EPI_mean = substr($temp1,0,rindex($temp1," "));
 print "L1EPI_mean: ".$ADC_L1EPI_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L1EPI_mean,$ADC_L1EPI_mean);
#************************Desvio padrao Cartilagem Terminal Inferior Vértebra 1*****************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 17 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L1EPI_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L1EPI_DP,$ADC_L1EPI_DP); 		
#************************Media em Osso Subcondral Inferior Vértebra 1**************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 18 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L1SBCI_mean = substr($temp1,0,rindex($temp1," "));
 print "L1SBCI_mean: ".$ADC_L1SBCI_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L1SBCI_mean,$ADC_L1SBCI_mean);
#************************Desvio padrao Osso Subcondral Inferior Vértebra 1*********************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 18 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L1SBCI_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L1SBCI_DP,$ADC_L1SBCI_DP); 
#************************Media em Cartilagem Terminal Superior Vértebra 1*********************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 19 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L1EPS_mean = substr($temp1,0,rindex($temp1," "));
 print "L1EPS_mean: ".$ADC_L1EPS_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L1EPS_mean,$ADC_L1EPS_mean);
#************************Desvio padrao Cartilagem Terminal Superior Vértebra 1*****************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 19 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L4EPS_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L1EPS_DP,$ADC_L1EPS_DP); 		
#************************Media em Osso Subcondral Superior Vértebra 1**************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 20 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L1SBCS_mean = substr($temp1,0,rindex($temp1," "));
 print "L1SBCS_mean: ".$ADC_L1SBCS_mean."\n";
 $sh->rm("volume1.txt");
 push(@ADC_L1SBCS_mean,$ADC_L1SBCS_mean);
#************************Desvio padrao Osso Subcondral Inferior Vértebra 1*********************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 20 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L1SBCS_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L1SBCS_DP,$ADC_L1SBCS_DP)."\n"; 

				
#*********************Fim da estimativa do ADC*************************************************








 chdir("..");							# Deixa no diretorio inicial		
}								# Fim do programa principal


