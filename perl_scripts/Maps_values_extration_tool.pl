#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               
#Ribeirao Preto,05 de outubro de 2009                                                                                                                                       
#versao 1.0                                                                                                                                                                                   
# Este programa é baseado nos labels do programa FreeSurfer                                                    
#Os valores dos labels para cada estrutura são:       
#Left-Cerebral-White-Matter   2
#Left-Cerebral-Cortex        3
#Left-Cerebellum-White-Matter  7
#Left-Cerebellum-Cortex     8
#Left-Thalamus-Proper       10
#Left-Caudate                      11  
#Left-Putamen                     12
#Left-Pallidum 		    13
#Brain-Stem                        16   
#Left-Hippocampus             17       
#Left-Amygdala                   18
#Left-Accumbens-area       26
#Left-VentralDC                 28
#Right-Cerebral-White-Matter      41
#Right-Cerebral-Cortex  42
#Right-Cerebellum-White-Matter   46
#Right-Cerebellum-Cortex     47
#Right-Thalamus-Proper        49
#Right-Caudate		      50
#Right-Putamen                     51        
#Right-Pallidum                     52
#Right-Hippocampus            53
#Right-Amygdala                  54
#Right-Accumbens-area       58 
#Right-VentralDC                  60   
#WM-hypointensities           77
#Optic-Chiasm                      85
#CC_Posterior                     251
#CC_Mid_Posterior            252
#CC_Central                        253
#CC_Mid_Anterior             254      
#CC_Anterior                      255

#lh-caudalanteriorcingulate 1002
#lh-caudalmiddlefrontal 1003
#lh-cuneus 1005 
#lh-entorhinal 1006
#lh-fusiform 1007
#lh-inferiorparietal 1008
#lh-inferiortemporal 1009
#lh-isthmuscingulate 1010
#lh-lateraloccipital 1011
#lh-lateralorbitofrontal 1012
#lh-lingual 1013
#lh-medialorbitofrontal 1014
#lh-middletemporal 1015
#lh-parahippocampal 1016
#lh-paracentral 1017
#lh-parsopercularis 1018
#lh-parsorbitalis 1019
#lh-parstriangularis 1020 
#lh-pericalcarine 1021
#lh-postcentral 1022
#lh-posteriorcingulate 1023
#lh-precentral 1024
#lh-precuneus 1025
#lh-rostralanteriorcingulate 1026
#lh-rostralmiddlefrontal 1027
#lh-superiorfrontal 1028 
#lh-superiorparietal 1029    
#lh-superiortemporal 1030    
#lh-supramarginal 1031    
#lh-frontalpole 1032    
#lh-temporalpole 1033    
#lh-transversetemporal 1034    
#lh-insula 1035  
#rh-caudalanteriorcingulate  2002    
#rh-caudalmiddlefrontal 2003    
#rh-cuneus 2003    
#rh-entorhinal 2006    
#rh-fusiform 2007    
#rh-inferiorparietal 2008    
#rh-inferiortemporal 2009    
#rh-isthmuscingulate 2010    
#rh-lateraloccipital 2011    
#rh-lateralorbitofrontal 2012    
#rh-lingual 2013    
#rh-medialorbitofrontal 2014    
#rh-middletemporal 2015    
#rh-parahippocampal 2016    
#rh-paracentral 2017    
#rh-parsopercularis 2018    
#rh-parsorbitalis 2019    
#rh-parstriangularis 2020    
#rh-pericalcarine 2021    
#rh-postcentral 2022    
#rh-posteriorcingulate 2023    
#rh-precentral 2024    
#rh-precuneus 2025    
#rh-rostralanteriorcingulate 2026    
#rh-rostralmiddlefrontal 2027    
#rh-superiorfrontal 2028    
#rh-superiorparietal 2029    
#rh-superiortemporal 2030    
#rh-supramarginal 2031    
#rh-frontalpole 2032    
#rh-temporalpole 2033    
#rh-transversetemporal 2034    
#rh-insula 2035   
#	3002	wm-lh-caudalanteriorcingulate
#	3003	wm-lh-caudalmiddlefrontal
#	3004	wm-lh-corpuscallosum
#	3005	wm-lh-cuneus
#	3006	wm-lh-entorhinal
#	3007	wm-lh-fusiform
#	3008	wm-lh-inferiorparietal
#	3009	wm-lh-inferiortemporal
#	3010	wm-lh-isthmuscingulate
#	3011	wm-lh-lateraloccipital
#	3012	wm-lh-lateralorbitofrontal
#	3013	wm-lh-lingual
#	3014	wm-lh-medialorbitofrontal
#	3015	wm-lh-middletemporal
#	3016	wm-lh-parahippocampal
#	3017	wm-lh-paracentral
#	3018	wm-lh-parsopercularis
#	3019	wm-lh-parsorbitalis
#	3020	wm-lh-parstriangularis
#	3021	wm-lh-pericalcarine
#	3022	wm-lh-postcentral
#	3023	wm-lh-posteriorcingulate
#	3024	wm-lh-precentral
#	3025	wm-lh-precuneus
#	3026	wm-lh-rostralanteriorcingulate
#	3027	wm-lh-rostralmiddlefrontal
#	3028	wm-lh-superiorfrontal
#	3029	wm-lh-superiorparietal
#	3030	wm-lh-superiortemporal
#	3031	wm-lh-supramarginal
#	3032	wm-lh-frontalpole
#	3033	wm-lh-temporalpole
#	3034	wm-lh-transversetemporal
#	3035	wm-lh-insula
#	4002	wm-rh-caudalanteriorcingulate
#	4003	wm-rh-caudalmiddlefrontal
#	4004	wm-rh-corpuscallosum
#	4005	wm-rh-cuneus
#	4006	wm-rh-entorhinal
#	4007	wm-rh-fusiform
#	4008	wm-rh-inferiorparietal
#	4009	wm-rh-inferiortemporal
#	4010	wm-rh-isthmuscingulate
#	4011	wm-rh-lateraloccipital
#	4012	wm-rh-lateralorbitofrontal
#	4013	wm-rh-lingual
#	4014	wm-rh-medialorbitofrontal
#	4015	wm-rh-middletemporal
#	4016	wm-rh-parahippocampal
#	4017	wm-rh-paracentral
#	4018	wm-rh-parsopercularis
#	4019	wm-rh-parsorbitalis
#	4020	wm-rh-parstriangularis
#	4021	wm-rh-pericalcarine
#	4022	wm-rh-postcentral
#	4023	wm-rh-posteriorcingulate
#	4024	wm-rh-precentral
#	4025	wm-rh-precuneus
#	4026	wm-rh-rostralanteriorcingulate
#	4027	wm-rh-rostralmiddlefrontal
#	4028	wm-rh-superiorfrontal
#	4029	wm-rh-superiorparietal
#	4030	wm-rh-superiortemporal
#	4031	wm-rh-supramarginal
#	4032	wm-rh-frontalpole
#	4033	wm-rh-temporalpole
#	4034	wm-rh-transversetemporal
#	4035	wm-rh-insula 
 
#####################################################################
#@NAME       : Maps_values_extration_tool.pl
#@INPUT      : 
#@OUTPUT     : quantitative_MR_aseg.txt
#@RETURNS    : 
#@DESCRIPTION: Extração dos dados de MTR, relaxometria, FA, Difusibilidade paralela e difusibilidade perpendicular.

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

$option = &get_arguments(@ARGV);
#***********************************************************Main**************************************************************************************


print "\n*********************************************************************\n";

print "\n Starting Process...\n";
print "\n-- Please wait --\n";

@pastas = glob("./*");
$NomePastaAnter="";
$teste = @pastas ;
$contador=0;
while($contador != $teste)
{
  $arquivo = $pastas[0];
  $Start = index($arquivo,"./") + 2;
  $NomePasta = substr($arquivo,$Start);
  if($NomePasta ne $NomePastaAnter)
  {  
	print "\n ======================================================================= \n";
    print "Patient name: ".$NomePasta."\n";
	&Processamento;
   }   
  $NomePastaAnter = $NomePasta;
  shift(@pastas ); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
  
 }
 #Arquivos com resultados
if($option == 1 || $option == 0)	 
{
open(RELATDADOS, "> Data_Relaxometry_subcortical_structures.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Left-Cerebral-White-Matter;Left-Cerebral-Cortex;Left-Cerebellum-White-Matter;Left-Cerebellum-Cortex;Left-Thalamus-Proper;Left-Caudate;Left-Putamen;Left-Pallidum;Brain-Stem;Left-Hippocampus;Left-Amygdala;Left-Accumbens-area;Left-VentralDC;Right-Cerebral-White-Matter;Right-Cerebral-Cortex;Right-Cerebellum-White-Matter;Right-Cerebellum-Cortex;Right-Thalamus-Proper;Right-Caudate;Right-Putamen;Right-Pallidum;Right-Hippocampus;Right-Amygdala;Right-Accumbens-area;Right-VentralDC;WM-hypointensities;Optic-Chiasm;CC_Posterior;CC_Mid_Posterior;CC_Central;CC_Mid_Anterior;CC_Anterior \r";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$media_relaxo_Left_Cerebral_White_Matter[$c].";".$media_relaxo_Left_Cerebral_Cortex[$c].";".$media_relaxo_Left_Cerebellum_White_Matter[$c].";".$media_relaxo_Left_Cerebellum_Cortex[$c].";".$media_relaxo_Left_Thalamus_Proper[$c].";".$media_relaxo_Left_Caudate[$c].";".$media_relaxo_Left_Putamen[$c].";".$media_relaxo_Left_Pallidum[$c].";".$media_relaxo_Brain_Stem[$c].";".$media_relaxo_Left_Hippocampus[$c].";".$media_relaxo_Left_Amygdala[$c].";".$media_relaxo_Left_Accumbens_area[$c].";".$media_relaxo_Left_VentralDC[$c].";".$media_relaxo_Right_Cerebral_White_Matter[$c].";".$media_relaxo_Right_Cerebral_Cortex[$c].";".$media_relaxo_Right_Cerebellum_White_Matter[$c].";".$media_relaxo_Right_Cerebellum_Cortex[$c].";".$media_relaxo_Right_Thalamus_Proper[$c].";".$media_relaxo_Right_Caudate[$c].";".$media_relaxo_Right_Putamen[$c].";".$media_relaxo_Right_Pallidum[$c].";".$media_relaxo_Right_Hippocampus[$c].";".$media_relaxo_Right_Amygdala[$c].";".$media_relaxo_Right_Accumbens_area[$c].";".$media_relaxo_Right_VentralDC[$c].";".$media_relaxo_WM_hypointensities[$c].";".$media_relaxo_Optic_Chiasm[$c].";".$media_relaxo_CC_Posterior[$c].";".$media_relaxo_CC_Mid_Posterior[$c].";".$media_relaxo_CC_Central[$c].";".$media_relaxo_CC_Mid_Anterior[$c].";".$media_relaxo_CC_Anterior[$c]."\r";
	  $c=$c+1;
	}
open(RELATDADOS, "> Data_MTR_subcortical_structures.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Left-Cerebral-White-Matter;Left-Cerebral-Cortex;Left-Cerebellum-White-Matter;Left-Cerebellum-Cortex;Left-Thalamus-Proper;Left-Caudate;Left-Putamen;Left-Pallidum;Brain-Stem;Left-Hippocampus;Left-Amygdala;Left-Accumbens-area;Left-VentralDC;Right-Cerebral-White-Matter;Right-Cerebral-Cortex;Right-Cerebellum-White-Matter;Right-Cerebellum-Cortex;Right-Thalamus-Proper;Right-Caudate;Right-Putamen;Right-Pallidum;Right-Hippocampus;Right-Amygdala;Right-Accumbens-area;Right-VentralDC;WM-hypointensities;Optic-Chiasm;CC_Posterior;CC_Mid_Posterior;CC_Central;CC_Mid_Anterior;CC_Anterior \r";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$media_MT_Left_Cerebral_White_Matter[$c].";".$media_MT_Left_Cerebral_Cortex[$c].";".$media_MT_Left_Cerebellum_White_Matter[$c].";".$media_MT_Left_Cerebellum_Cortex[$c].";".$media_MT_Left_Thalamus_Proper[$c].";".$media_MT_Left_Caudate[$c].";".$media_MT_Left_Putamen[$c].";".$media_MT_Left_Pallidum[$c].";".$media_MT_Brain_Stem[$c].";".$media_MT_Left_Hippocampus[$c].";".$media_MT_Left_Amygdala[$c].";".$media_MT_Left_Accumbens_area[$c].";".$media_MT_Left_VentralDC[$c].";".$media_MT_Right_Cerebral_White_Matter[$c].";".$media_MT_Right_Cerebral_Cortex[$c].";".$media_MT_Right_Cerebellum_White_Matter[$c].";".$media_MT_Right_Cerebellum_Cortex[$c].";".$media_MT_Right_Thalamus_Proper[$c].";".$media_MT_Right_Caudate[$c].";".$media_MT_Right_Putamen[$c].";".$media_MT_Right_Pallidum[$c].";".$media_MT_Right_Hippocampus[$c].";".$media_MT_Right_Amygdala[$c].";".$media_MT_Right_Accumbens_area[$c].";".$media_MT_Right_VentralDC[$c].";".$media_MT_WM_hypointensities[$c].";".$media_MT_Optic_Chiasm[$c].";".$media_MT_CC_Posterior[$c].";".$media_MT_CC_Mid_Posterior[$c].";".$media_MT_CC_Central[$c].";".$media_MT_CC_Mid_Anterior[$c].";".$media_MT_CC_Anterior[$c]."\r";
	 $c=$c+1;
	}
open(RELATDADOS, "> Data_FA_subcortical_structures.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Left-Cerebral-White-Matter;Left-Cerebral-Cortex;Left-Cerebellum-White-Matter;Left-Cerebellum-Cortex;Left-Thalamus-Proper;Left-Caudate;Left-Putamen;Left-Pallidum;Brain-Stem;Left-Hippocampus;Left-Amygdala;Left-Accumbens-area;Left-VentralDC;Right-Cerebral-White-Matter;Right-Cerebral-Cortex;Right-Cerebellum-White-Matter;Right-Cerebellum-Cortex;Right-Thalamus-Proper;Right-Caudate;Right-Putamen;Right-Pallidum;Right-Hippocampus;Right-Amygdala;Right-Accumbens-area;Right-VentralDC;WM-hypointensities;Optic-Chiasm;CC_Posterior;CC_Mid_Posterior;CC_Central;CC_Mid_Anterior;CC_Anterior \r";
	$c=0;
	while($c != $tam)
	{  
	print RELATDADOS $nomes[$c].";".$media_FA_Left_Cerebral_White_Matter[$c].";".$media_FA_Left_Cerebral_Cortex[$c].";".$media_FA_Left_Cerebellum_White_Matter[$c].";".$media_FA_Left_Cerebellum_Cortex[$c].";".$media_FA_Left_Thalamus_Proper[$c].";".$media_FA_Left_Caudate[$c].";".$media_FA_Left_Putamen[$c].";".$media_FA_Left_Pallidum[$c].";".$media_FA_Brain_Stem[$c].";".$media_FA_Left_Hippocampus[$c].";".$media_FA_Left_Amygdala[$c].";".$media_FA_Left_Accumbens_area[$c].";".$media_FA_Left_VentralDC[$c].";".$media_FA_Right_Cerebral_White_Matter[$c].";".$media_FA_Right_Cerebral_Cortex[$c].";".$media_FA_Right_Cerebellum_White_Matter[$c].";".$media_FA_Right_Cerebellum_Cortex[$c].";".$media_FA_Right_Thalamus_Proper[$c].";".$media_FA_Right_Caudate[$c].";".$media_FA_Right_Putamen[$c].";".$media_FA_Right_Pallidum[$c].";".$media_FA_Right_Hippocampus[$c].";".$media_FA_Right_Amygdala[$c].";".$media_FA_Right_Accumbens_area[$c].";".$media_FA_Right_VentralDC[$c].";".$media_FA_WM_hypointensities[$c].";".$media_FA_Optic_Chiasm[$c].";".$media_FA_CC_Posterior[$c].";".$media_FA_CC_Mid_Posterior[$c].";".$media_FA_CC_Central[$c].";".$media_FA_CC_Mid_Anterior[$c].";".$media_FA_CC_Anterior[$c]."\r";
	$c=$c+1;
	}
#Difusibilidade Media
open(RELATDADOS, "> Data_average_diffusivity_subcortical_structures.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Left-Cerebral-White-Matter;Left-Cerebral-Cortex;Left-Cerebellum-White-Matter;Left-Cerebellum-Cortex;Left-Thalamus-Proper;Left-Caudate;Left-Putamen;Left-Pallidum;Brain-Stem;Left-Hippocampus;Left-Amygdala;Left-Accumbens-area;Left-VentralDC;Right-Cerebral-White-Matter;Right-Cerebral-Cortex;Right-Cerebellum-White-Matter;Right-Cerebellum-Cortex;Right-Thalamus-Proper;Right-Caudate;Right-Putamen;Right-Pallidum;Right-Hippocampus;Right-Amygdala;Right-Accumbens-area;Right-VentralDC;WM-hypointensities;Optic-Chiasm;CC_Posterior;CC_Mid_Posterior;CC_Central;CC_Mid_Anterior;CC_Anterior \r";
	$c=0;
	while($c != $tam)
	{  
	    print RELATDADOS $nomes[$c].";".$media_dMap_Left_Cerebral_White_Matter[$c].";".$media_dMap_Left_Cerebral_Cortex[$c].";".$media_dMap_Left_Cerebellum_White_Matter[$c].";".$media_dMap_Left_Cerebellum_Cortex[$c].";".$media_dMap_Left_Thalamus_Proper[$c].";".$media_dMap_Left_Caudate[$c].";".$media_dMap_Left_Putamen[$c].";".$media_dMap_Left_Pallidum[$c].";".$media_dMap_Brain_Stem[$c].";".$media_dMap_Left_Hippocampus[$c].";".$media_dMap_Left_Amygdala[$c].";".$media_dMap_Left_Accumbens_area[$c].";".$media_dMap_Left_VentralDC[$c].";".$media_dMap_Right_Cerebral_White_Matter[$c].";".$media_dMap_Right_Cerebral_Cortex[$c].";".$media_dMap_Right_Cerebellum_White_Matter[$c].";".$media_dMap_Right_Cerebellum_Cortex[$c].";".$media_dMap_Right_Thalamus_Proper[$c].";".$media_dMap_Right_Caudate[$c].";".$media_dMap_Right_Putamen[$c].";".$media_dMap_Right_Pallidum[$c].";".$media_dMap_Right_Hippocampus[$c].";".$media_dMap_Right_Amygdala[$c].";".$media_dMap_Right_Accumbens_area[$c].";".$media_dMap_Right_VentralDC[$c].";".$media_dMap_WM_hypointensities[$c].";".$media_dMap_Optic_Chiasm[$c].";".$media_dMap_CC_Posterior[$c].";".$media_dMap_CC_Mid_Posterior[$c].";".$media_dMap_CC_Central[$c].";".$media_dMap_CC_Mid_Anterior[$c].";".$media_dMap_CC_Anterior[$c]."\r";
	  $c=$c+1;
	}
#Dpara
open(RELATDADOS, "> Data_parallel_diffusivity_subcortical_structures.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Left-Cerebral-White-Matter;Left-Cerebral-Cortex;Left-Cerebellum-White-Matter;Left-Cerebellum-Cortex;Left-Thalamus-Proper;Left-Caudate;Left-Putamen;Left-Pallidum;Brain-Stem;Left-Hippocampus;Left-Amygdala;Left-Accumbens-area;Left-VentralDC;Right-Cerebral-White-Matter;Right-Cerebral-Cortex;Right-Cerebellum-White-Matter;Right-Cerebellum-Cortex;Right-Thalamus-Proper;Right-Caudate;Right-Putamen;Right-Pallidum;Right-Hippocampus;Right-Amygdala;Right-Accumbens-area;Right-VentralDC;WM-hypointensities;Optic-Chiasm;CC_Posterior;CC_Mid_Posterior;CC_Central;CC_Mid_Anterior;CC_Anterior \r";
	$c=0;
	while($c != $tam)
	{  
	    print RELATDADOS $nomes[$c].";".$media_Dpara_Left_Cerebral_White_Matter[$c].";".$media_Dpara_Left_Cerebral_Cortex[$c].";".$media_Dpara_Left_Cerebellum_White_Matter[$c].";".$media_Dpara_Left_Cerebellum_Cortex[$c].";".$media_Dpara_Left_Thalamus_Proper[$c].";".$media_Dpara_Left_Caudate[$c].";".$media_Dpara_Left_Putamen[$c].";".$media_Dpara_Left_Pallidum[$c].";".$media_Dpara_Brain_Stem[$c].";".$media_Dpara_Left_Hippocampus[$c].";".$media_Dpara_Left_Amygdala[$c].";".$media_Dpara_Left_Accumbens_area[$c].";".$media_Dpara_Left_VentralDC[$c].";".$media_Dpara_Right_Cerebral_White_Matter[$c].";".$media_Dpara_Right_Cerebral_Cortex[$c].";".$media_Dpara_Right_Cerebellum_White_Matter[$c].";".$media_Dpara_Right_Cerebellum_Cortex[$c].";".$media_Dpara_Right_Thalamus_Proper[$c].";".$media_Dpara_Right_Caudate[$c].";".$media_Dpara_Right_Putamen[$c].";".$media_Dpara_Right_Pallidum[$c].";".$media_Dpara_Right_Hippocampus[$c].";".$media_Dpara_Right_Amygdala[$c].";".$media_Dpara_Right_Accumbens_area[$c].";".$media_Dpara_Right_VentralDC[$c].";".$media_Dpara_WM_hypointensities[$c].";".$media_Dpara_Optic_Chiasm[$c].";".$media_Dpara_CC_Posterior[$c].";".$media_Dpara_CC_Mid_Posterior[$c].";".$media_Dpara_CC_Central[$c].";".$media_Dpara_CC_Mid_Anterior[$c].";".$media_Dpara_CC_Anterior[$c]."\r";
	  $c=$c+1;
	}
#Dperp	
open(RELATDADOS, "> Data_perpendicular_diffusivity_subcortical_structures.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Left-Cerebral-White-Matter;Left-Cerebral-Cortex;Left-Cerebellum-White-Matter;Left-Cerebellum-Cortex;Left-Thalamus-Proper;Left-Caudate;Left-Putamen;Left-Pallidum;Brain-Stem;Left-Hippocampus;Left-Amygdala;Left-Accumbens-area;Left-VentralDC;Right-Cerebral-White-Matter;Right-Cerebral-Cortex;Right-Cerebellum-White-Matter;Right-Cerebellum-Cortex;Right-Thalamus-Proper;Right-Caudate;Right-Putamen;Right-Pallidum;Right-Hippocampus;Right-Amygdala;Right-Accumbens-area;Right-VentralDC;WM-hypointensities;Optic-Chiasm;CC_Posterior;CC_Mid_Posterior;CC_Central;CC_Mid_Anterior;CC_Anterior \r";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$media_Dperp_Left_Cerebral_White_Matter[$c].";".$media_Dperp_Left_Cerebral_Cortex[$c].";".$media_Dperp_Left_Cerebellum_White_Matter[$c].";".$media_Dperp_Left_Cerebellum_Cortex[$c].";".$media_Dperp_Left_Thalamus_Proper[$c].";".$media_Dperp_Left_Caudate[$c].";".$media_Dperp_Left_Putamen[$c].";".$media_Dperp_Left_Pallidum[$c].";".$media_Dperp_Brain_Stem[$c].";".$media_Dperp_Left_Hippocampus[$c].";".$media_Dperp_Left_Amygdala[$c].";".$media_Dperp_Left_Accumbens_area[$c].";".$media_Dperp_Left_VentralDC[$c].";".$media_Dperp_Right_Cerebral_White_Matter[$c].";".$media_Dperp_Right_Cerebral_Cortex[$c].";".$media_Dperp_Right_Cerebellum_White_Matter[$c].";".$media_Dperp_Right_Cerebellum_Cortex[$c].";".$media_Dperp_Right_Thalamus_Proper[$c].";".$media_Dperp_Right_Caudate[$c].";".$media_Dperp_Right_Putamen[$c].";".$media_Dperp_Right_Pallidum[$c].";".$media_Dperp_Right_Hippocampus[$c].";".$media_Dperp_Right_Amygdala[$c].";".$media_Dperp_Right_Accumbens_area[$c].";".$media_Dperp_Right_VentralDC[$c].";".$media_Dperp_WM_hypointensities[$c].";".$media_Dperp_Optic_Chiasm[$c].";".$media_Dperp_CC_Posterior[$c].";".$media_Dperp_CC_Mid_Posterior[$c].";".$media_Dperp_CC_Central[$c].";".$media_Dperp_CC_Mid_Anterior[$c].";".$media_Dperp_CC_Anterior[$c]."\r";
	  
	  $c=$c+1;
	}
}
#Print cortex parts
if($option == 2 || $option == 0)	 
{	open(RELATDADOS, "> Data_Relaxometry_cortex.txt");
    $tam =@nomes;
	print RELATDADOS "nome;lh-caudalanteriorcingulate;lh-caudalmiddlefrontal;lh-cuneus;lh-entorhinal;lh-fusiform;lh-inferiorparietal;lh-inferiortemporal;lh-isthmuscingulate;lh-lateraloccipital;lh-lateralorbitofrontal;lh-lingual;lh-medialorbitofrontal;lh-middletemporal;lh-parahippocampal;lh-paracentral;lh-parsopercularis;lh-parsorbitalis;lh-parstriangularis;lh-pericalcarine;lh-postcentral;lh-posteriorcingulate;lh-precentral;lh-precuneus;lh-rostralanteriorcingulate;lh-rostralmiddlefrontal;lh-superiorfrontal;lh-superiorparietal;lh-superiortemporal;lh-supramarginal;lh-frontalpole;lh-temporalpole;lh-transversetemporal;lh-insula;rh-caudalanteriorcingulate;rh-caudalmiddlefrontal;rh-cuneus;rh-entorhinal;rh-fusiform;rh-inferiorparietal;rh-inferiortemporal;rh-isthmuscingulate;rh-lateraloccipital;rh-lateralorbitofrontal;rh-lingual;rh-medialorbitofrontal;rh-middletemporal;rh-parahippocampal;rh-paracentral;rh-parsopercularis;rh-parsorbitalis;rh-parstriangularis;rh-pericalcarine;rh-postcentral;rh-posteriorcingulate;rh-precentral;rh-precuneus;rh-rostralanteriorcingulate;rh-rostralmiddlefrontal;rh-superiorfrontal;rh-superiorparietal;rh-superiortemporal;rh-supramarginal;rh-frontalpole;rh-temporalpole;rh-transversetemporal;rh-insula \r";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$media_relaxo_lh_caudalanteriorcingulate[$c].";".$media_relaxo_lh_caudalmiddlefrontal[$c].";".$media_relaxo_lh_cuneus[$c].";".$media_relaxo_lh_entorhinal[$c].";".$media_relaxo_lh_fusiform[$c].";".$media_relaxo_lh_inferiorparietal[$c].";".$media_relaxo_lh_inferiortemporal[$c].";".$media_relaxo_lh_isthmuscingulate[$c].";".$media_relaxo_lh_lateraloccipital[$c].";".$media_relaxo_lh_lateralorbitofrontal[$c].";".$media_relaxo_lh_lingual[$c].";".$media_relaxo_lh_medialorbitofrontal[$c].";".$media_relaxo_lh_middletemporal[$c].";".$media_relaxo_lh_parahippocampal[$c].";".$media_relaxo_lh_paracentral[$c].";".$media_relaxo_lh_parsopercularis[$c].";".$media_relaxo_lh_parsorbitalis[$c].";".$media_relaxo_lh_parstriangularis[$c].";".$media_relaxo_lh_pericalcarine[$c].";".$media_relaxo_lh_postcentral[$c].";".$media_relaxo_lh_posteriorcingulate[$c].";".$media_relaxo_lh_precentral[$c].";".$media_relaxo_lh_precuneus[$c].";".$media_relaxo_lh_rostralanteriorcingulate[$c].";".$media_relaxo_lh_rostralmiddlefrontal[$c].";".$media_relaxo_lh_superiorfrontal[$c].";".$media_relaxo_lh_superiorparietal[$c].";".$media_relaxo_lh_superiortemporal[$c].";".$media_relaxo_lh_supramarginal[$c].";".$media_relaxo_lh_frontalpole[$c].";".$media_relaxo_lh_temporalpole[$c].";".$media_relaxo_lh_transversetemporal[$c].";".$media_relaxo_lh_insula[$c].";".$media_relaxo_rh_caudalanteriorcingulate[$c].";".$media_relaxo_rh_caudalmiddlefrontal[$c].";".$media_relaxo_rh_cuneus[$c].";".$media_relaxo_rh_entorhinal[$c].";".$media_relaxo_rh_fusiform[$c].";".$media_relaxo_rh_inferiorparietal[$c].";".$media_relaxo_rh_inferiortemporal[$c].";".$media_relaxo_rh_isthmuscingulate[$c].";".$media_relaxo_rh_lateraloccipital[$c].";".$media_relaxo_rh_lateralorbitofrontal[$c].";".$media_relaxo_rh_lingual[$c].";".$media_relaxo_rh_medialorbitofrontal[$c].";".$media_relaxo_rh_middletemporal[$c].";".$media_relaxo_rh_parahippocampal[$c].";".$media_relaxo_rh_paracentral[$c].";".$media_relaxo_rh_parsopercularis[$c].";".$media_relaxo_rh_parsorbitalis[$c].";".$media_relaxo_rh_parstriangularis[$c].";".$media_relaxo_rh_pericalcarine[$c].";".$media_relaxo_rh_postcentral[$c].";".$media_relaxo_rh_posteriorcingulate[$c].";".$media_relaxo_rh_precentral[$c].";".$media_relaxo_rh_precuneus[$c].";".$media_relaxo_rh_rostralanteriorcingulate[$c].";".$media_relaxo_rh_rostralmiddlefrontal[$c].";".$media_relaxo_rh_superiorfrontal[$c].";".$media_relaxo_rh_superiorparietal[$c].";".$media_relaxo_rh_superiortemporal[$c].";".$media_relaxo_rh_supramarginal[$c].";".$media_relaxo_rh_frontalpole[$c].";".$media_relaxo_rh_temporalpole[$c].";".$media_relaxo_rh_transversetemporal[$c].";".$media_relaxo_rh_insula[$c]."\r";
	  $c=$c+1;
	}
open(RELATDADOS, "> Data_MTR_cortex.txt");
    $tam =@nomes;
	print RELATDADOS "nome;lh-caudalanteriorcingulate;lh-caudalmiddlefrontal;lh-cuneus;lh-entorhinal;lh-fusiform;lh-inferiorparietal;lh-inferiortemporal;lh-isthmuscingulate;lh-lateraloccipital;lh-lateralorbitofrontal;lh-lingual;lh-medialorbitofrontal;lh-middletemporal;lh-parahippocampal;lh-paracentral;lh-parsopercularis;lh-parsorbitalis;lh-parstriangularis;lh-pericalcarine;lh-postcentral;lh-posteriorcingulate;lh-precentral;lh-precuneus;lh-rostralanteriorcingulate;lh-rostralmiddlefrontal;lh-superiorfrontal;lh-superiorparietal;lh-superiortemporal;lh-supramarginal;lh-frontalpole;lh-temporalpole;lh-transversetemporal;lh-insula;rh-caudalanteriorcingulate;rh-caudalmiddlefrontal;rh-cuneus;rh-entorhinal;rh-fusiform;rh-inferiorparietal;rh-inferiortemporal;rh-isthmuscingulate;rh-lateraloccipital;rh-lateralorbitofrontal;rh-lingual;rh-medialorbitofrontal;rh-middletemporal;rh-parahippocampal;rh-paracentral;rh-parsopercularis;rh-parsorbitalis;rh-parstriangularis;rh-pericalcarine;rh-postcentral;rh-posteriorcingulate;rh-precentral;rh-precuneus;rh-rostralanteriorcingulate;rh-rostralmiddlefrontal;rh-superiorfrontal;rh-superiorparietal;rh-superiortemporal;rh-supramarginal;rh-frontalpole;rh-temporalpole;rh-transversetemporal;rh-insula \r";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$media_MT_lh_caudalanteriorcingulate[$c].";".$media_MT_lh_caudalmiddlefrontal[$c].";".$media_MT_lh_cuneus[$c].";".$media_MT_lh_entorhinal[$c].";".$media_MT_lh_fusiform[$c].";".$media_MT_lh_inferiorparietal[$c].";".$media_MT_lh_inferiortemporal[$c].";".$media_MT_lh_isthmuscingulate[$c].";".$media_MT_lh_lateraloccipital[$c].";".$media_MT_lh_lateralorbitofrontal[$c].";".$media_MT_lh_lingual[$c].";".$media_MT_lh_medialorbitofrontal[$c].";".$media_MT_lh_middletemporal[$c].";".$media_MT_lh_parahippocampal[$c].";".$media_MT_lh_paracentral[$c].";".$media_MT_lh_parsopercularis[$c].";".$media_MT_lh_parsorbitalis[$c].";".$media_MT_lh_parstriangularis[$c].";".$media_MT_lh_pericalcarine[$c].";".$media_MT_lh_postcentral[$c].";".$media_MT_lh_posteriorcingulate[$c].";".$media_MT_lh_precentral[$c].";".$media_MT_lh_precuneus[$c].";".$media_MT_lh_rostralanteriorcingulate[$c].";".$media_MT_lh_rostralmiddlefrontal[$c].";".$media_MT_lh_superiorfrontal[$c].";".$media_MT_lh_superiorparietal[$c].";".$media_MT_lh_superiortemporal[$c].";".$media_MT_lh_supramarginal[$c].";".$media_MT_lh_frontalpole[$c].";".$media_MT_lh_temporalpole[$c].";".$media_MT_lh_transversetemporal[$c].";".$media_MT_lh_insula[$c].";".$media_MT_rh_caudalanteriorcingulate[$c].";".$media_MT_rh_caudalmiddlefrontal[$c].";".$media_MT_rh_cuneus[$c].";".$media_MT_rh_entorhinal[$c].";".$media_MT_rh_fusiform[$c].";".$media_MT_rh_inferiorparietal[$c].";".$media_MT_rh_inferiortemporal[$c].";".$media_MT_rh_isthmuscingulate[$c].";".$media_MT_rh_lateraloccipital[$c].";".$media_MT_rh_lateralorbitofrontal[$c].";".$media_MT_rh_lingual[$c].";".$media_MT_rh_medialorbitofrontal[$c].";".$media_MT_rh_middletemporal[$c].";".$media_MT_rh_parahippocampal[$c].";".$media_MT_rh_paracentral[$c].";".$media_MT_rh_parsopercularis[$c].";".$media_MT_rh_parsorbitalis[$c].";".$media_MT_rh_parstriangularis[$c].";".$media_MT_rh_pericalcarine[$c].";".$media_MT_rh_postcentral[$c].";".$media_MT_rh_posteriorcingulate[$c].";".$media_MT_rh_precentral[$c].";".$media_MT_rh_precuneus[$c].";".$media_MT_rh_rostralanteriorcingulate[$c].";".$media_MT_rh_rostralmiddlefrontal[$c].";".$media_MT_rh_superiorfrontal[$c].";".$media_MT_rh_superiorparietal[$c].";".$media_MT_rh_superiortemporal[$c].";".$media_MT_rh_supramarginal[$c].";".$media_MT_rh_frontalpole[$c].";".$media_MT_rh_temporalpole[$c].";".$media_MT_rh_transversetemporal[$c].";".$media_MT_rh_insula[$c]."\r";
	 $c=$c+1;
	}
open(RELATDADOS, "> Data_FA_cortex.txt");
    $tam =@nomes;
	print RELATDADOS "nome;lh-caudalanteriorcingulate;lh-caudalmiddlefrontal;lh-cuneus;lh-entorhinal;lh-fusiform;lh-inferiorparietal;lh-inferiortemporal;lh-isthmuscingulate;lh-lateraloccipital;lh-lateralorbitofrontal;lh-lingual;lh-medialorbitofrontal;lh-middletemporal;lh-parahippocampal;lh-paracentral;lh-parsopercularis;lh-parsorbitalis;lh-parstriangularis;lh-pericalcarine;lh-postcentral;lh-posteriorcingulate;lh-precentral;lh-precuneus;lh-rostralanteriorcingulate;lh-rostralmiddlefrontal;lh-superiorfrontal;lh-superiorparietal;lh-superiortemporal;lh-supramarginal;lh-frontalpole;lh-temporalpole;lh-transversetemporal;lh-insula;rh-caudalanteriorcingulate;rh-caudalmiddlefrontal;rh-cuneus;rh-entorhinal;rh-fusiform;rh-inferiorparietal;rh-inferiortemporal;rh-isthmuscingulate;rh-lateraloccipital;rh-lateralorbitofrontal;rh-lingual;rh-medialorbitofrontal;rh-middletemporal;rh-parahippocampal;rh-paracentral;rh-parsopercularis;rh-parsorbitalis;rh-parstriangularis;rh-pericalcarine;rh-postcentral;rh-posteriorcingulate;rh-precentral;rh-precuneus;rh-rostralanteriorcingulate;rh-rostralmiddlefrontal;rh-superiorfrontal;rh-superiorparietal;rh-superiortemporal;rh-supramarginal;rh-frontalpole;rh-temporalpole;rh-transversetemporal;rh-insula \r";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$media_FA_lh_caudalanteriorcingulate[$c].";".$media_FA_lh_caudalmiddlefrontal[$c].";".$media_FA_lh_cuneus[$c].";".$media_FA_lh_entorhinal[$c].";".$media_FA_lh_fusiform[$c].";".$media_FA_lh_inferiorparietal[$c].";".$media_FA_lh_inferiortemporal[$c].";".$media_FA_lh_isthmuscingulate[$c].";".$media_FA_lh_lateraloccipital[$c].";".$media_FA_lh_lateralorbitofrontal[$c].";".$media_FA_lh_lingual[$c].";".$media_FA_lh_medialorbitofrontal[$c].";".$media_FA_lh_middletemporal[$c].";".$media_FA_lh_parahippocampal[$c].";".$media_FA_lh_paracentral[$c].";".$media_FA_lh_parsopercularis[$c].";".$media_FA_lh_parsorbitalis[$c].";".$media_FA_lh_parstriangularis[$c].";".$media_FA_lh_pericalcarine[$c].";".$media_FA_lh_postcentral[$c].";".$media_FA_lh_posteriorcingulate[$c].";".$media_FA_lh_precentral[$c].";".$media_FA_lh_precuneus[$c].";".$media_FA_lh_rostralanteriorcingulate[$c].";".$media_FA_lh_rostralmiddlefrontal[$c].";".$media_FA_lh_superiorfrontal[$c].";".$media_FA_lh_superiorparietal[$c].";".$media_FA_lh_superiortemporal[$c].";".$media_FA_lh_supramarginal[$c].";".$media_FA_lh_frontalpole[$c].";".$media_FA_lh_temporalpole[$c].";".$media_FA_lh_transversetemporal[$c].";".$media_FA_lh_insula[$c].";".$media_FA_rh_caudalanteriorcingulate[$c].";".$media_FA_rh_caudalmiddlefrontal[$c].";".$media_FA_rh_cuneus[$c].";".$media_FA_rh_entorhinal[$c].";".$media_FA_rh_fusiform[$c].";".$media_FA_rh_inferiorparietal[$c].";".$media_FA_rh_inferiortemporal[$c].";".$media_FA_rh_isthmuscingulate[$c].";".$media_FA_rh_lateraloccipital[$c].";".$media_FA_rh_lateralorbitofrontal[$c].";".$media_FA_rh_lingual[$c].";".$media_FA_rh_medialorbitofrontal[$c].";".$media_FA_rh_middletemporal[$c].";".$media_FA_rh_parahippocampal[$c].";".$media_FA_rh_paracentral[$c].";".$media_FA_rh_parsopercularis[$c].";".$media_FA_rh_parsorbitalis[$c].";".$media_FA_rh_parstriangularis[$c].";".$media_FA_rh_pericalcarine[$c].";".$media_FA_rh_postcentral[$c].";".$media_FA_rh_posteriorcingulate[$c].";".$media_FA_rh_precentral[$c].";".$media_FA_rh_precuneus[$c].";".$media_FA_rh_rostralanteriorcingulate[$c].";".$media_FA_rh_rostralmiddlefrontal[$c].";".$media_FA_rh_superiorfrontal[$c].";".$media_FA_rh_superiorparietal[$c].";".$media_FA_rh_superiortemporal[$c].";".$media_FA_rh_supramarginal[$c].";".$media_FA_rh_frontalpole[$c].";".$media_FA_rh_temporalpole[$c].";".$media_FA_rh_transversetemporal[$c].";".$media_FA_rh_insula[$c]."\r";
	 $c=$c+1;
	}
#Difusibilidade Media
open(RELATDADOS, "> Data_average_diffusivity_cortex.txt");
    $tam =@nomes;
	print RELATDADOS "nome;lh-caudalanteriorcingulate;lh-caudalmiddlefrontal;lh-cuneus;lh-entorhinal;lh-fusiform;lh-inferiorparietal;lh-inferiortemporal;lh-isthmuscingulate;lh-lateraloccipital;lh-lateralorbitofrontal;lh-lingual;lh-medialorbitofrontal;lh-middletemporal;lh-parahippocampal;lh-paracentral;lh-parsopercularis;lh-parsorbitalis;lh-parstriangularis;lh-pericalcarine;lh-postcentral;lh-posteriorcingulate;lh-precentral;lh-precuneus;lh-rostralanteriorcingulate;lh-rostralmiddlefrontal;lh-superiorfrontal;lh-superiorparietal;lh-superiortemporal;lh-supramarginal;lh-frontalpole;lh-temporalpole;lh-transversetemporal;lh-insula;rh-caudalanteriorcingulate;rh-caudalmiddlefrontal;rh-cuneus;rh-entorhinal;rh-fusiform;rh-inferiorparietal;rh-inferiortemporal;rh-isthmuscingulate;rh-lateraloccipital;rh-lateralorbitofrontal;rh-lingual;rh-medialorbitofrontal;rh-middletemporal;rh-parahippocampal;rh-paracentral;rh-parsopercularis;rh-parsorbitalis;rh-parstriangularis;rh-pericalcarine;rh-postcentral;rh-posteriorcingulate;rh-precentral;rh-precuneus;rh-rostralanteriorcingulate;rh-rostralmiddlefrontal;rh-superiorfrontal;rh-superiorparietal;rh-superiortemporal;rh-supramarginal;rh-frontalpole;rh-temporalpole;rh-transversetemporal;rh-insula \r";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$media_dMap_lh_caudalanteriorcingulate[$c].";".$media_dMap_lh_caudalmiddlefrontal[$c].";".$media_dMap_lh_cuneus[$c].";".$media_dMap_lh_entorhinal[$c].";".$media_dMap_lh_fusiform[$c].";".$media_dMap_lh_inferiorparietal[$c].";".$media_dMap_lh_inferiortemporal[$c].";".$media_dMap_lh_isthmuscingulate[$c].";".$media_dMap_lh_lateraloccipital[$c].";".$media_dMap_lh_lateralorbitofrontal[$c].";".$media_dMap_lh_lingual[$c].";".$media_dMap_lh_medialorbitofrontal[$c].";".$media_dMap_lh_middletemporal[$c].";".$media_dMap_lh_parahippocampal[$c].";".$media_dMap_lh_paracentral[$c].";".$media_dMap_lh_parsopercularis[$c].";".$media_dMap_lh_parsorbitalis[$c].";".$media_dMap_lh_parstriangularis[$c].";".$media_dMap_lh_pericalcarine[$c].";".$media_dMap_lh_postcentral[$c].";".$media_dMap_lh_posteriorcingulate[$c].";".$media_dMap_lh_precentral[$c].";".$media_dMap_lh_precuneus[$c].";".$media_dMap_lh_rostralanteriorcingulate[$c].";".$media_dMap_lh_rostralmiddlefrontal[$c].";".$media_dMap_lh_superiorfrontal[$c].";".$media_dMap_lh_superiorparietal[$c].";".$media_dMap_lh_superiortemporal[$c].";".$media_dMap_lh_supramarginal[$c].";".$media_dMap_lh_frontalpole[$c].";".$media_dMap_lh_temporalpole[$c].";".$media_dMap_lh_transversetemporal[$c].";".$media_dMap_lh_insula[$c].";".$media_dMap_rh_caudalanteriorcingulate[$c].";".$media_dMap_rh_caudalmiddlefrontal[$c].";".$media_dMap_rh_cuneus[$c].";".$media_dMap_rh_entorhinal[$c].";".$media_dMap_rh_fusiform[$c].";".$media_dMap_rh_inferiorparietal[$c].";".$media_dMap_rh_inferiortemporal[$c].";".$media_dMap_rh_isthmuscingulate[$c].";".$media_dMap_rh_lateraloccipital[$c].";".$media_dMap_rh_lateralorbitofrontal[$c].";".$media_dMap_rh_lingual[$c].";".$media_dMap_rh_medialorbitofrontal[$c].";".$media_dMap_rh_middletemporal[$c].";".$media_dMap_rh_parahippocampal[$c].";".$media_dMap_rh_paracentral[$c].";".$media_dMap_rh_parsopercularis[$c].";".$media_dMap_rh_parsorbitalis[$c].";".$media_dMap_rh_parstriangularis[$c].";".$media_dMap_rh_pericalcarine[$c].";".$media_dMap_rh_postcentral[$c].";".$media_dMap_rh_posteriorcingulate[$c].";".$media_dMap_rh_precentral[$c].";".$media_dMap_rh_precuneus[$c].";".$media_dMap_rh_rostralanteriorcingulate[$c].";".$media_dMap_rh_rostralmiddlefrontal[$c].";".$media_dMap_rh_superiorfrontal[$c].";".$media_dMap_rh_superiorparietal[$c].";".$media_dMap_rh_superiortemporal[$c].";".$media_dMap_rh_supramarginal[$c].";".$media_dMap_rh_frontalpole[$c].";".$media_dMap_rh_temporalpole[$c].";".$media_dMap_rh_transversetemporal[$c].";".$media_dMap_rh_insula[$c]."\r";
	 $c=$c+1;
	}
#Dpara
open(RELATDADOS, "> Data_parallel_diffusivity_cortex.txt");
    $tam =@nomes;
	print RELATDADOS "nome;lh-caudalanteriorcingulate;lh-caudalmiddlefrontal;lh-cuneus;lh-entorhinal;lh-fusiform;lh-inferiorparietal;lh-inferiortemporal;lh-isthmuscingulate;lh-lateraloccipital;lh-lateralorbitofrontal;lh-lingual;lh-medialorbitofrontal;lh-middletemporal;lh-parahippocampal;lh-paracentral;lh-parsopercularis;lh-parsorbitalis;lh-parstriangularis;lh-pericalcarine;lh-postcentral;lh-posteriorcingulate;lh-precentral;lh-precuneus;lh-rostralanteriorcingulate;lh-rostralmiddlefrontal;lh-superiorfrontal;lh-superiorparietal;lh-superiortemporal;lh-supramarginal;lh-frontalpole;lh-temporalpole;lh-transversetemporal;lh-insula;rh-caudalanteriorcingulate;rh-caudalmiddlefrontal;rh-cuneus;rh-entorhinal;rh-fusiform;rh-inferiorparietal;rh-inferiortemporal;rh-isthmuscingulate;rh-lateraloccipital;rh-lateralorbitofrontal;rh-lingual;rh-medialorbitofrontal;rh-middletemporal;rh-parahippocampal;rh-paracentral;rh-parsopercularis;rh-parsorbitalis;rh-parstriangularis;rh-pericalcarine;rh-postcentral;rh-posteriorcingulate;rh-precentral;rh-precuneus;rh-rostralanteriorcingulate;rh-rostralmiddlefrontal;rh-superiorfrontal;rh-superiorparietal;rh-superiortemporal;rh-supramarginal;rh-frontalpole;rh-temporalpole;rh-transversetemporal;rh-insula \r";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$media_Dpara_lh_caudalanteriorcingulate[$c].";".$media_Dpara_lh_caudalmiddlefrontal[$c].";".$media_Dpara_lh_cuneus[$c].";".$media_Dpara_lh_entorhinal[$c].";".$media_Dpara_lh_fusiform[$c].";".$media_Dpara_lh_inferiorparietal[$c].";".$media_Dpara_lh_inferiortemporal[$c].";".$media_Dpara_lh_isthmuscingulate[$c].";".$media_Dpara_lh_lateraloccipital[$c].";".$media_Dpara_lh_lateralorbitofrontal[$c].";".$media_Dpara_lh_lingual[$c].";".$media_Dpara_lh_medialorbitofrontal[$c].";".$media_Dpara_lh_middletemporal[$c].";".$media_Dpara_lh_parahippocampal[$c].";".$media_Dpara_lh_paracentral[$c].";".$media_Dpara_lh_parsopercularis[$c].";".$media_Dpara_lh_parsorbitalis[$c].";".$media_Dpara_lh_parstriangularis[$c].";".$media_Dpara_lh_pericalcarine[$c].";".$media_Dpara_lh_postcentral[$c].";".$media_Dpara_lh_posteriorcingulate[$c].";".$media_Dpara_lh_precentral[$c].";".$media_Dpara_lh_precuneus[$c].";".$media_Dpara_lh_rostralanteriorcingulate[$c].";".$media_Dpara_lh_rostralmiddlefrontal[$c].";".$media_Dpara_lh_superiorfrontal[$c].";".$media_Dpara_lh_superiorparietal[$c].";".$media_Dpara_lh_superiortemporal[$c].";".$media_Dpara_lh_supramarginal[$c].";".$media_Dpara_lh_frontalpole[$c].";".$media_Dpara_lh_temporalpole[$c].";".$media_Dpara_lh_transversetemporal[$c].";".$media_Dpara_lh_insula[$c].";".$media_Dpara_rh_caudalanteriorcingulate[$c].";".$media_Dpara_rh_caudalmiddlefrontal[$c].";".$media_Dpara_rh_cuneus[$c].";".$media_Dpara_rh_entorhinal[$c].";".$media_Dpara_rh_fusiform[$c].";".$media_Dpara_rh_inferiorparietal[$c].";".$media_Dpara_rh_inferiortemporal[$c].";".$media_Dpara_rh_isthmuscingulate[$c].";".$media_Dpara_rh_lateraloccipital[$c].";".$media_Dpara_rh_lateralorbitofrontal[$c].";".$media_Dpara_rh_lingual[$c].";".$media_Dpara_rh_medialorbitofrontal[$c].";".$media_Dpara_rh_middletemporal[$c].";".$media_Dpara_rh_parahippocampal[$c].";".$media_Dpara_rh_paracentral[$c].";".$media_Dpara_rh_parsopercularis[$c].";".$media_Dpara_rh_parsorbitalis[$c].";".$media_Dpara_rh_parstriangularis[$c].";".$media_Dpara_rh_pericalcarine[$c].";".$media_Dpara_rh_postcentral[$c].";".$media_Dpara_rh_posteriorcingulate[$c].";".$media_Dpara_rh_precentral[$c].";".$media_Dpara_rh_precuneus[$c].";".$media_Dpara_rh_rostralanteriorcingulate[$c].";".$media_Dpara_rh_rostralmiddlefrontal[$c].";".$media_Dpara_rh_superiorfrontal[$c].";".$media_Dpara_rh_superiorparietal[$c].";".$media_Dpara_rh_superiortemporal[$c].";".$media_Dpara_rh_supramarginal[$c].";".$media_Dpara_rh_frontalpole[$c].";".$media_Dpara_rh_temporalpole[$c].";".$media_Dpara_rh_transversetemporal[$c].";".$media_Dpara_rh_insula[$c]."\r";
	 $c=$c+1;
	}
#Dperp	
open(RELATDADOS, "> Data_perpendicular_diffusivity_cortex.txt");
    $tam =@nomes;
	print RELATDADOS "nome;lh-caudalanteriorcingulate;lh-caudalmiddlefrontal;lh-cuneus;lh-entorhinal;lh-fusiform;lh-inferiorparietal;lh-inferiortemporal;lh-isthmuscingulate;lh-lateraloccipital;lh-lateralorbitofrontal;lh-lingual;lh-medialorbitofrontal;lh-middletemporal;lh-parahippocampal;lh-paracentral;lh-parsopercularis;lh-parsorbitalis;lh-parstriangularis;lh-pericalcarine;lh-postcentral;lh-posteriorcingulate;lh-precentral;lh-precuneus;lh-rostralanteriorcingulate;lh-rostralmiddlefrontal;lh-superiorfrontal;lh-superiorparietal;lh-superiortemporal;lh-supramarginal;lh-frontalpole;lh-temporalpole;lh-transversetemporal;lh-insula;rh-caudalanteriorcingulate;rh-caudalmiddlefrontal;rh-cuneus;rh-entorhinal;rh-fusiform;rh-inferiorparietal;rh-inferiortemporal;rh-isthmuscingulate;rh-lateraloccipital;rh-lateralorbitofrontal;rh-lingual;rh-medialorbitofrontal;rh-middletemporal;rh-parahippocampal;rh-paracentral;rh-parsopercularis;rh-parsorbitalis;rh-parstriangularis;rh-pericalcarine;rh-postcentral;rh-posteriorcingulate;rh-precentral;rh-precuneus;rh-rostralanteriorcingulate;rh-rostralmiddlefrontal;rh-superiorfrontal;rh-superiorparietal;rh-superiortemporal;rh-supramarginal;rh-frontalpole;rh-temporalpole;rh-transversetemporal;rh-insula \r";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$media_Dperp_lh_caudalanteriorcingulate[$c].";".$media_Dperp_lh_caudalmiddlefrontal[$c].";".$media_Dperp_lh_cuneus[$c].";".$media_Dperp_lh_entorhinal[$c].";".$media_Dperp_lh_fusiform[$c].";".$media_Dperp_lh_inferiorparietal[$c].";".$media_Dperp_lh_inferiortemporal[$c].";".$media_Dperp_lh_isthmuscingulate[$c].";".$media_Dperp_lh_lateraloccipital[$c].";".$media_Dperp_lh_lateralorbitofrontal[$c].";".$media_Dperp_lh_lingual[$c].";".$media_Dperp_lh_medialorbitofrontal[$c].";".$media_Dperp_lh_middletemporal[$c].";".$media_Dperp_lh_parahippocampal[$c].";".$media_Dperp_lh_paracentral[$c].";".$media_Dperp_lh_parsopercularis[$c].";".$media_Dperp_lh_parsorbitalis[$c].";".$media_Dperp_lh_parstriangularis[$c].";".$media_Dperp_lh_pericalcarine[$c].";".$media_Dperp_lh_postcentral[$c].";".$media_Dperp_lh_posteriorcingulate[$c].";".$media_Dperp_lh_precentral[$c].";".$media_Dperp_lh_precuneus[$c].";".$media_Dperp_lh_rostralanteriorcingulate[$c].";".$media_Dperp_lh_rostralmiddlefrontal[$c].";".$media_Dperp_lh_superiorfrontal[$c].";".$media_Dperp_lh_superiorparietal[$c].";".$media_Dperp_lh_superiortemporal[$c].";".$media_Dperp_lh_supramarginal[$c].";".$media_Dperp_lh_frontalpole[$c].";".$media_Dperp_lh_temporalpole[$c].";".$media_Dperp_lh_transversetemporal[$c].";".$media_Dperp_lh_insula[$c].";".$media_Dperp_rh_caudalanteriorcingulate[$c].";".$media_Dperp_rh_caudalmiddlefrontal[$c].";".$media_Dperp_rh_cuneus[$c].";".$media_Dperp_rh_entorhinal[$c].";".$media_Dperp_rh_fusiform[$c].";".$media_Dperp_rh_inferiorparietal[$c].";".$media_Dperp_rh_inferiortemporal[$c].";".$media_Dperp_rh_isthmuscingulate[$c].";".$media_Dperp_rh_lateraloccipital[$c].";".$media_Dperp_rh_lateralorbitofrontal[$c].";".$media_Dperp_rh_lingual[$c].";".$media_Dperp_rh_medialorbitofrontal[$c].";".$media_Dperp_rh_middletemporal[$c].";".$media_Dperp_rh_parahippocampal[$c].";".$media_Dperp_rh_paracentral[$c].";".$media_Dperp_rh_parsopercularis[$c].";".$media_Dperp_rh_parsorbitalis[$c].";".$media_Dperp_rh_parstriangularis[$c].";".$media_Dperp_rh_pericalcarine[$c].";".$media_Dperp_rh_postcentral[$c].";".$media_Dperp_rh_posteriorcingulate[$c].";".$media_Dperp_rh_precentral[$c].";".$media_Dperp_rh_precuneus[$c].";".$media_Dperp_rh_rostralanteriorcingulate[$c].";".$media_Dperp_rh_rostralmiddlefrontal[$c].";".$media_Dperp_rh_superiorfrontal[$c].";".$media_Dperp_rh_superiorparietal[$c].";".$media_Dperp_rh_superiortemporal[$c].";".$media_Dperp_rh_supramarginal[$c].";".$media_Dperp_rh_frontalpole[$c].";".$media_Dperp_rh_temporalpole[$c].";".$media_Dperp_rh_transversetemporal[$c].";".$media_Dperp_rh_insula[$c]."\r";
	 $c=$c+1;
	}
}

#print white matter parts
if($option == 3 || $option == 0)	 
{	open(RELATDADOS, "> Data_Relaxometry_WM.txt");
    $tam =@nomes;
	print RELATDADOS "nome;wm_lh_caudalanteriorcingulate;wm_lh_caudalmiddlefrontal;wm_lh_corpuscallosum;wm_lh_cuneus;wm_lh_entorhinal;wm_lh_fusiform;wm_lh_inferiorparietal;wm_lh_inferiortemporal;wm_lh_isthmuscingulate;wm_lh_lateraloccipital;wm_lh_lateralorbitofrontal;wm_lh_lingual;wm_lh_medialorbitofrontal;wm_lh_middletemporal;wm_lh_parahippocampal;wm_lh_paracentral;wm_lh_parsopercularis;wm_lh_parsorbitalis;wm_lh_parstriangularis;wm_lh_pericalcarine;wm_lh_postcentral;wm_lh_posteriorcingulate;wm_lh_precentral;wm_lh_precuneus;wm_lh_rostralanteriorcingulate;wm_lh_rostralmiddlefrontal;wm_lh_superiorfrontal;wm_lh_superiorparietal;wm_lh_superiortemporal;wm_lh_supramarginal;wm_lh_frontalpole;wm_lh_temporalpole;wm_lh_transversetemporal;wm_lh_insula;wm_rh_caudalanteriorcingulate;wm_rh_caudalmiddlefrontal;wm_rh_corpuscallosum;wm_rh_cuneus;wm_rh_entorhinal;wm_rh_fusiform;wm_rh_inferiorparietal;wm_rh_inferiortemporal;wm_rh_isthmuscingulate;wm_rh_lateraloccipital;wm_rh_lateralorbitofrontal;wm_rh_lingual;wm_rh_medialorbitofrontal;wm_rh_middletemporal;wm_rh_parahippocampal;wm_rh_paracentral;wm_rh_parsopercularis;wm_rh_parsorbitalis;wm_rh_parstriangularis;wm_rh_pericalcarine;wm_rh_postcentral;wm_rh_posteriorcingulate;wm_rh_precentral;wm_rh_precuneus;wm_rh_rostralanteriorcingulate;wm_rh_rostralmiddlefrontal;wm_rh_superiorfrontal;wm_rh_superiorparietal;wm_rh_superiortemporal;wm_rh_supramarginal;wm_rh_frontalpole;wm_rh_temporalpole;wm_rh_transversetemporal;wm_rh_insula\r";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$media_relaxo_wm_lh_caudalanteriorcingulate[$c].";".$media_relaxo_wm_lh_caudalmiddlefrontal[$c].";".$media_relaxo_wm_lh_corpuscallosum[$c].";".$media_relaxo_wm_lh_cuneus[$c].";".$media_relaxo_wm_lh_entorhinal[$c].";".$media_relaxo_wm_lh_fusiform[$c].";".$media_relaxo_wm_lh_inferiorparietal[$c].";".$media_relaxo_wm_lh_inferiortemporal[$c].";".$media_relaxo_wm_lh_isthmuscingulate[$c].";".$media_relaxo_wm_lh_lateraloccipital[$c].";".$media_relaxo_wm_lh_lateralorbitofrontal[$c].";".$media_relaxo_wm_lh_lingual[$c].";".$media_relaxo_wm_lh_medialorbitofrontal[$c].";".$media_relaxo_wm_lh_middletemporal[$c].";".$media_relaxo_wm_lh_parahippocampal[$c].";".$media_relaxo_wm_lh_paracentral[$c].";".$media_relaxo_wm_lh_parsopercularis[$c].";".$media_relaxo_wm_lh_parsorbitalis[$c].";".$media_relaxo_wm_lh_parstriangularis[$c].";".$media_relaxo_wm_lh_pericalcarine[$c].";".$media_relaxo_wm_lh_postcentral[$c].";".$media_relaxo_wm_lh_posteriorcingulate[$c].";".$media_relaxo_wm_lh_precentral[$c].";".$media_relaxo_wm_lh_precuneus[$c].";".$media_relaxo_wm_lh_rostralanteriorcingulate[$c].";".$media_relaxo_wm_lh_rostralmiddlefrontal[$c].";".$media_relaxo_wm_lh_superiorfrontal[$c].";".$media_relaxo_wm_lh_superiorparietal[$c].";".$media_relaxo_wm_lh_superiortemporal[$c].";".$media_relaxo_wm_lh_supramarginal[$c].";".$media_relaxo_wm_lh_frontalpole[$c].";".$media_relaxo_wm_lh_temporalpole[$c].";".$media_relaxo_wm_lh_transversetemporal[$c].";".$media_relaxo_wm_lh_insula[$c].";".$media_relaxo_wm_rh_caudalanteriorcingulate[$c].";".$media_relaxo_wm_rh_caudalmiddlefrontal[$c].";".$media_relaxo_wm_rh_corpuscallosum[$c].";".$media_relaxo_wm_rh_cuneus[$c].";".$media_relaxo_wm_rh_entorhinal[$c].";".$media_relaxo_wm_rh_fusiform[$c].";".$media_relaxo_wm_rh_inferiorparietal[$c].";".$media_relaxo_wm_rh_inferiortemporal[$c].";".$media_relaxo_wm_rh_isthmuscingulate[$c].";".$media_relaxo_wm_rh_lateraloccipital[$c].";".$media_relaxo_wm_rh_lateralorbitofrontal[$c].";".$media_relaxo_wm_rh_lingual[$c].";".$media_relaxo_wm_rh_medialorbitofrontal[$c].";".$media_relaxo_wm_rh_middletemporal[$c].";".$media_relaxo_wm_rh_parahippocampal[$c].";".$media_relaxo_wm_rh_paracentral[$c].";".$media_relaxo_wm_rh_parsopercularis[$c].";".$media_relaxo_wm_rh_parsorbitalis[$c].";".$media_relaxo_wm_rh_parstriangularis[$c].";".$media_relaxo_wm_rh_pericalcarine[$c].";".$media_relaxo_wm_rh_postcentral[$c].";".$media_relaxo_wm_rh_posteriorcingulate[$c].";".$media_relaxo_wm_rh_precentral[$c].";".$media_relaxo_wm_rh_precuneus[$c].";".$media_relaxo_wm_rh_rostralanteriorcingulate[$c].";".$media_relaxo_wm_rh_rostralmiddlefrontal[$c].";".$media_relaxo_wm_rh_superiorfrontal[$c].";".$media_relaxo_wm_rh_superiorparietal[$c].";".$media_relaxo_wm_rh_superiortemporal[$c].";".$media_relaxo_wm_rh_supramarginal[$c].";".$media_relaxo_wm_rh_frontalpole[$c].";".$media_relaxo_wm_rh_temporalpole[$c].";".$media_relaxo_wm_rh_transversetemporal[$c].";".$media_relaxo_wm_rh_insula[$c]."\r";
	  $c=$c+1;
	}
open(RELATDADOS, "> Data_MTR_WM.txt");
    $tam =@nomes;
	print RELATDADOS "nome;wm_lh_caudalanteriorcingulate;wm_lh_caudalmiddlefrontal;wm_lh_corpuscallosum;wm_lh_cuneus;wm_lh_entorhinal;wm_lh_fusiform;wm_lh_inferiorparietal;wm_lh_inferiortemporal;wm_lh_isthmuscingulate;wm_lh_lateraloccipital;wm_lh_lateralorbitofrontal;wm_lh_lingual;wm_lh_medialorbitofrontal;wm_lh_middletemporal;wm_lh_parahippocampal;wm_lh_paracentral;wm_lh_parsopercularis;wm_lh_parsorbitalis;wm_lh_parstriangularis;wm_lh_pericalcarine;wm_lh_postcentral;wm_lh_posteriorcingulate;wm_lh_precentral;wm_lh_precuneus;wm_lh_rostralanteriorcingulate;wm_lh_rostralmiddlefrontal;wm_lh_superiorfrontal;wm_lh_superiorparietal;wm_lh_superiortemporal;wm_lh_supramarginal;wm_lh_frontalpole;wm_lh_temporalpole;wm_lh_transversetemporal;wm_lh_insula;wm_rh_caudalanteriorcingulate;wm_rh_caudalmiddlefrontal;wm_rh_corpuscallosum;wm_rh_cuneus;wm_rh_entorhinal;wm_rh_fusiform;wm_rh_inferiorparietal;wm_rh_inferiortemporal;wm_rh_isthmuscingulate;wm_rh_lateraloccipital;wm_rh_lateralorbitofrontal;wm_rh_lingual;wm_rh_medialorbitofrontal;wm_rh_middletemporal;wm_rh_parahippocampal;wm_rh_paracentral;wm_rh_parsopercularis;wm_rh_parsorbitalis;wm_rh_parstriangularis;wm_rh_pericalcarine;wm_rh_postcentral;wm_rh_posteriorcingulate;wm_rh_precentral;wm_rh_precuneus;wm_rh_rostralanteriorcingulate;wm_rh_rostralmiddlefrontal;wm_rh_superiorfrontal;wm_rh_superiorparietal;wm_rh_superiortemporal;wm_rh_supramarginal;wm_rh_frontalpole;wm_rh_temporalpole;wm_rh_transversetemporal;wm_rh_insula\r";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$media_MT_wm_lh_caudalanteriorcingulate[$c].";".$media_MT_wm_lh_caudalmiddlefrontal[$c].";".$media_MT_wm_lh_corpuscallosum[$c].";".$media_MT_wm_lh_cuneus[$c].";".$media_MT_wm_lh_entorhinal[$c].";".$media_MT_wm_lh_fusiform[$c].";".$media_MT_wm_lh_inferiorparietal[$c].";".$media_MT_wm_lh_inferiortemporal[$c].";".$media_MT_wm_lh_isthmuscingulate[$c].";".$media_MT_wm_lh_lateraloccipital[$c].";".$media_MT_wm_lh_lateralorbitofrontal[$c].";".$media_MT_wm_lh_lingual[$c].";".$media_MT_wm_lh_medialorbitofrontal[$c].";".$media_MT_wm_lh_middletemporal[$c].";".$media_MT_wm_lh_parahippocampal[$c].";".$media_MT_wm_lh_paracentral[$c].";".$media_MT_wm_lh_parsopercularis[$c].";".$media_MT_wm_lh_parsorbitalis[$c].";".$media_MT_wm_lh_parstriangularis[$c].";".$media_MT_wm_lh_pericalcarine[$c].";".$media_MT_wm_lh_postcentral[$c].";".$media_MT_wm_lh_posteriorcingulate[$c].";".$media_MT_wm_lh_precentral[$c].";".$media_MT_wm_lh_precuneus[$c].";".$media_MT_wm_lh_rostralanteriorcingulate[$c].";".$media_MT_wm_lh_rostralmiddlefrontal[$c].";".$media_MT_wm_lh_superiorfrontal[$c].";".$media_MT_wm_lh_superiorparietal[$c].";".$media_MT_wm_lh_superiortemporal[$c].";".$media_MT_wm_lh_supramarginal[$c].";".$media_MT_wm_lh_frontalpole[$c].";".$media_MT_wm_lh_temporalpole[$c].";".$media_MT_wm_lh_transversetemporal[$c].";".$media_MT_wm_lh_insula[$c].";".$media_MT_wm_rh_caudalanteriorcingulate[$c].";".$media_MT_wm_rh_caudalmiddlefrontal[$c].";".$media_MT_wm_rh_corpuscallosum[$c].";".$media_MT_wm_rh_cuneus[$c].";".$media_MT_wm_rh_entorhinal[$c].";".$media_MT_wm_rh_fusiform[$c].";".$media_MT_wm_rh_inferiorparietal[$c].";".$media_MT_wm_rh_inferiortemporal[$c].";".$media_MT_wm_rh_isthmuscingulate[$c].";".$media_MT_wm_rh_lateraloccipital[$c].";".$media_MT_wm_rh_lateralorbitofrontal[$c].";".$media_MT_wm_rh_lingual[$c].";".$media_MT_wm_rh_medialorbitofrontal[$c].";".$media_MT_wm_rh_middletemporal[$c].";".$media_MT_wm_rh_parahippocampal[$c].";".$media_MT_wm_rh_paracentral[$c].";".$media_MT_wm_rh_parsopercularis[$c].";".$media_MT_wm_rh_parsorbitalis[$c].";".$media_MT_wm_rh_parstriangularis[$c].";".$media_MT_wm_rh_pericalcarine[$c].";".$media_MT_wm_rh_postcentral[$c].";".$media_MT_wm_rh_posteriorcingulate[$c].";".$media_MT_wm_rh_precentral[$c].";".$media_MT_wm_rh_precuneus[$c].";".$media_MT_wm_rh_rostralanteriorcingulate[$c].";".$media_MT_wm_rh_rostralmiddlefrontal[$c].";".$media_MT_wm_rh_superiorfrontal[$c].";".$media_MT_wm_rh_superiorparietal[$c].";".$media_MT_wm_rh_superiortemporal[$c].";".$media_MT_wm_rh_supramarginal[$c].";".$media_MT_wm_rh_frontalpole[$c].";".$media_MT_wm_rh_temporalpole[$c].";".$media_MT_wm_rh_transversetemporal[$c].";".$media_MT_wm_rh_insula[$c]."\r";
	  $c=$c+1;
	}
open(RELATDADOS, "> Data_FA_WM.txt");
    $tam =@nomes;
	print RELATDADOS "nome;wm_lh_caudalanteriorcingulate;wm_lh_caudalmiddlefrontal;wm_lh_corpuscallosum;wm_lh_cuneus;wm_lh_entorhinal;wm_lh_fusiform;wm_lh_inferiorparietal;wm_lh_inferiortemporal;wm_lh_isthmuscingulate;wm_lh_lateraloccipital;wm_lh_lateralorbitofrontal;wm_lh_lingual;wm_lh_medialorbitofrontal;wm_lh_middletemporal;wm_lh_parahippocampal;wm_lh_paracentral;wm_lh_parsopercularis;wm_lh_parsorbitalis;wm_lh_parstriangularis;wm_lh_pericalcarine;wm_lh_postcentral;wm_lh_posteriorcingulate;wm_lh_precentral;wm_lh_precuneus;wm_lh_rostralanteriorcingulate;wm_lh_rostralmiddlefrontal;wm_lh_superiorfrontal;wm_lh_superiorparietal;wm_lh_superiortemporal;wm_lh_supramarginal;wm_lh_frontalpole;wm_lh_temporalpole;wm_lh_transversetemporal;wm_lh_insula;wm_rh_caudalanteriorcingulate;wm_rh_caudalmiddlefrontal;wm_rh_corpuscallosum;wm_rh_cuneus;wm_rh_entorhinal;wm_rh_fusiform;wm_rh_inferiorparietal;wm_rh_inferiortemporal;wm_rh_isthmuscingulate;wm_rh_lateraloccipital;wm_rh_lateralorbitofrontal;wm_rh_lingual;wm_rh_medialorbitofrontal;wm_rh_middletemporal;wm_rh_parahippocampal;wm_rh_paracentral;wm_rh_parsopercularis;wm_rh_parsorbitalis;wm_rh_parstriangularis;wm_rh_pericalcarine;wm_rh_postcentral;wm_rh_posteriorcingulate;wm_rh_precentral;wm_rh_precuneus;wm_rh_rostralanteriorcingulate;wm_rh_rostralmiddlefrontal;wm_rh_superiorfrontal;wm_rh_superiorparietal;wm_rh_superiortemporal;wm_rh_supramarginal;wm_rh_frontalpole;wm_rh_temporalpole;wm_rh_transversetemporal;wm_rh_insula\r";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$media_FA_wm_lh_caudalanteriorcingulate[$c].";".$media_FA_wm_lh_caudalmiddlefrontal[$c].";".$media_FA_wm_lh_corpuscallosum[$c].";".$media_FA_wm_lh_cuneus[$c].";".$media_FA_wm_lh_entorhinal[$c].";".$media_FA_wm_lh_fusiform[$c].";".$media_FA_wm_lh_inferiorparietal[$c].";".$media_FA_wm_lh_inferiortemporal[$c].";".$media_FA_wm_lh_isthmuscingulate[$c].";".$media_FA_wm_lh_lateraloccipital[$c].";".$media_FA_wm_lh_lateralorbitofrontal[$c].";".$media_FA_wm_lh_lingual[$c].";".$media_FA_wm_lh_medialorbitofrontal[$c].";".$media_FA_wm_lh_middletemporal[$c].";".$media_FA_wm_lh_parahippocampal[$c].";".$media_FA_wm_lh_paracentral[$c].";".$media_FA_wm_lh_parsopercularis[$c].";".$media_FA_wm_lh_parsorbitalis[$c].";".$media_FA_wm_lh_parstriangularis[$c].";".$media_FA_wm_lh_pericalcarine[$c].";".$media_FA_wm_lh_postcentral[$c].";".$media_FA_wm_lh_posteriorcingulate[$c].";".$media_FA_wm_lh_precentral[$c].";".$media_FA_wm_lh_precuneus[$c].";".$media_FA_wm_lh_rostralanteriorcingulate[$c].";".$media_FA_wm_lh_rostralmiddlefrontal[$c].";".$media_FA_wm_lh_superiorfrontal[$c].";".$media_FA_wm_lh_superiorparietal[$c].";".$media_FA_wm_lh_superiortemporal[$c].";".$media_FA_wm_lh_supramarginal[$c].";".$media_FA_wm_lh_frontalpole[$c].";".$media_FA_wm_lh_temporalpole[$c].";".$media_FA_wm_lh_transversetemporal[$c].";".$media_FA_wm_lh_insula[$c].";".$media_FA_wm_rh_caudalanteriorcingulate[$c].";".$media_FA_wm_rh_caudalmiddlefrontal[$c].";".$media_FA_wm_rh_corpuscallosum[$c].";".$media_FA_wm_rh_cuneus[$c].";".$media_FA_wm_rh_entorhinal[$c].";".$media_FA_wm_rh_fusiform[$c].";".$media_FA_wm_rh_inferiorparietal[$c].";".$media_FA_wm_rh_inferiortemporal[$c].";".$media_FA_wm_rh_isthmuscingulate[$c].";".$media_FA_wm_rh_lateraloccipital[$c].";".$media_FA_wm_rh_lateralorbitofrontal[$c].";".$media_FA_wm_rh_lingual[$c].";".$media_FA_wm_rh_medialorbitofrontal[$c].";".$media_FA_wm_rh_middletemporal[$c].";".$media_FA_wm_rh_parahippocampal[$c].";".$media_FA_wm_rh_paracentral[$c].";".$media_FA_wm_rh_parsopercularis[$c].";".$media_FA_wm_rh_parsorbitalis[$c].";".$media_FA_wm_rh_parstriangularis[$c].";".$media_FA_wm_rh_pericalcarine[$c].";".$media_FA_wm_rh_postcentral[$c].";".$media_FA_wm_rh_posteriorcingulate[$c].";".$media_FA_wm_rh_precentral[$c].";".$media_FA_wm_rh_precuneus[$c].";".$media_FA_wm_rh_rostralanteriorcingulate[$c].";".$media_FA_wm_rh_rostralmiddlefrontal[$c].";".$media_FA_wm_rh_superiorfrontal[$c].";".$media_FA_wm_rh_superiorparietal[$c].";".$media_FA_wm_rh_superiortemporal[$c].";".$media_FA_wm_rh_supramarginal[$c].";".$media_FA_wm_rh_frontalpole[$c].";".$media_FA_wm_rh_temporalpole[$c].";".$media_FA_wm_rh_transversetemporal[$c].";".$media_FA_wm_rh_insula[$c]."\r";
	  $c=$c+1;
	}
#Difusibilidade Media
open(RELATDADOS, "> Data_average_diffusivity_WM.txt");
    $tam =@nomes;
	print RELATDADOS "nome;wm_lh_caudalanteriorcingulate;wm_lh_caudalmiddlefrontal;wm_lh_corpuscallosum;wm_lh_cuneus;wm_lh_entorhinal;wm_lh_fusiform;wm_lh_inferiorparietal;wm_lh_inferiortemporal;wm_lh_isthmuscingulate;wm_lh_lateraloccipital;wm_lh_lateralorbitofrontal;wm_lh_lingual;wm_lh_medialorbitofrontal;wm_lh_middletemporal;wm_lh_parahippocampal;wm_lh_paracentral;wm_lh_parsopercularis;wm_lh_parsorbitalis;wm_lh_parstriangularis;wm_lh_pericalcarine;wm_lh_postcentral;wm_lh_posteriorcingulate;wm_lh_precentral;wm_lh_precuneus;wm_lh_rostralanteriorcingulate;wm_lh_rostralmiddlefrontal;wm_lh_superiorfrontal;wm_lh_superiorparietal;wm_lh_superiortemporal;wm_lh_supramarginal;wm_lh_frontalpole;wm_lh_temporalpole;wm_lh_transversetemporal;wm_lh_insula;wm_rh_caudalanteriorcingulate;wm_rh_caudalmiddlefrontal;wm_rh_corpuscallosum;wm_rh_cuneus;wm_rh_entorhinal;wm_rh_fusiform;wm_rh_inferiorparietal;wm_rh_inferiortemporal;wm_rh_isthmuscingulate;wm_rh_lateraloccipital;wm_rh_lateralorbitofrontal;wm_rh_lingual;wm_rh_medialorbitofrontal;wm_rh_middletemporal;wm_rh_parahippocampal;wm_rh_paracentral;wm_rh_parsopercularis;wm_rh_parsorbitalis;wm_rh_parstriangularis;wm_rh_pericalcarine;wm_rh_postcentral;wm_rh_posteriorcingulate;wm_rh_precentral;wm_rh_precuneus;wm_rh_rostralanteriorcingulate;wm_rh_rostralmiddlefrontal;wm_rh_superiorfrontal;wm_rh_superiorparietal;wm_rh_superiortemporal;wm_rh_supramarginal;wm_rh_frontalpole;wm_rh_temporalpole;wm_rh_transversetemporal;wm_rh_insula\r";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$media_dMap_wm_lh_caudalanteriorcingulate[$c].";".$media_dMap_wm_lh_caudalmiddlefrontal[$c].";".$media_dMap_wm_lh_corpuscallosum[$c].";".$media_dMap_wm_lh_cuneus[$c].";".$media_dMap_wm_lh_entorhinal[$c].";".$media_dMap_wm_lh_fusiform[$c].";".$media_dMap_wm_lh_inferiorparietal[$c].";".$media_dMap_wm_lh_inferiortemporal[$c].";".$media_dMap_wm_lh_isthmuscingulate[$c].";".$media_dMap_wm_lh_lateraloccipital[$c].";".$media_dMap_wm_lh_lateralorbitofrontal[$c].";".$media_dMap_wm_lh_lingual[$c].";".$media_dMap_wm_lh_medialorbitofrontal[$c].";".$media_dMap_wm_lh_middletemporal[$c].";".$media_dMap_wm_lh_parahippocampal[$c].";".$media_dMap_wm_lh_paracentral[$c].";".$media_dMap_wm_lh_parsopercularis[$c].";".$media_dMap_wm_lh_parsorbitalis[$c].";".$media_dMap_wm_lh_parstriangularis[$c].";".$media_dMap_wm_lh_pericalcarine[$c].";".$media_dMap_wm_lh_postcentral[$c].";".$media_dMap_wm_lh_posteriorcingulate[$c].";".$media_dMap_wm_lh_precentral[$c].";".$media_dMap_wm_lh_precuneus[$c].";".$media_dMap_wm_lh_rostralanteriorcingulate[$c].";".$media_dMap_wm_lh_rostralmiddlefrontal[$c].";".$media_dMap_wm_lh_superiorfrontal[$c].";".$media_dMap_wm_lh_superiorparietal[$c].";".$media_dMap_wm_lh_superiortemporal[$c].";".$media_dMap_wm_lh_supramarginal[$c].";".$media_dMap_wm_lh_frontalpole[$c].";".$media_dMap_wm_lh_temporalpole[$c].";".$media_dMap_wm_lh_transversetemporal[$c].";".$media_dMap_wm_lh_insula[$c].";".$media_dMap_wm_rh_caudalanteriorcingulate[$c].";".$media_dMap_wm_rh_caudalmiddlefrontal[$c].";".$media_dMap_wm_rh_corpuscallosum[$c].";".$media_dMap_wm_rh_cuneus[$c].";".$media_dMap_wm_rh_entorhinal[$c].";".$media_dMap_wm_rh_fusiform[$c].";".$media_dMap_wm_rh_inferiorparietal[$c].";".$media_dMap_wm_rh_inferiortemporal[$c].";".$media_dMap_wm_rh_isthmuscingulate[$c].";".$media_dMap_wm_rh_lateraloccipital[$c].";".$media_dMap_wm_rh_lateralorbitofrontal[$c].";".$media_dMap_wm_rh_lingual[$c].";".$media_dMap_wm_rh_medialorbitofrontal[$c].";".$media_dMap_wm_rh_middletemporal[$c].";".$media_dMap_wm_rh_parahippocampal[$c].";".$media_dMap_wm_rh_paracentral[$c].";".$media_dMap_wm_rh_parsopercularis[$c].";".$media_dMap_wm_rh_parsorbitalis[$c].";".$media_dMap_wm_rh_parstriangularis[$c].";".$media_dMap_wm_rh_pericalcarine[$c].";".$media_dMap_wm_rh_postcentral[$c].";".$media_dMap_wm_rh_posteriorcingulate[$c].";".$media_dMap_wm_rh_precentral[$c].";".$media_dMap_wm_rh_precuneus[$c].";".$media_dMap_wm_rh_rostralanteriorcingulate[$c].";".$media_dMap_wm_rh_rostralmiddlefrontal[$c].";".$media_dMap_wm_rh_superiorfrontal[$c].";".$media_dMap_wm_rh_superiorparietal[$c].";".$media_dMap_wm_rh_superiortemporal[$c].";".$media_dMap_wm_rh_supramarginal[$c].";".$media_dMap_wm_rh_frontalpole[$c].";".$media_dMap_wm_rh_temporalpole[$c].";".$media_dMap_wm_rh_transversetemporal[$c].";".$media_dMap_wm_rh_insula[$c]."\r";
	  $c=$c+1;
	}
#Dpara
open(RELATDADOS, "> Data_parallel_diffusivity_WM.txt");
    $tam =@nomes;
	print RELATDADOS "nome;wm_lh_caudalanteriorcingulate;wm_lh_caudalmiddlefrontal;wm_lh_corpuscallosum;wm_lh_cuneus;wm_lh_entorhinal;wm_lh_fusiform;wm_lh_inferiorparietal;wm_lh_inferiortemporal;wm_lh_isthmuscingulate;wm_lh_lateraloccipital;wm_lh_lateralorbitofrontal;wm_lh_lingual;wm_lh_medialorbitofrontal;wm_lh_middletemporal;wm_lh_parahippocampal;wm_lh_paracentral;wm_lh_parsopercularis;wm_lh_parsorbitalis;wm_lh_parstriangularis;wm_lh_pericalcarine;wm_lh_postcentral;wm_lh_posteriorcingulate;wm_lh_precentral;wm_lh_precuneus;wm_lh_rostralanteriorcingulate;wm_lh_rostralmiddlefrontal;wm_lh_superiorfrontal;wm_lh_superiorparietal;wm_lh_superiortemporal;wm_lh_supramarginal;wm_lh_frontalpole;wm_lh_temporalpole;wm_lh_transversetemporal;wm_lh_insula;wm_rh_caudalanteriorcingulate;wm_rh_caudalmiddlefrontal;wm_rh_corpuscallosum;wm_rh_cuneus;wm_rh_entorhinal;wm_rh_fusiform;wm_rh_inferiorparietal;wm_rh_inferiortemporal;wm_rh_isthmuscingulate;wm_rh_lateraloccipital;wm_rh_lateralorbitofrontal;wm_rh_lingual;wm_rh_medialorbitofrontal;wm_rh_middletemporal;wm_rh_parahippocampal;wm_rh_paracentral;wm_rh_parsopercularis;wm_rh_parsorbitalis;wm_rh_parstriangularis;wm_rh_pericalcarine;wm_rh_postcentral;wm_rh_posteriorcingulate;wm_rh_precentral;wm_rh_precuneus;wm_rh_rostralanteriorcingulate;wm_rh_rostralmiddlefrontal;wm_rh_superiorfrontal;wm_rh_superiorparietal;wm_rh_superiortemporal;wm_rh_supramarginal;wm_rh_frontalpole;wm_rh_temporalpole;wm_rh_transversetemporal;wm_rh_insula\r";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$media_Dpara_wm_lh_caudalanteriorcingulate[$c].";".$media_Dpara_wm_lh_caudalmiddlefrontal[$c].";".$media_Dpara_wm_lh_corpuscallosum[$c].";".$media_Dpara_wm_lh_cuneus[$c].";".$media_Dpara_wm_lh_entorhinal[$c].";".$media_Dpara_wm_lh_fusiform[$c].";".$media_Dpara_wm_lh_inferiorparietal[$c].";".$media_Dpara_wm_lh_inferiortemporal[$c].";".$media_Dpara_wm_lh_isthmuscingulate[$c].";".$media_Dpara_wm_lh_lateraloccipital[$c].";".$media_Dpara_wm_lh_lateralorbitofrontal[$c].";".$media_Dpara_wm_lh_lingual[$c].";".$media_Dpara_wm_lh_medialorbitofrontal[$c].";".$media_Dpara_wm_lh_middletemporal[$c].";".$media_Dpara_wm_lh_parahippocampal[$c].";".$media_Dpara_wm_lh_paracentral[$c].";".$media_Dpara_wm_lh_parsopercularis[$c].";".$media_Dpara_wm_lh_parsorbitalis[$c].";".$media_Dpara_wm_lh_parstriangularis[$c].";".$media_Dpara_wm_lh_pericalcarine[$c].";".$media_Dpara_wm_lh_postcentral[$c].";".$media_Dpara_wm_lh_posteriorcingulate[$c].";".$media_Dpara_wm_lh_precentral[$c].";".$media_Dpara_wm_lh_precuneus[$c].";".$media_Dpara_wm_lh_rostralanteriorcingulate[$c].";".$media_Dpara_wm_lh_rostralmiddlefrontal[$c].";".$media_Dpara_wm_lh_superiorfrontal[$c].";".$media_Dpara_wm_lh_superiorparietal[$c].";".$media_Dpara_wm_lh_superiortemporal[$c].";".$media_Dpara_wm_lh_supramarginal[$c].";".$media_Dpara_wm_lh_frontalpole[$c].";".$media_Dpara_wm_lh_temporalpole[$c].";".$media_Dpara_wm_lh_transversetemporal[$c].";".$media_Dpara_wm_lh_insula[$c].";".$media_Dpara_wm_rh_caudalanteriorcingulate[$c].";".$media_Dpara_wm_rh_caudalmiddlefrontal[$c].";".$media_Dpara_wm_rh_corpuscallosum[$c].";".$media_Dpara_wm_rh_cuneus[$c].";".$media_Dpara_wm_rh_entorhinal[$c].";".$media_Dpara_wm_rh_fusiform[$c].";".$media_Dpara_wm_rh_inferiorparietal[$c].";".$media_Dpara_wm_rh_inferiortemporal[$c].";".$media_Dpara_wm_rh_isthmuscingulate[$c].";".$media_Dpara_wm_rh_lateraloccipital[$c].";".$media_Dpara_wm_rh_lateralorbitofrontal[$c].";".$media_Dpara_wm_rh_lingual[$c].";".$media_Dpara_wm_rh_medialorbitofrontal[$c].";".$media_Dpara_wm_rh_middletemporal[$c].";".$media_Dpara_wm_rh_parahippocampal[$c].";".$media_Dpara_wm_rh_paracentral[$c].";".$media_Dpara_wm_rh_parsopercularis[$c].";".$media_Dpara_wm_rh_parsorbitalis[$c].";".$media_Dpara_wm_rh_parstriangularis[$c].";".$media_Dpara_wm_rh_pericalcarine[$c].";".$media_Dpara_wm_rh_postcentral[$c].";".$media_Dpara_wm_rh_posteriorcingulate[$c].";".$media_Dpara_wm_rh_precentral[$c].";".$media_Dpara_wm_rh_precuneus[$c].";".$media_Dpara_wm_rh_rostralanteriorcingulate[$c].";".$media_Dpara_wm_rh_rostralmiddlefrontal[$c].";".$media_Dpara_wm_rh_superiorfrontal[$c].";".$media_Dpara_wm_rh_superiorparietal[$c].";".$media_Dpara_wm_rh_superiortemporal[$c].";".$media_Dpara_wm_rh_supramarginal[$c].";".$media_Dpara_wm_rh_frontalpole[$c].";".$media_Dpara_wm_rh_temporalpole[$c].";".$media_Dpara_wm_rh_transversetemporal[$c].";".$media_Dpara_wm_rh_insula[$c]."\r";
	  $c=$c+1;
	}
#Dperp	
open(RELATDADOS, "> Data_perpendicular_diffusivity_WM.txt");
    $tam =@nomes;
	print RELATDADOS "nome;wm_lh_caudalanteriorcingulate;wm_lh_caudalmiddlefrontal;wm_lh_corpuscallosum;wm_lh_cuneus;wm_lh_entorhinal;wm_lh_fusiform;wm_lh_inferiorparietal;wm_lh_inferiortemporal;wm_lh_isthmuscingulate;wm_lh_lateraloccipital;wm_lh_lateralorbitofrontal;wm_lh_lingual;wm_lh_medialorbitofrontal;wm_lh_middletemporal;wm_lh_parahippocampal;wm_lh_paracentral;wm_lh_parsopercularis;wm_lh_parsorbitalis;wm_lh_parstriangularis;wm_lh_pericalcarine;wm_lh_postcentral;wm_lh_posteriorcingulate;wm_lh_precentral;wm_lh_precuneus;wm_lh_rostralanteriorcingulate;wm_lh_rostralmiddlefrontal;wm_lh_superiorfrontal;wm_lh_superiorparietal;wm_lh_superiortemporal;wm_lh_supramarginal;wm_lh_frontalpole;wm_lh_temporalpole;wm_lh_transversetemporal;wm_lh_insula;wm_rh_caudalanteriorcingulate;wm_rh_caudalmiddlefrontal;wm_rh_corpuscallosum;wm_rh_cuneus;wm_rh_entorhinal;wm_rh_fusiform;wm_rh_inferiorparietal;wm_rh_inferiortemporal;wm_rh_isthmuscingulate;wm_rh_lateraloccipital;wm_rh_lateralorbitofrontal;wm_rh_lingual;wm_rh_medialorbitofrontal;wm_rh_middletemporal;wm_rh_parahippocampal;wm_rh_paracentral;wm_rh_parsopercularis;wm_rh_parsorbitalis;wm_rh_parstriangularis;wm_rh_pericalcarine;wm_rh_postcentral;wm_rh_posteriorcingulate;wm_rh_precentral;wm_rh_precuneus;wm_rh_rostralanteriorcingulate;wm_rh_rostralmiddlefrontal;wm_rh_superiorfrontal;wm_rh_superiorparietal;wm_rh_superiortemporal;wm_rh_supramarginal;wm_rh_frontalpole;wm_rh_temporalpole;wm_rh_transversetemporal;wm_rh_insula\r";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$media_Dperp_wm_lh_caudalanteriorcingulate[$c].";".$media_Dperp_wm_lh_caudalmiddlefrontal[$c].";".$media_Dperp_wm_lh_corpuscallosum[$c].";".$media_Dperp_wm_lh_cuneus[$c].";".$media_Dperp_wm_lh_entorhinal[$c].";".$media_Dperp_wm_lh_fusiform[$c].";".$media_Dperp_wm_lh_inferiorparietal[$c].";".$media_Dperp_wm_lh_inferiortemporal[$c].";".$media_Dperp_wm_lh_isthmuscingulate[$c].";".$media_Dperp_wm_lh_lateraloccipital[$c].";".$media_Dperp_wm_lh_lateralorbitofrontal[$c].";".$media_Dperp_wm_lh_lingual[$c].";".$media_Dperp_wm_lh_medialorbitofrontal[$c].";".$media_Dperp_wm_lh_middletemporal[$c].";".$media_Dperp_wm_lh_parahippocampal[$c].";".$media_Dperp_wm_lh_paracentral[$c].";".$media_Dperp_wm_lh_parsopercularis[$c].";".$media_Dperp_wm_lh_parsorbitalis[$c].";".$media_Dperp_wm_lh_parstriangularis[$c].";".$media_Dperp_wm_lh_pericalcarine[$c].";".$media_Dperp_wm_lh_postcentral[$c].";".$media_Dperp_wm_lh_posteriorcingulate[$c].";".$media_Dperp_wm_lh_precentral[$c].";".$media_Dperp_wm_lh_precuneus[$c].";".$media_Dperp_wm_lh_rostralanteriorcingulate[$c].";".$media_Dperp_wm_lh_rostralmiddlefrontal[$c].";".$media_Dperp_wm_lh_superiorfrontal[$c].";".$media_Dperp_wm_lh_superiorparietal[$c].";".$media_Dperp_wm_lh_superiortemporal[$c].";".$media_Dperp_wm_lh_supramarginal[$c].";".$media_Dperp_wm_lh_frontalpole[$c].";".$media_Dperp_wm_lh_temporalpole[$c].";".$media_Dperp_wm_lh_transversetemporal[$c].";".$media_Dperp_wm_lh_insula[$c].";".$media_Dperp_wm_rh_caudalanteriorcingulate[$c].";".$media_Dperp_wm_rh_caudalmiddlefrontal[$c].";".$media_Dperp_wm_rh_corpuscallosum[$c].";".$media_Dperp_wm_rh_cuneus[$c].";".$media_Dperp_wm_rh_entorhinal[$c].";".$media_Dperp_wm_rh_fusiform[$c].";".$media_Dperp_wm_rh_inferiorparietal[$c].";".$media_Dperp_wm_rh_inferiortemporal[$c].";".$media_Dperp_wm_rh_isthmuscingulate[$c].";".$media_Dperp_wm_rh_lateraloccipital[$c].";".$media_Dperp_wm_rh_lateralorbitofrontal[$c].";".$media_Dperp_wm_rh_lingual[$c].";".$media_Dperp_wm_rh_medialorbitofrontal[$c].";".$media_Dperp_wm_rh_middletemporal[$c].";".$media_Dperp_wm_rh_parahippocampal[$c].";".$media_Dperp_wm_rh_paracentral[$c].";".$media_Dperp_wm_rh_parsopercularis[$c].";".$media_Dperp_wm_rh_parsorbitalis[$c].";".$media_Dperp_wm_rh_parstriangularis[$c].";".$media_Dperp_wm_rh_pericalcarine[$c].";".$media_Dperp_wm_rh_postcentral[$c].";".$media_Dperp_wm_rh_posteriorcingulate[$c].";".$media_Dperp_wm_rh_precentral[$c].";".$media_Dperp_wm_rh_precuneus[$c].";".$media_Dperp_wm_rh_rostralanteriorcingulate[$c].";".$media_Dperp_wm_rh_rostralmiddlefrontal[$c].";".$media_Dperp_wm_rh_superiorfrontal[$c].";".$media_Dperp_wm_rh_superiorparietal[$c].";".$media_Dperp_wm_rh_superiortemporal[$c].";".$media_Dperp_wm_rh_supramarginal[$c].";".$media_Dperp_wm_rh_frontalpole[$c].";".$media_Dperp_wm_rh_temporalpole[$c].";".$media_Dperp_wm_rh_transversetemporal[$c].";".$media_Dperp_wm_rh_insula[$c]."\r";
	  $c=$c+1;
	}
}
#=============================================================================
sub Processamento
{#print"\n\n  dados do paciente...\n\n";
 chdir($NomePasta);
 $sh->gzip(" -f *_0_mpr.mnc");
 @d1 = glob("./*_0_mpr.mnc.gz");
 $file = $d1[0];
 $sh->mincheader(" $file > mincheader.txt ");
 $linha = $sh->grep(" dicom_0x0008:el_0x0020 mincheader.txt");
  $te1 = substr($linha,rindex($linha,"=")+2);
  $Stop = rindex($te1,'"');
  $te = substr($te1,0,$Stop);
  $start = index($te,'"')+1;
  $stop = index($te,'"')+4;
  $ano = substr($te,$start,$stop);
  $Start = index($te,'"')+5;
  $Stop = index($te,$ano)+1;
  $mes = substr($te,$Start,$Stop);
  $start = index($te,'"')+7;
  $stop = index($te,'"')+9;
  $dia = substr($te,$start,$stop);
 
 $Stop = index($NomePasta,"_");
 #$NomePaciente = substr($NomePasta,0,$Stop);
 $Stop = index($NomePasta,"_".$ano);
 $PrimNome = substr($NomePasta,0,$Stop);
 $sh->rm(" mincheader.txt");
 
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 #print "\n\n Primeiro nome: $PrimNome \n\n";
 #print "\n\n".$pastas [0]."\n\n";
 $sh->gzip(" -f ./faMap_normalizada.mnc");
 $sh->gzip(" -f ./dMap_normalizada.mnc");
 
 $sh->mv(" ./faMap_normalizada.mnc.gz ./Analise_mt_relaxo/faMap_normalizada.mnc.gz");
 $sh->mv(" ./dMap_normalizada.mnc.gz ./Analise_mt_relaxo/dMap_normalizada.mnc.gz");
 
chdir("Analise_mt_relaxo");
$sh->gzip(" -f *.mnc");
#user wants to extract values from subcortical structures or all
if($option == 1 || $option == 0)	 
{
@aseg1 = glob("./*_aseg.mnc.gz");
$arquivo = $aseg1[0];
$Start = index($arquivo,"./") + 2;
$Stop = index($arquivo,".mnc")-2;
$aseg = substr($arquivo,$Start,$Stop);	

# Análises MT e Relaxo e difusão
print"\n\n Getting subcortical regions values...\n\n";
print"\n\n Getting Relaxometry data...\n\n";
#####################################################################
 #Relaxometria
$sh->res(" ".$aseg." ".$PrimNome."_relaxo ");
#Left-Cerebral-White-Matter   2
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebral-Cortex        3
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Cerebral_Cortex = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-White-Matter  7
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Cerebellum_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-Cortex     8
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Cerebellum_Cortex = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Thalamus-Proper       10
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 10 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Thalamus_Proper     = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Caudate                      11  

 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 11 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Caudate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Putamen                     12

 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 12 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Putamen = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-Pallidum 		    13

 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 13 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Pallidum  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Brain-Stem                        16   
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 16 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Brain_Stem   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Hippocampus             17       

 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 17 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Amygdala                   18
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 18 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Amygdala    = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-Accumbens-area       26
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 26 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_Accumbens_area     = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-VentralDC                 28
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 28 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Left_VentralDC = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebral-White-Matter      41
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 41 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebral-Cortex  42
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 42 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Cerebral_Cortex  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-White-Matter   46
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 46 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Cerebellum_White_Matter   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-Cortex     47
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 47 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Cerebellum_Cortex   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Thalamus-Proper        49
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 49 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Thalamus_Proper = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Caudate		      50
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 50 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Caudate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Putamen                     51        
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 51 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Putamen  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Pallidum                     52
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 52 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Pallidum   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Hippocampus            53
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 53 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Amygdala                  54
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 54 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Amygdala = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Accumbens-area       58 
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 58 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_Accumbens_area  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-VentralDC                  60   
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 60 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Right_VentralDC = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#WM-hypointensities           77
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 77 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_WM_hypointensities = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Optic-Chiasm                      85
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 85 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Optic_Chiasm = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Posterior                     251
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 251 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_CC_Posterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Mid_Posterior            252
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 252 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_CC_Mid_Posterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#CC_Central                        253
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 253 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_CC_Central = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Mid_Anterior             254    
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 254 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_CC_Mid_Anterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Anterior                      255
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 255 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_CC_Anterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($aseg."_res.mnc.gz");
 
 #Montando os arrays para relaxometria

 push(@media_relaxo_Left_Cerebral_White_Matter,$media_relaxo_Left_Cerebral_White_Matter);
 push(@media_relaxo_Left_Cerebral_Cortex,$media_relaxo_Left_Cerebral_Cortex);
 push(@media_relaxo_Left_Cerebellum_White_Matter,$media_relaxo_Left_Cerebellum_White_Matter);
 push(@media_relaxo_Left_Cerebellum_Cortex,$media_relaxo_Left_Cerebellum_Cortex);
 push(@media_relaxo_Left_Thalamus_Proper,$media_relaxo_Left_Thalamus_Proper);
 push(@media_relaxo_Left_Caudate,$media_relaxo_Left_Caudate);
 push(@media_relaxo_Left_Putamen,$media_relaxo_Left_Putamen);
 push(@media_relaxo_Left_Pallidum,$media_relaxo_Left_Pallidum);
 push(@media_relaxo_Brain_Stem,$media_relaxo_Brain_Stem);
 push(@media_relaxo_Left_Hippocampus,$media_relaxo_Left_Hippocampus);
 push(@media_relaxo_Left_Amygdala,$media_relaxo_Left_Amygdala);
 push(@media_relaxo_Left_Accumbens_area ,$media_relaxo_Left_Accumbens_area);
 push(@media_relaxo_Left_VentralDC,$media_relaxo_Left_VentralDC);
 push(@media_relaxo_Right_Cerebral_White_Matter,$media_relaxo_Right_Cerebral_White_Matter);
 push(@media_relaxo_Right_Cerebral_Cortex,$media_relaxo_Right_Cerebral_Cortex);
 push(@media_relaxo_Right_Cerebellum_White_Matter,$media_relaxo_Right_Cerebellum_White_Matter);
 push(@media_relaxo_Right_Cerebellum_Cortex,$media_relaxo_Right_Cerebellum_Cortex);
 push(@media_relaxo_Right_Thalamus_Proper,$media_relaxo_Right_Thalamus_Proper);
 push(@media_relaxo_Right_Caudate,$media_relaxo_Right_Caudate);
 push(@media_relaxo_Right_Putamen,$media_relaxo_Right_Putamen);
 push(@media_relaxo_Right_Pallidum,$media_relaxo_Right_Pallidum);
 push(@media_relaxo_Right_Hippocampus,$media_relaxo_Right_Hippocampus);
 push(@media_relaxo_Right_Amygdala,$media_relaxo_Right_Amygdala);
 push(@media_relaxo_Right_Accumbens_area,$media_relaxo_Right_Accumbens_area);
 push(@media_relaxo_Right_VentralDC,$media_relaxo_Right_VentralDC);
 push(@media_relaxo_WM_hypointensities ,$media_relaxo_WM_hypointensities);
 push(@media_relaxo_Optic_Chiasm,$media_relaxo_Optic_Chiasm);
 push(@media_relaxo_CC_Posterior,$media_relaxo_CC_Posterior);
 push(@media_relaxo_CC_Mid_Posterior,$media_relaxo_CC_Mid_Posterior);
 push(@media_relaxo_CC_Central,$media_relaxo_CC_Central);
 push(@media_relaxo_CC_Mid_Anterior,$media_relaxo_CC_Mid_Anterior);
 push(@media_relaxo_CC_Anterior,$media_relaxo_CC_Anterior);
 
 
 #####################################################################
  print"\n\n Getting MTR data...\n\n";
 #MT
 $sh->res(" ".$aseg." ".$PrimNome."_".$ano.$mes.$dia."_mt ");
 #Left-Cerebral-White-Matter   2
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebral-Cortex        3
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Cerebral_Cortex = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-White-Matter  7
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Cerebellum_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-Cortex     8
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Cerebellum_Cortex = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Thalamus-Proper       10
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 10 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Thalamus_Proper     = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Caudate                      11  

 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 11 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Caudate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Putamen                     12

 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 12 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Putamen = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-Pallidum 		    13

 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 13 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Pallidum  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Brain-Stem                        16   
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 16 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Brain_Stem   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Hippocampus             17       

 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 17 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Amygdala                   18
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 18 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Amygdala    = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-Accumbens-area       26
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 26 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_Accumbens_area     = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-VentralDC                 28
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 28 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Left_VentralDC = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebral-White-Matter      41
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 41 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebral-Cortex  42
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 42 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Cerebral_Cortex  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-White-Matter   46
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 46 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Cerebellum_White_Matter   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-Cortex     47
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 47 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Cerebellum_Cortex   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Thalamus-Proper        49
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 49 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Thalamus_Proper = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Caudate		      50
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 50 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Caudate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Putamen                     51        
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 51 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Putamen  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Pallidum                     52
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 52 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Pallidum   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Hippocampus            53
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 53 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Amygdala                  54
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 54 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Amygdala = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Accumbens-area       58 
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 58 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_Accumbens_area  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-VentralDC                  60   
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 60 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Right_VentralDC = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#WM-hypointensities           77
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 77 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_WM_hypointensities = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Optic-Chiasm                      85
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 85 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_Optic_Chiasm = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Posterior                     251
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 251 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_CC_Posterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Mid_Posterior            252
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 252 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_CC_Mid_Posterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#CC_Central                        253
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 253 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_CC_Central = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Mid_Anterior             254    
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 254 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_CC_Mid_Anterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Anterior                      255
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 255 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_CC_Anterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($aseg."_res.mnc.gz");
  
 #Montando os arrays para MTR
 push(@media_MT_Left_Cerebral_White_Matter,$media_MT_Left_Cerebral_White_Matter);
 push(@media_MT_Left_Cerebral_Cortex,$media_MT_Left_Cerebral_Cortex);
 push(@media_MT_Left_Cerebellum_White_Matter,$media_MT_Left_Cerebellum_White_Matter);
 push(@media_MT_Left_Cerebellum_Cortex,$media_MT_Left_Cerebellum_Cortex);
 push(@media_MT_Left_Thalamus_Proper,$media_MT_Left_Thalamus_Proper);
 push(@media_MT_Left_Caudate,$media_MT_Left_Caudate);
 push(@media_MT_Left_Putamen,$media_MT_Left_Putamen);
 push(@media_MT_Left_Pallidum,$media_MT_Left_Pallidum);
 push(@media_MT_Brain_Stem,$media_MT_Brain_Stem);
 push(@media_MT_Left_Hippocampus,$media_MT_Left_Hippocampus);
 push(@media_MT_Left_Amygdala,$media_MT_Left_Amygdala);
 push(@media_MT_Left_Accumbens_area ,$media_MT_Left_Accumbens_area);
 push(@media_MT_Left_VentralDC,$media_MT_Left_VentralDC);
 push(@media_MT_Right_Cerebral_White_Matter,$media_MT_Right_Cerebral_White_Matter);
 push(@media_MT_Right_Cerebral_Cortex,$media_MT_Right_Cerebral_Cortex);
 push(@media_MT_Right_Cerebellum_White_Matter,$media_MT_Right_Cerebellum_White_Matter);
 push(@media_MT_Right_Cerebellum_Cortex,$media_MT_Right_Cerebellum_Cortex);
 push(@media_MT_Right_Thalamus_Proper,$media_MT_Right_Thalamus_Proper);
 push(@media_MT_Right_Caudate,$media_MT_Right_Caudate);
 push(@media_MT_Right_Putamen,$media_MT_Right_Putamen);
 push(@media_MT_Right_Pallidum,$media_MT_Right_Pallidum);
 push(@media_MT_Right_Hippocampus,$media_MT_Right_Hippocampus);
 push(@media_MT_Right_Amygdala,$media_MT_Right_Amygdala);
 push(@media_MT_Right_Accumbens_area,$media_MT_Right_Accumbens_area);
 push(@media_MT_Right_VentralDC,$media_MT_Right_VentralDC);
 push(@media_MT_WM_hypointensities ,$media_MT_WM_hypointensities);
 push(@media_MT_Optic_Chiasm,$media_MT_Optic_Chiasm);
 push(@media_MT_CC_Posterior,$media_MT_CC_Posterior);
 push(@media_MT_CC_Mid_Posterior,$media_MT_CC_Mid_Posterior);
 push(@media_MT_CC_Central,$media_MT_CC_Central);
 push(@media_MT_CC_Mid_Anterior,$media_MT_CC_Mid_Anterior);
 push(@media_MT_CC_Anterior,$media_MT_CC_Anterior);
 
 #####################################################################
  print"\n\n Getting FA data...\n\n";
 #FA
 $sh->res(" ".$aseg." faMap_normalizada ");
 #Left-Cerebral-White-Matter   2
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Left-Cerebral-Cortex        3
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Cerebral_Cortex = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-White-Matter  7
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Cerebellum_White_Matter = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-Cortex     8
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Cerebellum_Cortex = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Left-Thalamus-Proper       10
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 10 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Thalamus_Proper     = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Left-Caudate                      11  

 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 11 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Caudate = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Left-Putamen                     12

 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 12 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Putamen = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");

#Left-Pallidum 		    13

 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 13 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Pallidum = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Brain-Stem                        16   
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 16 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Brain_Stem   = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Left-Hippocampus             17       

 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 17 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Left-Amygdala                   18
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 18 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Amygdala    = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");

#Left-Accumbens-area       26
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 26 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_Accumbens_area     = substr($temp1,0,rindex($temp1," "));
 #$media_FA_Left_Accumbens_area     =$media_FA_Left_Accumbens_area/3000;
 $sh->rm("volume1.txt");

#Left-VentralDC                 28
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 28 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Left_VentralDC = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-Cerebral-White-Matter      41
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 41 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-Cerebral-Cortex  42
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 42 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Cerebral_Cortex  = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-White-Matter   46
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 46 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Cerebellum_White_Matter   = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-Cortex     47
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 47 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Cerebellum_Cortex   = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-Thalamus-Proper        49
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 49 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Thalamus_Proper = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-Caudate		      50
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 50 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Caudate = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-Putamen                     51        
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 51 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Putamen  = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-Pallidum                     52
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 52 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Pallidum   = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-Hippocampus            53
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 53 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Hippocampus   = substr($temp1,0,rindex($temp1," "));
  
 $sh->rm("volume1.txt");
 
#Right-Amygdala                  54
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 54 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Amygdala = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-Accumbens-area       58 
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 58 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_Accumbens_area=substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Right-VentralDC                  60   
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 60 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Right_VentralDC = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#WM-hypointensities           77
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 77 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_WM_hypointensities = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#Optic-Chiasm                      85
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 85 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_Optic_Chiasm = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#CC_Posterior                     251
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 251 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_CC_Posterior = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#CC_Mid_Posterior            252
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 252 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_CC_Mid_Posterior = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");

#CC_Central                        253
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 253 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_CC_Central = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#CC_Mid_Anterior             254    
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 254 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_CC_Mid_Anterior = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 
#CC_Anterior                      255
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 255 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_CC_Anterior = substr($temp1,0,rindex($temp1," "));
 
 $sh->rm("volume1.txt");
 $sh->rm($aseg."_res.mnc.gz");
  
 #Montando os arrays para FA
 push(@media_FA_Left_Cerebral_White_Matter,$media_FA_Left_Cerebral_White_Matter);
 push(@media_FA_Left_Cerebral_Cortex,$media_FA_Left_Cerebral_Cortex);
 push(@media_FA_Left_Cerebellum_White_Matter,$media_FA_Left_Cerebellum_White_Matter);
 push(@media_FA_Left_Cerebellum_Cortex,$media_FA_Left_Cerebellum_Cortex);
 push(@media_FA_Left_Thalamus_Proper,$media_FA_Left_Thalamus_Proper);
 push(@media_FA_Left_Caudate,$media_FA_Left_Caudate);
 push(@media_FA_Left_Putamen,$media_FA_Left_Putamen);
 push(@media_FA_Left_Pallidum,$media_FA_Left_Pallidum);
 push(@media_FA_Brain_Stem,$media_FA_Brain_Stem);
 push(@media_FA_Left_Hippocampus,$media_FA_Left_Hippocampus);
 push(@media_FA_Left_Amygdala,$media_FA_Left_Amygdala);
 push(@media_FA_Left_Accumbens_area ,$media_FA_Left_Accumbens_area);
 push(@media_FA_Left_VentralDC,$media_FA_Left_VentralDC);
 push(@media_FA_Right_Cerebral_White_Matter,$media_FA_Right_Cerebral_White_Matter);
 push(@media_FA_Right_Cerebral_Cortex,$media_FA_Right_Cerebral_Cortex);
 push(@media_FA_Right_Cerebellum_White_Matter,$media_FA_Right_Cerebellum_White_Matter);
 push(@media_FA_Right_Cerebellum_Cortex,$media_FA_Right_Cerebellum_Cortex);
 push(@media_FA_Right_Thalamus_Proper,$media_FA_Right_Thalamus_Proper);
 push(@media_FA_Right_Caudate,$media_FA_Right_Caudate);
 push(@media_FA_Right_Putamen,$media_FA_Right_Putamen);
 push(@media_FA_Right_Pallidum,$media_FA_Right_Pallidum);
 push(@media_FA_Right_Hippocampus,$media_FA_Right_Hippocampus);
 push(@media_FA_Right_Amygdala,$media_FA_Right_Amygdala);
 push(@media_FA_Right_Accumbens_area,$media_FA_Right_Accumbens_area);
 push(@media_FA_Right_VentralDC,$media_FA_Right_VentralDC);
 push(@media_FA_WM_hypointensities ,$media_FA_WM_hypointensities);
 push(@media_FA_Optic_Chiasm,$media_FA_Optic_Chiasm);
 push(@media_FA_CC_Posterior,$media_FA_CC_Posterior);
 push(@media_FA_CC_Mid_Posterior,$media_FA_CC_Mid_Posterior);
 push(@media_FA_CC_Central,$media_FA_CC_Central);
 push(@media_FA_CC_Mid_Anterior,$media_FA_CC_Mid_Anterior);
 push(@media_FA_CC_Anterior,$media_FA_CC_Anterior);
 
 #####################################################################
  print"\n\n Getting average diffusivity data...\n\n";
 #Difusibilidade média
 $sh->res(" ".$aseg." dMap_normalizada ");
 
 #Left-Cerebral-White-Matter   2
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebral-Cortex        3
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Cerebral_Cortex = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-White-Matter  7
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Cerebellum_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-Cortex     8
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Cerebellum_Cortex = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Thalamus-Proper       10
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 10 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Thalamus_Proper     = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Caudate                      11  

 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 11 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Caudate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Putamen                     12

 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 12 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Putamen = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-Pallidum 		    13

 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 13 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Pallidum  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Brain-Stem                        16   
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 16 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Brain_Stem   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Hippocampus             17       

 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 17 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Amygdala                   18
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 18 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Amygdala    = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-Accumbens-area       26
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 26 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_Accumbens_area     = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-VentralDC                 28
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 28 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Left_VentralDC = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebral-White-Matter      41
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 41 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebral-Cortex  42
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 42 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Cerebral_Cortex  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-White-Matter   46
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 46 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Cerebellum_White_Matter   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-Cortex     47
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 47 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Cerebellum_Cortex   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Thalamus-Proper        49
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 49 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Thalamus_Proper = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Caudate		      50
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 50 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Caudate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Putamen                     51        
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 51 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Putamen  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Pallidum                     52
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 52 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Pallidum   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Hippocampus            53
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 53 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Amygdala                  54
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 54 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Amygdala = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Accumbens-area       58 
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 58 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_Accumbens_area  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-VentralDC                  60   
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 60 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Right_VentralDC = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#WM-hypointensities           77
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 77 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_WM_hypointensities = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Optic-Chiasm                      85
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 85 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_Optic_Chiasm = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Posterior                     251
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 251 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_CC_Posterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Mid_Posterior            252
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 252 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_CC_Mid_Posterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#CC_Central                        253
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 253 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_CC_Central = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Mid_Anterior             254    
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 254 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_CC_Mid_Anterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Anterior                      255
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 255 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_CC_Anterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($aseg."_res.mnc.gz");
  
 #Montando os arrays para dMap
 push(@media_dMap_Left_Cerebral_White_Matter,$media_dMap_Left_Cerebral_White_Matter);
 push(@media_dMap_Left_Cerebral_Cortex,$media_dMap_Left_Cerebral_Cortex);
 push(@media_dMap_Left_Cerebellum_White_Matter,$media_dMap_Left_Cerebellum_White_Matter);
 push(@media_dMap_Left_Cerebellum_Cortex,$media_dMap_Left_Cerebellum_Cortex);
 push(@media_dMap_Left_Thalamus_Proper,$media_dMap_Left_Thalamus_Proper);
 push(@media_dMap_Left_Caudate,$media_dMap_Left_Caudate);
 push(@media_dMap_Left_Putamen,$media_dMap_Left_Putamen);
 push(@media_dMap_Left_Pallidum,$media_dMap_Left_Pallidum);
 push(@media_dMap_Brain_Stem,$media_dMap_Brain_Stem);
 push(@media_dMap_Left_Hippocampus,$media_dMap_Left_Hippocampus);
 push(@media_dMap_Left_Amygdala,$media_dMap_Left_Amygdala);
 push(@media_dMap_Left_Accumbens_area ,$media_dMap_Left_Accumbens_area);
 push(@media_dMap_Left_VentralDC,$media_dMap_Left_VentralDC);
 push(@media_dMap_Right_Cerebral_White_Matter,$media_dMap_Right_Cerebral_White_Matter);
 push(@media_dMap_Right_Cerebral_Cortex,$media_dMap_Right_Cerebral_Cortex);
 push(@media_dMap_Right_Cerebellum_White_Matter,$media_dMap_Right_Cerebellum_White_Matter);
 push(@media_dMap_Right_Cerebellum_Cortex,$media_dMap_Right_Cerebellum_Cortex);
 push(@media_dMap_Right_Thalamus_Proper,$media_dMap_Right_Thalamus_Proper);
 push(@media_dMap_Right_Caudate,$media_dMap_Right_Caudate);
 push(@media_dMap_Right_Putamen,$media_dMap_Right_Putamen);
 push(@media_dMap_Right_Pallidum,$media_dMap_Right_Pallidum);
 push(@media_dMap_Right_Hippocampus,$media_dMap_Right_Hippocampus);
 push(@media_dMap_Right_Amygdala,$media_dMap_Right_Amygdala);
 push(@media_dMap_Right_Accumbens_area,$media_dMap_Right_Accumbens_area);
 push(@media_dMap_Right_VentralDC,$media_dMap_Right_VentralDC);
 push(@media_dMap_WM_hypointensities ,$media_dMap_WM_hypointensities);
 push(@media_dMap_Optic_Chiasm,$media_dMap_Optic_Chiasm);
 push(@media_dMap_CC_Posterior,$media_dMap_CC_Posterior);
 push(@media_dMap_CC_Mid_Posterior,$media_dMap_CC_Mid_Posterior);
 push(@media_dMap_CC_Central,$media_dMap_CC_Central);
 push(@media_dMap_CC_Mid_Anterior,$media_dMap_CC_Mid_Anterior);
 push(@media_dMap_CC_Anterior,$media_dMap_CC_Anterior);
 
 #####################################################################
  print"\n\n Getting parallel diffusivity data...\n\n";

 #Dparalelo
 $sh->res(" ".$aseg." ".$PrimNome."_Dpara ");
 
  #Left-Cerebral-White-Matter   2
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebral-Cortex        3
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Cerebral_Cortex = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-White-Matter  7
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Cerebellum_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-Cortex     8
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Cerebellum_Cortex = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Thalamus-Proper       10
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 10 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Thalamus_Proper     = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Caudate                      11  

 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 11 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Caudate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Putamen                     12

 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 12 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Putamen = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-Pallidum 		    13

 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 13 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Pallidum  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Brain-Stem                        16   
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 16 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Brain_Stem   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Hippocampus             17       

 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 17 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Amygdala                   18
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 18 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Amygdala    = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-Accumbens-area       26
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 26 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_Accumbens_area     = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-VentralDC                 28
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 28 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Left_VentralDC = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebral-White-Matter      41
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 41 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebral-Cortex  42
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 42 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Cerebral_Cortex  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-White-Matter   46
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 46 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Cerebellum_White_Matter   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-Cortex     47
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 47 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Cerebellum_Cortex   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Thalamus-Proper        49
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 49 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Thalamus_Proper = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Caudate		      50
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 50 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Caudate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Putamen                     51        
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 51 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Putamen  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Pallidum                     52
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 52 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Pallidum   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Hippocampus            53
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 53 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Amygdala                  54
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 54 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Amygdala   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Accumbens-area       58 
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 58 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_Accumbens_area  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-VentralDC                  60   
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 60 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Right_VentralDC = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#WM-hypointensities           77
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 77 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_WM_hypointensities = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Optic-Chiasm                      85
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 85 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_Optic_Chiasm = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Posterior                     251
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 251 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_CC_Posterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Mid_Posterior            252
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 252 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_CC_Mid_Posterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#CC_Central                        253
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 253 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_CC_Central = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Mid_Anterior             254    
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 254 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_CC_Mid_Anterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Anterior                      255
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 255 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_CC_Anterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($aseg."_res.mnc.gz");
  
 #Montando os arrays para Dpara
 push(@media_Dpara_Left_Cerebral_White_Matter,$media_Dpara_Left_Cerebral_White_Matter);
 push(@media_Dpara_Left_Cerebral_Cortex,$media_Dpara_Left_Cerebral_Cortex);
 push(@media_Dpara_Left_Cerebellum_White_Matter,$media_Dpara_Left_Cerebellum_White_Matter);
 push(@media_Dpara_Left_Cerebellum_Cortex,$media_Dpara_Left_Cerebellum_Cortex);
 push(@media_Dpara_Left_Thalamus_Proper,$media_Dpara_Left_Thalamus_Proper);
 push(@media_Dpara_Left_Caudate,$media_Dpara_Left_Caudate);
 push(@media_Dpara_Left_Putamen,$media_Dpara_Left_Putamen);
 push(@media_Dpara_Left_Pallidum,$media_Dpara_Left_Pallidum);
 push(@media_Dpara_Brain_Stem,$media_Dpara_Brain_Stem);
 push(@media_Dpara_Left_Hippocampus,$media_Dpara_Left_Hippocampus);
 push(@media_Dpara_Left_Amygdala,$media_Dpara_Left_Amygdala);
 push(@media_Dpara_Left_Accumbens_area ,$media_Dpara_Left_Accumbens_area);
 push(@media_Dpara_Left_VentralDC,$media_Dpara_Left_VentralDC);
 push(@media_Dpara_Right_Cerebral_White_Matter,$media_Dpara_Right_Cerebral_White_Matter);
 push(@media_Dpara_Right_Cerebral_Cortex,$media_Dpara_Right_Cerebral_Cortex);
 push(@media_Dpara_Right_Cerebellum_White_Matter,$media_Dpara_Right_Cerebellum_White_Matter);
 push(@media_Dpara_Right_Cerebellum_Cortex,$media_Dpara_Right_Cerebellum_Cortex);
 push(@media_Dpara_Right_Thalamus_Proper,$media_Dpara_Right_Thalamus_Proper);
 push(@media_Dpara_Right_Caudate,$media_Dpara_Right_Caudate);
 push(@media_Dpara_Right_Putamen,$media_Dpara_Right_Putamen);
 push(@media_Dpara_Right_Pallidum,$media_Dpara_Right_Pallidum);
 push(@media_Dpara_Right_Hippocampus,$media_Dpara_Right_Hippocampus);
 push(@media_Dpara_Right_Amygdala,$media_Dpara_Right_Amygdala);
 push(@media_Dpara_Right_Accumbens_area,$media_Dpara_Right_Accumbens_area);
 push(@media_Dpara_Right_VentralDC,$media_Dpara_Right_VentralDC);
 push(@media_Dpara_WM_hypointensities ,$media_Dpara_WM_hypointensities);
 push(@media_Dpara_Optic_Chiasm,$media_Dpara_Optic_Chiasm);
 push(@media_Dpara_CC_Posterior,$media_Dpara_CC_Posterior);
 push(@media_Dpara_CC_Mid_Posterior,$media_Dpara_CC_Mid_Posterior);
 push(@media_Dpara_CC_Central,$media_Dpara_CC_Central);
 push(@media_Dpara_CC_Mid_Anterior,$media_Dpara_CC_Mid_Anterior);
 push(@media_Dpara_CC_Anterior,$media_Dpara_CC_Anterior);
  
 ##################################################################### 
 print"\n\n Getting perpendicular diffusivity data...\n\n";
 #Dperpendicular
 $sh->res(" ".$aseg." ".$PrimNome."_Dperp ");
 
 #Left-Cerebral-White-Matter   2
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebral-Cortex        3
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Cerebral_Cortex = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-White-Matter  7
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Cerebellum_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Cerebellum-Cortex     8
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Cerebellum_Cortex = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Thalamus-Proper       10
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 10 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Thalamus_Proper     = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Caudate                      11  

 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 11 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Caudate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Putamen                     12

 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 12 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Putamen = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-Pallidum 		    13

 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 13 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Pallidum  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Brain-Stem                        16   
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 16 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Brain_Stem   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Hippocampus             17       

 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 17 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Left-Amygdala                   18
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 18 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Amygdala    = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-Accumbens-area       26
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 26 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_Accumbens_area     = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#Left-VentralDC                 28
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 28 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Left_VentralDC = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebral-White-Matter      41
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 41 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Cerebral_White_Matter = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebral-Cortex  42
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 42 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Cerebral_Cortex  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-White-Matter   46
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 46 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Cerebellum_White_Matter   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Cerebellum-Cortex     47
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 47 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Cerebellum_Cortex   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Thalamus-Proper        49
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 49 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Thalamus_Proper = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Caudate		      50
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 50 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Caudate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Putamen                     51        
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 51 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Putamen  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Pallidum                     52
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 52 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Pallidum   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Hippocampus            53
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 53 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Hippocampus   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Amygdala                  54
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 54 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Amygdala = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-Accumbens-area       58 
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 58 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_Accumbens_area  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Right-VentralDC                  60   
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 60 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Right_VentralDC = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#WM-hypointensities           77
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 77 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_WM_hypointensities = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#Optic-Chiasm                      85
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 85 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_Optic_Chiasm = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Posterior                     251
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 251 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_CC_Posterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Mid_Posterior            252
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 252 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_CC_Mid_Posterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#CC_Central                        253
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 253 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_CC_Central = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Mid_Anterior             254    
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 254 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_CC_Mid_Anterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#CC_Anterior                      255
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aseg."_res.mnc.gz -mask_binvalue 255 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_CC_Anterior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($aseg."_res.mnc.gz");
  
 #Montando os arrays para Dpara
 push(@media_Dperp_Left_Cerebral_White_Matter,$media_Dperp_Left_Cerebral_White_Matter);
 push(@media_Dperp_Left_Cerebral_Cortex,$media_Dperp_Left_Cerebral_Cortex);
 push(@media_Dperp_Left_Cerebellum_White_Matter,$media_Dperp_Left_Cerebellum_White_Matter);
 push(@media_Dperp_Left_Cerebellum_Cortex,$media_Dperp_Left_Cerebellum_Cortex);
 push(@media_Dperp_Left_Thalamus_Proper,$media_Dperp_Left_Thalamus_Proper);
 push(@media_Dperp_Left_Caudate,$media_Dperp_Left_Caudate);
 push(@media_Dperp_Left_Putamen,$media_Dperp_Left_Putamen);
 push(@media_Dperp_Left_Pallidum,$media_Dperp_Left_Pallidum);
 push(@media_Dperp_Brain_Stem,$media_Dperp_Brain_Stem);
 push(@media_Dperp_Left_Hippocampus,$media_Dperp_Left_Hippocampus);
 push(@media_Dperp_Left_Amygdala,$media_Dperp_Left_Amygdala);
 push(@media_Dperp_Left_Accumbens_area ,$media_Dperp_Left_Accumbens_area);
 push(@media_Dperp_Left_VentralDC,$media_Dperp_Left_VentralDC);
 push(@media_Dperp_Right_Cerebral_White_Matter,$media_Dperp_Right_Cerebral_White_Matter);
 push(@media_Dperp_Right_Cerebral_Cortex,$media_Dperp_Right_Cerebral_Cortex);
 push(@media_Dperp_Right_Cerebellum_White_Matter,$media_Dperp_Right_Cerebellum_White_Matter);
 push(@media_Dperp_Right_Cerebellum_Cortex,$media_Dperp_Right_Cerebellum_Cortex);
 push(@media_Dperp_Right_Thalamus_Proper,$media_Dperp_Right_Thalamus_Proper);
 push(@media_Dperp_Right_Caudate,$media_Dperp_Right_Caudate);
 push(@media_Dperp_Right_Putamen,$media_Dperp_Right_Putamen);
 push(@media_Dperp_Right_Pallidum,$media_Dperp_Right_Pallidum);
 push(@media_Dperp_Right_Hippocampus,$media_Dperp_Right_Hippocampus);
 push(@media_Dperp_Right_Amygdala,$media_Dperp_Right_Amygdala);
 push(@media_Dperp_Right_Accumbens_area,$media_Dperp_Right_Accumbens_area);
 push(@media_Dperp_Right_VentralDC,$media_Dperp_Right_VentralDC);
 push(@media_Dperp_WM_hypointensities ,$media_Dperp_WM_hypointensities);
 push(@media_Dperp_Optic_Chiasm,$media_Dperp_Optic_Chiasm);
 push(@media_Dperp_CC_Posterior,$media_Dperp_CC_Posterior);
 push(@media_Dperp_CC_Mid_Posterior,$media_Dperp_CC_Mid_Posterior);
 push(@media_Dperp_CC_Central,$media_Dperp_CC_Central);
 push(@media_Dperp_CC_Mid_Anterior,$media_Dperp_CC_Mid_Anterior);
 push(@media_Dperp_CC_Anterior,$media_Dperp_CC_Anterior);
 
 ##################################################################### fim de extraçaõ de dados
 }

#####################################################################

if($option == 2 || $option == 0)	 #cortex parts
{
	@aparc_aseg1 = glob("./*_aparc+aseg.mnc.gz");
	$arquivo = $aparc_aseg1[0];
	$Start = index($arquivo,"./") + 2;
	$Stop = index($arquivo,".mnc")-2;
	$aparc_aseg = substr($arquivo,$Start,$Stop);
	
######Relaxometry
print"\n\n Getting Cortical regions values...\n\n";
print"\n\n Getting Relaxometry data...\n\n";

$sh->res(" ".$aparc_aseg." ".$PrimNome."_relaxo ");

#lh-caudalanteriorcingulate 1002
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-caudalmiddlefrontal 1003
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_caudalmiddlefrontal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-cuneus 1005 
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_cuneus  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-entorhinal 1006
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_entorhinal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-fusiform 1007
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_fusiform   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiorparietal 1008
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_inferiorparietal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiortemporal 1009
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_inferiortemporal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-isthmuscingulate 1010
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_isthmuscingulate  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateraloccipital 1011
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateralorbitofrontal 1012
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lingual 1013
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-medialorbitofrontal 1014
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-middletemporal 1015
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parahippocampal 1016
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-paracentral 1017
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsopercularis 1018
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsorbitalis 1019
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_parsorbitalis  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parstriangularis 1020 
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-pericalcarine 1021
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-postcentral 1022
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-posteriorcingulate 1023
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precentral 1024
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precuneus 1025
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralanteriorcingulate 1026
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralmiddlefrontal 1027
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorfrontal 1028 
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorparietal 1029   
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#lh-superiortemporal 1030    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-supramarginal 1031    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-frontalpole 1032    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-temporalpole 1033    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-transversetemporal 1034    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-insula 1035  
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalanteriorcingulate  2002    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalmiddlefrontal 2003 
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-cuneus 2005   
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

 #rh-entorhinal 2006   
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-fusiform 2007    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-inferiorparietal 2008 
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-inferiortemporal 2009    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-isthmuscingulate 2010    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateraloccipital 2011    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateralorbitofrontal 2012    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lingual 2013    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-medialorbitofrontal 2014    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-middletemporal 2015    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parahippocampal 2016    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-paracentral 2017
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsopercularis 2018    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsorbitalis 2019    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parstriangularis 2020    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-pericalcarine 2021 
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-postcentral 2022
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-posteriorcingulate 2023
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precentral 2024    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precuneus 2025    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralanteriorcingulate 2026 
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralmiddlefrontal 2027    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#rh-superiorfrontal 2028    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorparietal 2029  
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-superiortemporal 2030
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-supramarginal 2031    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-frontalpole 2032    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

#rh-temporalpole 2033    
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

#rh-transversetemporal 2034   
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-insula 2035   
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_rh_insula = substr($temp1,0,rindex($temp1," "));

 $sh->rm("volume1.txt"); 
 $sh->rm($aparc_aseg."_res.mnc.gz"); 

 #Montando os arrays para Dpara
push(@media_relaxo_lh_caudalanteriorcingulate,$media_relaxo_lh_caudalanteriorcingulate);
push(@media_relaxo_lh_caudalmiddlefrontal,$media_relaxo_lh_caudalmiddlefrontal);
push(@media_relaxo_lh_cuneus ,$media_relaxo_lh_cuneus);
push(@media_relaxo_lh_entorhinal,$media_relaxo_lh_entorhinal);
push(@media_relaxo_lh_fusiform,$media_relaxo_lh_fusiform);
push(@media_relaxo_lh_inferiorparietal,$media_relaxo_lh_inferiorparietal);
push(@media_relaxo_lh_inferiortemporal,$media_relaxo_lh_inferiortemporal);
push(@media_relaxo_lh_isthmuscingulate,$media_relaxo_lh_isthmuscingulate);
push(@media_relaxo_lh_lateraloccipital,$media_relaxo_lh_lateraloccipital);
push(@media_relaxo_lh_lateralorbitofrontal,$media_relaxo_lh_lateralorbitofrontal);
push(@media_relaxo_lh_lingual,$media_relaxo_lh_lingual);
push(@media_relaxo_lh_medialorbitofrontal,$media_relaxo_lh_medialorbitofrontal);
push(@media_relaxo_lh_middletemporal,$media_relaxo_lh_middletemporal);
push(@media_relaxo_lh_parahippocampal,$media_relaxo_lh_parahippocampal);
push(@media_relaxo_lh_paracentral,$media_relaxo_lh_paracentral);
push(@media_relaxo_lh_parsopercularis,$media_relaxo_lh_parsopercularis);
push(@media_relaxo_lh_parsorbitalis,$media_relaxo_lh_parsorbitalis);
push(@media_relaxo_lh_parstriangularis,$media_relaxo_lh_parstriangularis);
push(@media_relaxo_lh_pericalcarine,$media_relaxo_lh_pericalcarine);
push(@media_relaxo_lh_postcentral,$media_relaxo_lh_postcentral);
push(@media_relaxo_lh_posteriorcingulate,$media_relaxo_lh_posteriorcingulate);
push(@media_relaxo_lh_precentral,$media_relaxo_lh_precentral);
push(@media_relaxo_lh_precuneus,$media_relaxo_lh_precuneus);
push(@media_relaxo_lh_rostralanteriorcingulate,$media_relaxo_lh_rostralanteriorcingulate);
push(@media_relaxo_lh_rostralmiddlefrontal,$media_relaxo_lh_rostralmiddlefrontal);
push(@media_relaxo_lh_superiorfrontal,$media_relaxo_lh_superiorfrontal);
push(@media_relaxo_lh_superiorparietal,$media_relaxo_lh_superiorparietal);
push(@media_relaxo_lh_superiortemporal,$media_relaxo_lh_superiortemporal);
push(@media_relaxo_lh_supramarginal,$media_relaxo_lh_supramarginal);
push(@media_relaxo_lh_frontalpole,$media_relaxo_lh_frontalpole);
push(@media_relaxo_lh_temporalpole,$media_relaxo_lh_temporalpole);
push(@media_relaxo_lh_transversetemporal,$media_relaxo_lh_transversetemporal);
push(@media_relaxo_lh_insula,$media_relaxo_lh_insula);

push(@media_relaxo_rh_caudalanteriorcingulate,$media_relaxo_rh_caudalanteriorcingulate);
push(@media_relaxo_rh_caudalmiddlefrontal,$media_relaxo_rh_caudalmiddlefrontal);
push(@media_relaxo_rh_cuneus ,$media_relaxo_rh_cuneus);
push(@media_relaxo_rh_entorhinal,$media_relaxo_rh_entorhinal);
push(@media_relaxo_rh_fusiform,$media_relaxo_rh_fusiform);
push(@media_relaxo_rh_inferiorparietal,$media_relaxo_rh_inferiorparietal);
push(@media_relaxo_rh_inferiortemporal,$media_relaxo_rh_inferiortemporal);
push(@media_relaxo_rh_isthmuscingulate,$media_relaxo_rh_isthmuscingulate);
push(@media_relaxo_rh_lateraloccipital,$media_relaxo_rh_lateraloccipital);
push(@media_relaxo_rh_lateralorbitofrontal,$media_relaxo_rh_lateralorbitofrontal);
push(@media_relaxo_rh_lingual,$media_relaxo_rh_lingual);
push(@media_relaxo_rh_medialorbitofrontal,$media_relaxo_rh_medialorbitofrontal);
push(@media_relaxo_rh_middletemporal,$media_relaxo_rh_middletemporal);
push(@media_relaxo_rh_parahippocampal,$media_relaxo_rh_parahippocampal);
push(@media_relaxo_rh_paracentral,$media_relaxo_rh_paracentral);
push(@media_relaxo_rh_parsopercularis,$media_relaxo_rh_parsopercularis);
push(@media_relaxo_rh_parsorbitalis,$media_relaxo_rh_parsorbitalis);
push(@media_relaxo_rh_parstriangularis,$media_relaxo_rh_parstriangularis);
push(@media_relaxo_rh_pericalcarine,$media_relaxo_rh_pericalcarine);
push(@media_relaxo_rh_postcentral,$media_relaxo_rh_postcentral);
push(@media_relaxo_rh_posteriorcingulate,$media_relaxo_rh_posteriorcingulate);
push(@media_relaxo_rh_precentral,$media_relaxo_rh_precentral);
push(@media_relaxo_rh_precuneus,$media_relaxo_rh_precuneus);
push(@media_relaxo_rh_rostralanteriorcingulate,$media_relaxo_rh_rostralanteriorcingulate);
push(@media_relaxo_rh_rostralmiddlefrontal,$media_relaxo_rh_rostralmiddlefrontal);
push(@media_relaxo_rh_superiorfrontal,$media_relaxo_rh_superiorfrontal);
push(@media_relaxo_rh_superiorparietal,$media_relaxo_rh_superiorparietal);
push(@media_relaxo_rh_superiortemporal,$media_relaxo_rh_superiortemporal);
push(@media_relaxo_rh_supramarginal,$media_relaxo_rh_supramarginal);
push(@media_relaxo_rh_frontalpole,$media_relaxo_rh_frontalpole);
push(@media_relaxo_rh_temporalpole,$media_relaxo_rh_temporalpole);
push(@media_relaxo_rh_transversetemporal,$media_relaxo_rh_transversetemporal);
push(@media_relaxo_rh_insula,$media_relaxo_rh_insula);


####################################################################
######MTR
print"\n\n Getting MTR data...\n\n";
 #MT
 $sh->res(" ".$aparc_aseg." ".$PrimNome."_".$ano.$mes.$dia."_mt");
 
#lh-caudalanteriorcingulate 1002
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-caudalmiddlefrontal 1003
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_caudalmiddlefrontal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-cuneus 1005 
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_cuneus  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-entorhinal 1006
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_entorhinal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-fusiform 1007
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_fusiform   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiorparietal 1008
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_inferiorparietal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiortemporal 1009
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_inferiortemporal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-isthmuscingulate 1010
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_isthmuscingulate  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateraloccipital 1011
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateralorbitofrontal 1012
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lingual 1013
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-medialorbitofrontal 1014
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-middletemporal 1015
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parahippocampal 1016
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-paracentral 1017
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsopercularis 1018
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsorbitalis 1019
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_parsorbitalis  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parstriangularis 1020 
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-pericalcarine 1021
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-postcentral 1022
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-posteriorcingulate 1023
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precentral 1024
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precuneus 1025
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralanteriorcingulate 1026
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralmiddlefrontal 1027
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorfrontal 1028 
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorparietal 1029   
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#lh-superiortemporal 1030    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-supramarginal 1031    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-frontalpole 1032    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-temporalpole 1033    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-transversetemporal 1034    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-insula 1035  
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalanteriorcingulate  2002    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalmiddlefrontal 2003 
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-cuneus 2005   
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

 #rh-entorhinal 2006   
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-fusiform 2007    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-inferiorparietal 2008 
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-inferiortemporal 2009    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-isthmuscingulate 2010    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateraloccipital 2011    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateralorbitofrontal 2012    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lingual 2013    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-medialorbitofrontal 2014    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-middletemporal 2015    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parahippocampal 2016    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-paracentral 2017
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsopercularis 2018    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsorbitalis 2019    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parstriangularis 2020    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-pericalcarine 2021 
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-postcentral 2022
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-posteriorcingulate 2023
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precentral 2024    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precuneus 2025    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralanteriorcingulate 2026 
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralmiddlefrontal 2027    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorfrontal 2028    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorparietal 2029  
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-superiortemporal 2030
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-supramarginal 2031    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-frontalpole 2032    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

#rh-temporalpole 2033    
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-transversetemporal 2034   
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-insula 2035   
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 $sh->rm($aparc_aseg."_res.mnc.gz"); 

 #Montando os arrays para Dpara
push(@media_MT_lh_caudalanteriorcingulate,$media_MT_lh_caudalanteriorcingulate);
push(@media_MT_lh_caudalmiddlefrontal,$media_MT_lh_caudalmiddlefrontal);
push(@media_MT_lh_cuneus ,$media_MT_lh_cuneus);
push(@media_MT_lh_entorhinal,$media_MT_lh_entorhinal);
push(@media_MT_lh_fusiform,$media_MT_lh_fusiform);
push(@media_MT_lh_inferiorparietal,$media_MT_lh_inferiorparietal);
push(@media_MT_lh_inferiortemporal,$media_MT_lh_inferiortemporal);
push(@media_MT_lh_isthmuscingulate,$media_MT_lh_isthmuscingulate);
push(@media_MT_lh_lateraloccipital,$media_MT_lh_lateraloccipital);
push(@media_MT_lh_lateralorbitofrontal,$media_MT_lh_lateralorbitofrontal);
push(@media_MT_lh_lingual,$media_MT_lh_lingual);
push(@media_MT_lh_medialorbitofrontal,$media_MT_lh_medialorbitofrontal);
push(@media_MT_lh_middletemporal,$media_MT_lh_middletemporal);
push(@media_MT_lh_parahippocampal,$media_MT_lh_parahippocampal);
push(@media_MT_lh_paracentral,$media_MT_lh_paracentral);
push(@media_MT_lh_parsopercularis,$media_MT_lh_parsopercularis);
push(@media_MT_lh_parsorbitalis,$media_MT_lh_parsorbitalis);
push(@media_MT_lh_parstriangularis,$media_MT_lh_parstriangularis);
push(@media_MT_lh_pericalcarine,$media_MT_lh_pericalcarine);
push(@media_MT_lh_postcentral,$media_MT_lh_postcentral);
push(@media_MT_lh_posteriorcingulate,$media_MT_lh_posteriorcingulate);
push(@media_MT_lh_precentral,$media_MT_lh_precentral);
push(@media_MT_lh_precuneus,$media_MT_lh_precuneus);
push(@media_MT_lh_rostralanteriorcingulate,$media_MT_lh_rostralanteriorcingulate);
push(@media_MT_lh_rostralmiddlefrontal,$media_MT_lh_rostralmiddlefrontal);
push(@media_MT_lh_superiorfrontal,$media_MT_lh_superiorfrontal);
push(@media_MT_lh_superiorparietal,$media_MT_lh_superiorparietal);
push(@media_MT_lh_superiortemporal,$media_MT_lh_superiortemporal);
push(@media_MT_lh_supramarginal,$media_MT_lh_supramarginal);
push(@media_MT_lh_frontalpole,$media_MT_lh_frontalpole);
push(@media_MT_lh_temporalpole,$media_MT_lh_temporalpole);
push(@media_MT_lh_transversetemporal,$media_MT_lh_transversetemporal);
push(@media_MT_lh_insula,$media_MT_lh_insula);

push(@media_MT_rh_caudalanteriorcingulate,$media_MT_rh_caudalanteriorcingulate);
push(@media_MT_rh_caudalmiddlefrontal,$media_MT_rh_caudalmiddlefrontal);
push(@media_MT_rh_cuneus ,$media_MT_rh_cuneus);
push(@media_MT_rh_entorhinal,$media_MT_rh_entorhinal);
push(@media_MT_rh_fusiform,$media_MT_rh_fusiform);
push(@media_MT_rh_inferiorparietal,$media_MT_rh_inferiorparietal);
push(@media_MT_rh_inferiortemporal,$media_MT_rh_inferiortemporal);
push(@media_MT_rh_isthmuscingulate,$media_MT_rh_isthmuscingulate);
push(@media_MT_rh_lateraloccipital,$media_MT_rh_lateraloccipital);
push(@media_MT_rh_lateralorbitofrontal,$media_MT_rh_lateralorbitofrontal);
push(@media_MT_rh_lingual,$media_MT_rh_lingual);
push(@media_MT_rh_medialorbitofrontal,$media_MT_rh_medialorbitofrontal);
push(@media_MT_rh_middletemporal,$media_MT_rh_middletemporal);
push(@media_MT_rh_parahippocampal,$media_MT_rh_parahippocampal);
push(@media_MT_rh_paracentral,$media_MT_rh_paracentral);
push(@media_MT_rh_parsopercularis,$media_MT_rh_parsopercularis);
push(@media_MT_rh_parsorbitalis,$media_MT_rh_parsorbitalis);
push(@media_MT_rh_parstriangularis,$media_MT_rh_parstriangularis);
push(@media_MT_rh_pericalcarine,$media_MT_rh_pericalcarine);
push(@media_MT_rh_postcentral,$media_MT_rh_postcentral);
push(@media_MT_rh_posteriorcingulate,$media_MT_rh_posteriorcingulate);
push(@media_MT_rh_precentral,$media_MT_rh_precentral);
push(@media_MT_rh_precuneus,$media_MT_rh_precuneus);
push(@media_MT_rh_rostralanteriorcingulate,$media_MT_rh_rostralanteriorcingulate);
push(@media_MT_rh_rostralmiddlefrontal,$media_MT_rh_rostralmiddlefrontal);
push(@media_MT_rh_superiorfrontal,$media_MT_rh_superiorfrontal);
push(@media_MT_rh_superiorparietal,$media_MT_rh_superiorparietal);
push(@media_MT_rh_superiortemporal,$media_MT_rh_superiortemporal);
push(@media_MT_rh_supramarginal,$media_MT_rh_supramarginal);
push(@media_MT_rh_frontalpole,$media_MT_rh_frontalpole);
push(@media_MT_rh_temporalpole,$media_MT_rh_temporalpole);
push(@media_MT_rh_transversetemporal,$media_MT_rh_transversetemporal);
push(@media_MT_rh_insula,$media_MT_rh_insula);

###########################################################################
  print"\n\n Getting FA data...\n\n";
 #FA
 $sh->res(" ".$aparc_aseg." faMap_normalizada ");

$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-caudalmiddlefrontal 1003
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_caudalmiddlefrontal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-cuneus 1005 
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_cuneus  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-entorhinal 1006
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_entorhinal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-fusiform 1007
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_fusiform   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiorparietal 1008
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_inferiorparietal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiortemporal 1009
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_inferiortemporal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-isthmuscingulate 1010
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_isthmuscingulate  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateraloccipital 1011
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateralorbitofrontal 1012
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lingual 1013
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-medialorbitofrontal 1014
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-middletemporal 1015
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parahippocampal 1016
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-paracentral 1017
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsopercularis 1018
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsorbitalis 1019
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_parsorbitalis  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parstriangularis 1020 
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-pericalcarine 1021
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-postcentral 1022
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-posteriorcingulate 1023
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precentral 1024
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precuneus 1025
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralanteriorcingulate 1026
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralmiddlefrontal 1027
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorfrontal 1028 
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorparietal 1029   
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#lh-superiortemporal 1030    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-supramarginal 1031    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-frontalpole 1032    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-temporalpole 1033    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-transversetemporal 1034    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-insula 1035  
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalanteriorcingulate  2002    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalmiddlefrontal 2003 
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-cuneus 2005   
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

 #rh-entorhinal 2006   
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-fusiform 2007    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-inferiorparietal 2008 
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-inferiortemporal 2009    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-isthmuscingulate 2010    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateraloccipital 2011    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateralorbitofrontal 2012    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lingual 2013    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-medialorbitofrontal 2014    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-middletemporal 2015    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parahippocampal 2016    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-paracentral 2017
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsopercularis 2018    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsorbitalis 2019    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parstriangularis 2020    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-pericalcarine 2021 
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-postcentral 2022
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-posteriorcingulate 2023
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precentral 2024    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precuneus 2025    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralanteriorcingulate 2026 
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralmiddlefrontal 2027    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorfrontal 2028    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorparietal 2029  
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-superiortemporal 2030
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-supramarginal 2031    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-frontalpole 2032    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

#rh-temporalpole 2033    
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-transversetemporal 2034   
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-insula 2035   
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 $sh->rm($aparc_aseg."_res.mnc.gz"); 

 #Montando os arrays para Dpara
push(@media_FA_lh_caudalanteriorcingulate,$media_FA_lh_caudalanteriorcingulate);
push(@media_FA_lh_caudalmiddlefrontal,$media_FA_lh_caudalmiddlefrontal);
push(@media_FA_lh_cuneus ,$media_FA_lh_cuneus);
push(@media_FA_lh_entorhinal,$media_FA_lh_entorhinal);
push(@media_FA_lh_fusiform,$media_FA_lh_fusiform);
push(@media_FA_lh_inferiorparietal,$media_FA_lh_inferiorparietal);
push(@media_FA_lh_inferiortemporal,$media_FA_lh_inferiortemporal);
push(@media_FA_lh_isthmuscingulate,$media_FA_lh_isthmuscingulate);
push(@media_FA_lh_lateraloccipital,$media_FA_lh_lateraloccipital);
push(@media_FA_lh_lateralorbitofrontal,$media_FA_lh_lateralorbitofrontal);
push(@media_FA_lh_lingual,$media_FA_lh_lingual);
push(@media_FA_lh_medialorbitofrontal,$media_FA_lh_medialorbitofrontal);
push(@media_FA_lh_middletemporal,$media_FA_lh_middletemporal);
push(@media_FA_lh_parahippocampal,$media_FA_lh_parahippocampal);
push(@media_FA_lh_paracentral,$media_FA_lh_paracentral);
push(@media_FA_lh_parsopercularis,$media_FA_lh_parsopercularis);
push(@media_FA_lh_parsorbitalis,$media_FA_lh_parsorbitalis);
push(@media_FA_lh_parstriangularis,$media_FA_lh_parstriangularis);
push(@media_FA_lh_pericalcarine,$media_FA_lh_pericalcarine);
push(@media_FA_lh_postcentral,$media_FA_lh_postcentral);
push(@media_FA_lh_posteriorcingulate,$media_FA_lh_posteriorcingulate);
push(@media_FA_lh_precentral,$media_FA_lh_precentral);
push(@media_FA_lh_precuneus,$media_FA_lh_precuneus);
push(@media_FA_lh_rostralanteriorcingulate,$media_FA_lh_rostralanteriorcingulate);
push(@media_FA_lh_rostralmiddlefrontal,$media_FA_lh_rostralmiddlefrontal);
push(@media_FA_lh_superiorfrontal,$media_FA_lh_superiorfrontal);
push(@media_FA_lh_superiorparietal,$media_FA_lh_superiorparietal);
push(@media_FA_lh_superiortemporal,$media_FA_lh_superiortemporal);
push(@media_FA_lh_supramarginal,$media_FA_lh_supramarginal);
push(@media_FA_lh_frontalpole,$media_FA_lh_frontalpole);
push(@media_FA_lh_temporalpole,$media_FA_lh_temporalpole);
push(@media_FA_lh_transversetemporal,$media_FA_lh_transversetemporal);
push(@media_FA_lh_insula,$media_FA_lh_insula);

push(@media_FA_rh_caudalanteriorcingulate,$media_FA_rh_caudalanteriorcingulate);
push(@media_FA_rh_caudalmiddlefrontal,$media_FA_rh_caudalmiddlefrontal);
push(@media_FA_rh_cuneus ,$media_FA_rh_cuneus);
push(@media_FA_rh_entorhinal,$media_FA_rh_entorhinal);
push(@media_FA_rh_fusiform,$media_FA_rh_fusiform);
push(@media_FA_rh_inferiorparietal,$media_FA_rh_inferiorparietal);
push(@media_FA_rh_inferiortemporal,$media_FA_rh_inferiortemporal);
push(@media_FA_rh_isthmuscingulate,$media_FA_rh_isthmuscingulate);
push(@media_FA_rh_lateraloccipital,$media_FA_rh_lateraloccipital);
push(@media_FA_rh_lateralorbitofrontal,$media_FA_rh_lateralorbitofrontal);
push(@media_FA_rh_lingual,$media_FA_rh_lingual);
push(@media_FA_rh_medialorbitofrontal,$media_FA_rh_medialorbitofrontal);
push(@media_FA_rh_middletemporal,$media_FA_rh_middletemporal);
push(@media_FA_rh_parahippocampal,$media_FA_rh_parahippocampal);
push(@media_FA_rh_paracentral,$media_FA_rh_paracentral);
push(@media_FA_rh_parsopercularis,$media_FA_rh_parsopercularis);
push(@media_FA_rh_parsorbitalis,$media_FA_rh_parsorbitalis);
push(@media_FA_rh_parstriangularis,$media_FA_rh_parstriangularis);
push(@media_FA_rh_pericalcarine,$media_FA_rh_pericalcarine);
push(@media_FA_rh_postcentral,$media_FA_rh_postcentral);
push(@media_FA_rh_posteriorcingulate,$media_FA_rh_posteriorcingulate);
push(@media_FA_rh_precentral,$media_FA_rh_precentral);
push(@media_FA_rh_precuneus,$media_FA_rh_precuneus);
push(@media_FA_rh_rostralanteriorcingulate,$media_FA_rh_rostralanteriorcingulate);
push(@media_FA_rh_rostralmiddlefrontal,$media_FA_rh_rostralmiddlefrontal);
push(@media_FA_rh_superiorfrontal,$media_FA_rh_superiorfrontal);
push(@media_FA_rh_superiorparietal,$media_FA_rh_superiorparietal);
push(@media_FA_rh_superiortemporal,$media_FA_rh_superiortemporal);
push(@media_FA_rh_supramarginal,$media_FA_rh_supramarginal);
push(@media_FA_rh_frontalpole,$media_FA_rh_frontalpole);
push(@media_FA_rh_temporalpole,$media_FA_rh_temporalpole);
push(@media_FA_rh_transversetemporal,$media_FA_rh_transversetemporal);
push(@media_FA_rh_insula,$media_FA_rh_insula);

###########################################################################
 print"\n\n Getting average diffusivity data...\n\n";
 #Difusibilidade média
 $sh->res(" ".$aparc_aseg." dMap_normalizada ");

$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-caudalmiddlefrontal 1003
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_caudalmiddlefrontal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-cuneus 1005 
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_cuneus  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-entorhinal 1006
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_entorhinal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-fusiform 1007
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_fusiform   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiorparietal 1008
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_inferiorparietal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiortemporal 1009
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_inferiortemporal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-isthmuscingulate 1010
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_isthmuscingulate  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateraloccipital 1011
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateralorbitofrontal 1012
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lingual 1013
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-medialorbitofrontal 1014
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-middletemporal 1015
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parahippocampal 1016
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-paracentral 1017
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsopercularis 1018
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsorbitalis 1019
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_parsorbitalis  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parstriangularis 1020 
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-pericalcarine 1021
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-postcentral 1022
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-posteriorcingulate 1023
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precentral 1024
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precuneus 1025
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralanteriorcingulate 1026
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralmiddlefrontal 1027
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorfrontal 1028 
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorparietal 1029   
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#lh-superiortemporal 1030    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-supramarginal 1031    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-frontalpole 1032    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-temporalpole 1033    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-transversetemporal 1034    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-insula 1035  
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalanteriorcingulate  2002    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalmiddlefrontal 2003 
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-cuneus 2005   
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

 #rh-entorhinal 2006   
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-fusiform 2007    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-inferiorparietal 2008 
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-inferiortemporal 2009    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-isthmuscingulate 2010    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateraloccipital 2011    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateralorbitofrontal 2012    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lingual 2013    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-medialorbitofrontal 2014    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-middletemporal 2015    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parahippocampal 2016    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-paracentral 2017
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsopercularis 2018    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsorbitalis 2019    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parstriangularis 2020    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-pericalcarine 2021 
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-postcentral 2022
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-posteriorcingulate 2023
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precentral 2024    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precuneus 2025    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralanteriorcingulate 2026 
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralmiddlefrontal 2027    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorfrontal 2028    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorparietal 2029  
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-superiortemporal 2030
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-supramarginal 2031    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_supramarginal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-frontalpole 2032    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

#rh-temporalpole 2033    
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-transversetemporal 2034   
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-insula 2035   
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 $sh->rm($aparc_aseg."_res.mnc.gz"); 

 #Montando os arrays para Dpara
push(@media_dMap_lh_caudalanteriorcingulate,$media_dMap_lh_caudalanteriorcingulate);
push(@media_dMap_lh_caudalmiddlefrontal,$media_dMap_lh_caudalmiddlefrontal);
push(@media_dMap_lh_cuneus ,$media_dMap_lh_cuneus);
push(@media_dMap_lh_entorhinal,$media_dMap_lh_entorhinal);
push(@media_dMap_lh_fusiform,$media_dMap_lh_fusiform);
push(@media_dMap_lh_inferiorparietal,$media_dMap_lh_inferiorparietal);
push(@media_dMap_lh_inferiortemporal,$media_dMap_lh_inferiortemporal);
push(@media_dMap_lh_isthmuscingulate,$media_dMap_lh_isthmuscingulate);
push(@media_dMap_lh_lateraloccipital,$media_dMap_lh_lateraloccipital);
push(@media_dMap_lh_lateralorbitofrontal,$media_dMap_lh_lateralorbitofrontal);
push(@media_dMap_lh_lingual,$media_dMap_lh_lingual);
push(@media_dMap_lh_medialorbitofrontal,$media_dMap_lh_medialorbitofrontal);
push(@media_dMap_lh_middletemporal,$media_dMap_lh_middletemporal);
push(@media_dMap_lh_parahippocampal,$media_dMap_lh_parahippocampal);
push(@media_dMap_lh_paracentral,$media_dMap_lh_paracentral);
push(@media_dMap_lh_parsopercularis,$media_dMap_lh_parsopercularis);
push(@media_dMap_lh_parsorbitalis,$media_dMap_lh_parsorbitalis);
push(@media_dMap_lh_parstriangularis,$media_dMap_lh_parstriangularis);
push(@media_dMap_lh_pericalcarine,$media_dMap_lh_pericalcarine);
push(@media_dMap_lh_postcentral,$media_dMap_lh_postcentral);
push(@media_dMap_lh_posteriorcingulate,$media_dMap_lh_posteriorcingulate);
push(@media_dMap_lh_precentral,$media_dMap_lh_precentral);
push(@media_dMap_lh_precuneus,$media_dMap_lh_precuneus);
push(@media_dMap_lh_rostralanteriorcingulate,$media_dMap_lh_rostralanteriorcingulate);
push(@media_dMap_lh_rostralmiddlefrontal,$media_dMap_lh_rostralmiddlefrontal);
push(@media_dMap_lh_superiorfrontal,$media_dMap_lh_superiorfrontal);
push(@media_dMap_lh_superiorparietal,$media_dMap_lh_superiorparietal);
push(@media_dMap_lh_superiortemporal,$media_dMap_lh_superiortemporal);
push(@media_dMap_lh_supramarginal,$media_dMap_lh_supramarginal);
push(@media_dMap_lh_frontalpole,$media_dMap_lh_frontalpole);
push(@media_dMap_lh_temporalpole,$media_dMap_lh_temporalpole);
push(@media_dMap_lh_transversetemporal,$media_dMap_lh_transversetemporal);
push(@media_dMap_lh_insula,$media_dMap_lh_insula);

push(@media_dMap_rh_caudalanteriorcingulate,$media_dMap_rh_caudalanteriorcingulate);
push(@media_dMap_rh_caudalmiddlefrontal,$media_dMap_rh_caudalmiddlefrontal);
push(@media_dMap_rh_cuneus ,$media_dMap_rh_cuneus);
push(@media_dMap_rh_entorhinal,$media_dMap_rh_entorhinal);
push(@media_dMap_rh_fusiform,$media_dMap_rh_fusiform);
push(@media_dMap_rh_inferiorparietal,$media_dMap_rh_inferiorparietal);
push(@media_dMap_rh_inferiortemporal,$media_dMap_rh_inferiortemporal);
push(@media_dMap_rh_isthmuscingulate,$media_dMap_rh_isthmuscingulate);
push(@media_dMap_rh_lateraloccipital,$media_dMap_rh_lateraloccipital);
push(@media_dMap_rh_lateralorbitofrontal,$media_dMap_rh_lateralorbitofrontal);
push(@media_dMap_rh_lingual,$media_dMap_rh_lingual);
push(@media_dMap_rh_medialorbitofrontal,$media_dMap_rh_medialorbitofrontal);
push(@media_dMap_rh_middletemporal,$media_dMap_rh_middletemporal);
push(@media_dMap_rh_parahippocampal,$media_dMap_rh_parahippocampal);
push(@media_dMap_rh_paracentral,$media_dMap_rh_paracentral);
push(@media_dMap_rh_parsopercularis,$media_dMap_rh_parsopercularis);
push(@media_dMap_rh_parsorbitalis,$media_dMap_rh_parsorbitalis);
push(@media_dMap_rh_parstriangularis,$media_dMap_rh_parstriangularis);
push(@media_dMap_rh_pericalcarine,$media_dMap_rh_pericalcarine);
push(@media_dMap_rh_postcentral,$media_dMap_rh_postcentral);
push(@media_dMap_rh_posteriorcingulate,$media_dMap_rh_posteriorcingulate);
push(@media_dMap_rh_precentral,$media_dMap_rh_precentral);
push(@media_dMap_rh_precuneus,$media_dMap_rh_precuneus);
push(@media_dMap_rh_rostralanteriorcingulate,$media_dMap_rh_rostralanteriorcingulate);
push(@media_dMap_rh_rostralmiddlefrontal,$media_dMap_rh_rostralmiddlefrontal);
push(@media_dMap_rh_superiorfrontal,$media_dMap_rh_superiorfrontal);
push(@media_dMap_rh_superiorparietal,$media_dMap_rh_superiorparietal);
push(@media_dMap_rh_superiortemporal,$media_dMap_rh_superiortemporal);
push(@media_dMap_rh_supramarginal,$media_dMap_rh_supramarginal);
push(@media_dMap_rh_frontalpole,$media_dMap_rh_frontalpole);
push(@media_dMap_rh_temporalpole,$media_dMap_rh_temporalpole);
push(@media_dMap_rh_transversetemporal,$media_dMap_rh_transversetemporal);
push(@media_dMap_rh_insula,$media_dMap_rh_insula);
###########################################################################
  print"\n\n Getting parallel diffusivity data...\n\n";
 #Dparalelo
 $sh->res(" ".$aparc_aseg." ".$PrimNome."_Dpara ");

$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-caudalmiddlefrontal 1003
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_caudalmiddlefrontal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-cuneus 1005 
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_cuneus  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-entorhinal 1006
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_entorhinal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-fusiform 1007
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_fusiform   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiorparietal 1008
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_inferiorparietal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiortemporal 1009
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_inferiortemporal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-isthmuscingulate 1010
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_isthmuscingulate  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateraloccipital 1011
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateralorbitofrontal 1012
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lingual 1013
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-medialorbitofrontal 1014
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-middletemporal 1015
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parahippocampal 1016
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-paracentral 1017
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsopercularis 1018
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsorbitalis 1019
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_parsorbitalis  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parstriangularis 1020 
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-pericalcarine 1021
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-postcentral 1022
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-posteriorcingulate 1023
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precentral 1024
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precuneus 1025
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralanteriorcingulate 1026
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralmiddlefrontal 1027
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorfrontal 1028 
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorparietal 1029   
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#lh-superiortemporal 1030    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-supramarginal 1031    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-frontalpole 1032    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-temporalpole 1033    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-transversetemporal 1034    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-insula 1035  
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalanteriorcingulate  2002    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalmiddlefrontal 2003 
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-cuneus 2005   
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

 #rh-entorhinal 2006   
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-fusiform 2007    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-inferiorparietal 2008 
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-inferiortemporal 2009    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-isthmuscingulate 2010    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateraloccipital 2011    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateralorbitofrontal 2012    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lingual 2013    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-medialorbitofrontal 2014    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-middletemporal 2015    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parahippocampal 2016    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-paracentral 2017
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsopercularis 2018    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsorbitalis 2019    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parstriangularis 2020    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-pericalcarine 2021 
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-postcentral 2022
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-posteriorcingulate 2023
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precentral 2024    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precuneus 2025    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralanteriorcingulate 2026 
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralmiddlefrontal 2027    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorfrontal 2028    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorparietal 2029  
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-superiortemporal 2030
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-supramarginal 2031    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-frontalpole 2032    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

#rh-temporalpole 2033    
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-transversetemporal 2034   
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-insula 2035   
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 $sh->rm($aparc_aseg."_res.mnc.gz"); 

 #Montando os arrays para Dpara
push(@media_Dpara_lh_caudalanteriorcingulate,$media_Dpara_lh_caudalanteriorcingulate);
push(@media_Dpara_lh_caudalmiddlefrontal,$media_Dpara_lh_caudalmiddlefrontal);
push(@media_Dpara_lh_cuneus ,$media_Dpara_lh_cuneus);
push(@media_Dpara_lh_entorhinal,$media_Dpara_lh_entorhinal);
push(@media_Dpara_lh_fusiform,$media_Dpara_lh_fusiform);
push(@media_Dpara_lh_inferiorparietal,$media_Dpara_lh_inferiorparietal);
push(@media_Dpara_lh_inferiortemporal,$media_Dpara_lh_inferiortemporal);
push(@media_Dpara_lh_isthmuscingulate,$media_Dpara_lh_isthmuscingulate);
push(@media_Dpara_lh_lateraloccipital,$media_Dpara_lh_lateraloccipital);
push(@media_Dpara_lh_lateralorbitofrontal,$media_Dpara_lh_lateralorbitofrontal);
push(@media_Dpara_lh_lingual,$media_Dpara_lh_lingual);
push(@media_Dpara_lh_medialorbitofrontal,$media_Dpara_lh_medialorbitofrontal);
push(@media_Dpara_lh_middletemporal,$media_Dpara_lh_middletemporal);
push(@media_Dpara_lh_parahippocampal,$media_Dpara_lh_parahippocampal);
push(@media_Dpara_lh_paracentral,$media_Dpara_lh_paracentral);
push(@media_Dpara_lh_parsopercularis,$media_Dpara_lh_parsopercularis);
push(@media_Dpara_lh_parsorbitalis,$media_Dpara_lh_parsorbitalis);
push(@media_Dpara_lh_parstriangularis,$media_Dpara_lh_parstriangularis);
push(@media_Dpara_lh_pericalcarine,$media_Dpara_lh_pericalcarine);
push(@media_Dpara_lh_postcentral,$media_Dpara_lh_postcentral);
push(@media_Dpara_lh_posteriorcingulate,$media_Dpara_lh_posteriorcingulate);
push(@media_Dpara_lh_precentral,$media_Dpara_lh_precentral);
push(@media_Dpara_lh_precuneus,$media_Dpara_lh_precuneus);
push(@media_Dpara_lh_rostralanteriorcingulate,$media_Dpara_lh_rostralanteriorcingulate);
push(@media_Dpara_lh_rostralmiddlefrontal,$media_Dpara_lh_rostralmiddlefrontal);
push(@media_Dpara_lh_superiorfrontal,$media_Dpara_lh_superiorfrontal);
push(@media_Dpara_lh_superiorparietal,$media_Dpara_lh_superiorparietal);
push(@media_Dpara_lh_superiortemporal,$media_Dpara_lh_superiortemporal);
push(@media_Dpara_lh_supramarginal,$media_Dpara_lh_supramarginal);
push(@media_Dpara_lh_frontalpole,$media_Dpara_lh_frontalpole);
push(@media_Dpara_lh_temporalpole,$media_Dpara_lh_temporalpole);
push(@media_Dpara_lh_transversetemporal,$media_Dpara_lh_transversetemporal);
push(@media_Dpara_lh_insula,$media_Dpara_lh_insula);

push(@media_Dpara_rh_caudalanteriorcingulate,$media_Dpara_rh_caudalanteriorcingulate);
push(@media_Dpara_rh_caudalmiddlefrontal,$media_Dpara_rh_caudalmiddlefrontal);
push(@media_Dpara_rh_cuneus ,$media_Dpara_rh_cuneus);
push(@media_Dpara_rh_entorhinal,$media_Dpara_rh_entorhinal);
push(@media_Dpara_rh_fusiform,$media_Dpara_rh_fusiform);
push(@media_Dpara_rh_inferiorparietal,$media_Dpara_rh_inferiorparietal);
push(@media_Dpara_rh_inferiortemporal,$media_Dpara_rh_inferiortemporal);
push(@media_Dpara_rh_isthmuscingulate,$media_Dpara_rh_isthmuscingulate);
push(@media_Dpara_rh_lateraloccipital,$media_Dpara_rh_lateraloccipital);
push(@media_Dpara_rh_lateralorbitofrontal,$media_Dpara_rh_lateralorbitofrontal);
push(@media_Dpara_rh_lingual,$media_Dpara_rh_lingual);
push(@media_Dpara_rh_medialorbitofrontal,$media_Dpara_rh_medialorbitofrontal);
push(@media_Dpara_rh_middletemporal,$media_Dpara_rh_middletemporal);
push(@media_Dpara_rh_parahippocampal,$media_Dpara_rh_parahippocampal);
push(@media_Dpara_rh_paracentral,$media_Dpara_rh_paracentral);
push(@media_Dpara_rh_parsopercularis,$media_Dpara_rh_parsopercularis);
push(@media_Dpara_rh_parsorbitalis,$media_Dpara_rh_parsorbitalis);
push(@media_Dpara_rh_parstriangularis,$media_Dpara_rh_parstriangularis);
push(@media_Dpara_rh_pericalcarine,$media_Dpara_rh_pericalcarine);
push(@media_Dpara_rh_postcentral,$media_Dpara_rh_postcentral);
push(@media_Dpara_rh_posteriorcingulate,$media_Dpara_rh_posteriorcingulate);
push(@media_Dpara_rh_precentral,$media_Dpara_rh_precentral);
push(@media_Dpara_rh_precuneus,$media_Dpara_rh_precuneus);
push(@media_Dpara_rh_rostralanteriorcingulate,$media_Dpara_rh_rostralanteriorcingulate);
push(@media_Dpara_rh_rostralmiddlefrontal,$media_Dpara_rh_rostralmiddlefrontal);
push(@media_Dpara_rh_superiorfrontal,$media_Dpara_rh_superiorfrontal);
push(@media_Dpara_rh_superiorparietal,$media_Dpara_rh_superiorparietal);
push(@media_Dpara_rh_superiortemporal,$media_Dpara_rh_superiortemporal);
push(@media_Dpara_rh_supramarginal,$media_Dpara_rh_supramarginal);
push(@media_Dpara_rh_frontalpole,$media_Dpara_rh_frontalpole);
push(@media_Dpara_rh_temporalpole,$media_Dpara_rh_temporalpole);
push(@media_Dpara_rh_transversetemporal,$media_Dpara_rh_transversetemporal);
push(@media_Dpara_rh_insula,$media_Dpara_rh_insula);

###########################################################################
 print"\n\n Getting perpendicular diffusivity data...\n\n";
 #Dperpendicular
 $sh->res(" ".$aparc_aseg." ".$PrimNome."_Dperp ");

$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-caudalmiddlefrontal 1003
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_caudalmiddlefrontal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-cuneus 1005 
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_cuneus  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-entorhinal 1006
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_entorhinal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-fusiform 1007
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_fusiform   = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiorparietal 1008
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_inferiorparietal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-inferiortemporal 1009
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_inferiortemporal  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-isthmuscingulate 1010
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_isthmuscingulate  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateraloccipital 1011
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lateralorbitofrontal 1012
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-lingual 1013
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-medialorbitofrontal 1014
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-middletemporal 1015
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parahippocampal 1016
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-paracentral 1017
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsopercularis 1018
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parsorbitalis 1019
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_parsorbitalis  = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-parstriangularis 1020 
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-pericalcarine 1021
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-postcentral 1022
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-posteriorcingulate 1023
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precentral 1024
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-precuneus 1025
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralanteriorcingulate 1026
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-rostralmiddlefrontal 1027
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorfrontal 1028 
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-superiorparietal 1029   
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#lh-superiortemporal 1030    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-supramarginal 1031    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-frontalpole 1032    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-temporalpole 1033    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-transversetemporal 1034    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#lh-insula 1035  
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 1035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalanteriorcingulate  2002    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-caudalmiddlefrontal 2003 
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-cuneus 2005   
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

 #rh-entorhinal 2006   
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-fusiform 2007    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-inferiorparietal 2008 
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-inferiortemporal 2009    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-isthmuscingulate 2010    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateraloccipital 2011    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lateralorbitofrontal 2012    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-lingual 2013    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-medialorbitofrontal 2014    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-middletemporal 2015    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parahippocampal 2016    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-paracentral 2017
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsopercularis 2018    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parsorbitalis 2019    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-parstriangularis 2020    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-pericalcarine 2021 
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-postcentral 2022
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-posteriorcingulate 2023
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precentral 2024    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-precuneus 2025    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralanteriorcingulate 2026 
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-rostralmiddlefrontal 2027    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorfrontal 2028    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#rh-superiorparietal 2029  
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-superiortemporal 2030
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-supramarginal 2031    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-frontalpole 2032    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 

#rh-temporalpole 2033    
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 
#rh-transversetemporal 2034   
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");  
 
#rh-insula 2035   
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$aparc_aseg."_res.mnc.gz -mask_binvalue 2035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt"); 
 $sh->rm($aparc_aseg."_res.mnc.gz"); 

 #Montando os arrays para Dpara
push(@media_Dperp_lh_caudalanteriorcingulate,$media_Dperp_lh_caudalanteriorcingulate);
push(@media_Dperp_lh_caudalmiddlefrontal,$media_Dperp_lh_caudalmiddlefrontal);
push(@media_Dperp_lh_cuneus ,$media_Dperp_lh_cuneus);
push(@media_Dperp_lh_entorhinal,$media_Dperp_lh_entorhinal);
push(@media_Dperp_lh_fusiform,$media_Dperp_lh_fusiform);
push(@media_Dperp_lh_inferiorparietal,$media_Dperp_lh_inferiorparietal);
push(@media_Dperp_lh_inferiortemporal,$media_Dperp_lh_inferiortemporal);
push(@media_Dperp_lh_isthmuscingulate,$media_Dperp_lh_isthmuscingulate);
push(@media_Dperp_lh_lateraloccipital,$media_Dperp_lh_lateraloccipital);
push(@media_Dperp_lh_lateralorbitofrontal,$media_Dperp_lh_lateralorbitofrontal);
push(@media_Dperp_lh_lingual,$media_Dperp_lh_lingual);
push(@media_Dperp_lh_medialorbitofrontal,$media_Dperp_lh_medialorbitofrontal);
push(@media_Dperp_lh_middletemporal,$media_Dperp_lh_middletemporal);
push(@media_Dperp_lh_parahippocampal,$media_Dperp_lh_parahippocampal);
push(@media_Dperp_lh_paracentral,$media_Dperp_lh_paracentral);
push(@media_Dperp_lh_parsopercularis,$media_Dperp_lh_parsopercularis);
push(@media_Dperp_lh_parsorbitalis,$media_Dperp_lh_parsorbitalis);
push(@media_Dperp_lh_parstriangularis,$media_Dperp_lh_parstriangularis);
push(@media_Dperp_lh_pericalcarine,$media_Dperp_lh_pericalcarine);
push(@media_Dperp_lh_postcentral,$media_Dperp_lh_postcentral);
push(@media_Dperp_lh_posteriorcingulate,$media_Dperp_lh_posteriorcingulate);
push(@media_Dperp_lh_precentral,$media_Dperp_lh_precentral);
push(@media_Dperp_lh_precuneus,$media_Dperp_lh_precuneus);
push(@media_Dperp_lh_rostralanteriorcingulate,$media_Dperp_lh_rostralanteriorcingulate);
push(@media_Dperp_lh_rostralmiddlefrontal,$media_Dperp_lh_rostralmiddlefrontal);
push(@media_Dperp_lh_superiorfrontal,$media_Dperp_lh_superiorfrontal);
push(@media_Dperp_lh_superiorparietal,$media_Dperp_lh_superiorparietal);
push(@media_Dperp_lh_superiortemporal,$media_Dperp_lh_superiortemporal);
push(@media_Dperp_lh_supramarginal,$media_Dperp_lh_supramarginal);
push(@media_Dperp_lh_frontalpole,$media_Dperp_lh_frontalpole);
push(@media_Dperp_lh_temporalpole,$media_Dperp_lh_temporalpole);
push(@media_Dperp_lh_transversetemporal,$media_Dperp_lh_transversetemporal);
push(@media_Dperp_lh_insula,$media_Dperp_lh_insula);

push(@media_Dperp_rh_caudalanteriorcingulate,$media_Dperp_rh_caudalanteriorcingulate);
push(@media_Dperp_rh_caudalmiddlefrontal,$media_Dperp_rh_caudalmiddlefrontal);
push(@media_Dperp_rh_cuneus ,$media_Dperp_rh_cuneus);
push(@media_Dperp_rh_entorhinal,$media_Dperp_rh_entorhinal);
push(@media_Dperp_rh_fusiform,$media_Dperp_rh_fusiform);
push(@media_Dperp_rh_inferiorparietal,$media_Dperp_rh_inferiorparietal);
push(@media_Dperp_rh_inferiortemporal,$media_Dperp_rh_inferiortemporal);
push(@media_Dperp_rh_isthmuscingulate,$media_Dperp_rh_isthmuscingulate);
push(@media_Dperp_rh_lateraloccipital,$media_Dperp_rh_lateraloccipital);
push(@media_Dperp_rh_lateralorbitofrontal,$media_Dperp_rh_lateralorbitofrontal);
push(@media_Dperp_rh_lingual,$media_Dperp_rh_lingual);
push(@media_Dperp_rh_medialorbitofrontal,$media_Dperp_rh_medialorbitofrontal);
push(@media_Dperp_rh_middletemporal,$media_Dperp_rh_middletemporal);
push(@media_Dperp_rh_parahippocampal,$media_Dperp_rh_parahippocampal);
push(@media_Dperp_rh_paracentral,$media_Dperp_rh_paracentral);
push(@media_Dperp_rh_parsopercularis,$media_Dperp_rh_parsopercularis);
push(@media_Dperp_rh_parsorbitalis,$media_Dperp_rh_parsorbitalis);
push(@media_Dperp_rh_parstriangularis,$media_Dperp_rh_parstriangularis);
push(@media_Dperp_rh_pericalcarine,$media_Dperp_rh_pericalcarine);
push(@media_Dperp_rh_postcentral,$media_Dperp_rh_postcentral);
push(@media_Dperp_rh_posteriorcingulate,$media_Dperp_rh_posteriorcingulate);
push(@media_Dperp_rh_precentral,$media_Dperp_rh_precentral);
push(@media_Dperp_rh_precuneus,$media_Dperp_rh_precuneus);
push(@media_Dperp_rh_rostralanteriorcingulate,$media_Dperp_rh_rostralanteriorcingulate);
push(@media_Dperp_rh_rostralmiddlefrontal,$media_Dperp_rh_rostralmiddlefrontal);
push(@media_Dperp_rh_superiorfrontal,$media_Dperp_rh_superiorfrontal);
push(@media_Dperp_rh_superiorparietal,$media_Dperp_rh_superiorparietal);
push(@media_Dperp_rh_superiortemporal,$media_Dperp_rh_superiortemporal);
push(@media_Dperp_rh_supramarginal,$media_Dperp_rh_supramarginal);
push(@media_Dperp_rh_frontalpole,$media_Dperp_rh_frontalpole);
push(@media_Dperp_rh_temporalpole,$media_Dperp_rh_temporalpole);
push(@media_Dperp_rh_transversetemporal,$media_Dperp_rh_transversetemporal);
push(@media_Dperp_rh_insula,$media_Dperp_rh_insula);
}
if($option == 3 || $option == 0)	 #white matter parts
{
	@wmparc1 = glob("./*_wmparc.mnc.gz");
	$arquivo = $wmparc1[0];
	$Start = index($arquivo,"./") + 2;
	$Stop = index($arquivo,".mnc")-2;
	$wmparc = substr($arquivo,$Start,$Stop);
	
######Relaxometry
print"\n\n Getting White Matter regions values...\n\n";
print"\n\n Getting Relaxometry data...\n\n";
#####################################################################
 #Relaxometria
$sh->res(" ".$wmparc." ".$PrimNome."_relaxo ");

#	3002	wm_lh_caudalanteriorcingulate
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3003	wm_lh_caudalmiddlefrontal
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3004	wm_lh_corpuscallosum
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3005	wm_lh_cuneus
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3006	wm_lh_entorhinal
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3007	wm_lh_fusiform
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3008	wm_lh_inferiorparietal
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3009	wm_lh_inferiortemporal
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3010	wm_lh_isthmuscingulate
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3011	wm_lh_lateraloccipital
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3012	wm_lh_lateralorbitofrontal
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3013	wm_lh_lingual
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3014	wm_lh_medialorbitofrontal
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3015	wm_lh_middletemporal
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3016	wm_lh_parahippocampal
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3017	wm_lh_paracentral
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3018	wm_lh_parsopercularis
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3019	wm_lh_parsorbitalis
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3020	wm_lh_parstriangularis
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3021	wm_lh_pericalcarine
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3022	wm_lh_postcentral
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3023	wm_lh_posteriorcingulate
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3024	wm_lh_precentral
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3025	wm_lh_precuneus
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3026	wm_lh_rostralanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3027	wm_lh_rostralmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3028	wm_lh_superiorfrontal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3029	wm_lh_superiorparietal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3030	wm_lh_superiortemporal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3031	wm_lh_supramarginal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3032	wm_lh_frontalpole
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3033	wm_lh_temporalpole
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3034	wm_lh_transversetemporal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3035	wm_lh_insula
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4002	wm_rh_caudalanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4003	wm_rh_caudalmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4004	wm_rh_corpuscallosum
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4005	wm_rh_cuneus
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4006	wm_rh_entorhinal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4007	wm_rh_fusiform
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4008	wm_rh_inferiorparietal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4009	wm_rh_inferiortemporal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_inferiortemporal= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4010	wm_rh_isthmuscingulate
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_isthmuscingulate= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4011	wm_rh_lateraloccipital
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4012	wm_rh_lateralorbitofrontal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4013	wm_rh_lingual
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4014	wm_rh_medialorbitofrontal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4015	wm_rh_middletemporal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4016	wm_rh_parahippocampal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4017	wm_rh_paracentral
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4018	wm_rh_parsopercularis
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4019	wm_rh_parsorbitalis
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4020	wm_rh_parstriangularis
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4021	wm_rh_pericalcarine
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4022	wm_rh_postcentral
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4023	wm_rh_posteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4024	wm_rh_precentral
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4025	wm_rh_precuneus
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4026	wm_rh_rostralanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4027	wm_rh_rostralmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4028	wm_rh_superiorfrontal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4029	wm_rh_superiorparietal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4030	wm_rh_superiortemporal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4031	wm_rh_supramarginal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4032	wm_rh_frontalpole
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4033	wm_rh_temporalpole
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4034	wm_rh_transversetemporal
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4035	wm_rh_insula
$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_wm_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($wmparc."_res.mnc.gz"); 
 
 #Montando o array
 push(@media_relaxo_wm_lh_caudalanteriorcingulate,$media_relaxo_wm_lh_caudalanteriorcingulate);
 push(@media_relaxo_wm_lh_caudalmiddlefrontal,$media_relaxo_wm_lh_caudalmiddlefrontal);
 push(@media_relaxo_wm_lh_corpuscallosum,$media_relaxo_wm_lh_corpuscallosum);
 push(@media_relaxo_wm_lh_cuneus,$media_relaxo_wm_lh_cuneus);
 push(@media_relaxo_wm_lh_entorhinal,$media_relaxo_wm_lh_entorhinal);
 push(@media_relaxo_wm_lh_fusiform,$media_relaxo_wm_lh_fusiform);
 push(@media_relaxo_wm_lh_inferiorparietal,$media_relaxo_wm_lh_inferiorparietal);
 push(@media_relaxo_wm_lh_inferiortemporal,$media_relaxo_wm_lh_inferiortemporal);
 push(@media_relaxo_wm_lh_isthmuscingulate,$media_relaxo_wm_lh_isthmuscingulate);
 push(@media_relaxo_wm_lh_lateraloccipital,$media_relaxo_wm_lh_lateraloccipital);
 push(@media_relaxo_wm_lh_lateralorbitofrontal,$media_relaxo_wm_lh_lateralorbitofrontal);
 push(@media_relaxo_wm_lh_lingual,$media_relaxo_wm_lh_lingual);
 push(@media_relaxo_wm_lh_medialorbitofrontal,$media_relaxo_wm_lh_medialorbitofrontal);
 push(@media_relaxo_wm_lh_middletemporal,$media_relaxo_wm_lh_middletemporal);
 push(@media_relaxo_wm_lh_parahippocampal,$media_relaxo_wm_lh_parahippocampal);
 push(@media_relaxo_wm_lh_paracentral,$media_relaxo_wm_lh_paracentral);
 push(@media_relaxo_wm_lh_parsopercularis,$media_relaxo_wm_lh_parsopercularis);
 push(@media_relaxo_wm_lh_parsorbitalis,$media_relaxo_wm_lh_parsorbitalis);
 push(@media_relaxo_wm_lh_parstriangularis,$media_relaxo_wm_lh_parstriangularis);
 push(@media_relaxo_wm_lh_pericalcarine,$media_relaxo_wm_lh_pericalcarine);
 push(@media_relaxo_wm_lh_postcentral,$media_relaxo_wm_lh_postcentral);
 push(@media_relaxo_wm_lh_posteriorcingulate,$media_relaxo_wm_lh_posteriorcingulate);
 push(@media_relaxo_wm_lh_precentral,$media_relaxo_wm_lh_precentral);
 push(@media_relaxo_wm_lh_precuneus,$media_relaxo_wm_lh_precuneus);
 push(@media_relaxo_wm_lh_rostralanteriorcingulate,$media_relaxo_wm_lh_rostralanteriorcingulate);
 push(@media_relaxo_wm_lh_rostralmiddlefrontal,$media_relaxo_wm_lh_rostralmiddlefrontal);
 push(@media_relaxo_wm_lh_superiorfrontal,$media_relaxo_wm_lh_superiorfrontal);
 push(@media_relaxo_wm_lh_superiorparietal,$media_relaxo_wm_lh_superiorparietal);
 push(@media_relaxo_wm_lh_superiortemporal,$media_relaxo_wm_lh_superiortemporal);
 push(@media_relaxo_wm_lh_supramarginal,$media_relaxo_wm_lh_supramarginal);
 push(@media_relaxo_wm_lh_frontalpole,$media_relaxo_wm_lh_frontalpole);
 push(@media_relaxo_wm_lh_temporalpole,$media_relaxo_wm_lh_temporalpole);
 push(@media_relaxo_wm_lh_transversetemporal,$media_relaxo_wm_lh_transversetemporal);
 push(@media_relaxo_wm_lh_insula,$media_relaxo_wm_lh_insula);
 
 push(@media_relaxo_wm_rh_caudalanteriorcingulate,$media_relaxo_wm_rh_caudalanteriorcingulate);
 push(@media_relaxo_wm_rh_caudalmiddlefrontal,$media_relaxo_wm_rh_caudalmiddlefrontal);
 push(@media_relaxo_wm_rh_corpuscallosum,$media_relaxo_wm_rh_corpuscallosum);
 push(@media_relaxo_wm_rh_cuneus,$media_relaxo_wm_rh_cuneus);
 push(@media_relaxo_wm_rh_entorhinal,$media_relaxo_wm_rh_entorhinal);
 push(@media_relaxo_wm_rh_fusiform,$media_relaxo_wm_rh_fusiform);
 push(@media_relaxo_wm_rh_inferiorparietal,$media_relaxo_wm_rh_inferiorparietal);
 push(@media_relaxo_wm_rh_inferiortemporal,$media_relaxo_wm_rh_inferiortemporal);
 push(@media_relaxo_wm_rh_isthmuscingulate,$media_relaxo_wm_rh_isthmuscingulate);
 push(@media_relaxo_wm_rh_lateraloccipital,$media_relaxo_wm_rh_lateraloccipital);
 push(@media_relaxo_wm_rh_lateralorbitofrontal,$media_relaxo_wm_rh_lateralorbitofrontal);
 push(@media_relaxo_wm_rh_lingual,$media_relaxo_wm_rh_lingual);
 push(@media_relaxo_wm_rh_medialorbitofrontal,$media_relaxo_wm_rh_medialorbitofrontal);
 push(@media_relaxo_wm_rh_middletemporal,$media_relaxo_wm_rh_middletemporal);
 push(@media_relaxo_wm_rh_parahippocampal,$media_relaxo_wm_rh_parahippocampal);
 push(@media_relaxo_wm_rh_paracentral,$media_relaxo_wm_rh_paracentral);
 push(@media_relaxo_wm_rh_parsopercularis,$media_relaxo_wm_rh_parsopercularis);
 push(@media_relaxo_wm_rh_parsorbitalis,$media_relaxo_wm_rh_parsorbitalis);
 push(@media_relaxo_wm_rh_parstriangularis,$media_relaxo_wm_rh_parstriangularis);
 push(@media_relaxo_wm_rh_pericalcarine,$media_relaxo_wm_rh_pericalcarine);
 push(@media_relaxo_wm_rh_postcentral,$media_relaxo_wm_rh_postcentral);
 push(@media_relaxo_wm_rh_posteriorcingulate,$media_relaxo_wm_rh_posteriorcingulate);
 push(@media_relaxo_wm_rh_precentral,$media_relaxo_wm_rh_precentral);
 push(@media_relaxo_wm_rh_precuneus,$media_relaxo_wm_rh_precuneus);
 push(@media_relaxo_wm_rh_rostralanteriorcingulate,$media_relaxo_wm_rh_rostralanteriorcingulate);
 push(@media_relaxo_wm_rh_rostralmiddlefrontal,$media_relaxo_wm_rh_rostralmiddlefrontal);
 push(@media_relaxo_wm_rh_superiorfrontal,$media_relaxo_wm_rh_superiorfrontal);
 push(@media_relaxo_wm_rh_superiorparietal,$media_relaxo_wm_rh_superiorparietal);
 push(@media_relaxo_wm_rh_superiortemporal,$media_relaxo_wm_rh_superiortemporal);
 push(@media_relaxo_wm_rh_supramarginal,$media_relaxo_wm_rh_supramarginal);
 push(@media_relaxo_wm_rh_frontalpole,$media_relaxo_wm_rh_frontalpole);
 push(@media_relaxo_wm_rh_temporalpole,$media_relaxo_wm_rh_temporalpole);
 push(@media_relaxo_wm_rh_transversetemporal,$media_relaxo_wm_rh_transversetemporal);
 push(@media_relaxo_wm_rh_insula,$media_relaxo_wm_rh_insula);
 
####################################################################
######MTR
print"\n\n Getting MTR data...\n\n";
 #MT
 $sh->res(" ".$wmparc." ".$PrimNome."_".$ano.$mes.$dia."_mt");
 
#	3002	wm_lh_caudalanteriorcingulate
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3003	wm_lh_caudalmiddlefrontal
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3004	wm_lh_corpuscallosum
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3005	wm_lh_cuneus
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3006	wm_lh_entorhinal
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3007	wm_lh_fusiform
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3008	wm_lh_inferiorparietal
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3009	wm_lh_inferiortemporal
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3010	wm_lh_isthmuscingulate
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3011	wm_lh_lateraloccipital
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3012	wm_lh_lateralorbitofrontal
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3013	wm_lh_lingual
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3014	wm_lh_medialorbitofrontal
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3015	wm_lh_middletemporal
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3016	wm_lh_parahippocampal
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3017	wm_lh_paracentral
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3018	wm_lh_parsopercularis
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3019	wm_lh_parsorbitalis
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3020	wm_lh_parstriangularis
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3021	wm_lh_pericalcarine
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3022	wm_lh_postcentral
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3023	wm_lh_posteriorcingulate
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3024	wm_lh_precentral
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3025	wm_lh_precuneus
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3026	wm_lh_rostralanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3027	wm_lh_rostralmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3028	wm_lh_superiorfrontal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3029	wm_lh_superiorparietal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3030	wm_lh_superiortemporal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3031	wm_lh_supramarginal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3032	wm_lh_frontalpole
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3033	wm_lh_temporalpole
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3034	wm_lh_transversetemporal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3035	wm_lh_insula
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4002	wm_rh_caudalanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4003	wm_rh_caudalmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4004	wm_rh_corpuscallosum
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4005	wm_rh_cuneus
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4006	wm_rh_entorhinal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4007	wm_rh_fusiform
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4008	wm_rh_inferiorparietal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4009	wm_rh_inferiortemporal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_inferiortemporal= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4010	wm_rh_isthmuscingulate
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_isthmuscingulate= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4011	wm_rh_lateraloccipital
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4012	wm_rh_lateralorbitofrontal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4013	wm_rh_lingual
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4014	wm_rh_medialorbitofrontal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4015	wm_rh_middletemporal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4016	wm_rh_parahippocampal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4017	wm_rh_paracentral
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4018	wm_rh_parsopercularis
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4019	wm_rh_parsorbitalis
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4020	wm_rh_parstriangularis
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4021	wm_rh_pericalcarine
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4022	wm_rh_postcentral
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4023	wm_rh_posteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4024	wm_rh_precentral
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4025	wm_rh_precuneus
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4026	wm_rh_rostralanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4027	wm_rh_rostralmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4028	wm_rh_superiorfrontal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4029	wm_rh_superiorparietal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4030	wm_rh_superiortemporal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4031	wm_rh_supramarginal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4032	wm_rh_frontalpole
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4033	wm_rh_temporalpole
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4034	wm_rh_transversetemporal
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4035	wm_rh_insula
$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_MT_wm_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($wmparc."_res.mnc.gz"); 
 
 #Montando o array
 push(@media_MT_wm_lh_caudalanteriorcingulate,$media_MT_wm_lh_caudalanteriorcingulate);
 push(@media_MT_wm_lh_caudalmiddlefrontal,$media_MT_wm_lh_caudalmiddlefrontal);
 push(@media_MT_wm_lh_corpuscallosum,$media_MT_wm_lh_corpuscallosum);
 push(@media_MT_wm_lh_cuneus,$media_MT_wm_lh_cuneus);
 push(@media_MT_wm_lh_entorhinal,$media_MT_wm_lh_entorhinal);
 push(@media_MT_wm_lh_fusiform,$media_MT_wm_lh_fusiform);
 push(@media_MT_wm_lh_inferiorparietal,$media_MT_wm_lh_inferiorparietal);
 push(@media_MT_wm_lh_inferiortemporal,$media_MT_wm_lh_inferiortemporal);
 push(@media_MT_wm_lh_isthmuscingulate,$media_MT_wm_lh_isthmuscingulate);
 push(@media_MT_wm_lh_lateraloccipital,$media_MT_wm_lh_lateraloccipital);
 push(@media_MT_wm_lh_lateralorbitofrontal,$media_MT_wm_lh_lateralorbitofrontal);
 push(@media_MT_wm_lh_lingual,$media_MT_wm_lh_lingual);
 push(@media_MT_wm_lh_medialorbitofrontal,$media_MT_wm_lh_medialorbitofrontal);
 push(@media_MT_wm_lh_middletemporal,$media_MT_wm_lh_middletemporal);
 push(@media_MT_wm_lh_parahippocampal,$media_MT_wm_lh_parahippocampal);
 push(@media_MT_wm_lh_paracentral,$media_MT_wm_lh_paracentral);
 push(@media_MT_wm_lh_parsopercularis,$media_MT_wm_lh_parsopercularis);
 push(@media_MT_wm_lh_parsorbitalis,$media_MT_wm_lh_parsorbitalis);
 push(@media_MT_wm_lh_parstriangularis,$media_MT_wm_lh_parstriangularis);
 push(@media_MT_wm_lh_pericalcarine,$media_MT_wm_lh_pericalcarine);
 push(@media_MT_wm_lh_postcentral,$media_MT_wm_lh_postcentral);
 push(@media_MT_wm_lh_posteriorcingulate,$media_MT_wm_lh_posteriorcingulate);
 push(@media_MT_wm_lh_precentral,$media_MT_wm_lh_precentral);
 push(@media_MT_wm_lh_precuneus,$media_MT_wm_lh_precuneus);
 push(@media_MT_wm_lh_rostralanteriorcingulate,$media_MT_wm_lh_rostralanteriorcingulate);
 push(@media_MT_wm_lh_rostralmiddlefrontal,$media_MT_wm_lh_rostralmiddlefrontal);
 push(@media_MT_wm_lh_superiorfrontal,$media_MT_wm_lh_superiorfrontal);
 push(@media_MT_wm_lh_superiorparietal,$media_MT_wm_lh_superiorparietal);
 push(@media_MT_wm_lh_superiortemporal,$media_MT_wm_lh_superiortemporal);
 push(@media_MT_wm_lh_supramarginal,$media_MT_wm_lh_supramarginal);
 push(@media_MT_wm_lh_frontalpole,$media_MT_wm_lh_frontalpole);
 push(@media_MT_wm_lh_temporalpole,$media_MT_wm_lh_temporalpole);
 push(@media_MT_wm_lh_transversetemporal,$media_MT_wm_lh_transversetemporal);
 push(@media_MT_wm_lh_insula,$media_MT_wm_lh_insula);
 
 push(@media_MT_wm_rh_caudalanteriorcingulate,$media_MT_wm_rh_caudalanteriorcingulate);
 push(@media_MT_wm_rh_caudalmiddlefrontal,$media_MT_wm_rh_caudalmiddlefrontal);
 push(@media_MT_wm_rh_corpuscallosum,$media_MT_wm_rh_corpuscallosum);
 push(@media_MT_wm_rh_cuneus,$media_MT_wm_rh_cuneus);
 push(@media_MT_wm_rh_entorhinal,$media_MT_wm_rh_entorhinal);
 push(@media_MT_wm_rh_fusiform,$media_MT_wm_rh_fusiform);
 push(@media_MT_wm_rh_inferiorparietal,$media_MT_wm_rh_inferiorparietal);
 push(@media_MT_wm_rh_inferiortemporal,$media_MT_wm_rh_inferiortemporal);
 push(@media_MT_wm_rh_isthmuscingulate,$media_MT_wm_rh_isthmuscingulate);
 push(@media_MT_wm_rh_lateraloccipital,$media_MT_wm_rh_lateraloccipital);
 push(@media_MT_wm_rh_lateralorbitofrontal,$media_MT_wm_rh_lateralorbitofrontal);
 push(@media_MT_wm_rh_lingual,$media_MT_wm_rh_lingual);
 push(@media_MT_wm_rh_medialorbitofrontal,$media_MT_wm_rh_medialorbitofrontal);
 push(@media_MT_wm_rh_middletemporal,$media_MT_wm_rh_middletemporal);
 push(@media_MT_wm_rh_parahippocampal,$media_MT_wm_rh_parahippocampal);
 push(@media_MT_wm_rh_paracentral,$media_MT_wm_rh_paracentral);
 push(@media_MT_wm_rh_parsopercularis,$media_MT_wm_rh_parsopercularis);
 push(@media_MT_wm_rh_parsorbitalis,$media_MT_wm_rh_parsorbitalis);
 push(@media_MT_wm_rh_parstriangularis,$media_MT_wm_rh_parstriangularis);
 push(@media_MT_wm_rh_pericalcarine,$media_MT_wm_rh_pericalcarine);
 push(@media_MT_wm_rh_postcentral,$media_MT_wm_rh_postcentral);
 push(@media_MT_wm_rh_posteriorcingulate,$media_MT_wm_rh_posteriorcingulate);
 push(@media_MT_wm_rh_precentral,$media_MT_wm_rh_precentral);
 push(@media_MT_wm_rh_precuneus,$media_MT_wm_rh_precuneus);
 push(@media_MT_wm_rh_rostralanteriorcingulate,$media_MT_wm_rh_rostralanteriorcingulate);
 push(@media_MT_wm_rh_rostralmiddlefrontal,$media_MT_wm_rh_rostralmiddlefrontal);
 push(@media_MT_wm_rh_superiorfrontal,$media_MT_wm_rh_superiorfrontal);
 push(@media_MT_wm_rh_superiorparietal,$media_MT_wm_rh_superiorparietal);
 push(@media_MT_wm_rh_superiortemporal,$media_MT_wm_rh_superiortemporal);
 push(@media_MT_wm_rh_supramarginal,$media_MT_wm_rh_supramarginal);
 push(@media_MT_wm_rh_frontalpole,$media_MT_wm_rh_frontalpole);
 push(@media_MT_wm_rh_temporalpole,$media_MT_wm_rh_temporalpole);
 push(@media_MT_wm_rh_transversetemporal,$media_MT_wm_rh_transversetemporal);
 push(@media_MT_wm_rh_insula,$media_MT_wm_rh_insula);
 ###########################################################################
 print"\n\n Getting FA data...\n\n";
 #FA
 $sh->res(" ".$wmparc." faMap_normalizada ");
 
 #	3002	wm_lh_caudalanteriorcingulate
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3003	wm_lh_caudalmiddlefrontal
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3004	wm_lh_corpuscallosum
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3005	wm_lh_cuneus
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3006	wm_lh_entorhinal
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3007	wm_lh_fusiform
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3008	wm_lh_inferiorparietal
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3009	wm_lh_inferiortemporal
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3010	wm_lh_isthmuscingulate
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3011	wm_lh_lateraloccipital
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3012	wm_lh_lateralorbitofrontal
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3013	wm_lh_lingual
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3014	wm_lh_medialorbitofrontal
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3015	wm_lh_middletemporal
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3016	wm_lh_parahippocampal
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3017	wm_lh_paracentral
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3018	wm_lh_parsopercularis
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3019	wm_lh_parsorbitalis
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3020	wm_lh_parstriangularis
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3021	wm_lh_pericalcarine
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3022	wm_lh_postcentral
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3023	wm_lh_posteriorcingulate
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3024	wm_lh_precentral
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3025	wm_lh_precuneus
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3026	wm_lh_rostralanteriorcingulate
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3027	wm_lh_rostralmiddlefrontal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3028	wm_lh_superiorfrontal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3029	wm_lh_superiorparietal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3030	wm_lh_superiortemporal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3031	wm_lh_supramarginal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3032	wm_lh_frontalpole
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3033	wm_lh_temporalpole
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3034	wm_lh_transversetemporal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3035	wm_lh_insula
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4002	wm_rh_caudalanteriorcingulate
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4003	wm_rh_caudalmiddlefrontal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4004	wm_rh_corpuscallosum
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4005	wm_rh_cuneus
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4006	wm_rh_entorhinal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4007	wm_rh_fusiform
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4008	wm_rh_inferiorparietal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4009	wm_rh_inferiortemporal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_inferiortemporal= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4010	wm_rh_isthmuscingulate
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_isthmuscingulate= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4011	wm_rh_lateraloccipital
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4012	wm_rh_lateralorbitofrontal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4013	wm_rh_lingual
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4014	wm_rh_medialorbitofrontal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4015	wm_rh_middletemporal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4016	wm_rh_parahippocampal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4017	wm_rh_paracentral
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4018	wm_rh_parsopercularis
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4019	wm_rh_parsorbitalis
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4020	wm_rh_parstriangularis
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4021	wm_rh_pericalcarine
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4022	wm_rh_postcentral
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4023	wm_rh_posteriorcingulate
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4024	wm_rh_precentral
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4025	wm_rh_precuneus
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4026	wm_rh_rostralanteriorcingulate
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4027	wm_rh_rostralmiddlefrontal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4028	wm_rh_superiorfrontal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4029	wm_rh_superiorparietal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4030	wm_rh_superiortemporal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4031	wm_rh_supramarginal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4032	wm_rh_frontalpole
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4033	wm_rh_temporalpole
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4034	wm_rh_transversetemporal
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4035	wm_rh_insula
$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_FA_wm_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($wmparc."_res.mnc.gz"); 
 
 #Montando o array
 push(@media_FA_wm_lh_caudalanteriorcingulate,$media_FA_wm_lh_caudalanteriorcingulate);
 push(@media_FA_wm_lh_caudalmiddlefrontal,$media_FA_wm_lh_caudalmiddlefrontal);
 push(@media_FA_wm_lh_corpuscallosum,$media_FA_wm_lh_corpuscallosum);
 push(@media_FA_wm_lh_cuneus,$media_FA_wm_lh_cuneus);
 push(@media_FA_wm_lh_entorhinal,$media_FA_wm_lh_entorhinal);
 push(@media_FA_wm_lh_fusiform,$media_FA_wm_lh_fusiform);
 push(@media_FA_wm_lh_inferiorparietal,$media_FA_wm_lh_inferiorparietal);
 push(@media_FA_wm_lh_inferiortemporal,$media_FA_wm_lh_inferiortemporal);
 push(@media_FA_wm_lh_isthmuscingulate,$media_FA_wm_lh_isthmuscingulate);
 push(@media_FA_wm_lh_lateraloccipital,$media_FA_wm_lh_lateraloccipital);
 push(@media_FA_wm_lh_lateralorbitofrontal,$media_FA_wm_lh_lateralorbitofrontal);
 push(@media_FA_wm_lh_lingual,$media_FA_wm_lh_lingual);
 push(@media_FA_wm_lh_medialorbitofrontal,$media_FA_wm_lh_medialorbitofrontal);
 push(@media_FA_wm_lh_middletemporal,$media_FA_wm_lh_middletemporal);
 push(@media_FA_wm_lh_parahippocampal,$media_FA_wm_lh_parahippocampal);
 push(@media_FA_wm_lh_paracentral,$media_FA_wm_lh_paracentral);
 push(@media_FA_wm_lh_parsopercularis,$media_FA_wm_lh_parsopercularis);
 push(@media_FA_wm_lh_parsorbitalis,$media_FA_wm_lh_parsorbitalis);
 push(@media_FA_wm_lh_parstriangularis,$media_FA_wm_lh_parstriangularis);
 push(@media_FA_wm_lh_pericalcarine,$media_FA_wm_lh_pericalcarine);
 push(@media_FA_wm_lh_postcentral,$media_FA_wm_lh_postcentral);
 push(@media_FA_wm_lh_posteriorcingulate,$media_FA_wm_lh_posteriorcingulate);
 push(@media_FA_wm_lh_precentral,$media_FA_wm_lh_precentral);
 push(@media_FA_wm_lh_precuneus,$media_FA_wm_lh_precuneus);
 push(@media_FA_wm_lh_rostralanteriorcingulate,$media_FA_wm_lh_rostralanteriorcingulate);
 push(@media_FA_wm_lh_rostralmiddlefrontal,$media_FA_wm_lh_rostralmiddlefrontal);
 push(@media_FA_wm_lh_superiorfrontal,$media_FA_wm_lh_superiorfrontal);
 push(@media_FA_wm_lh_superiorparietal,$media_FA_wm_lh_superiorparietal);
 push(@media_FA_wm_lh_superiortemporal,$media_FA_wm_lh_superiortemporal);
 push(@media_FA_wm_lh_supramarginal,$media_FA_wm_lh_supramarginal);
 push(@media_FA_wm_lh_frontalpole,$media_FA_wm_lh_frontalpole);
 push(@media_FA_wm_lh_temporalpole,$media_FA_wm_lh_temporalpole);
 push(@media_FA_wm_lh_transversetemporal,$media_FA_wm_lh_transversetemporal);
 push(@media_FA_wm_lh_insula,$media_FA_wm_lh_insula);
 
 push(@media_FA_wm_rh_caudalanteriorcingulate,$media_FA_wm_rh_caudalanteriorcingulate);
 push(@media_FA_wm_rh_caudalmiddlefrontal,$media_FA_wm_rh_caudalmiddlefrontal);
 push(@media_FA_wm_rh_corpuscallosum,$media_FA_wm_rh_corpuscallosum);
 push(@media_FA_wm_rh_cuneus,$media_FA_wm_rh_cuneus);
 push(@media_FA_wm_rh_entorhinal,$media_FA_wm_rh_entorhinal);
 push(@media_FA_wm_rh_fusiform,$media_FA_wm_rh_fusiform);
 push(@media_FA_wm_rh_inferiorparietal,$media_FA_wm_rh_inferiorparietal);
 push(@media_FA_wm_rh_inferiortemporal,$media_FA_wm_rh_inferiortemporal);
 push(@media_FA_wm_rh_isthmuscingulate,$media_FA_wm_rh_isthmuscingulate);
 push(@media_FA_wm_rh_lateraloccipital,$media_FA_wm_rh_lateraloccipital);
 push(@media_FA_wm_rh_lateralorbitofrontal,$media_FA_wm_rh_lateralorbitofrontal);
 push(@media_FA_wm_rh_lingual,$media_FA_wm_rh_lingual);
 push(@media_FA_wm_rh_medialorbitofrontal,$media_FA_wm_rh_medialorbitofrontal);
 push(@media_FA_wm_rh_middletemporal,$media_FA_wm_rh_middletemporal);
 push(@media_FA_wm_rh_parahippocampal,$media_FA_wm_rh_parahippocampal);
 push(@media_FA_wm_rh_paracentral,$media_FA_wm_rh_paracentral);
 push(@media_FA_wm_rh_parsopercularis,$media_FA_wm_rh_parsopercularis);
 push(@media_FA_wm_rh_parsorbitalis,$media_FA_wm_rh_parsorbitalis);
 push(@media_FA_wm_rh_parstriangularis,$media_FA_wm_rh_parstriangularis);
 push(@media_FA_wm_rh_pericalcarine,$media_FA_wm_rh_pericalcarine);
 push(@media_FA_wm_rh_postcentral,$media_FA_wm_rh_postcentral);
 push(@media_FA_wm_rh_posteriorcingulate,$media_FA_wm_rh_posteriorcingulate);
 push(@media_FA_wm_rh_precentral,$media_FA_wm_rh_precentral);
 push(@media_FA_wm_rh_precuneus,$media_FA_wm_rh_precuneus);
 push(@media_FA_wm_rh_rostralanteriorcingulate,$media_FA_wm_rh_rostralanteriorcingulate);
 push(@media_FA_wm_rh_rostralmiddlefrontal,$media_FA_wm_rh_rostralmiddlefrontal);
 push(@media_FA_wm_rh_superiorfrontal,$media_FA_wm_rh_superiorfrontal);
 push(@media_FA_wm_rh_superiorparietal,$media_FA_wm_rh_superiorparietal);
 push(@media_FA_wm_rh_superiortemporal,$media_FA_wm_rh_superiortemporal);
 push(@media_FA_wm_rh_supramarginal,$media_FA_wm_rh_supramarginal);
 push(@media_FA_wm_rh_frontalpole,$media_FA_wm_rh_frontalpole);
 push(@media_FA_wm_rh_temporalpole,$media_FA_wm_rh_temporalpole);
 push(@media_FA_wm_rh_transversetemporal,$media_FA_wm_rh_transversetemporal);
 push(@media_FA_wm_rh_insula,$media_FA_wm_rh_insula);
 ###########################################################################
 print"\n\n Getting average diffusivity data...\n\n";
 #Difusibilidade média
 $sh->res(" ".$wmparc." dMap_normalizada ");
 
 #	3002	wm_lh_caudalanteriorcingulate
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3003	wm_lh_caudalmiddlefrontal
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3004	wm_lh_corpuscallosum
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3005	wm_lh_cuneus
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3006	wm_lh_entorhinal
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3007	wm_lh_fusiform
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3008	wm_lh_inferiorparietal
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3009	wm_lh_inferiortemporal
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3010	wm_lh_isthmuscingulate
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3011	wm_lh_lateraloccipital
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3012	wm_lh_lateralorbitofrontal
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3013	wm_lh_lingual
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3014	wm_lh_medialorbitofrontal
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3015	wm_lh_middletemporal
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3016	wm_lh_parahippocampal
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3017	wm_lh_paracentral
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3018	wm_lh_parsopercularis
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3019	wm_lh_parsorbitalis
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3020	wm_lh_parstriangularis
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3021	wm_lh_pericalcarine
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3022	wm_lh_postcentral
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3023	wm_lh_posteriorcingulate
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3024	wm_lh_precentral
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3025	wm_lh_precuneus
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3026	wm_lh_rostralanteriorcingulate
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3027	wm_lh_rostralmiddlefrontal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3028	wm_lh_superiorfrontal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3029	wm_lh_superiorparietal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3030	wm_lh_superiortemporal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3031	wm_lh_supramarginal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3032	wm_lh_frontalpole
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3033	wm_lh_temporalpole
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3034	wm_lh_transversetemporal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3035	wm_lh_insula
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4002	wm_rh_caudalanteriorcingulate
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4003	wm_rh_caudalmiddlefrontal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4004	wm_rh_corpuscallosum
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4005	wm_rh_cuneus
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4006	wm_rh_entorhinal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4007	wm_rh_fusiform
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4008	wm_rh_inferiorparietal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4009	wm_rh_inferiortemporal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_inferiortemporal= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4010	wm_rh_isthmuscingulate
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_isthmuscingulate= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4011	wm_rh_lateraloccipital
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4012	wm_rh_lateralorbitofrontal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4013	wm_rh_lingual
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4014	wm_rh_medialorbitofrontal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4015	wm_rh_middletemporal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4016	wm_rh_parahippocampal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4017	wm_rh_paracentral
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4018	wm_rh_parsopercularis
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4019	wm_rh_parsorbitalis
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4020	wm_rh_parstriangularis
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4021	wm_rh_pericalcarine
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4022	wm_rh_postcentral
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4023	wm_rh_posteriorcingulate
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4024	wm_rh_precentral
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4025	wm_rh_precuneus
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4026	wm_rh_rostralanteriorcingulate
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4027	wm_rh_rostralmiddlefrontal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4028	wm_rh_superiorfrontal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4029	wm_rh_superiorparietal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4030	wm_rh_superiortemporal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4031	wm_rh_supramarginal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4032	wm_rh_frontalpole
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4033	wm_rh_temporalpole
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4034	wm_rh_transversetemporal
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4035	wm_rh_insula
$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_wm_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($wmparc."_res.mnc.gz"); 
 
 #Montando o array
 push(@media_dMap_wm_lh_caudalanteriorcingulate,$media_dMap_wm_lh_caudalanteriorcingulate);
 push(@media_dMap_wm_lh_caudalmiddlefrontal,$media_dMap_wm_lh_caudalmiddlefrontal);
 push(@media_dMap_wm_lh_corpuscallosum,$media_dMap_wm_lh_corpuscallosum);
 push(@media_dMap_wm_lh_cuneus,$media_dMap_wm_lh_cuneus);
 push(@media_dMap_wm_lh_entorhinal,$media_dMap_wm_lh_entorhinal);
 push(@media_dMap_wm_lh_fusiform,$media_dMap_wm_lh_fusiform);
 push(@media_dMap_wm_lh_inferiorparietal,$media_dMap_wm_lh_inferiorparietal);
 push(@media_dMap_wm_lh_inferiortemporal,$media_dMap_wm_lh_inferiortemporal);
 push(@media_dMap_wm_lh_isthmuscingulate,$media_dMap_wm_lh_isthmuscingulate);
 push(@media_dMap_wm_lh_lateraloccipital,$media_dMap_wm_lh_lateraloccipital);
 push(@media_dMap_wm_lh_lateralorbitofrontal,$media_dMap_wm_lh_lateralorbitofrontal);
 push(@media_dMap_wm_lh_lingual,$media_dMap_wm_lh_lingual);
 push(@media_dMap_wm_lh_medialorbitofrontal,$media_dMap_wm_lh_medialorbitofrontal);
 push(@media_dMap_wm_lh_middletemporal,$media_dMap_wm_lh_middletemporal);
 push(@media_dMap_wm_lh_parahippocampal,$media_dMap_wm_lh_parahippocampal);
 push(@media_dMap_wm_lh_paracentral,$media_dMap_wm_lh_paracentral);
 push(@media_dMap_wm_lh_parsopercularis,$media_dMap_wm_lh_parsopercularis);
 push(@media_dMap_wm_lh_parsorbitalis,$media_dMap_wm_lh_parsorbitalis);
 push(@media_dMap_wm_lh_parstriangularis,$media_dMap_wm_lh_parstriangularis);
 push(@media_dMap_wm_lh_pericalcarine,$media_dMap_wm_lh_pericalcarine);
 push(@media_dMap_wm_lh_postcentral,$media_dMap_wm_lh_postcentral);
 push(@media_dMap_wm_lh_posteriorcingulate,$media_dMap_wm_lh_posteriorcingulate);
 push(@media_dMap_wm_lh_precentral,$media_dMap_wm_lh_precentral);
 push(@media_dMap_wm_lh_precuneus,$media_dMap_wm_lh_precuneus);
 push(@media_dMap_wm_lh_rostralanteriorcingulate,$media_dMap_wm_lh_rostralanteriorcingulate);
 push(@media_dMap_wm_lh_rostralmiddlefrontal,$media_dMap_wm_lh_rostralmiddlefrontal);
 push(@media_dMap_wm_lh_superiorfrontal,$media_dMap_wm_lh_superiorfrontal);
 push(@media_dMap_wm_lh_superiorparietal,$media_dMap_wm_lh_superiorparietal);
 push(@media_dMap_wm_lh_superiortemporal,$media_dMap_wm_lh_superiortemporal);
 push(@media_dMap_wm_lh_supramarginal,$media_dMap_wm_lh_supramarginal);
 push(@media_dMap_wm_lh_frontalpole,$media_dMap_wm_lh_frontalpole);
 push(@media_dMap_wm_lh_temporalpole,$media_dMap_wm_lh_temporalpole);
 push(@media_dMap_wm_lh_transversetemporal,$media_dMap_wm_lh_transversetemporal);
 push(@media_dMap_wm_lh_insula,$media_dMap_wm_lh_insula);
 
 push(@media_dMap_wm_rh_caudalanteriorcingulate,$media_dMap_wm_rh_caudalanteriorcingulate);
 push(@media_dMap_wm_rh_caudalmiddlefrontal,$media_dMap_wm_rh_caudalmiddlefrontal);
 push(@media_dMap_wm_rh_corpuscallosum,$media_dMap_wm_rh_corpuscallosum);
 push(@media_dMap_wm_rh_cuneus,$media_dMap_wm_rh_cuneus);
 push(@media_dMap_wm_rh_entorhinal,$media_dMap_wm_rh_entorhinal);
 push(@media_dMap_wm_rh_fusiform,$media_dMap_wm_rh_fusiform);
 push(@media_dMap_wm_rh_inferiorparietal,$media_dMap_wm_rh_inferiorparietal);
 push(@media_dMap_wm_rh_inferiortemporal,$media_dMap_wm_rh_inferiortemporal);
 push(@media_dMap_wm_rh_isthmuscingulate,$media_dMap_wm_rh_isthmuscingulate);
 push(@media_dMap_wm_rh_lateraloccipital,$media_dMap_wm_rh_lateraloccipital);
 push(@media_dMap_wm_rh_lateralorbitofrontal,$media_dMap_wm_rh_lateralorbitofrontal);
 push(@media_dMap_wm_rh_lingual,$media_dMap_wm_rh_lingual);
 push(@media_dMap_wm_rh_medialorbitofrontal,$media_dMap_wm_rh_medialorbitofrontal);
 push(@media_dMap_wm_rh_middletemporal,$media_dMap_wm_rh_middletemporal);
 push(@media_dMap_wm_rh_parahippocampal,$media_dMap_wm_rh_parahippocampal);
 push(@media_dMap_wm_rh_paracentral,$media_dMap_wm_rh_paracentral);
 push(@media_dMap_wm_rh_parsopercularis,$media_dMap_wm_rh_parsopercularis);
 push(@media_dMap_wm_rh_parsorbitalis,$media_dMap_wm_rh_parsorbitalis);
 push(@media_dMap_wm_rh_parstriangularis,$media_dMap_wm_rh_parstriangularis);
 push(@media_dMap_wm_rh_pericalcarine,$media_dMap_wm_rh_pericalcarine);
 push(@media_dMap_wm_rh_postcentral,$media_dMap_wm_rh_postcentral);
 push(@media_dMap_wm_rh_posteriorcingulate,$media_dMap_wm_rh_posteriorcingulate);
 push(@media_dMap_wm_rh_precentral,$media_dMap_wm_rh_precentral);
 push(@media_dMap_wm_rh_precuneus,$media_dMap_wm_rh_precuneus);
 push(@media_dMap_wm_rh_rostralanteriorcingulate,$media_dMap_wm_rh_rostralanteriorcingulate);
 push(@media_dMap_wm_rh_rostralmiddlefrontal,$media_dMap_wm_rh_rostralmiddlefrontal);
 push(@media_dMap_wm_rh_superiorfrontal,$media_dMap_wm_rh_superiorfrontal);
 push(@media_dMap_wm_rh_superiorparietal,$media_dMap_wm_rh_superiorparietal);
 push(@media_dMap_wm_rh_superiortemporal,$media_dMap_wm_rh_superiortemporal);
 push(@media_dMap_wm_rh_supramarginal,$media_dMap_wm_rh_supramarginal);
 push(@media_dMap_wm_rh_frontalpole,$media_dMap_wm_rh_frontalpole);
 push(@media_dMap_wm_rh_temporalpole,$media_dMap_wm_rh_temporalpole);
 push(@media_dMap_wm_rh_transversetemporal,$media_dMap_wm_rh_transversetemporal);
 push(@media_dMap_wm_rh_insula,$media_dMap_wm_rh_insula);
 
########################################################################### 
 print"\n\n Getting parallel diffusivity data...\n\n";

 #Dparalelo
 $sh->res(" ".$wmparc." ".$PrimNome."_Dpara ");
  
 #	3002	wm_lh_caudalanteriorcingulate
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3003	wm_lh_caudalmiddlefrontal
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3004	wm_lh_corpuscallosum
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3005	wm_lh_cuneus
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3006	wm_lh_entorhinal
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3007	wm_lh_fusiform
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3008	wm_lh_inferiorparietal
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3009	wm_lh_inferiortemporal
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3010	wm_lh_isthmuscingulate
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3011	wm_lh_lateraloccipital
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3012	wm_lh_lateralorbitofrontal
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3013	wm_lh_lingual
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3014	wm_lh_medialorbitofrontal
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3015	wm_lh_middletemporal
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3016	wm_lh_parahippocampal
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3017	wm_lh_paracentral
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3018	wm_lh_parsopercularis
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3019	wm_lh_parsorbitalis
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3020	wm_lh_parstriangularis
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3021	wm_lh_pericalcarine
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3022	wm_lh_postcentral
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3023	wm_lh_posteriorcingulate
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3024	wm_lh_precentral
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3025	wm_lh_precuneus
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3026	wm_lh_rostralanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3027	wm_lh_rostralmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3028	wm_lh_superiorfrontal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3029	wm_lh_superiorparietal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3030	wm_lh_superiortemporal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3031	wm_lh_supramarginal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3032	wm_lh_frontalpole
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3033	wm_lh_temporalpole
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3034	wm_lh_transversetemporal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3035	wm_lh_insula
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4002	wm_rh_caudalanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4003	wm_rh_caudalmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4004	wm_rh_corpuscallosum
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4005	wm_rh_cuneus
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4006	wm_rh_entorhinal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4007	wm_rh_fusiform
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4008	wm_rh_inferiorparietal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4009	wm_rh_inferiortemporal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_inferiortemporal= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4010	wm_rh_isthmuscingulate
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_isthmuscingulate= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4011	wm_rh_lateraloccipital
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4012	wm_rh_lateralorbitofrontal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4013	wm_rh_lingual
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4014	wm_rh_medialorbitofrontal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4015	wm_rh_middletemporal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4016	wm_rh_parahippocampal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4017	wm_rh_paracentral
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4018	wm_rh_parsopercularis
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4019	wm_rh_parsorbitalis
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4020	wm_rh_parstriangularis
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4021	wm_rh_pericalcarine
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4022	wm_rh_postcentral
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4023	wm_rh_posteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4024	wm_rh_precentral
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4025	wm_rh_precuneus
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4026	wm_rh_rostralanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4027	wm_rh_rostralmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4028	wm_rh_superiorfrontal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4029	wm_rh_superiorparietal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4030	wm_rh_superiortemporal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4031	wm_rh_supramarginal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4032	wm_rh_frontalpole
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4033	wm_rh_temporalpole
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4034	wm_rh_transversetemporal
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4035	wm_rh_insula
$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_wm_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($wmparc."_res.mnc.gz"); 
 
 #Montando o array
 push(@media_Dpara_wm_lh_caudalanteriorcingulate,$media_Dpara_wm_lh_caudalanteriorcingulate);
 push(@media_Dpara_wm_lh_caudalmiddlefrontal,$media_Dpara_wm_lh_caudalmiddlefrontal);
 push(@media_Dpara_wm_lh_corpuscallosum,$media_Dpara_wm_lh_corpuscallosum);
 push(@media_Dpara_wm_lh_cuneus,$media_Dpara_wm_lh_cuneus);
 push(@media_Dpara_wm_lh_entorhinal,$media_Dpara_wm_lh_entorhinal);
 push(@media_Dpara_wm_lh_fusiform,$media_Dpara_wm_lh_fusiform);
 push(@media_Dpara_wm_lh_inferiorparietal,$media_Dpara_wm_lh_inferiorparietal);
 push(@media_Dpara_wm_lh_inferiortemporal,$media_Dpara_wm_lh_inferiortemporal);
 push(@media_Dpara_wm_lh_isthmuscingulate,$media_Dpara_wm_lh_isthmuscingulate);
 push(@media_Dpara_wm_lh_lateraloccipital,$media_Dpara_wm_lh_lateraloccipital);
 push(@media_Dpara_wm_lh_lateralorbitofrontal,$media_Dpara_wm_lh_lateralorbitofrontal);
 push(@media_Dpara_wm_lh_lingual,$media_Dpara_wm_lh_lingual);
 push(@media_Dpara_wm_lh_medialorbitofrontal,$media_Dpara_wm_lh_medialorbitofrontal);
 push(@media_Dpara_wm_lh_middletemporal,$media_Dpara_wm_lh_middletemporal);
 push(@media_Dpara_wm_lh_parahippocampal,$media_Dpara_wm_lh_parahippocampal);
 push(@media_Dpara_wm_lh_paracentral,$media_Dpara_wm_lh_paracentral);
 push(@media_Dpara_wm_lh_parsopercularis,$media_Dpara_wm_lh_parsopercularis);
 push(@media_Dpara_wm_lh_parsorbitalis,$media_Dpara_wm_lh_parsorbitalis);
 push(@media_Dpara_wm_lh_parstriangularis,$media_Dpara_wm_lh_parstriangularis);
 push(@media_Dpara_wm_lh_pericalcarine,$media_Dpara_wm_lh_pericalcarine);
 push(@media_Dpara_wm_lh_postcentral,$media_Dpara_wm_lh_postcentral);
 push(@media_Dpara_wm_lh_posteriorcingulate,$media_Dpara_wm_lh_posteriorcingulate);
 push(@media_Dpara_wm_lh_precentral,$media_Dpara_wm_lh_precentral);
 push(@media_Dpara_wm_lh_precuneus,$media_Dpara_wm_lh_precuneus);
 push(@media_Dpara_wm_lh_rostralanteriorcingulate,$media_Dpara_wm_lh_rostralanteriorcingulate);
 push(@media_Dpara_wm_lh_rostralmiddlefrontal,$media_Dpara_wm_lh_rostralmiddlefrontal);
 push(@media_Dpara_wm_lh_superiorfrontal,$media_Dpara_wm_lh_superiorfrontal);
 push(@media_Dpara_wm_lh_superiorparietal,$media_Dpara_wm_lh_superiorparietal);
 push(@media_Dpara_wm_lh_superiortemporal,$media_Dpara_wm_lh_superiortemporal);
 push(@media_Dpara_wm_lh_supramarginal,$media_Dpara_wm_lh_supramarginal);
 push(@media_Dpara_wm_lh_frontalpole,$media_Dpara_wm_lh_frontalpole);
 push(@media_Dpara_wm_lh_temporalpole,$media_Dpara_wm_lh_temporalpole);
 push(@media_Dpara_wm_lh_transversetemporal,$media_Dpara_wm_lh_transversetemporal);
 push(@media_Dpara_wm_lh_insula,$media_Dpara_wm_lh_insula);
 
 push(@media_Dpara_wm_rh_caudalanteriorcingulate,$media_Dpara_wm_rh_caudalanteriorcingulate);
 push(@media_Dpara_wm_rh_caudalmiddlefrontal,$media_Dpara_wm_rh_caudalmiddlefrontal);
 push(@media_Dpara_wm_rh_corpuscallosum,$media_Dpara_wm_rh_corpuscallosum);
 push(@media_Dpara_wm_rh_cuneus,$media_Dpara_wm_rh_cuneus);
 push(@media_Dpara_wm_rh_entorhinal,$media_Dpara_wm_rh_entorhinal);
 push(@media_Dpara_wm_rh_fusiform,$media_Dpara_wm_rh_fusiform);
 push(@media_Dpara_wm_rh_inferiorparietal,$media_Dpara_wm_rh_inferiorparietal);
 push(@media_Dpara_wm_rh_inferiortemporal,$media_Dpara_wm_rh_inferiortemporal);
 push(@media_Dpara_wm_rh_isthmuscingulate,$media_Dpara_wm_rh_isthmuscingulate);
 push(@media_Dpara_wm_rh_lateraloccipital,$media_Dpara_wm_rh_lateraloccipital);
 push(@media_Dpara_wm_rh_lateralorbitofrontal,$media_Dpara_wm_rh_lateralorbitofrontal);
 push(@media_Dpara_wm_rh_lingual,$media_Dpara_wm_rh_lingual);
 push(@media_Dpara_wm_rh_medialorbitofrontal,$media_Dpara_wm_rh_medialorbitofrontal);
 push(@media_Dpara_wm_rh_middletemporal,$media_Dpara_wm_rh_middletemporal);
 push(@media_Dpara_wm_rh_parahippocampal,$media_Dpara_wm_rh_parahippocampal);
 push(@media_Dpara_wm_rh_paracentral,$media_Dpara_wm_rh_paracentral);
 push(@media_Dpara_wm_rh_parsopercularis,$media_Dpara_wm_rh_parsopercularis);
 push(@media_Dpara_wm_rh_parsorbitalis,$media_Dpara_wm_rh_parsorbitalis);
 push(@media_Dpara_wm_rh_parstriangularis,$media_Dpara_wm_rh_parstriangularis);
 push(@media_Dpara_wm_rh_pericalcarine,$media_Dpara_wm_rh_pericalcarine);
 push(@media_Dpara_wm_rh_postcentral,$media_Dpara_wm_rh_postcentral);
 push(@media_Dpara_wm_rh_posteriorcingulate,$media_Dpara_wm_rh_posteriorcingulate);
 push(@media_Dpara_wm_rh_precentral,$media_Dpara_wm_rh_precentral);
 push(@media_Dpara_wm_rh_precuneus,$media_Dpara_wm_rh_precuneus);
 push(@media_Dpara_wm_rh_rostralanteriorcingulate,$media_Dpara_wm_rh_rostralanteriorcingulate);
 push(@media_Dpara_wm_rh_rostralmiddlefrontal,$media_Dpara_wm_rh_rostralmiddlefrontal);
 push(@media_Dpara_wm_rh_superiorfrontal,$media_Dpara_wm_rh_superiorfrontal);
 push(@media_Dpara_wm_rh_superiorparietal,$media_Dpara_wm_rh_superiorparietal);
 push(@media_Dpara_wm_rh_superiortemporal,$media_Dpara_wm_rh_superiortemporal);
 push(@media_Dpara_wm_rh_supramarginal,$media_Dpara_wm_rh_supramarginal);
 push(@media_Dpara_wm_rh_frontalpole,$media_Dpara_wm_rh_frontalpole);
 push(@media_Dpara_wm_rh_temporalpole,$media_Dpara_wm_rh_temporalpole);
 push(@media_Dpara_wm_rh_transversetemporal,$media_Dpara_wm_rh_transversetemporal);
 push(@media_Dpara_wm_rh_insula,$media_Dpara_wm_rh_insula);
 ###########################################################################
 print"\n\n Getting perpendicular diffusivity data...\n\n";
 #Dperpendicular
 $sh->res(" ".$wmparc." ".$PrimNome."_Dperp ");
  
  #	3002	wm_lh_caudalanteriorcingulate
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3003	wm_lh_caudalmiddlefrontal
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3004	wm_lh_corpuscallosum
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3005	wm_lh_cuneus
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3006	wm_lh_entorhinal
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3007	wm_lh_fusiform
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3008	wm_lh_inferiorparietal
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3009	wm_lh_inferiortemporal
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_inferiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3010	wm_lh_isthmuscingulate
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_isthmuscingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3011	wm_lh_lateraloccipital
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3012	wm_lh_lateralorbitofrontal
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3013	wm_lh_lingual
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3014	wm_lh_medialorbitofrontal
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3015	wm_lh_middletemporal
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3016	wm_lh_parahippocampal
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3017	wm_lh_paracentral
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3018	wm_lh_parsopercularis
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3019	wm_lh_parsorbitalis
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3020	wm_lh_parstriangularis
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3021	wm_lh_pericalcarine
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3022	wm_lh_postcentral
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3023	wm_lh_posteriorcingulate
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3024	wm_lh_precentral
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3025	wm_lh_precuneus
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3026	wm_lh_rostralanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3027	wm_lh_rostralmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3028	wm_lh_superiorfrontal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3029	wm_lh_superiorparietal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3030	wm_lh_superiortemporal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	3031	wm_lh_supramarginal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3032	wm_lh_frontalpole
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3033	wm_lh_temporalpole
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	3034	wm_lh_transversetemporal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	3035	wm_lh_insula
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 3035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_lh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4002	wm_rh_caudalanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4002 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_caudalanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4003	wm_rh_caudalmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4003 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_caudalmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4004	wm_rh_corpuscallosum
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4004 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_corpuscallosum = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4005	wm_rh_cuneus
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4005 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_cuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4006	wm_rh_entorhinal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4006 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_entorhinal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4007	wm_rh_fusiform
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4007 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_fusiform = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4008	wm_rh_inferiorparietal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4008 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_inferiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4009	wm_rh_inferiortemporal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4009 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_inferiortemporal= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4010	wm_rh_isthmuscingulate
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4010 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_isthmuscingulate= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4011	wm_rh_lateraloccipital
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4011 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_lateraloccipital = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4012	wm_rh_lateralorbitofrontal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4012 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_lateralorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4013	wm_rh_lingual
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4013 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_lingual = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4014	wm_rh_medialorbitofrontal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4014 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_medialorbitofrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4015	wm_rh_middletemporal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4015 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_middletemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4016	wm_rh_parahippocampal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4016 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_parahippocampal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4017	wm_rh_paracentral
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4017 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_paracentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4018	wm_rh_parsopercularis
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4018 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_parsopercularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4019	wm_rh_parsorbitalis
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4019 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_parsorbitalis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4020	wm_rh_parstriangularis
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4020 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_parstriangularis = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4021	wm_rh_pericalcarine
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4021 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_pericalcarine = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4022	wm_rh_postcentral
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4022 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_postcentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4023	wm_rh_posteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4023 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_posteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4024	wm_rh_precentral
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4024 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_precentral = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4025	wm_rh_precuneus
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4025 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_precuneus = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4026	wm_rh_rostralanteriorcingulate
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4026 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_rostralanteriorcingulate = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4027	wm_rh_rostralmiddlefrontal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4027 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_rostralmiddlefrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4028	wm_rh_superiorfrontal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4028 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_superiorfrontal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4029	wm_rh_superiorparietal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4029 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_superiorparietal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4030	wm_rh_superiortemporal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4030 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_superiortemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4031	wm_rh_supramarginal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4031 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_supramarginal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4032	wm_rh_frontalpole
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4032 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_frontalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
#	4033	wm_rh_temporalpole
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4033 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_temporalpole = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

#	4034	wm_rh_transversetemporal
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4034 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_transversetemporal = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
  
#	4035	wm_rh_insula
$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$wmparc."_res.mnc.gz -mask_binvalue 4035 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_wm_rh_insula = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($wmparc."_res.mnc.gz"); 
 
 #Montando o array
 push(@media_Dperp_wm_lh_caudalanteriorcingulate,$media_Dperp_wm_lh_caudalanteriorcingulate);
 push(@media_Dperp_wm_lh_caudalmiddlefrontal,$media_Dperp_wm_lh_caudalmiddlefrontal);
 push(@media_Dperp_wm_lh_corpuscallosum,$media_Dperp_wm_lh_corpuscallosum);
 push(@media_Dperp_wm_lh_cuneus,$media_Dperp_wm_lh_cuneus);
 push(@media_Dperp_wm_lh_entorhinal,$media_Dperp_wm_lh_entorhinal);
 push(@media_Dperp_wm_lh_fusiform,$media_Dperp_wm_lh_fusiform);
 push(@media_Dperp_wm_lh_inferiorparietal,$media_Dperp_wm_lh_inferiorparietal);
 push(@media_Dperp_wm_lh_inferiortemporal,$media_Dperp_wm_lh_inferiortemporal);
 push(@media_Dperp_wm_lh_isthmuscingulate,$media_Dperp_wm_lh_isthmuscingulate);
 push(@media_Dperp_wm_lh_lateraloccipital,$media_Dperp_wm_lh_lateraloccipital);
 push(@media_Dperp_wm_lh_lateralorbitofrontal,$media_Dperp_wm_lh_lateralorbitofrontal);
 push(@media_Dperp_wm_lh_lingual,$media_Dperp_wm_lh_lingual);
 push(@media_Dperp_wm_lh_medialorbitofrontal,$media_Dperp_wm_lh_medialorbitofrontal);
 push(@media_Dperp_wm_lh_middletemporal,$media_Dperp_wm_lh_middletemporal);
 push(@media_Dperp_wm_lh_parahippocampal,$media_Dperp_wm_lh_parahippocampal);
 push(@media_Dperp_wm_lh_paracentral,$media_Dperp_wm_lh_paracentral);
 push(@media_Dperp_wm_lh_parsopercularis,$media_Dperp_wm_lh_parsopercularis);
 push(@media_Dperp_wm_lh_parsorbitalis,$media_Dperp_wm_lh_parsorbitalis);
 push(@media_Dperp_wm_lh_parstriangularis,$media_Dperp_wm_lh_parstriangularis);
 push(@media_Dperp_wm_lh_pericalcarine,$media_Dperp_wm_lh_pericalcarine);
 push(@media_Dperp_wm_lh_postcentral,$media_Dperp_wm_lh_postcentral);
 push(@media_Dperp_wm_lh_posteriorcingulate,$media_Dperp_wm_lh_posteriorcingulate);
 push(@media_Dperp_wm_lh_precentral,$media_Dperp_wm_lh_precentral);
 push(@media_Dperp_wm_lh_precuneus,$media_Dperp_wm_lh_precuneus);
 push(@media_Dperp_wm_lh_rostralanteriorcingulate,$media_Dperp_wm_lh_rostralanteriorcingulate);
 push(@media_Dperp_wm_lh_rostralmiddlefrontal,$media_Dperp_wm_lh_rostralmiddlefrontal);
 push(@media_Dperp_wm_lh_superiorfrontal,$media_Dperp_wm_lh_superiorfrontal);
 push(@media_Dperp_wm_lh_superiorparietal,$media_Dperp_wm_lh_superiorparietal);
 push(@media_Dperp_wm_lh_superiortemporal,$media_Dperp_wm_lh_superiortemporal);
 push(@media_Dperp_wm_lh_supramarginal,$media_Dperp_wm_lh_supramarginal);
 push(@media_Dperp_wm_lh_frontalpole,$media_Dperp_wm_lh_frontalpole);
 push(@media_Dperp_wm_lh_temporalpole,$media_Dperp_wm_lh_temporalpole);
 push(@media_Dperp_wm_lh_transversetemporal,$media_Dperp_wm_lh_transversetemporal);
 push(@media_Dperp_wm_lh_insula,$media_Dperp_wm_lh_insula);
 
 push(@media_Dperp_wm_rh_caudalanteriorcingulate,$media_Dperp_wm_rh_caudalanteriorcingulate);
 push(@media_Dperp_wm_rh_caudalmiddlefrontal,$media_Dperp_wm_rh_caudalmiddlefrontal);
 push(@media_Dperp_wm_rh_corpuscallosum,$media_Dperp_wm_rh_corpuscallosum);
 push(@media_Dperp_wm_rh_cuneus,$media_Dperp_wm_rh_cuneus);
 push(@media_Dperp_wm_rh_entorhinal,$media_Dperp_wm_rh_entorhinal);
 push(@media_Dperp_wm_rh_fusiform,$media_Dperp_wm_rh_fusiform);
 push(@media_Dperp_wm_rh_inferiorparietal,$media_Dperp_wm_rh_inferiorparietal);
 push(@media_Dperp_wm_rh_inferiortemporal,$media_Dperp_wm_rh_inferiortemporal);
 push(@media_Dperp_wm_rh_isthmuscingulate,$media_Dperp_wm_rh_isthmuscingulate);
 push(@media_Dperp_wm_rh_lateraloccipital,$media_Dperp_wm_rh_lateraloccipital);
 push(@media_Dperp_wm_rh_lateralorbitofrontal,$media_Dperp_wm_rh_lateralorbitofrontal);
 push(@media_Dperp_wm_rh_lingual,$media_Dperp_wm_rh_lingual);
 push(@media_Dperp_wm_rh_medialorbitofrontal,$media_Dperp_wm_rh_medialorbitofrontal);
 push(@media_Dperp_wm_rh_middletemporal,$media_Dperp_wm_rh_middletemporal);
 push(@media_Dperp_wm_rh_parahippocampal,$media_Dperp_wm_rh_parahippocampal);
 push(@media_Dperp_wm_rh_paracentral,$media_Dperp_wm_rh_paracentral);
 push(@media_Dperp_wm_rh_parsopercularis,$media_Dperp_wm_rh_parsopercularis);
 push(@media_Dperp_wm_rh_parsorbitalis,$media_Dperp_wm_rh_parsorbitalis);
 push(@media_Dperp_wm_rh_parstriangularis,$media_Dperp_wm_rh_parstriangularis);
 push(@media_Dperp_wm_rh_pericalcarine,$media_Dperp_wm_rh_pericalcarine);
 push(@media_Dperp_wm_rh_postcentral,$media_Dperp_wm_rh_postcentral);
 push(@media_Dperp_wm_rh_posteriorcingulate,$media_Dperp_wm_rh_posteriorcingulate);
 push(@media_Dperp_wm_rh_precentral,$media_Dperp_wm_rh_precentral);
 push(@media_Dperp_wm_rh_precuneus,$media_Dperp_wm_rh_precuneus);
 push(@media_Dperp_wm_rh_rostralanteriorcingulate,$media_Dperp_wm_rh_rostralanteriorcingulate);
 push(@media_Dperp_wm_rh_rostralmiddlefrontal,$media_Dperp_wm_rh_rostralmiddlefrontal);
 push(@media_Dperp_wm_rh_superiorfrontal,$media_Dperp_wm_rh_superiorfrontal);
 push(@media_Dperp_wm_rh_superiorparietal,$media_Dperp_wm_rh_superiorparietal);
 push(@media_Dperp_wm_rh_superiortemporal,$media_Dperp_wm_rh_superiortemporal);
 push(@media_Dperp_wm_rh_supramarginal,$media_Dperp_wm_rh_supramarginal);
 push(@media_Dperp_wm_rh_frontalpole,$media_Dperp_wm_rh_frontalpole);
 push(@media_Dperp_wm_rh_temporalpole,$media_Dperp_wm_rh_temporalpole);
 push(@media_Dperp_wm_rh_transversetemporal,$media_Dperp_wm_rh_transversetemporal);
 push(@media_Dperp_wm_rh_insula,$media_Dperp_wm_rh_insula);
 } 
 
 $sh->rm("*_res.mnc.gz"); 
 chdir("..");

  chdir(".."); 

}

#-----------------------------------------------------------------------
# get_arguments()
#     Routine to get argument values
#-----------------------------------------------------------------------

sub get_arguments {

  # Usage line
  $0 =~ /([^\/]+)$/;
  my $prog = $1;
  my $usage = "Usage:\tMaps_values_extration_tool.pl [<options>]\n\tMaps_values_extration_tool.pl -help\n";

  # Set default values
  my $option = undef;
 

  # Loop througt arguments
  while (@_) {
    $_ = shift;
    if (/^-subcortical$/) { $option = "1"; }
    elsif (/^-cortex$/) { $option = "2"; }
    elsif (/^-wm_parts$/) { $option = "3";} 	
	elsif (/^-all$/) {$option = "0"; }
	elsif (/^-h(|elp)$/){
    die
"
Command-specific options:

 -subcortical:\tExtract the values from subcortical structures(aseg labels)
 -cortex:\tExtract the values from cortical(aparc labels)
 -wm_parts:\tExtract the values from white matter parts(wmparc labels)
 -all:\t\tExtract the values from all structures
 
Generic options for all commands:
 -help:\t\tPrint summary of comand-line options and abort

Example:
 Maps_values_extration_tool.pl -subcortical

$usage
";
    }
 
  # return the valids arguments
  return($option);

 }
}