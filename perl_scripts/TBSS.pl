#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               #
#Ribeirao Preto,16 de janeiro de 2007                                                                                                                                         #
#versao 1.0                                                                                                                                                                                       #
# A teoria parao desenvolvimento desta ferramenta foi retirada da tese de doutorado de André Luiz Mendes Matos        #
# "Criação de um mapa voxel por voxel da distribuição espacial da transferencia de magnetização na suabstância          #
#                                                     Branca do cérebro humano de adultos normais"                                                                    #
#                                                   							                                                                           #
#                                                    - Análise do histograma do MTR da substância branca e cinzenta                                       #
#                                                    - Análise Golobal - mapas: média, desvio padrão, z-score                                                      #
#####################################################################
#@NAME       : DEMMT.pl
#@INPUT      : 
#@OUTPUT     : mapa_medio_MTR.mnc,mapa_medio_white_matter.mnc,mapa_medio_gray_matter.mnc,<mrs_id>_mt.mnc, and <mrs_id>_nnr.txt
#@RETURNS    : 
#@DESCRIPTION: Criação de um mapa voxel por voxel da distribuição espacial da transferencia de magnetização na suabstância Branca do cérebro humano.

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************


print "\n*********************************************************************\n";

print "\n Iniciando Processo...\n";
print "\n-- Por favor aguarde --\n";

print "\n-- TBSS etapa 01 --\n";
$sh->tbss_1_preproc( "*.nii.gz");
print "\n-- TBSS etapa 02 --\n";
$sh->tbss_2_reg(" -T");
print "\n-- TBSS etapa 03 --\n";
$sh->tbss_3_postreg(" -T");
print "\n-- TBSS etapa 04 --\n";
$sh->tbss_4_prestats(" 0.2");
chdir("stats");
print "\n-- TBSS etapa 05 --\n";
#CONTROLES PACIENTES
$sh->design_ttest2(" design ".$ARGV[0]." ".$ARGV[1]);
$sh->randomise(" -i all_FA_skeletonised -o tbss -m mean_FA_skeleton_mask -d design.mat -t design.con -n 5000 --T2 -V");
print "\n-- ACABOU!!!! --\n";
print "\n-- TBSS Abrindo resultado... --\n";
chdir("stats");
$sh->fslview(" $FSLDIR/data/standard/MNI152_T1_1mm mean_FA_skeleton -l Green -b 0.2,0.7 tbss_tfce_corrp_tstat1 -l Red-Yellow -b 0.95,1");


