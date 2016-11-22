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
 
sub Processamento 
{print"\n\n Obtendo dados do paciente...\n\n";
  print "\n\n".$pastas[0]."\n\n";
  $Stop = index($NomePasta,"_".$ARGV[0]);
 $NomePaciente = substr($NomePasta,0,$Stop);

 
 #@dMap = glob("./*_dMap.mnc.gz");
 #@faMap = glob("./*_".$ARGV[0].".mnc.gz");
	 
print "\n\n convertendo de minc para nift\n";	 
$sh->mv(" ".$pastas[0]." ".$NomePaciente."_faMap_normalizada.nii.gz");

}