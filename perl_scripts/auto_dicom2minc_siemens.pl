#!/usr/bin/perl -W


###############################################################
#Autores:Paula Rejane Beserra Diniz  #
#Ribeirao Preto,11 de julho de 2006      #
#versao 1.0
###############################################################

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************


print "\n*********************************************************************\n";

print "\nIniciando Processamento...\n";
#reconhece as pastas de cada paciente
$NomePacienteAnter="";
@vectorpasta = glob("./*");
$teste = @vectorpasta;
$contador=0;
#entra pasta por pasta
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
    #$sh->rm(" -r ".$NomePaciente); 
	$sh->gzip(" --best -v *mnc");
  }   

  $NomePacienteAnter = $NomePaciente;
  shift(@vectorpasta); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}


sub Processamento
{print"\n\n Preparando arquivos...\n\n";
 chdir($NomePaciente);#entra na pasta do paciente
  $sh->rm(" DICOMDIR");
  @pasta=glob("./*");
	 print "\n\npasta: ".$pasta[0]."\n\n";
	 chdir($pasta[0]);
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
	 @pasta2=glob("./*");
	 print "\n\npasta: ".$pasta2[0]."\n\n";
	 chdir($pasta2[0]);
	@vectorpasta_2 = glob("./*"); 
	 print "O nome da pasta eh: ".$vectorpasta_2[0]."\n";
     chdir($vectorpasta_2[0]);
	 mkdir(" ~/mincs");
	 $sh->d2m(" ~/mincs SE*/*");
	 #$sh->minc_conv();
	 chdir("..");
	 chdir("..");
  }   
  
  $NomePastaAnter = $NomePasta;
  shift(@vectorpasta1); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador1=$contador1+1;
} 
 chdir("..");
 chdir("..");

 print"\n\n Movendo...\n\n";
 $sh->mv(" ~/mincs/*.mnc ./");
}
