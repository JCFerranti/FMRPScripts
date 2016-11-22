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
 
 mkdir("nift_files");
 $sh->mv(" *.nii ./nift_files");
 
 chdir("nift_files");
	$sh->gzip("*.nii");
 chdir("..");
 
sub Processamento 
{print"\n\n Obtendo dados do paciente...\n\n";
  print "\n\n".$pastas[0]."\n\n";
  $Stop = index($NomePasta,"_".$ARGV[1]);
 $NomePaciente = substr($NomePasta,0,$Stop);

 
 #@dMap = glob("./*_dMap.mnc.gz");
 @faMap = glob("./*_".$ARGV[1].".mnc.gz");
 #$sh->gunzip($dMap[0]);
 $sh->gunzip($faMap[0]);
 @faMap = glob("./*_".$ARGV[1].".mnc");

	 
print "\n\n convertendo de minc para nift\n";	 
$sh->mnc2nii(" -int ".$faMap[0]." ".$ARGV[0]."_".$NomePaciente."_".$ARGV[1].".nii");
#$sh->rm("faMap_add.mnc");

}