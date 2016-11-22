#!/usr/bin/perl -W

use Shell; 

my $sh = Shell->new();

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
    }   
  
  $NomePacienteAnter = $NomePaciente;
  shift(@vectorpasta); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}

sub Processamento
{	print"\n\n Preparando arquivos...\n\n";
	chdir($NomePaciente);
	@v= glob("./*_0_mpr.mnc.gz");
	print "\n\n".$v[0]."\n\n";
	$sh->gunzip(" ".$v[0]." ");
	@v = glob("./*_0_mpr.mnc");
	print "\n\n tirando o mnc do final \n\n";
	$sh->mincresample(" -nearest_neighbour -transverse ".$v[0]." ".$NomePaciente."_d1_ln.mnc ");
	@v = glob("./*_d1_ln.mnc");
	$arquivo = $v[0];
	$sh->mritotal(" ".$v[0]." ".$NomePaciente."_talairach_transform.xfm");
	$sh->mincresample(" -like /usr/local/mni/data/ICBM/icbm_template_1.00mm.mnc -transformation ".$NomePaciente."_talairach_transform.xfm ".$v[0]." ".$NomePaciente."_talairach_corrected.mnc");
	@v = glob("./*_talairach_corrected.mnc");
	$arquivo = $v[0];
    $Start = index($arquivo,"./") + 2;
	$Stop = index($arquivo,".mnc")-2;
    $Nomearq = substr($arquivo,$Start,$Stop);
	print "\n\n".$Nomearq."\n\n";
	#$arquivo = $vector[0];
	print "\n\n convertendo para analyze \n\n";
	$sh->minc2analyze(" ".$Nomearq);
	@vector2 = glob("./*.hdr");
	print "\n\n".$vector2[0] ."\n\n";
	$arquivo3 = $vector2[0];
	$Start = index($arquivo3,"./") + 2;
	$Stop = index($arquivo3,".hdr")-2;
    $Nomearq2 = substr($arquivo3,$Start,$Stop);
	$sh->rm(" ".$arquivo." ");
	print "\n\n".$Nomearq2."\n\n";
	print "\n\n Bet \n\n";
	$sh->bet(" ".$arquivo3." bet_".$NomePaciente." -m");
	print "\n\n convertendo para minc \n\n";
	$sh->analyze2minc(" bet_".$NomePaciente);
	print "\n\n removendo e zipando \n\n";
	#$sh->gzip(" bet_".$NomePaciente.".mnc");
	$sh->rm("*.hdr");
	$sh->rm("*.img");
	$sh->gzip("*.mnc");
	chdir("..");
}