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

use vars qw( %ENV );
   # vari�vel de ambiente PATH
   $ENV{SUBJECTS_DIR} = q( ./);
 
 $patient = $ARGV[0];
 $Stop = index($patient,".");
 $PatientName = substr($patient,0,$Stop);

system("echo patient=$patient");
system("echo Stop=$Stop");
system("echo PatientName=$PatientName");
system("echo \n");
system("echo Descompactando...");
system("gunzip ".$PatientName.".mnc.gz");
system("echo Iniciando o Freesurfer");
system("echo recon-all -s ".$PatientName." -i ".$PatientName.".mnc -all");

#system (" recon-all -s ".$PatientName." -i ".$patient);
system("recon-all -s ".$PatientName." -i ".$PatientName.".mnc -all");
#system (" recon-all -s ".$PatientName." -all ");

#Convertendo para minc
$sh->mri_convert(" --in_type mgz -i ./".$PatientName."/mri/aseg.mgz --out_type minc -o ".$PatientName."_aseg.mnc");  
$sh->mri_convert(" --in_type mgz -i ./".$PatientName."/mri/aparc+aseg.mgz --out_type minc -o ".$PatientName."_aparc+aseg.mnc");  
$sh->mri_convert(" --in_type mgz -i ./".$PatientName."/mri/wmparc.mgz --out_type minc -o ".$PatientName."_wmparc.mnc");  

