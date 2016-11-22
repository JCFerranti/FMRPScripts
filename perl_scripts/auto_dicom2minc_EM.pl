#!/usr/bin/perl -W


###############################################################
#Autores:Paula Rejane Beserra Diniz  #
#Ribeirao Preto,11 de julho de 2006      #
#versao 1.0
#pasta_paciente - pasta_data-STXXX-SEXXX
###############################################################

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************


print "\n*********************************************************************\n";

print "\nIniciando Processamento...\n";
$NomePacienteAnter="";
@vectorpasta = glob("./*");
$teste = @vectorpasta;
$contador=0;
while($contador != $teste)
{
  $arquivo = $vectorpasta[0];
  
  #$Stop = index($arquivo,"_")-2;
  $Start = index($arquivo,"./") + 2;
  $NomePaciente = substr($arquivo,$Start);
  if($NomePaciente ne $NomePacienteAnter)
  {
    print "O nome do paciente eh: ".$NomePaciente."\n";
	&Processamento;
    $sh->rm(" -r ".$NomePaciente); 
	$sh->gzip(" --best -v *mnc");
  }   

  $NomePacienteAnter = $NomePaciente;
  shift(@vectorpasta); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}


sub Processamento
{print"\n\n Preparando arquivos...\n\n";
 chdir($NomePaciente);
 #dentro da pasta do paciente
 $NomePastaAnter = "";
 @vectorpasta1 = glob("./*");
 $teste1 = @vectorpasta1;
 $contador1=0;
 while($contador1 != $teste1)
 {
  $arquivo1 = $vectorpasta1[0];
  $Start1 = index($arquivo1,"./") + 2;
  $NomePasta = substr($arquivo1,$Start1);
  if($NomePasta ne $NomePastaAnter)
  {
    print "O nome da pasta eh: ".$NomePasta."\n";
	 chdir($vectorpasta1[0]);
	 mkdir(" ~/mincs");
	 $sh->d2m(" ~/mincs SE*/*");
	 #$sh->minc_conv();
	 chdir("..");
  }   
  
  $NomePastaAnter = $NomePasta;
  shift(@vectorpasta1); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador1=$contador1+1;
} 
 chdir("..");
 print"\n\n Movendo...\n\n";
 $sh->mv(" ~/mincs/*.mnc ./");
}
