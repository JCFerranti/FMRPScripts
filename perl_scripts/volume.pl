#!/usr/bin/perl 

###############################################################
#Autor:Carlos Garrido Salmon 
#Ribeirao Preto,27 de junho de 2011      #
#versao 1 
###############################################################
#####################################################################
#@NAME       : Vertebral_body.pl
#@INPUT      : 
#@OUTPUT     : Vertebral_Volume.txt Vertebral_ADC.txt Vertebral_FAT.txt
#@RETURNS    : 
#@DESCRIPTION: Extração dos dados de volume, ADC e conteudo de gordura em 4 corpos vertebrais.

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


#*****************************Geração de arquivos de resultados************************************************
 $tam =@nomes;								# Guarda na variavel teste o numero de nomes
#**************Resultados de volume*************************************
 open(RELATDADOS, "> Vertebral_Volume.txt");				# Abertura de arquivo para salvar dados de volume
 print RELATDADOS "name; VOLUME_1(cm³); VOLUME_2(cm³); VOLUME_3(cm³); VOLUME_4(cm³); VOLUME_5(cm³)\n";		# Salva o cabeçalho no arquivo Vertebral_Volume.txt
  $c=0;									# Inicialização nula da variavel c que contabiliza os pacientes
 while($c != $tam)							# Ciclo variando pelos diferentes pacientes
	{  								# Inicio do ciclo de pacientes
	 print RELATDADOS $nomes[$c].";".$Vol_L1[$c].";".$Vol_L2[$c].";".$Vol_L3[$c].";".$Vol_L4[$c].";".$Vol_L5[$c]."\n";
	 $c=$c+1;							# Incremento do contador c
	}								# Fim do ciclo de pacientes
#**************Resultados de ADC*************************************
# open(RELATDADOS, "> Vertebral_ADC.txt");				# Abertura de arquivo para salvar dados de ADC
# print RELATDADOS "name; ADC_L1 (mm²/s); ±DP(mm²/s); ADC_L2 (mm²/s); ±DP(mm²/s); ADC_L3 (mm²/s); ±DP(mm²/s); ADC_L4 (mm²/s); ±DP(mm²/s); ADC_L5 (mm²/s); ±DP(mm²/s) \n";
# $c=0;
# while($c != $tam)
#	{  
#	 print RELATDADOS $nomes[$c].";".$ADC_L1_mean[$c].";".$ADC_L1_DP[$c].";".$ADC_L2_mean[$c].";".$ADC_L2_DP[$c].";".$ADC_L3_mean[$c].";".$ADC_L3_DP[$c].";".$ADC_L4_mean[$c].";".$ADC_L4_DP[$c].";".$ADC_L5_mean[$c].";".$ADC_L5_DP[$c]."\n";
#	 $c=$c+1;
#	}
#**************Resultados de conteudo de gordura**********************************
 open(RELATDADOS, "> Vertebral_FAT.txt");				# Abertura de arquivo para salvar dados de conteudo de gordura
 print RELATDADOS "name; VOLUME_1 (%); ±DP(%); VOLUME_2 (%); ±DP(%); VOLUME_3 (%); ±DP(%); VOLUME_4 (%); ±DP(%)\n";
 $c=0;
 while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$FAT_L1_mean[$c].";".$FAT_L1_DP[$c].";".$FAT_L2_mean[$c].";".$FAT_L2_DP[$c].";".$FAT_L3_mean[$c].";".$FAT_L3_DP[$c].";".$FAT_L4_mean[$c].";".$FAT_L4_DP[$c]."\n";
	 $c=$c+1;
	}


#********************************************Processamento******************************************************
sub Processamento   							# Inicio de sub-rotina de processamento
{
 chdir($NomePasta);							# Definindo NomePasta como sub-diretorio corrente
 @vector = glob("./*_e*");
 $file = $vector[0];
 $sh->mincheader(" $file > mincheader.txt ");
 $linha = $sh->grep(" dicom_0x0008:el_0x0020 mincheader.txt");
 #$dimensao = $sh->grep(" dicom_0x0018:el_0x0087 mincheader.txt");

 
 $tag1=$sh->grep(" dicom_0x0008:el_0x0020 mincheader.txt");
 $temp1=substr($tag1,rindex($tag1,":")+15);
 
 $dimensao=substr($temp1,0,rindex($temp1,""));
 
 print "dimensao:" .$dimensao."\n";
 
 
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
 $PrimNome = substr($NomePasta,0,$Stop);
 #$sh->rm(" mincheader.txt");				#Apaga o arquivo mincheader.txt
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 
#************************Geração do mapa de conteudo de gordura***************************************************
 print"\n\n Iniciando FAT...\n\n";
 
 $sh->mincmath(" -double -sub ".$vector[0]." ".$vector[1]." subtracao.mnc");	# Subtracao das imagens in_phase e out_phase
 $sh->mincmath(" -double -add ".$vector[0]." ".$vector[1]." soma.mnc");         # Soma das imagens in_phase e out_phase
 
 print "vector[0]".$vector[0]."\n";
 print "vector[1]".$vector[1]."\n";
 
 $sh->mincmath(" -double -div  subtracao.mnc soma.mnc div.mnc");	# Divisao da subtracao e a soma
 $sh->mincmath(" -double -mult -const 100  div.mnc fat_map.mnc");	# Multiplicacao por 100 para levar a percentagem, criando o mapa em fat_map.mnc
 $sh->rm("subtracao.mnc");						# Elimina o arquivo subtracao
 $sh->rm("soma.mnc");							# Elimina o arquivo soma
 $sh->rm("div.mnc");							# Elimina o arquivo div
 $sh->gzip("fat_map.mnc");						# Compactacao do arquivo com o mapa de conteudo de gordura

 @label=glob("./*_lbl.mnc*");					# Guarda no ponteiro label os arquivos _label.mnc
 $sh->gzip($label[0]);							# Compacta o primeiro arquivo do ponteiro label
 $arquivo = $label[0];
 $Start = index($arquivo,"./") + 2;
 $Stop = index($arquivo,".mnc") - 2;
 $lbl = substr($arquivo,$Start,$Stop);

#************************Estimativa do volume***************************************************
#************************Volume em vertebra 1**********************************************************
 $sh->mincstats(" -volume ".$arquivo." -mask ".$arquivo." -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));
 $volumeConv = $volume1/1000;
 $sh->rm("volume1.txt");
 push(@Vol_L1,$volumeConv);
#************************Volume em vertebra 2**********************************************************
 $sh->mincstats(" -volume ".$arquivo." -mask ".$arquivo." -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));
 $volumeConv = $volume1/1000;
 $sh->rm("volume1.txt");
 push(@Vol_L2,$volumeConv);
#************************Volume em vertebra 3**********************************************************
 $sh->mincstats(" -volume ".$arquivo." -mask ".$arquivo." -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));
 $volumeConv = $volume1/1000;
 $sh->rm("volume1.txt");
 push(@Vol_L3,$volumeConv);
#************************Volume em vertebra 4**********************************************************
 $sh->mincstats(" -volume ".$arquivo." -mask ".$arquivo." -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));
 $volumeConv = $volume1/1000;
 $sh->rm("volume1.txt");
 push(@Vol_L4,$volumeConv);
#************************Volume em vertebra 5**********************************************************
 $sh->mincstats(" -volume ".$arquivo." -mask ".$arquivo." -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));
 $volumeConv = $volume1/1000;
 $sh->rm("volume1.txt");
 push(@Vol_L5,$volumeConv);
#********************Fim de estimativa do volume***************************************************

#************************Estimativa do conteudo de gordura***************************************************
# $sh->res(" ".$lbl. $PrimNome."_adc ");
# print "Result: ".$PrimNome."_adc "."\n"; 
# $sh->res(" ".$lbl. " fat_map ");				# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 $sh->res($lbl," fat_map ");					# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 print "lbl: ".$lbl."\n"; 

#************************Media em vertebra 1**********************************************************
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FAT_L1_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FAT_L1_mean,$FAT_L1_mean);
 
#************************Desvio padrao em vertebra 1**************************************************
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $FAT_L1_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FAT_L1_DP,$FAT_L1_DP);
#************************Media em vertebra 2********************************************************** 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FAT_L2_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FAT_L2_mean,$FAT_L2_mean);
#************************Desvio padrao em vertebra 2**************************************************
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $FAT_L2_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FAT_L2_DP,$FAT_L2_DP);
#************************Media em vertebra 3********************************************************** 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FAT_L3_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FAT_L3_mean,$FAT_L3_mean);
#************************Desvio padrao em vertebra 3************************************************** 
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $FAT_L3_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FAT_L3_DP,$FAT_L3_DP);
#************************Media em vertebra 4********************************************************** 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FAT_L4_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FAT_L4_mean,$FAT_L4_mean);
#************************Desvio padrao em vertebra 4************************************************** 
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $FAT_L4_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FAT_L4_DP,$FAT_L4_DP);

  $sh->rm($lbl."_res.mnc.gz");					# Apaga arquivo *_res.mnc.gz

#*********************Fim da estimativa do conteudo de gordura*************************************************

#************************Estimativa do ADC***************************************************
 $sh->res($lbl,$PrimNome."_adc");  				# coregistra label com mapa adc
#************************Media em vertebra 1**********************************************************
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L1_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L1_mean,$ADC_L1_mean);
#************************Desvio padrao em vertebra 1**************************************************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L1_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L1_DP,$ADC_L1_DP);
#************************Media em vertebra 2********************************************************** 
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L2_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L2_mean,$ADC_L2_mean);
#************************Desvio padrao em vertebra 2**************************************************
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L2_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L2_DP,$ADC_L2_DP);
#************************Media em vertebra 3********************************************************** 
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L3_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L3_mean,$ADC_L3_mean);
#************************Desvio padrao em vertebra 3************************************************** 
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L3_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L3_DP,$ADC_L3_DP);
#************************Media em vertebra 4********************************************************** 
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L4_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L4_mean,$ADC_L4_mean);
#************************Desvio padrao em vertebra 4************************************************** 
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L4_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 #$sh->rm($lbl."_res.mnc.gz");
 push(@ADC_L4_DP,$ADC_L4_DP); 					
#************************Media em vertebra 5********************************************************** 
 $sh->mincstats(" -mean ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $ADC_L5_mean = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@ADC_L5_mean,$ADC_L5_mean);
#************************Desvio padrao em vertebra 5************************************************** 
 $sh->mincstats(" -stddev ".$PrimNome."_adc.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $ADC_L5_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 #$sh->rm($lbl."_res.mnc.gz");
 push(@ADC_L5_DP,$ADC_L5_DP); 					# Apaga arquivo *_res.mnc.gz
#*********************Fim da estimativa do ADC*************************************************



 chdir("..");					# Deixa no diretorio inicial		
}								# Fim do programa principal


