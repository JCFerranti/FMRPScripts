#!/usr/bin/perl -W

###############################################################
#Autores:Paula Rejane Beserra Diniz  #
#Ribeirao Preto,27 de junho de 2007      #
#Retorna os labels de substância Branca, cinzenta e líquor#
#versao 2.0#
###############################################################


use Shell; # Modulo(Biblioteca) de acesso aos comandos do shell

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
	$arquivo = $vectorarquivo[0];
	print "\n\n".$arquivo."\n\n";
	$Start = index($arquivo,"./") + 2;
	$Stop = index($arquivo,"_")-2;
	$NomePaciente = substr($arquivo,$Start,$Stop);	
	@vetorformask = glob("./bet_*");
	$sh->mincmath(" -const2 1 99999 -segment ".$vetorformask[0]." bet1_".$NomePaciente.".mnc");
	print "\n\n".$vectorarquivo[0] ."\n\n";
	 
  
	#Create a transform to talairach space
	print "\n Create a transform to talairach space \n";
	#$sh->mritotal(" ".$vectorarquivo[0]." ".$NomePaciente."_talairach_transform.xfm");
	
	#Correct for non-uniformity (old versions of nu_correct, ex. v1.05, can fail with volumes with too long headers)
	#print "\n Correct for non-uniformity (old versions of nu_correct, ex. v1.05, can fail with volumes with too long headers)\n";
	#$sh->mv(" ".$vectorarquivo[0]." ..");
	#chdir("..");
	#$sh->nu_correct(" ".$vectorarquivo[0]." ".$NomePaciente."_native_corrected.mnc");
	#$sh->mv(" *.mnc ./".$NomePasta);
	#$sh->rm(" *.imp");
	#chdir($NomePasta);
	#print "\n Use talairach_transform.xfm to transform the image into talairach space\n";
	#$sh->cp(" ".$vectorarquivo[0]." ./".$NomePaciente."_native_corrected.mnc");
	#$sh->mincresample(" -like /usr/local/mni/data/ICBM/icbm_template_1.00mm.mnc -transformation ".$NomePaciente."_talairach_transform.xfm ".$NomePaciente."_native_corrected.mnc ".$NomePaciente."_talairach_corrected.mnc");
	@vector_mpr_talairach = glob("./*_mpr_talairach.mnc.gz");
	$sh->gunzip(" ".$vector_mpr_talairach[0]);
	@vector_mpr_talairach = glob("./*_mpr_talairach.mnc");
	$sh->cp(" ".$vector_mpr_talairach[0]." ./".$NomePaciente."_talairach_corrected.mnc");
	$sh->gunzip(" ".$NomePaciente."_native_corrected.mnc");
	
	
	#Classify each voxel as white, grey, CSF, or background
	@class = glob(" ".$NomePaciente."_talairach_corrected.mnc");
	$classfile = @class;
	print "\n\n".$classfile." ".$class[0]."\n\n";
	#$sh->mritoself(" -close /usr/local/mni/share/tal_models/tal_eye_inv.mnc bet1_".$NomePaciente.".mnc eyes2bet.xfm");
	#$sh->mincresample(" /usr/local/mni/share/tal_models/tal_eye_inv.mnc eyes2bet.mnc -like bet1_".$NomePaciente.".mnc -transformation eyes2bet.xfm");
	#$sh->mritoself(" -close /usr/local/mni/share/tal_models/tal_eye_carotid_cerebellum_brainstem_inv.mnc bet1_".$NomePaciente.".mnc cerebelo2bet.xfm");
	#$sh->mincresample(" /usr/local/mni/share/tal_models/tal_eye_carotid_cerebellum_brainstem_inv.mnc encefalo2bet.mnc -like bet1_".$NomePaciente.".mnc -transformation cerebelo2bet.xfm");
	#$sh->mincmath(" -mult bet1_".$NomePaciente.".mnc eyes2bet.mnc bet_".$NomePaciente.".mnc");
	#$sh->mincmath(" -mult encefalo2bet.mnc bet_".$NomePaciente.".mnc ".$NomePaciente."_encefalo1.mnc");
	#$sh->mincresample(" ".$NomePaciente."_encefalo1.mnc ".$NomePaciente."_encefalo.mnc -like ".$NomePaciente."_native_corrected.mnc -invert_transformation -transformation ".$NomePaciente."_talairach_transform.xfm");	
	$sh->mv("bet1_".$NomePaciente.".mnc bet_".$NomePaciente.".mnc");
	$sh->rm(" *.nii");
	
	print "\n Classify each voxel as white, grey, CSF, or background\n";
	
	$sh->classify_clean(" ".$NomePaciente."_talairach_corrected.mnc ".$NomePaciente."_classified2.mnc");
	#$sh->classify_clean(" ".$NomePaciente."_talairach_corrected.mnc ".$NomePaciente."_classified2.mnc");
	$sh->gzip(" ".$NomePaciente."_classified2.mnc");
	$sh->gzip(" bet_".$NomePaciente.".mnc");
	$sh->res(" bet_".$NomePaciente." ".$NomePaciente."_classified2 ");
	$sh->gunzip(" bet_".$NomePaciente.".mnc.gz");
	$sh->gunzip(" ".$NomePaciente."_classified2.mnc.gz");
	$sh->mincmath(" -mult ".$NomePaciente."_classified2.mnc bet_".$NomePaciente."_res.mnc.gz ".$NomePaciente."_classified1.mnc");
	
	print "\n Mask the skull and dura from the brain, so that they do not interfere with the data.\n";
	$sh->mincresample(" ".$NomePaciente."_classified1.mnc ".$NomePaciente."_classified.mnc -like ".$NomePaciente."_native_corrected.mnc -invert_transformation -transformation ".$NomePaciente."_talairach_transform.xfm");	
	
	@flair = glob(" *_0_flair.mnc.gz");
	$sh->mritoself(" -close ".$vectorarquivo[0]." ".$flair[0]." flair_to_mpr.xfm");
	$sh->mincresample(" ".$flair[0]." flairtompr.mnc -like ".$vectorarquivo[0]." -transformation flair_to_mpr.xfm");
	$sh->mincblur("-fwhm 4 -gaussian flairtompr.mnc flairtompr ");
    #$sh->mincblur("-fwhm 4 -gaussian ".$flair[0]." flairtompr ");
	
	#$sh->mincmath(" -const2 230 99999 -segment flairtompr.mnc ".$NomePaciente."_0_lesoes_lbl.mnc");
	#$sh->mincmath(" -const2 230 99999 -nsegment flairtompr.mnc ".$NomePaciente."_0_slesoes_lbl.mnc");
	#$sh->mincmath(" -const2 212 423 -segment flairtompr.mnc ".$NomePaciente."_0_lesoes_lbl.mnc");
	#$sh->mincmath(" -const2 212 423 -nsegment flairtompr.mnc ".$NomePaciente."_0_slesoes_lbl.mnc");
	$sh->mincmath(" -const2 215 9999 -segment flairtompr_blur.mnc ".$NomePaciente."_0_lesoes_lbl.mnc");
	$sh->mincmath(" -const2 215 9999 -nsegment flairtompr_blur.mnc ".$NomePaciente."_0_slesoes_lbl.mnc");
	

	$sh->mincmath(" -mult ".$NomePaciente."_classified.mnc ".$NomePaciente."_0_slesoes_lbl.mnc ".$NomePaciente."_classified_s_lesao.mnc");
	#Lesões sem caixa
	$sh->mincmath(" -const2 1 9999 -segment ".$NomePaciente."_classified.mnc mascara_cerebro.mnc");
	$sh->gzip("mascara_cerebro.mnc");
	$sh->gzip(" ".$NomePaciente."_0_lesoes_lbl.mnc");
	$sh->res("mascara_cerebro ".$NomePaciente."_0_lesoes_lbl");
	$sh->mincmath(" -mult ".$NomePaciente."_0_lesoes_lbl.mnc.gz mascara_cerebro_res.mnc.gz ".$NomePaciente."_0_lesoes.mnc");
	print "\n Finish work \n";
     $sh->rm(" *.xfm");
	 $sh->rm(" ".$NomePaciente."_classified1.mnc");
	 #$sh->rm(" *_res.mnc");
	 $sh->rm(" ".$NomePaciente."_native_corrected.mnc");
	 $sh->rm(" *_d1_ln.mnc");
	 $sh->gzip(" *.mnc");

  chdir("..");

}