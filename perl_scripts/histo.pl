!/usr/bin/perl 

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
 print RELATDADOS "name; NP5 (mm²/s); Histo \n";
 $c=0;
 print "Nomes: ".$nomes."\n"; 
 while($c != $tam)
	{  
         print "Escrevendo resultados: \n"; 
	 print RELATDADOS $nomes[$c].";".$NP5_mean[$c].";".$Histo_5[$c]. "\n";
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
 sh->mincstats(" -histogram histogram_relaxo_lesao.txt ".$PrimNome."_process.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $Histo_5 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");
 push(@Histo_5,$Histo_5);


"\n"; 

				
#*********************Fim da estimativa do ADC*************************************************








 chdir("..");							# Deixa no diretorio inicial		
}								# Fim do programa principal


