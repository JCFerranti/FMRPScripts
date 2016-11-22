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

#system ("setenv FREESURFER_HOME /Applications/freesurfer");
use vars qw( %ENV );
   # variável de ambiente PATH
   #$ENV{FREESURFER_HOME} = q( /Applications/freesurfer);
   #$sh-> source ("$FREESURFER_HOME/SetUpFreeSurfer.csh");
#system ("setenv SUBJECTS_DIR ./");
   $ENV{SUBJECTS_DIR} = q( ./);
 
 $patient = $ARGV[0];
 $Stop = index($patient,".");
 $PatientName = substr($patient,0,$Stop);

system (" recon-all -s ".$PatientName." -i ".$patient);
system (" recon-all -s ".$PatientName." -all ");