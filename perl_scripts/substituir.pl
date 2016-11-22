#!/usr/bin/perl -W

use Shell; 

my $sh = Shell->new();

print "\nIniciando Processamento...\n";
@vectorpasta = glob("./*");
$teste = @vectorpasta;
$contador=0;
while($contador != $teste)
{
  $arquivo = $vectorpasta[0];
  print "\n O nome do arquivo:".$vectorpasta[0]."\n";
  
  #$Stop = index($arquivo,"_")-2;
  $Start = index($arquivo,"./") + 2;
  $NomePaciente = substr($arquivo,$Start);
  $NomePaciente2 = substr($arquivo,$Start);
   print "\n O nome do arquivo:".$NomePaciente2."\n";
  $NomePaciente2 =~ s/ /_/g;
  print "\n O nome do arquivo:".$NomePaciente2."\n";
  rename($NomePaciente,$NomePaciente2);
  #mkdir($NomePaciente2);  
  #$sh->mv(" ./".$NomePaciente." ./".$NomePaciente2);
  #$sh->rm(" -r ".$NomePaciente);
  shift(@vectorpasta);
  $contador=$contador+1;
  
}

