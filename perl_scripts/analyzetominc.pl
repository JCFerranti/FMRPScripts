#!/usr/bin/perl -W


###############################################################
#Autores:Paula Rejane Beserra Diniz  #
#Ribeirao Preto,25 de junho de 2007      #
#Retorna o volume de substância Branca, cinzenta e líquor#
#versao 1.0#
###############################################################

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

print "\n*********************************************************************\n";

print "\nIniciando Processamento...\n";
$NomePacienteAnter="";
@vectorpasta = glob("./*");
print " veja: ".$vectorpasta[0];
$teste = @vectorpasta;
print @vectorpasta;
$contador=0;
while($contador != $teste)
{
  $arquivo = $vectorpasta[0];
  
  #$Stop = index($arquivo,"_")-2;
  $Start = index($arquivo,"./")+2;
  $Stop = index($arquivo,".hdr")-2;
  $NomePaciente = substr($arquivo,$Start,$Stop);
  print "\n\n $NomePaciente \n\n";
  if($arquivo ne $NomePacienteAnter)
  {
    print "O nome do paciente eh: ".$NomePaciente."\n";
	print "\n\n convertendo para minc \n\n";
	$sh->analyze2minc( $NomePaciente);
	#$sh->ana2mnc(" ".$NomePaciente.".hdr ".$NomePaciente.".mnc");
  }	   
  
  $NomePacienteAnter = $arquivo;
  shift(@vectorpasta); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}
print "\n\n removendo e zipando \n\n";
$sh->rm("*.hdr");
$sh->rm("*.img");
$sh->gzip("*.mnc");
