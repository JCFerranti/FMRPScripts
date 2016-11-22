#!/usr/bin/perl 

###############################################################
#Autor: Rafael Reis
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
 

 open(RELATDADOS, "> Disc_volume.txt");				# Abertura de arquivo para salvar dados de ADC
 print RELATDADOS "name; L5S1 (cm³); L4L5 (cm³); L3L4 (cm³); L2L3 (cm³); L1L2 (cm³)\n";
 $c=0;
 print "Nomes: ".$nomes."\n"; 
 while($c != $tam)
	{  
         print "Escrevendo resultados: \n"; 
	 print RELATDADOS $nomes[$c].";".$L5S1_volume[$c].";".$L4L5_volume[$c].";".$L3L4_volume[$c].";".$L2L3_volume[$c].";".$L1L2_volume[$c]. "\n";
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
 
#************************Estimativa do Volume***************************************************
 $sh->res($lbl,$PrimNome."_process");  				# coregistra label com mapa adc


#************************Volume em Disco L5S1********************
 $sh->mincstats(" -volume ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $L5S1_volume = substr($temp1,0,rindex($temp1," "));
 $volumeConv = $L5S1_volume/1000;
 print "L5S1_volume: ".$L5S1_volume."\n";
 $sh->rm("volume1.txt");
 push(@L5S1_volume,$volumeConv);
	
#************************Volume em Disco L4L5**************************
 $sh->mincstats(" -volume ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $L4L5_volume = substr($temp1,0,rindex($temp1," "));
 $volumeConv = $L4L5_volume/1000;
 print "L4L5_volume: ".$L4L5_volume."\n";
 $sh->rm("volume1.txt");
 push(@L4L5_volume,$volumeConv);
#************************Volume em Disco L3L4**************************
 $sh->mincstats(" -volume ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $L3L4_volume = substr($temp1,0,rindex($temp1," "));
 $volumeConv = $L3L4_volume/1000;
 print "L3L4_volume: ".$L3L4_volume."\n";
 $sh->rm("volume1.txt");
 push(@L3L4_volume,$volumeConv);
#************************Volume em Disco L2L3**************************
 $sh->mincstats(" -volume ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $L2L3_volume = substr($temp1,0,rindex($temp1," "));
 $volumeConv = $L2L3_volume/1000;
 print "L2L3_volume: ".$L2L3_volume."\n";
 $sh->rm("volume1.txt");
 push(@L2L3_volume,$volumeConv);
#************************Volume em Disco L1L2**************************
 $sh->mincstats(" -volume ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $L1L2_volume = substr($temp1,0,rindex($temp1," "));
 $volumeConv = $L1L2_volume/1000;
 print "L1L2_volume: ".$L1L2_volume."\n";
 $sh->rm("volume1.txt");
 push(@L1L2_volume,$volumeConv); "\n"; 

				
#*********************Fim da estimativa do Volume*************************************************








 chdir("..");							# Deixa no diretorio inicial		
}								# Fim do programa principal


