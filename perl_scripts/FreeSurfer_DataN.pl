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


 #formando o vetor de pacientes
 $contador=0;
 $cont=@ARGV;
 $PatientName="";
 while($contador != $cont)
 { 
 #print "\n\n\teste ARGs".$ARGV[$contador];
 $patient = $ARGV[$contador];
 $PatientName=$PatientName." ".$patient;
 $contador=$contador+1;
}
#print "\n\n\n Teste:".$PatientName."\n\n";

print "Satating Tables...";

system (" asegstats2table --subjects ".$PatientName." --meas volume --tablefile aseg_stats.txt --skip");

system (" aparcstats2table --hemi lh --subjects ".$PatientName." --meas volume --tablefile aparc_stats_lh_volume.txt --skip");

system (" aparcstats2table --hemi rh --subjects ".$PatientName." --meas volume --tablefile aparc_stats_rh_volume.txt --skip");

system (" aparcstats2table --hemi lh --subjects ".$PatientName." --meas thickness --tablefile aparc_stats_lh_thickness.txt --skip");

system (" aparcstats2table --hemi rh --subjects ".$PatientName." --meas thickness --tablefile aparc_stats_rh_thickness.txt --skip");

system (" asegstats2table --subjects ".$PatientName." --all segs --stats wmparc.stats --tablefile wmparc_stats.txt --skip");

