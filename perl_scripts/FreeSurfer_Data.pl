#!/usr/bin/perl -W


###############################################################
#Autores:Paula Rejane Beserra Diniz  #
#Ribeirao Preto,24 de novembro de 2009     #
#Este script renomeia e classifica os arquivos minc dentro de um diretorio
#versao 2.0
###############################################################

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************


 $patient = $ARGV[0];
 $Stop = index($patient,".");
 $PatientName = substr($patient,0,$Stop);



print "Satating Tables...";

system (" asegstats2table --subjects ".$PatientName." --meas volume --tablefile aseg_stats_".$PatientName.".txt");

system (" aparcstats2table --hemi lh --subjects ".$PatientName." --meas volume --tablefile aparc_stats_lh_volume_".$PatientName.".txt");

system (" aparcstats2table --hemi rh --subjects ".$PatientName." --meas volume --tablefile aparc_stats_rh_volume_".$PatientName.".txt");

system (" aparcstats2table --hemi lh --subjects ".$PatientName." --meas thickness --tablefile aparc_stats_lh_thickness_".$PatientName.".txt");

system (" aparcstats2table --hemi rh --subjects ".$PatientName." --meas thickness --tablefile aparc_stats_rh_thickness_".$PatientName.".txt");

system (" asegstats2table --subjects ".$PatientName." --all segs --stats wmparc.stats --tablefile wmparc_stats_".$PatientName.".txt");

