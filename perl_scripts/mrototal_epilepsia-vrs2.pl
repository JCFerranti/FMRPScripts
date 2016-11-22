#!/usr/bin/perl -W


###############################################################
#Autores:Paula Rejane Beserra Diniz  #
#Ribeirao Preto,27 de junho de 2007      #
#Retorna o volume de substância Branca, cinzenta e líquor#
#versao 1.0#
###############################################################

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************
print "\n*********************************************************************\n";

print "\nIniciando Processamento...\n";
$NomePastaAnter="";
@vectorpasta = glob("./*");
$teste = @vectorpasta;
$contador=0;
while($contador != $teste)
{
  $arquivo = $vectorpasta[0];
  $Start = index($arquivo,"./") + 2;
  $NomePasta = substr($arquivo,$Start);

  if($NomePasta ne $NomePastaAnter)
  {
    print "O nome da pasta eh: ".$NomePasta."\n";
	&Processamento;
   }   
  
  $NomePastaAnter = $NomePasta;
  shift(@vectorpasta); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}

sub Processamento
{   chdir($NomePasta);
    push(@nomes,$NomePasta);
	@vectorarquivo = glob("./*0_mpr.mnc.gz");
	$sh->gunzip(" ".$vectorarquivo[0]);
	@vectorarquivo = glob("./*0_mpr.mnc");
	print "\n\n".$vectorarquivo[0] ."\n\n";
	#-----------------------------------------------------------------------------------------------------
	#$sh->mincresample(" ".$vectorarquivo[0]." ".$NomePasta."_mpr_cor.mnc -xstart -88.00 -ystart 160.00 -zstart 160.00");#160
	#@vectorarquivo = glob("./*_mpr_cor.mnc");	
	#------------------------------------------------------------------------------------------------------
	$arquivo = $vectorarquivo[0];
	print "\n\n".$arquivo."\n\n";
	$Start = index($arquivo,"./") + 2;
	$Stop = index($arquivo,"_")-2;
	$NomePaciente = substr($arquivo,$Start,$Stop);	
	print "\n\n".$vectorarquivo[0] ."\n\n";
	#Create a transform to talairach space
	print "\n Create a transform to talairach space \n";
	$sh->mritotal(" -crop 35v,0 25v,0 25v,0 -nonlinear ".$vectorarquivo[0]." ".$NomePaciente."_talairach_transform.xfm");
	#$sh->mritotal(" -crop -8v,0 15v,0 15v,0 -nonlinear ".$vectorarquivo[0]." ".$NomePaciente."_talairach_transform.xfm");
	#Correct for non-uniformity (old versions of nu_correct, ex. v1.05, can fail with volumes with too long headers)
	print "\n Correct for non-uniformity (old versions of nu_correct, ex. v1.05, can fail with volumes with too long headers)\n";
	$sh->mv(" ".$vectorarquivo[0]." ..");
	chdir("..");
	$sh->nu_correct(" -distance 30 ".$vectorarquivo[0]." ".$NomePaciente."_native_corrected.mnc");
	$sh->mv(" *.mnc ./".$NomePasta);
	$sh->rm(" *.imp");
	chdir($NomePasta);
	print "\n Use talairach_transform.xfm to transform the image into talairach space\n";
	$sh->mincresample(" -like /usr/local/mni/data/ICBM/icbm_template_1.00mm.mnc -transformation ".$NomePaciente."_talairach_transform.xfm ".$NomePaciente."_native_corrected.mnc ".$NomePaciente."_mpr_talairach.mnc");
	#$sh->rm(" *.xfm");
	#$sh->rm(" *_native_corrected.mnc");
	
	$sh->gzip(" *.mnc");
	chdir("..");
	}