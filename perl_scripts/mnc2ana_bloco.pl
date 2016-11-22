#!/usr/bin/perl -W

use Shell; 

my $sh = Shell->new();

print "\nIniciando Processamento...\n";
$NomePacienteAnter="";
$sh->gunzip(" * ");
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
    }   
  
  $NomePacienteAnter = $NomePaciente;
  shift(@vectorpasta); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}
$sh->rm("*.mnc");
mkdir("MTR");
$sh->mv("*_mt* ./MTR");
mkdir("RELAXOMETRIA");
$sh->mv("*_relaxo* ./RELAXOMETRIA");

sub Processamento
{	print"\n\n Preparando arquivos...\n\n";
	$arquivo = $NomePaciente;
    $Start = index($arquivo,"./") + 1;
	$Stop = index($arquivo,".mnc");
    $Nomearq = substr($arquivo,$Start,$Stop);
	print "\n\n".$Nomearq."\n\n";
	#$arquivo = $vector[0];
	print "\n\n convertendo para analyze \n\n";
	$sh->minc2analyze(" ".$Nomearq);
	@vector2 = glob("./*.hdr");
}