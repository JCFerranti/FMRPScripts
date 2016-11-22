#!/usr/bin/perl 

###############################################################
#Autor:Carlos Garrido Salmon, Rodrigo Pessini e Rafael Reis
#Ribeirao Preto,24 de setembro de 2012      #
#versao 1 
###############################################################
#####################################################################
#@NAME       : process_disc.pl
#@INPUT      : 
#@OUTPUT     : Disc_Results.txt 
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

#**************Resultados do Processamento*************************************
 

 open(RELATDADOS, "> Disc_results.txt");				# Abertura de arquivo para salvar dados de ADC
 print RELATDADOS "name; NP5 (mm²/s); ±DP(mm²/s); AFP5 (mm²/s); ±DP(mm²/s); AFA5 (mm²/s); ±DP(mm²/s); NP4 (mm²/s); ±DP(mm²/s); AFP4 (mm²/s); ±DP(mm²/s); AFA4 (mm²/s); ±DP(mm²/s); NP3 (mm²/s); ±DP(mm²/s); AFP3 (mm²/s); ±DP(mm²/s); AFA3 (mm²/s); ±DP(mm²/s); NP2 (mm²/s); ±DP(mm²/s); AFP2 (mm²/s); ±DP(mm²/s); AFA2 (mm²/s); ±DP(mm²/s); NP1 (mm²/s); ±DP(mm²/s); AFP1 (mm²/s); ±DP(mm²/s); AFA1 (mm²/s); ±DP(mm²/s)\n";
 $c=0;
 print "Nomes: ".$nomes."\n"; 
 while($c != $tam)
	{  
         print "Escrevendo resultados: \n"; 
	 print RELATDADOS $nomes[$c].";".$NP5_mean[$c].";".$NP5_DP[$c].";".$AFP5_mean[$c].";".$AFP5_DP[$c].";".$AFA5_mean[$c].";".$AFA5_DP[$c].";".$NP4_mean[$c].";".$NP4_DP[$c].";".$AFP4_mean[$c].";".$AFP4_DP[$c].";".$AFA4_mean[$c].";".$AFA4_DP[$c].";".$NP3_mean[$c].";".$NP3_DP[$c].";".$AFP3_mean[$c].";".$AFP3_DP[$c].";".$AFA3_mean[$c].";".$AFA3_DP[$c].";".$NP2_mean[$c].";".$NP2_DP[$c].";".$AFP2_mean[$c].";".$AFP2_DP[$c].";".$AFA2_mean[$c].";".$AFA2_DP[$c].";".$NP1_mean[$c].";".$NP1_DP[$c].";".$AFP1_mean[$c].";".$AFP1_DP[$c].";".$AFA1_mean[$c].";".$AFA1_DP[$c]. "\n";
	 $c=$c+1;
	}


#********************************************Processamento******************************************************
sub Processamento   							# Inicio de sub-rotina de processamento
{
 chdir($NomePasta);							# Definindo NomePasta como sub-diretorio corrente
 @vector = glob("./*_process*"); 
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
 $lbl = $NomePasta . "_process_lbl";
 $sh->rm(" mincheader.txt");
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 #$PrimNome = $PrimNome."_".$ano.$mes.$dia;
 print "FileName: ".$PrimNome."\n"; 
 
#************************Estimativa do ADC***************************************************
 $sh->res($lbl,$PrimNome."_process");  				# coregistra label com mapa adc


#************************Media em Núcleo Pulposo 5********************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $NP5_mean = substr($temp1,0,rindex($temp1," "));
 print "NP5_mean: ".$NP5_mean."\n";
 $sh->rm("volume1.txt");
 push(@NP5_mean,$NP5_mean);
#************************Desvio padrao em Núcleo Pulposo 5*****************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $NP5_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@NP5_DP,$NP5_DP); 		
#************************Media em Anulo Fibroso Posterior 5**************************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $AFP5_mean = substr($temp1,0,rindex($temp1," "));
 print "AFP5_mean: ".$AFP5_mean."\n";
 $sh->rm("volume1.txt");
 push(@AFP5_mean,$AFP5_mean);
#************************Desvio padrao em Anulo Fibroso Posterior Vértebra 5*********************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $AFP5_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@AFP5_DP,$AFP5_DP); 
#************************Media em Anulo Fibroso Anterior 5*********************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $AFA5_mean = substr($temp1,0,rindex($temp1," "));
 print "AFA5_mean: ".$AFA5_mean."\n";
 $sh->rm("volume1.txt");
 push(@AFA5_mean,$AFA5_mean);
#************************Desvio padrao em ANulo Fibroso Anterior 5*****************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $AFA5_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@AFA5_DP,$AFA5_DP); 		
#************************Media em Núcleo Pulposo 4********************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $NP4_mean = substr($temp1,0,rindex($temp1," "));
 print "NP4_mean: ".$NP4_mean."\n";
 $sh->rm("volume1.txt");
 push(@NP4_mean,$NP4_mean);
#************************Desvio padrao em Núcleo Pulposo 4*****************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $NP4_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@NP4_DP,$NP4_DP); 		
#************************Media em Anulo Fibroso Posterior 4**************************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $AFP4_mean = substr($temp1,0,rindex($temp1," "));
 print "AFP4_mean: ".$AFP4_mean."\n";
 $sh->rm("volume1.txt");
 push(@AFP4_mean,$AFP4_mean);
#************************Desvio padrao em Anulo Fibroso Posterior Vértebra 4*********************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $AFP4_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@AFP4_DP,$AFP4_DP); 
#************************Media em Anulo Fibroso Anterior 4*********************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 6 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $AFA4_mean = substr($temp1,0,rindex($temp1," "));
 print "AFA4_mean: ".$AFA4_mean."\n";
 $sh->rm("volume1.txt");
 push(@AFA4_mean,$AFA4_mean);
#************************Desvio padrao em ANulo Fibroso Anterior 4*****************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 6 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $AFA4_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@AFA4_DP,$AFA4_DP); 
#************************Media em Núcleo Pulposo 3********************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $NP3_mean = substr($temp1,0,rindex($temp1," "));
 print "NP3_mean: ".$NP3_mean."\n";
 $sh->rm("volume1.txt");
 push(@NP3_mean,$NP3_mean);
#************************Desvio padrao em Núcleo Pulposo 3*****************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $NP3_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@NP3_DP,$NP3_DP); 		
#************************Media em Anulo Fibroso Posterior 3**************************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $AFP3_mean = substr($temp1,0,rindex($temp1," "));
 print "AFP3_mean: ".$AFP3_mean."\n";
 $sh->rm("volume1.txt");
 push(@AFP3_mean,$AFP3_mean);
#************************Desvio padrao em Anulo Fibroso Posterior Vértebra 3*********************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $AFP3_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@AFP3_DP,$AFP3_DP); 
#************************Media em Anulo Fibroso Anterior 3*********************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 9 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $AFA3_mean = substr($temp1,0,rindex($temp1," "));
 print "AFA3_mean: ".$AFA3_mean."\n";
 $sh->rm("volume1.txt");
 push(@AFA3_mean,$AFA3_mean);
#************************Desvio padrao em ANulo Fibroso Anterior 3*****************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 9 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $AFA3_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@AFA3_DP,$AFA3_DP);
#************************Media em Núcleo Pulposo 2********************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 10 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $NP2_mean = substr($temp1,0,rindex($temp1," "));
 print "NP2_mean: ".$NP2_mean."\n";
 $sh->rm("volume1.txt");
 push(@NP2_mean,$NP2_mean);
#************************Desvio padrao em Núcleo Pulposo 2*****************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 10 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $NP2_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@NP2_DP,$NP2_DP); 		
#************************Media em Anulo Fibroso Posterior 2**************************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 11 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $AFP2_mean = substr($temp1,0,rindex($temp1," "));
 print "AFP2_mean: ".$AFP2_mean."\n";
 $sh->rm("volume1.txt");
 push(@AFP2_mean,$AFP2_mean);
#************************Desvio padrao em Anulo Fibroso Posterior Vértebra 2*********************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 11 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $AFP2_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@AFP2_DP,$AFP2_DP); 
#************************Media em Anulo Fibroso Anterior 2*********************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 12 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $AFA2_mean = substr($temp1,0,rindex($temp1," "));
 print "AFA2_mean: ".$AFA2_mean."\n";
 $sh->rm("volume1.txt");
 push(@AFA2_mean,$AFA2_mean);
#************************Desvio padrao em ANulo Fibroso Anterior 2*****************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 12 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $AFA2_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@AFA2_DP,$AFA2_DP);  
#************************Media em Núcleo Pulposo 1********************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 13 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $NP1_mean = substr($temp1,0,rindex($temp1," "));
 print "NP1_mean: ".$NP1_mean."\n";
 $sh->rm("volume1.txt");
 push(@NP1_mean,$NP1_mean);
#************************Desvio padrao em Núcleo Pulposo 1*****************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 13 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $NP1_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@NP1_DP,$NP1_DP); 		
#************************Media em Anulo Fibroso Posterior 1**************************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 14 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $AFP1_mean = substr($temp1,0,rindex($temp1," "));
 print "AFP1_mean: ".$AFP1_mean."\n";
 $sh->rm("volume1.txt");
 push(@AFP1_mean,$AFP1_mean);
#************************Desvio padrao em Anulo Fibroso Posterior Vértebra 1*********************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 14 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $AFP1_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@AFP1_DP,$AFP1_DP); 
#************************Media em Anulo Fibroso Anterior 1*********************
 $sh->mincstats(" -mean ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 15 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $AFA1_mean = substr($temp1,0,rindex($temp1," "));
 print "AFA1_mean: ".$AFA1_mean."\n";
 $sh->rm("volume1.txt");
 push(@AFA1_mean,$AFA1_mean);
#************************Desvio padrao em ANulo Fibroso Anterior 1*****************
 $sh->mincstats(" -stddev ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 15 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $AFA1_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@AFA1_DP,$AFA1_DP); "\n"; 

				
#*********************Fim da estimativa do ADC*************************************************








 chdir("..");							# Deixa no diretorio inicial		
}								# Fim do programa principal


