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

open(RELATDADOS, "> Dados_volume_classify_total_brain.txt");
    $tam =@nomes;
    print RELATDADOS "nome,CSF(cm3),GM(cm3),WM(cm3),Vol IC T(cm3),Vol enc(cm3),vol cerebelo_ponte_bulbo(cm3)\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$volumes_liquor[$c].",".$volumes_MC[$c].",".$volumes_MB[$c].",".$volumes_intracraniano[$c].",".$volumes_encefalo[$c].",".$volumes_cerebelo[$c]."\r";
	  $c=$c+1;
	}
sub Processamento
{   chdir($NomePasta);
    push(@nomes,$NomePasta);
	@vectorarquivo = glob("./*_0_mpr.mnc.gz");
	$sh->gunzip(" ".$vectorarquivo[0]);
	@vectorarquivo = glob("./*_0_mpr.mnc");
	print "\n\n".$vectorarquivo[0] ."\n\n";
	$arquivo = $vectorarquivo[0];
	print "\n\n".$arquivo."\n\n";
	$Start = index($arquivo,"./") + 2;
	$Stop = index($arquivo,"_")-2;
	$NomePaciente = substr($arquivo,$Start,$Stop);	
	#$sh->mincresample(" ".$vectorarquivo[0]." ".$NomePaciente."_d1_ln.mnc -nearest_neighbour -sagittal -zstep 1 -znelem 160");#160
	#@vectorarquivo = glob("./*_d1_ln.mnc");
	print "\n\n".$vectorarquivo[0] ."\n\n";
	#Create a transform to talairach space
	print "\n Create a transform to talairach space \n";
	$sh->mritotal(" ".$vectorarquivo[0]." ".$NomePaciente."_talairach_transform.xfm");
	#Correct for non-uniformity (old versions of nu_correct, ex. v1.05, can fail with volumes with too long headers)
	print "\n Correct for non-uniformity (old versions of nu_correct, ex. v1.05, can fail with volumes with too long headers)\n";
	$sh->mv(" ".$vectorarquivo[0]." ..");
	chdir("..");
	$sh->nu_correct(" ".$vectorarquivo[0]." ".$NomePaciente."_native_corrected.mnc");
	$sh->mv(" *.mnc ./".$NomePasta);
	$sh->rm(" *.imp");
	chdir($NomePasta);
	print "\n Use talairach_transform.xfm to transform the image into talairach space\n";
	$sh->mincresample(" -like /usr/local/mni/data/ICBM/icbm_template_1.00mm.mnc -transformation ".$NomePaciente."_talairach_transform.xfm ".$NomePaciente."_native_corrected.mnc ".$NomePaciente."_talairach_corrected.mnc");
	#Classify each voxel as white, grey, CSF, or background
	@class = glob(" ".$NomePaciente."_talairach_corrected.mnc");
	$classfile = @class;
	print "\n\n".$classfile." ".$class[0]."\n\n";
	print "\n Convertendo arquivo...\n";
	$sh->mnc2nii(" ".$NomePaciente."_talairach_corrected.mnc ".$NomePaciente."_forBet.nii");
	print "\n Fazendo o BET...\n";
	$sh->bet2(" ".$NomePaciente."_forBet.nii bet_".$NomePaciente." -m ");
	print "\n Descompactando arquivo...\n";
	$sh->rm(" ".$NomePaciente."_forBet.nii");
	$sh->gunzip(" bet_".$NomePaciente."_mask.nii.gz");
	print "\n Convertendo arquivo...\n";
	$sh->analyze2minc(" bet_".$NomePaciente."_mask bet1_".$NomePaciente." ");
	
	$sh->mritoself(" -close /usr/local/mni/share/tal_models/tal_eye_inv.mnc bet1_".$NomePaciente.".mnc eyes2bet.xfm");
	$sh->mincresample(" /usr/local/mni/share/tal_models/tal_eye_inv.mnc eyes2bet.mnc -like bet1_".$NomePaciente.".mnc -transformation eyes2bet.xfm");
	
	$sh->mritoself(" -close /usr/local/mni/share/tal_models/tal_eye_carotid_cerebellum_brainstem_inv.mnc bet1_".$NomePaciente.".mnc cerebelo2bet.xfm");
	$sh->mincresample(" /usr/local/mni/share/tal_models/tal_eye_carotid_cerebellum_brainstem_inv.mnc encefalo2bet.mnc -like bet1_".$NomePaciente.".mnc -transformation cerebelo2bet.xfm");
	
	
	$sh->mincmath(" -mult bet1_".$NomePaciente.".mnc eyes2bet.mnc bet_".$NomePaciente.".mnc");
	$sh->mincmath(" -mult encefalo2bet.mnc bet_".$NomePaciente.".mnc ".$NomePaciente."_encefalo1.mnc");
	
	#$sh->mincresample(" bet2_".$NomePaciente.".mnc bet_".$NomePaciente.".mnc -like bet2_".$NomePaciente.".mnc  -invert_transformation -transformation eyes2bet.xfm");ransformation ".$NomePaciente."_talairach_transform.xfm");	
	$sh->mincresample(" ".$NomePaciente."_encefalo1.mnc ".$NomePaciente."_encefalo.mnc -like ".$NomePaciente."_native_corrected.mnc -invert_transformation -transformation ".$NomePaciente."_talairach_transform.xfm");	
	$sh->rm(" *.nii");
	print "\n Classify each voxel as white, grey, CSF, or background\n";
	#$sh->classify_clean(" -clean_tags bet_".$NomePaciente.".mnc ".$NomePaciente."_classified1.mnc");
	$sh->classify_clean(" -clean_tags ".$NomePaciente."_talairach_corrected.mnc ".$NomePaciente."_classified2.mnc");
	$sh->mincmath(" -mult ".$NomePaciente."_classified2.mnc bet_".$NomePaciente.".mnc ".$NomePaciente."_classified1.mnc");
	#$sh->mritoself(" -close ".$NomePaciente."_classified1.mnc /usr/local/mni/share/tal_models/tal_eye.mnc eyes2bet.xfm");
	#$sh->mincresample(" ".$NomePaciente."_classified1.mnc eyes2bet.mnc -like /usr/local/mni/share/tal_models/tal_eye.mnc -transformation eyes2bet.xfm");
	#$sh->mincmath(" -or eyes2bet.mnc /usr/local/mni/share/tal_models/tal_eye.mnc ".$NomePaciente."_classified3.mnc");
	#$sh->mincresample(" ".$NomePaciente."_classified3.mnc ".$NomePaciente."_classified4.mnc -like ".$NomePaciente."_classified1.mnc -invert_transformation -transformation eyes2bet.xfm");
	#Mask the skull and dura from the brain, so that they do not interfere with the data.
	print "\n Mask the skull and dura from the brain, so that they do not interfere with the data.\n";
	#$sh->cortical_surface(" ".$NomePaciente."_classified.mnc ".$NomePaciente."_cortical_mask.obj 1.5");
	$sh->mincresample(" ".$NomePaciente."_classified1.mnc ".$NomePaciente."_classified.mnc -like ".$NomePaciente."_native_corrected.mnc -invert_transformation -transformation ".$NomePaciente."_talairach_transform.xfm");	
	print "\n Finish work \n";
     $sh->rm(" *.xfm");
	 $sh->rm(" ".$NomePaciente."_classified1.mnc");
	 $sh->rm(" *_res.mnc");
	 $sh->rm(" ".$NomePaciente."_native_corrected.mnc");
	 $sh->rm(" *_d1_ln.mnc");
	 $sh->gzip(" *.mnc");
	@vectorarquivo = glob("./*_mpr.mnc.gz");
	$arquivo1=$vectorarquivo[0];
	$Start = index($arquivo1,"./") + 2;
	$Stop = index($arquivo1,".mnc.gz")-2;
	$Nomed1 = substr($arquivo1,$Start,$Stop);
	print "\n\n".$Nomed1."\n\n";
	 #*Calculo do volume do licor******************************************************************
 $sh->res(" ".$Nomed1." ".$NomePaciente."_classified");
 @vectorres = glob("./*_mpr_res.mnc.gz");
 $sh->mincstats(" -volume ".$vectorres[0]." -mask ".$NomePaciente."_classified.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));

 $volumeConv_liquor = $volume1/1000;
  print"\n\n volume do liquor: ". $volumeConv_liquor."\n\n";
  push(@volumes_liquor,$volumeConv_liquor);
  $sh->rm("volume1.txt");
 
  #*Calculo do volume do massa cinzenta******************************************************************
 $sh->mincstats(" -volume ".$vectorres[0]." -mask ".$NomePaciente."_classified.mnc.gz -mask_binvalue 2 > volume3.txt");
 $tag3 = $sh->grep(" Volume volume3.txt");
 $temp3 = substr($tag3,rindex($tag3,":")+7);
 $volume3 = substr($temp3,0,rindex($temp3," "));
 
 $volumeConv_MC = $volume3/1000;
  print"\n\n volume da Massa Cinzenta: ".$volumeConv_MC."\n\n";
  push(@volumes_MC,$volumeConv_MC);
  $sh->rm("volume3.txt");
  
  #*Calculo do volume do massa branca******************************************************************
 $sh->mincstats(" -volume ".$vectorres[0]." -mask ".$NomePaciente."_classified.mnc.gz -mask_binvalue 3 > volume4.txt");
 $tag4 = $sh->grep(" Volume volume4.txt");
 $temp4 = substr($tag4,rindex($tag4,":")+7);
 $volume4 = substr($temp4,0,rindex($temp4," "));
 
 $volumeConv_MB = $volume4/1000;
  print"\n\n volume da Massa Branca: ".$volumeConv_MB."\n\n";
  push(@volumes_MB,$volumeConv_MB);
  $sh->rm("volume4.txt");
  
  #*volume cerebral********************************************************************
 $sh->mincstats(" -range 1,99999999 -volume ".$NomePaciente."_classified.mnc.gz > volume.txt");
 $tagi = $sh->grep(" Volume volume.txt");
 $tempi = substr($tagi,rindex($tagi,":")+7);
 $volumei = substr($tempi,0,rindex($tempi," "));
 $volumeConv_intracraniano = $volumei/1000;
  print"\n\n volume intra-craniano: ".$volumeConv_intracraniano."\n\n";
  push(@volumes_intracraniano,$volumeConv_intracraniano);
  $sh->rm("volume.txt");
 #*volume cerebral********************************************************************
  $sh->mincstats(" -range 1,1 -volume ".$NomePaciente."_encefalo.mnc.gz > volume.txt");
 $tagi = $sh->grep(" Volume volume.txt");
 $tempi = substr($tagi,rindex($tagi,":")+7);
 $volumei = substr($tempi,0,rindex($tempi," "));
 $volumeConv_encefalo = $volumei/1000;
  print"\n\n volume encefalo: ".$volumeConv_encefalo."\n\n";
  push(@volumes_encefalo,$volumeConv_encefalo);
  $sh->rm("volume.txt");
  
  #*volume cerebral********************************************************************
 $volumeConv_cerebelo = $volumeConv_intracraniano - $volumeConv_encefalo;
  print"\n\n volume cerebelo: ".$volumeConv_cerebelo."\n\n";
  push(@volumes_cerebelo,$volumeConv_cerebelo);


  chdir("..");

}