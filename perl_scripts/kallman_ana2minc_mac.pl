#!/usr/bin/perl -W


###############################################################
#Autores:Paula Rejane Beserra Diniz  #
#Ribeirao Preto,25 de junho de 2007      #
#
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
mkdir("Analyze");
while($contador != $teste)
{
  $arquivo = $vectorpasta[0];
  
  #$Stop = index($arquivo,"_")-2;
  $Start = index($arquivo,"./") + 2;
  $NomePaciente = substr($arquivo,$Start);
  print "\n\n $NomePaciente \n\n";
  if($NomePaciente ne $NomePacienteAnter)
  {
    #&Organiza;
    print "O nome do paciente eh: ".$NomePaciente."\n";
	&Processamento;
    }   
  
  $NomePacienteAnter = $NomePaciente;
  shift(@vectorpasta); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}

sub Processamento
{ chdir("Analyze");
  mkdir($NomePaciente);
  chdir("..");
  chdir($NomePaciente);
  $Stop = index($NomePaciente,"_");
  $PrimNome = substr($NomePaciente,0,$Stop);
  print "O nome do paciente eh: ".$PrimNome."\n";
  $sh->gunzip(" ".$PrimNome."_mt.mnc.gz");
  $sh->analyze2minc(" ".$PrimNome."_mt.mnc ".$PrimNome."_mt.hdr");
  $sh->mv("./".$PrimNome."_mt.hdr ~/process_marcel/Analyzes/".$ARGV[0]."/Analyze/".$NomePaciente);
  $sh->mv("./".$PrimNome."_mt.img ~/process_marcel/Analyzes/".$ARGV[0]."/Analyze/".$NomePaciente);
  chdir("RELAXOMETRIA");
  $sh->analyze2minc(" ".$PrimNome."_relaxo.mnc ".$PrimNome."_relaxo.hdr");
  $sh->mv("./".$PrimNome."_relaxo.hdr ~/process_marcel/Analyzes/".$ARGV[0]."/Analyze/".$NomePaciente);
  $sh->mv("./".$PrimNome."_relaxo.img ~/process_marcel/Analyzes/".$ARGV[0]."/Analyze/".$NomePaciente);
  chdir("..");
  chdir("..");
}