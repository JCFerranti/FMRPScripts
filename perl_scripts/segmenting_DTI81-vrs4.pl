#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               #
#Ribeirao Preto,16 de janeiro de 2007                                                                                                                                         #
#versao 1.0                                                                                                                                                                                       #
#####################################################################
#@NAME       :segmenting_corpus_callosum.pl
#@INPUT      : 
#@OUTPUT     : 
#@RETURNS    : 
#@DESCRIPTION: segmentação automática do corpo caloso

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************
print "\n*********************************************************************\n";

print "\n Iniciando Processo...\n";
print "\n-- Por favor aguarde --\n";

@pastas = glob("./*");
$NomePastaAnter="";
$teste = @pastas ;
print "\n O Numero de pastas é:".$teste."\n\n";
$contador=0;
while($contador != $teste)
{
  $arquivo = $pastas[0];
  $Start = index($arquivo,"./") + 2;
  $NomePasta = substr($arquivo,$Start);
  if($NomePasta ne $NomePastaAnter)
  {  
	print "\n ======================================================================= \n";
    print "O nome do paciente eh: ".$NomePasta."\n";
	&Processamento;   
  }   
  $NomePastaAnter = $NomePasta;
  shift(@pastas ); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
  
 }
 
 	open(RELATDADOS, "> Dados_faMap_DTI81.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Middle cerebellar peduncle;Pontine crossing tract (a part of MCP);Genu of corpus callosum;Body of corpus callosum;Splenium of corpus callosum;Fornix (column and body of fornix);Corticospinal tract right;Corticospinal tract left;Medial lemniscus right;Medial lemniscus left;Inferior cerebellar peduncle right;Inferior cerebellar peduncle left;Superior cerebellar peduncle right;Superior cerebellar peduncle left;Cerebral peduncle right;Cerebral peduncle left;Anterior limb of internal capsule right;Anterior limb of internal capsule left;Posterior limb of internal capsule right;Posterior limb of internal capsule left;Retrolenticular part of internal capsule right;Retrolenticular part of internal capsule left;Anterior corona radiata right;Anterior corona radiata left;Superior corona radiata right;Superior corona radiata left;Posterior corona radiata right;Posterior corona radiata left;Posterior thalamic radiation (include optic radiation) right;Posterior thalamic radiation (include optic radiation) left;Sagittal stratum (include inferior longitidinal fasciculus and inferior fronto-occipital fasciculus) right;Sagittal stratum (include inferior longitidinal fasciculus and inferior fronto-occipital fasciculus) left;External capsule right;External capsule left;Cingulum (cingulate gyrus) right;Cingulum (cingulate gyrus) left;Cingulum (hippocampus) right;Cingulum (hippocampus) left;Fornix (cres) / Stria terminalis (can not be resolved with current resolution) right;Fornix (cres) / Stria terminalis (can not be resolved with current resolution) left;Superior longitudinal fasciculus right;Superior longitudinal fasciculus left;Superior fronto-occipital fasciculus (could be a part of anterior internal capsule) right;Superior fronto-occipital fasciculus (could be a part of anterior internal capsule) left;Inferior fronto-occipital fasciculus right;Inferior fronto-occipital fasciculus left;Uncinate fasciculus right;Uncinate fasciculus left;Tapatum right;Tapatum left;\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasfaMCP[$c].";".$mediasfaPCT[$c].";".$mediasfaGCC[$c].";".$mediasfaBCC[$c].";".$mediasfaSCC[$c].";".$mediasfaFX[$c].";".$mediasfaCSTR[$c].";".$mediasfaCSTL[$c].";".$mediasfaMLR[$c].";".$mediasfaMLL[$c].";".$mediasfaICPR[$c].";".$mediasfaICPL[$c].";".$mediasfaSCPR[$c].";".$mediasfaSCPL[$c].";".$mediasfaCPR[$c].";".$mediasfaCPL[$c].";".$mediasfaALICR[$c].";".$mediasfaALICL[$c].";".$mediasfaPLICR[$c].";".$mediasfaPLICL[$c].";".$mediasfaRLICR[$c].";".$mediasfaRLICL[$c].";".$mediasfaACRR[$c].";".$mediasfaACRL[$c].";".$mediasfaSCRR[$c].";".$mediasfaSCRL[$c].";".$mediasfaPCRR[$c].";".$mediasfaPCRL[$c].";".$mediasfaPTRR[$c].";".$mediasfaPTRL[$c].";".$mediasfaSSR[$c].";".$mediasfaSSL[$c].";".$mediasfaECR[$c].";".$mediasfaECL[$c].";".$mediasfaCGCR[$c].";".$mediasfaCGCL[$c].";".$mediasfaCGHR[$c].";".$mediasfaCGHL[$c].";".$mediasfaFXSTR[$c].";".$mediasfaFXSTL[$c].";".$mediasfaSLFR[$c].";".$mediasfaSLFL[$c].";".$mediasfaSFOR[$c].";".$mediasfaSFOL[$c].";".$mediasfaIFOR[$c].";".$mediasfaIFOL[$c].";".$mediasfaUNCR[$c].";".$mediasfaUNCL[$c].";".$mediasfaTAPR[$c].";".$mediasfaTAPL[$c]."\r";
	   $c=$c+1;
	}
	
	open(RELATDADOS, "> Dados_Difusibilidade_media_DTI81.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Middle cerebellar peduncle;Pontine crossing tract (a part of MCP);Genu of corpus callosum;Body of corpus callosum;Splenium of corpus callosum;Fornix (column and body of fornix);Corticospinal tract right;Corticospinal tract left;Medial lemniscus right;Medial lemniscus left;Inferior cerebellar peduncle right;Inferior cerebellar peduncle left;Superior cerebellar peduncle right;Superior cerebellar peduncle left;Cerebral peduncle right;Cerebral peduncle left;Anterior limb of internal capsule right;Anterior limb of internal capsule left;Posterior limb of internal capsule right;Posterior limb of internal capsule left;Retrolenticular part of internal capsule right;Retrolenticular part of internal capsule left;Anterior corona radiata right;Anterior corona radiata left;Superior corona radiata right;Superior corona radiata left;Posterior corona radiata right;Posterior corona radiata left;Posterior thalamic radiation (include optic radiation) right;Posterior thalamic radiation (include optic radiation) left;Sagittal stratum (include inferior longitidinal fasciculus and inferior fronto-occipital fasciculus) right;Sagittal stratum (include inferior longitidinal fasciculus and inferior fronto-occipital fasciculus) left;External capsule right;External capsule left;Cingulum (cingulate gyrus) right;Cingulum (cingulate gyrus) left;Cingulum (hippocampus) right;Cingulum (hippocampus) left;Fornix (cres) / Stria terminalis (can not be resolved with current resolution) right;Fornix (cres) / Stria terminalis (can not be resolved with current resolution) left;Superior longitudinal fasciculus right;Superior longitudinal fasciculus left;Superior fronto-occipital fasciculus (could be a part of anterior internal capsule) right;Superior fronto-occipital fasciculus (could be a part of anterior internal capsule) left;Inferior fronto-occipital fasciculus right;Inferior fronto-occipital fasciculus left;Uncinate fasciculus right;Uncinate fasciculus left;Tapatum right;Tapatum left;\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasdMapMCP[$c].";".$mediasdMapPCT[$c].";".$mediasdMapGCC[$c].";".$mediasdMapBCC[$c].";".$mediasdMapSCC[$c].";".$mediasdMapFX[$c].";".$mediasdMapCSTR[$c].";".$mediasdMapCSTL[$c].";".$mediasdMapMLR[$c].";".$mediasdMapMLL[$c].";".$mediasdMapICPR[$c].";".$mediasdMapICPL[$c].";".$mediasdMapSCPR[$c].";".$mediasdMapSCPL[$c].";".$mediasdMapCPR[$c].";".$mediasdMapCPL[$c].";".$mediasdMapALICR[$c].";".$mediasdMapALICL[$c].";".$mediasdMapPLICR[$c].";".$mediasdMapPLICL[$c].";".$mediasdMapRLICR[$c].";".$mediasdMapRLICL[$c].";".$mediasdMapACRR[$c].";".$mediasdMapACRL[$c].";".$mediasdMapSCRR[$c].";".$mediasdMapSCRL[$c].";".$mediasdMapPCRR[$c].";".$mediasdMapPCRL[$c].";".$mediasdMapPTRR[$c].";".$mediasdMapPTRL[$c].";".$mediasdMapSSR[$c].";".$mediasdMapSSL[$c].";".$mediasdMapECR[$c].";".$mediasdMapECL[$c].";".$mediasdMapCGCR[$c].";".$mediasdMapCGCL[$c].";".$mediasdMapCGHR[$c].";".$mediasdMapCGHL[$c].";".$mediasdMapFXSTR[$c].";".$mediasdMapFXSTL[$c].";".$mediasdMapSLFR[$c].";".$mediasdMapSLFL[$c].";".$mediasdMapSFOR[$c].";".$mediasdMapSFOL[$c].";".$mediasdMapIFOR[$c].";".$mediasdMapIFOL[$c].";".$mediasdMapUNCR[$c].";".$mediasdMapUNCL[$c].";".$mediasdMapTAPR[$c].";".$mediasdMapTAPL[$c]."\r";
	   $c=$c+1;
	}
	
	open(RELATDADOS, "> Dados_Dpara_DTI81.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Middle cerebellar peduncle;Pontine crossing tract (a part of MCP);Genu of corpus callosum;Body of corpus callosum;Splenium of corpus callosum;Fornix (column and body of fornix);Corticospinal tract right;Corticospinal tract left;Medial lemniscus right;Medial lemniscus left;Inferior cerebellar peduncle right;Inferior cerebellar peduncle left;Superior cerebellar peduncle right;Superior cerebellar peduncle left;Cerebral peduncle right;Cerebral peduncle left;Anterior limb of internal capsule right;Anterior limb of internal capsule left;Posterior limb of internal capsule right;Posterior limb of internal capsule left;Retrolenticular part of internal capsule right;Retrolenticular part of internal capsule left;Anterior corona radiata right;Anterior corona radiata left;Superior corona radiata right;Superior corona radiata left;Posterior corona radiata right;Posterior corona radiata left;Posterior thalamic radiation (include optic radiation) right;Posterior thalamic radiation (include optic radiation) left;Sagittal stratum (include inferior longitidinal fasciculus and inferior fronto-occipital fasciculus) right;Sagittal stratum (include inferior longitidinal fasciculus and inferior fronto-occipital fasciculus) left;External capsule right;External capsule left;Cingulum (cingulate gyrus) right;Cingulum (cingulate gyrus) left;Cingulum (hippocampus) right;Cingulum (hippocampus) left;Fornix (cres) / Stria terminalis (can not be resolved with current resolution) right;Fornix (cres) / Stria terminalis (can not be resolved with current resolution) left;Superior longitudinal fasciculus right;Superior longitudinal fasciculus left;Superior fronto-occipital fasciculus (could be a part of anterior internal capsule) right;Superior fronto-occipital fasciculus (could be a part of anterior internal capsule) left;Inferior fronto-occipital fasciculus right;Inferior fronto-occipital fasciculus left;Uncinate fasciculus right;Uncinate fasciculus left;Tapatum right;Tapatum left;\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasDparaMCP[$c].";".$mediasDparaPCT[$c].";".$mediasDparaGCC[$c].";".$mediasDparaBCC[$c].";".$mediasDparaSCC[$c].";".$mediasDparaFX[$c].";".$mediasDparaCSTR[$c].";".$mediasDparaCSTL[$c].";".$mediasDparaMLR[$c].";".$mediasDparaMLL[$c].";".$mediasDparaICPR[$c].";".$mediasDparaICPL[$c].";".$mediasDparaSCPR[$c].";".$mediasDparaSCPL[$c].";".$mediasDparaCPR[$c].";".$mediasDparaCPL[$c].";".$mediasDparaALICR[$c].";".$mediasDparaALICL[$c].";".$mediasDparaPLICR[$c].";".$mediasDparaPLICL[$c].";".$mediasDparaRLICR[$c].";".$mediasDparaRLICL[$c].";".$mediasDparaACRR[$c].";".$mediasDparaACRL[$c].";".$mediasDparaSCRR[$c].";".$mediasDparaSCRL[$c].";".$mediasDparaPCRR[$c].";".$mediasDparaPCRL[$c].";".$mediasDparaPTRR[$c].";".$mediasDparaPTRL[$c].";".$mediasDparaSSR[$c].";".$mediasDparaSSL[$c].";".$mediasDparaECR[$c].";".$mediasDparaECL[$c].";".$mediasDparaCGCR[$c].";".$mediasDparaCGCL[$c].";".$mediasDparaCGHR[$c].";".$mediasDparaCGHL[$c].";".$mediasDparaFXSTR[$c].";".$mediasDparaFXSTL[$c].";".$mediasDparaSLFR[$c].";".$mediasDparaSLFL[$c].";".$mediasDparaSFOR[$c].";".$mediasDparaSFOL[$c].";".$mediasDparaIFOR[$c].";".$mediasDparaIFOL[$c].";".$mediasDparaUNCR[$c].";".$mediasDparaUNCL[$c].";".$mediasDparaTAPR[$c].";".$mediasDparaTAPL[$c]."\r";
	   $c=$c+1;
	}
	
	open(RELATDADOS, "> Dados_Dperp_DTI81.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Middle cerebellar peduncle;Pontine crossing tract (a part of MCP);Genu of corpus callosum;Body of corpus callosum;Splenium of corpus callosum;Fornix (column and body of fornix);Corticospinal tract right;Corticospinal tract left;Medial lemniscus right;Medial lemniscus left;Inferior cerebellar peduncle right;Inferior cerebellar peduncle left;Superior cerebellar peduncle right;Superior cerebellar peduncle left;Cerebral peduncle right;Cerebral peduncle left;Anterior limb of internal capsule right;Anterior limb of internal capsule left;Posterior limb of internal capsule right;Posterior limb of internal capsule left;Retrolenticular part of internal capsule right;Retrolenticular part of internal capsule left;Anterior corona radiata right;Anterior corona radiata left;Superior corona radiata right;Superior corona radiata left;Posterior corona radiata right;Posterior corona radiata left;Posterior thalamic radiation (include optic radiation) right;Posterior thalamic radiation (include optic radiation) left;Sagittal stratum (include inferior longitidinal fasciculus and inferior fronto-occipital fasciculus) right;Sagittal stratum (include inferior longitidinal fasciculus and inferior fronto-occipital fasciculus) left;External capsule right;External capsule left;Cingulum (cingulate gyrus) right;Cingulum (cingulate gyrus) left;Cingulum (hippocampus) right;Cingulum (hippocampus) left;Fornix (cres) / Stria terminalis (can not be resolved with current resolution) right;Fornix (cres) / Stria terminalis (can not be resolved with current resolution) left;Superior longitudinal fasciculus right;Superior longitudinal fasciculus left;Superior fronto-occipital fasciculus (could be a part of anterior internal capsule) right;Superior fronto-occipital fasciculus (could be a part of anterior internal capsule) left;Inferior fronto-occipital fasciculus right;Inferior fronto-occipital fasciculus left;Uncinate fasciculus right;Uncinate fasciculus left;Tapatum right;Tapatum left;\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasDperpMCP[$c].";".$mediasDperpPCT[$c].";".$mediasDperpGCC[$c].";".$mediasDperpBCC[$c].";".$mediasDperpSCC[$c].";".$mediasDperpFX[$c].";".$mediasDperpCSTR[$c].";".$mediasDperpCSTL[$c].";".$mediasDperpMLR[$c].";".$mediasDperpMLL[$c].";".$mediasDperpICPR[$c].";".$mediasDperpICPL[$c].";".$mediasDperpSCPR[$c].";".$mediasDperpSCPL[$c].";".$mediasDperpCPR[$c].";".$mediasDperpCPL[$c].";".$mediasDperpALICR[$c].";".$mediasDperpALICL[$c].";".$mediasDperpPLICR[$c].";".$mediasDperpPLICL[$c].";".$mediasDperpRLICR[$c].";".$mediasDperpRLICL[$c].";".$mediasDperpACRR[$c].";".$mediasDperpACRL[$c].";".$mediasDperpSCRR[$c].";".$mediasDperpSCRL[$c].";".$mediasDperpPCRR[$c].";".$mediasDperpPCRL[$c].";".$mediasDperpPTRR[$c].";".$mediasDperpPTRL[$c].";".$mediasDperpSSR[$c].";".$mediasDperpSSL[$c].";".$mediasDperpECR[$c].";".$mediasDperpECL[$c].";".$mediasDperpCGCR[$c].";".$mediasDperpCGCL[$c].";".$mediasDperpCGHR[$c].";".$mediasDperpCGHL[$c].";".$mediasDperpFXSTR[$c].";".$mediasDperpFXSTL[$c].";".$mediasDperpSLFR[$c].";".$mediasDperpSLFL[$c].";".$mediasDperpSFOR[$c].";".$mediasDperpSFOL[$c].";".$mediasDperpIFOR[$c].";".$mediasDperpIFOL[$c].";".$mediasDperpUNCR[$c].";".$mediasDperpUNCL[$c].";".$mediasDperpTAPR[$c].";".$mediasDperpTAPL[$c]."\r";
	   $c=$c+1;
	}
 sub Processamento
{print"\n\n Obtendo dados do paciente...\n\n";
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
 $NomePaciente = substr($NomePasta,0,$Stop);
 $Stop = index($NomePasta,"_".$ano);
 $PrimNome = substr($NomePasta,0,$Stop);
 $sh->rm(" mincheader.txt");
 
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 print "\n\n Nome: $PrimNome \n\n";
 
#******************************Processamento das imegens********************************
  
  print"\n\n Iniciando Processamento...\n\n";
  
#**************************************************************************************
 @vectorarquivo = glob("./*_0_mpr.mnc.gz");
 $sh->gunzip(" ".$vectorarquivo[0]);
 @vectorarquivo = glob("./*_0_mpr.mnc");
 @vectorclass = glob("./*_classified.mnc.gz");
 
print"\n Nonlinear transformation...\n";

 $sh->mritotal(" -nonlinear -model icbm_avg_152_t1_tal_lin ".$vectorarquivo[0]." ".$PrimNome."_".$ano.$mes.$dia."_d1.xfm");
 $sh->mincresample(" -nearest_neighbour -short /usr/local/mni/data/mni_autoreg/ICBM_WMPM.mnc ".$PrimNome."_".$ano.$mes.$dia."_lbl.mnc -like /usr/local/mni/data/mni_autoreg/icbm_avg_152_t1_tal_lin.mnc -invert_transformation -transformation ".$PrimNome."_".$ano.$mes.$dia."_d1.xfm");
 $sh->mincmath(" -const2 3 3.99 -segment -int ".$vectorclass[0]." white_matter.mnc");
 $sh->gzip(" -f ./".$PrimNome."_".$ano.$mes.$dia."_lbl.mnc");
 $sh->gzip(" -f ./white_matter.mnc");
 $sh->res("white_matter ".$PrimNome."_".$ano.$mes.$dia."_lbl");
 $sh->mincmath(" -mult -int white_matter_res.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_lbl.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_label.mnc");
 $sh->gzip(" -f ./".$PrimNome."_".$ano.$mes.$dia."_label.mnc");
 $sh->gzip(" -f faMap_normalizada.mnc");
 $sh->gzip(" -f dMap_normalizada.mnc");
 $sh->rm("./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_label.mnc.gz");
 $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_label.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_label.mnc.gz");	
 #$sh->mv(" ./white_matter.mnc.gz ./Analise_mt_relaxo/white_matter.mnc.gz");
 
 $sh->mv(" ./faMap_normalizada.mnc.gz ./Analise_mt_relaxo/faMap_normalizada.mnc.gz");
 $sh->mv(" ./dMap_normalizada.mnc.gz ./Analise_mt_relaxo/dMap_normalizada.mnc.gz");
 #$sh->cp(" ".$vectorarquivo[0]." ./Analise_mt_relaxo");
 $sh->rm(" *.xfm");
 $sh->rm(" white_matter*");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_lbl.mnc.gz");
 
	chdir("Analise_mt_relaxo");
	 
	
	#FA
	#$sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_label faMap_normalizada ");
	$sh->minctracc(" -identity -lsq6  -use_nonisotropic ../".$vectorarquivo[0]." faMap_normalizada.mnc.gz transform.xfm");
	$sh->mincresample(" -nearest_neighbour -short ".$PrimNome."_".$ano.$mes.$dia."_label.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc -like faMap_normalizada.mnc.gz -transform transform.xfm");
	$sh->gzip(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc"); 
	
	#Middle cerebellar peduncle
	$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 1 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_MCP = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Pontine crossing tract (a part of MCP)
	$sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 2 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_PCT = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Genu of corpus callosum
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 3 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_GCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Body of corpus callosum
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 4 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_BCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
      #Splenium of corpus callosum
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 5 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	    #Fornix (column and body of fornix)
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 6 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_FX = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	     #Corticospinal tract right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 8 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_CSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Corticospinal tract left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 9 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_CSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Medial lemniscus right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 10 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_MLR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Medial lemniscus left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 11 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_MLL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior cerebellar peduncle right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 12 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_ICPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
  
     #Inferior cerebellar peduncle left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 13 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_ICPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Superior cerebellar peduncle right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 14 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SCPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior cerebellar peduncle left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 15 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SCPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cerebral peduncle right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 16 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_CPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Cerebral peduncle left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 17 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_CPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Anterior limb of internal capsule right
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 18 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_ALICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Anterior limb of internal capsule left
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 19 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_ALICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Posterior limb of internal capsule right
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 20 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_PLICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior limb of internal capsule left
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 21 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_PLICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Retrolenticular part of internal capsule right
	   $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 7 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_RLICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Retrolenticular part of internal capsule left
	   $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 22 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_RLICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Anterior corona radiata right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 23 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_ACRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Anterior corona radiata left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 24 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_ACRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	
	 #Superior corona radiata right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 25 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SCRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Superior corona radiata left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 26 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SCRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior corona radiata right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 27 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_PCRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior corona radiata left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 28 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_PCRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior thalamic radiation right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 29 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_PTRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Posterior thalamic radiation left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 30 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_PTRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Sagittal stratum Right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 31 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SSR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Sagittal stratum left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 32 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SSL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #External capsule right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 33 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_ECR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #External capsule left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 34 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_ECL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (cingulate gyrus) right
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 35 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_CGCR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Cingulum (cingulate gyrus) left
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 36 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_CGCL= substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (hippocampus) right
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 37 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_CGHR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (hippocampus) left
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 38 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_CGHL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Fornix (cres) / Stria terminalis (can not be resolved with current resolution) right
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 39 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_FXSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Fornix (cres) / Stria terminalis (can not be resolved with current resolution) left
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 40 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_FXSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior longitudinal fasciculus right
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 41 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SLFR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior longitudinal fasciculus left
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 42 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SLFL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Superior fronto-occipital fasciculus right 
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 43 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SFOR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Superior fronto-occipital fasciculus left
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 44 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_SFOL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior fronto-occipital fasciculus right
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 45 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_IFOR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior fronto-occipital fasciculus left
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 46 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_IFOL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Uncinate fasciculus right
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 47 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_UNCR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Uncinate fasciculus left
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 48 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_UNCL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Tapatum right
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 49 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_TAPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Tapatum left
	  $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 50 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_TAPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #fornado a matrix de dados
	 push(@mediasfaMCP,$media_fa_MCP);
	 push(@mediasfaPCT,$media_fa_PCT);
	 push(@mediasfaGCC,$media_fa_GCC);
	 push(@mediasfaBCC,$media_fa_BCC);
	 push(@mediasfaSCC,$media_fa_SCC);
	 push(@mediasfaFX,$media_fa_FX);
	 push(@mediasfaCSTR,$media_fa_CSTR);
	 push(@mediasfaCSTL,$media_fa_CSTL);
	 push(@mediasfaMLR,$media_fa_MLR);
	 push(@mediasfaMLL,$media_fa_MLL);
	 push(@mediasfaICPR,$media_fa_ICPR);
	 push(@mediasfaICPL,$media_fa_ICPL);
	 push(@mediasfaSCPR,$media_fa_SCPR);
	 push(@mediasfaSCPL,$media_fa_SCPL);
	 push(@mediasfaCPR,$media_fa_CPR);
	 push(@mediasfaCPL,$media_fa_CPL);
	 push(@mediasfaALICR,$media_fa_ALICR);
	 push(@mediasfaALICL,$media_fa_ALICL);
	 push(@mediasfaPLICR,$media_fa_PLICR);
	 push(@mediasfaPLICL,$media_fa_PLICL);
	 push(@mediasfaRLICR,$media_fa_RLICR);
	 push(@mediasfaRLICL,$media_fa_RLICL);
	 push(@mediasfaACRR,$media_fa_ACRR);
	 push(@mediasfaACRL,$media_fa_ACRL);
	 push(@mediasfaSCRR,$media_fa_SCRR);
	 push(@mediasfaSCRL,$media_fa_SCRL);
	 push(@mediasfaPCRR,$media_fa_PCRR);
	 push(@mediasfaPCRL,$media_fa_PCRL);
	 push(@mediasfaPTRR,$media_fa_PTRR);
	 push(@mediasfaPTRL,$media_fa_PTRL);
	 push(@mediasfaSSR,$media_fa_SSR);
	 push(@mediasfaSSL,$media_fa_SSL);
	 push(@mediasfaECR,$media_fa_ECR);
	 push(@mediasfaECL,$media_fa_ECL);
	 push(@mediasfaCGCR,$media_fa_CGCR);
	 push(@mediasfaCGCL,$media_fa_CGCL);
	 push(@mediasfaCGHR,$media_fa_CGHR);
	 push(@mediasfaCGHL,$media_fa_CGHL);
	 push(@mediasfaFXSTR,$media_fa_FXSTR);
	 push(@mediasfaFXSTL,$media_fa_FXSTL);
	 push(@mediasfaSLFR,$media_fa_SLFR);
	 push(@mediasfaSLFL,$media_fa_SLFL);
	 push(@mediasfaSFOR,$media_fa_SFOR);
	 push(@mediasfaSFOL,$media_fa_SFOL);
	 push(@mediasfaIFOR,$media_fa_IFOR);
	 push(@mediasfaIFOL,$media_fa_IFOL);
	 push(@mediasfaUNCR,$media_fa_UNCR);
	 push(@mediasfaUNCL,$media_fa_UNCL);
	 push(@mediasfaTAPR,$media_fa_TAPR);
	 push(@mediasfaTAPL,$media_fa_TAPL);
	#$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz"); 
	  
	 #Difusibilidade_media
	#$sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_label dMap_normalizada ");
	#Middle cerebellar peduncle
	$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 1 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_MCP = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Pontine crossing tract (a part of MCP)
	$sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 2 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_PCT = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Genu of corpus callosum
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 3 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_GCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Body of corpus callosum
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 4 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_BCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
      #Splenium of corpus callosum
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 5 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	    #Fornix (column and body of fornix)
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 6 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_FX = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	     #Corticospinal tract right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 8 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_CSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Corticospinal tract left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 9 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_CSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Medial lemniscus right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 10 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_MLR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Medial lemniscus left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 11 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_MLL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior cerebellar peduncle right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 12 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_ICPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
  
     #Inferior cerebellar peduncle left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 13 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_ICPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Superior cerebellar peduncle right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 14 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SCPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior cerebellar peduncle left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 15 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SCPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cerebral peduncle right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 16 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_CPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Cerebral peduncle left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 17 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_CPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Anterior limb of internal capsule right
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 18 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_ALICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Anterior limb of internal capsule left
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 19 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_ALICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Posterior limb of internal capsule right
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 20 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_PLICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior limb of internal capsule left
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 21 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_PLICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Retrolenticular part of internal capsule right
	   $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 7 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_RLICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Retrolenticular part of internal capsule left
	   $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 22 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_RLICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Anterior corona radiata right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 23 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_ACRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Anterior corona radiata left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 24 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_ACRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	
	 #Superior corona radiata right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 25 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SCRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Superior corona radiata left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 26 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SCRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior corona radiata right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 27 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_PCRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior corona radiata left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 28 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_PCRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior thalamic radiation right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 29 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_PTRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Posterior thalamic radiation left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 30 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_PTRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Sagittal stratum Right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 31 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SSR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Sagittal stratum left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 32 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SSL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #External capsule right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 33 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_ECR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #External capsule left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 34 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_ECL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (cingulate gyrus) right
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 35 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_CGCR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Cingulum (cingulate gyrus) left
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 36 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_CGCL= substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (hippocampus) right
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 37 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_CGHR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (hippocampus) left
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 38 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_CGHL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Fornix (cres) / Stria terminalis (can not be resolved with current resolution) right
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 39 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_FXSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Fornix (cres) / Stria terminalis (can not be resolved with current resolution) left
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 40 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_FXSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior longitudinal fasciculus right
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 41 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SLFR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior longitudinal fasciculus left
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 42 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SLFL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Superior fronto-occipital fasciculus right 
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 43 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SFOR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Superior fronto-occipital fasciculus left
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 44 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_SFOL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior fronto-occipital fasciculus right
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 45 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_IFOR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior fronto-occipital fasciculus left
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 46 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_IFOL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Uncinate fasciculus right
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 47 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_UNCR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Uncinate fasciculus left
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 48 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_UNCL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Tapatum right
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 49 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_TAPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Tapatum left
	  $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 50 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_TAPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #fornado a matrix de dados
	 push(@mediasdMapMCP,$media_dMap_MCP);
	 push(@mediasdMapPCT,$media_dMap_PCT);
	 push(@mediasdMapGCC,$media_dMap_GCC);
	 push(@mediasdMapBCC,$media_dMap_BCC);
	 push(@mediasdMapSCC,$media_dMap_SCC);
	 push(@mediasdMapFX,$media_dMap_FX);
	 push(@mediasdMapCSTR,$media_dMap_CSTR);
	 push(@mediasdMapCSTL,$media_dMap_CSTL);
	 push(@mediasdMapMLR,$media_dMap_MLR);
	 push(@mediasdMapMLL,$media_dMap_MLL);
	 push(@mediasdMapICPR,$media_dMap_ICPR);
	 push(@mediasdMapICPL,$media_dMap_ICPL);
	 push(@mediasdMapSCPR,$media_dMap_SCPR);
	 push(@mediasdMapSCPL,$media_dMap_SCPL);
	 push(@mediasdMapCPR,$media_dMap_CPR);
	 push(@mediasdMapCPL,$media_dMap_CPL);
	 push(@mediasdMapALICR,$media_dMap_ALICR);
	 push(@mediasdMapALICL,$media_dMap_ALICL);
	 push(@mediasdMapPLICR,$media_dMap_PLICR);
	 push(@mediasdMapPLICL,$media_dMap_PLICL);
	 push(@mediasdMapRLICR,$media_dMap_RLICR);
	 push(@mediasdMapRLICL,$media_dMap_RLICL);
	 push(@mediasdMapACRR,$media_dMap_ACRR);
	 push(@mediasdMapACRL,$media_dMap_ACRL);
	 push(@mediasdMapSCRR,$media_dMap_SCRR);
	 push(@mediasdMapSCRL,$media_dMap_SCRL);
	 push(@mediasdMapPCRR,$media_dMap_PCRR);
	 push(@mediasdMapPCRL,$media_dMap_PCRL);
	 push(@mediasdMapPTRR,$media_dMap_PTRR);
	 push(@mediasdMapPTRL,$media_dMap_PTRL);
	 push(@mediasdMapSSR,$media_dMap_SSR);
	 push(@mediasdMapSSL,$media_dMap_SSL);
	 push(@mediasdMapECR,$media_dMap_ECR);
	 push(@mediasdMapECL,$media_dMap_ECL);
	 push(@mediasdMapCGCR,$media_dMap_CGCR);
	 push(@mediasdMapCGCL,$media_dMap_CGCL);
	 push(@mediasdMapCGHR,$media_dMap_CGHR);
	 push(@mediasdMapCGHL,$media_dMap_CGHL);
	 push(@mediasdMapFXSTR,$media_dMap_FXSTR);
	 push(@mediasdMapFXSTL,$media_dMap_FXSTL);
	 push(@mediasdMapSLFR,$media_dMap_SLFR);
	 push(@mediasdMapSLFL,$media_dMap_SLFL);
	 push(@mediasdMapSFOR,$media_dMap_SFOR);
	 push(@mediasdMapSFOL,$media_dMap_SFOL);
	 push(@mediasdMapIFOR,$media_dMap_IFOR);
	 push(@mediasdMapIFOL,$media_dMap_IFOL);
	 push(@mediasdMapUNCR,$media_dMap_UNCR);
	 push(@mediasdMapUNCL,$media_dMap_UNCL);
	 push(@mediasdMapTAPR,$media_dMap_TAPR);
	 push(@mediasdMapTAPL,$media_dMap_TAPL);
	#$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz"); 
	 
	 #Dpara
	#$sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_label ".$PrimNome."_Dpara ");
	#Middle cerebellar peduncle
	$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 1 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_MCP = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Pontine crossing tract (a part of MCP)
	$sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 2 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_PCT = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Genu of corpus callosum
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 3 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_GCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Body of corpus callosum
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 4 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_BCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
      #Splenium of corpus callosum
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 5 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	    #Fornix (column and body of fornix)
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 6 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_FX = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	     #Corticospinal tract right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 8 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_CSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Corticospinal tract left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 9 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_CSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Medial lemniscus right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 10 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_MLR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Medial lemniscus left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 11 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_MLL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior cerebellar peduncle right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 12 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_ICPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
  
     #Inferior cerebellar peduncle left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 13 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_ICPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Superior cerebellar peduncle right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 14 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SCPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior cerebellar peduncle left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 15 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SCPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cerebral peduncle right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 16 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_CPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Cerebral peduncle left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 17 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_CPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Anterior limb of internal capsule right
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 18 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_ALICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Anterior limb of internal capsule left
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 19 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_ALICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Posterior limb of internal capsule right
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 20 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_PLICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior limb of internal capsule left
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 21 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_PLICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Retrolenticular part of internal capsule right
	   $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 6 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_RLICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Retrolenticular part of internal capsule left
	   $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 22 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_RLICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Anterior corona radiata right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 23 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_ACRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Anterior corona radiata left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 24 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_ACRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	
	 #Superior corona radiata right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 25 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SCRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Superior corona radiata left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 26 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SCRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior corona radiata right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 27 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_PCRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior corona radiata left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 28 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_PCRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior thalamic radiation right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 29 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_PTRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Posterior thalamic radiation left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 30 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_PTRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Sagittal stratum Right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 31 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SSR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Sagittal stratum left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 32 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SSL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #External capsule right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 33 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_ECR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #External capsule left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 34 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_ECL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (cingulate gyrus) right
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 35 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_CGCR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Cingulum (cingulate gyrus) left
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 36 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_CGCL= substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (hippocampus) right
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 37 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_CGHR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (hippocampus) left
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 38 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_CGHL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Fornix (cres) / Stria terminalis (can not be resolved with current resolution) right
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 39 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_FXSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Fornix (cres) / Stria terminalis (can not be resolved with current resolution) left
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 40 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_FXSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior longitudinal fasciculus right
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 41 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SLFR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior longitudinal fasciculus left
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 42 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SLFL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Superior fronto-occipital fasciculus right 
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 43 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SFOR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Superior fronto-occipital fasciculus left
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 44 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_SFOL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior fronto-occipital fasciculus right
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 45 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_IFOR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior fronto-occipital fasciculus left
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 46 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_IFOL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Uncinate fasciculus right
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 47 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_UNCR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Uncinate fasciculus left
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 48 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_UNCL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Tapatum right
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 49 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_TAPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Tapatum left
	  $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 50 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_TAPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #fornado a matrix de dados
	 push(@mediasDparaMCP,$media_Dpara_MCP);
	 push(@mediasDparaPCT,$media_Dpara_PCT);
	 push(@mediasDparaGCC,$media_Dpara_GCC);
	 push(@mediasDparaBCC,$media_Dpara_BCC);
	 push(@mediasDparaSCC,$media_Dpara_SCC);
	 push(@mediasDparaFX,$media_Dpara_FX);
	 push(@mediasDparaCSTR,$media_Dpara_CSTR);
	 push(@mediasDparaCSTL,$media_Dpara_CSTL);
	 push(@mediasDparaMLR,$media_Dpara_MLR);
	 push(@mediasDparaMLL,$media_Dpara_MLL);
	 push(@mediasDparaICPR,$media_Dpara_ICPR);
	 push(@mediasDparaICPL,$media_Dpara_ICPL);
	 push(@mediasDparaSCPR,$media_Dpara_SCPR);
	 push(@mediasDparaSCPL,$media_Dpara_SCPL);
	 push(@mediasDparaCPR,$media_Dpara_CPR);
	 push(@mediasDparaCPL,$media_Dpara_CPL);
	 push(@mediasDparaALICR,$media_Dpara_ALICR);
	 push(@mediasDparaALICL,$media_Dpara_ALICL);
	 push(@mediasDparaPLICR,$media_Dpara_PLICR);
	 push(@mediasDparaPLICL,$media_Dpara_PLICL);
	 push(@mediasDparaRLICR,$media_Dpara_RLICR);
	 push(@mediasDparaRLICL,$media_Dpara_RLICL);
	 push(@mediasDparaACRR,$media_Dpara_ACRR);
	 push(@mediasDparaACRL,$media_Dpara_ACRL);
	 push(@mediasDparaSCRR,$media_Dpara_SCRR);
	 push(@mediasDparaSCRL,$media_Dpara_SCRL);
	 push(@mediasDparaPCRR,$media_Dpara_PCRR);
	 push(@mediasDparaPCRL,$media_Dpara_PCRL);
	 push(@mediasDparaPTRR,$media_Dpara_PTRR);
	 push(@mediasDparaPTRL,$media_Dpara_PTRL);
	 push(@mediasDparaSSR,$media_Dpara_SSR);
	 push(@mediasDparaSSL,$media_Dpara_SSL);
	 push(@mediasDparaECR,$media_Dpara_ECR);
	 push(@mediasDparaECL,$media_Dpara_ECL);
	 push(@mediasDparaCGCR,$media_Dpara_CGCR);
	 push(@mediasDparaCGCL,$media_Dpara_CGCL);
	 push(@mediasDparaCGHR,$media_Dpara_CGHR);
	 push(@mediasDparaCGHL,$media_Dpara_CGHL);
	 push(@mediasDparaFXSTR,$media_Dpara_FXSTR);
	 push(@mediasDparaFXSTL,$media_Dpara_FXSTL);
	 push(@mediasDparaSLFR,$media_Dpara_SLFR);
	 push(@mediasDparaSLFL,$media_Dpara_SLFL);
	 push(@mediasDparaSFOR,$media_Dpara_SFOR);
	 push(@mediasDparaSFOL,$media_Dpara_SFOL);
	 push(@mediasDparaIFOR,$media_Dpara_IFOR);
	 push(@mediasDparaIFOL,$media_Dpara_IFOL);
	 push(@mediasDparaUNCR,$media_Dpara_UNCR);
	 push(@mediasDparaUNCL,$media_Dpara_UNCL);
	 push(@mediasDparaTAPR,$media_Dpara_TAPR);
	 push(@mediasDparaTAPL,$media_Dpara_TAPL);
	#$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz"); 
	print "\n\n\n Dpara: ".$media_Dpara_CGHR."\n\n";
	#Dperp
	#$sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_label ".$PrimNome."_Dperp ");
	#Middle cerebellar peduncle
	$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 1 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_MCP = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Pontine crossing tract (a part of MCP)
	$sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 2 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_PCT = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Genu of corpus callosum
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 3 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_GCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Body of corpus callosum
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 4 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_BCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
      #Splenium of corpus callosum
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 5 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SCC = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	    #Fornix (column and body of fornix)
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 6 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_FX = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	     #Corticospinal tract right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 8 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_CSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Corticospinal tract left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 9 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_CSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Medial lemniscus right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 10 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_MLR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Medial lemniscus left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 11 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_MLL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior cerebellar peduncle right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 12 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_ICPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
  
     #Inferior cerebellar peduncle left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 13 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_ICPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Superior cerebellar peduncle right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 14 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SCPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior cerebellar peduncle left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 15 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SCPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cerebral peduncle right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 16 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_CPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Cerebral peduncle left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 17 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_CPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Anterior limb of internal capsule right
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 18 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_ALICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Anterior limb of internal capsule left
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 19 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_ALICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Posterior limb of internal capsule right
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 20 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_PLICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior limb of internal capsule left
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 21 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_PLICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Retrolenticular part of internal capsule right
	   $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 7 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_RLICR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Retrolenticular part of internal capsule left
	   $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 22 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_RLICL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Anterior corona radiata right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 23 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_ACRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Anterior corona radiata left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 24 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_ACRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	
	 #Superior corona radiata right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 25 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SCRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Superior corona radiata left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 26 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SCRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior corona radiata right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 27 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_PCRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior corona radiata left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 28 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_PCRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Posterior thalamic radiation right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 29 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_PTRR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Posterior thalamic radiation left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 30 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_PTRL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Sagittal stratum Right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 31 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SSR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Sagittal stratum left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 32 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SSL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #External capsule right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 33 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_ECR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #External capsule left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 34 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_ECL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (cingulate gyrus) right
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 35 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_CGCR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Cingulum (cingulate gyrus) left
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 36 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_CGCL= substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (hippocampus) right
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 37 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_CGHR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Cingulum (hippocampus) left
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 38 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_CGHL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Fornix (cres) / Stria terminalis (can not be resolved with current resolution) right
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 39 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_FXSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Fornix (cres) / Stria terminalis (can not be resolved with current resolution) left
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 40 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_FXSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior longitudinal fasciculus right
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 41 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SLFR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Superior longitudinal fasciculus left
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 42 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SLFL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Superior fronto-occipital fasciculus right 
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 43 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SFOR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Superior fronto-occipital fasciculus left
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 44 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_SFOL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior fronto-occipital fasciculus right
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 45 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_IFOR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Inferior fronto-occipital fasciculus left
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 46 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_IFOL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Uncinate fasciculus right
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 47 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_UNCR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  #Uncinate fasciculus left
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 48 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_UNCL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Tapatum right
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 49 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_TAPR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Tapatum left
	  $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 50 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_TAPL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #fornado a matrix de dados
	 push(@mediasDperpMCP,$media_Dperp_MCP);
	 push(@mediasDperpPCT,$media_Dperp_PCT);
	 push(@mediasDperpGCC,$media_Dperp_GCC);
	 push(@mediasDperpBCC,$media_Dperp_BCC);
	 push(@mediasDperpSCC,$media_Dperp_SCC);
	 push(@mediasDperpFX,$media_Dperp_FX);
	 push(@mediasDperpCSTR,$media_Dperp_CSTR);
	 push(@mediasDperpCSTL,$media_Dperp_CSTL);
	 push(@mediasDperpMLR,$media_Dperp_MLR);
	 push(@mediasDperpMLL,$media_Dperp_MLL);
	 push(@mediasDperpICPR,$media_Dperp_ICPR);
	 push(@mediasDperpICPL,$media_Dperp_ICPL);
	 push(@mediasDperpSCPR,$media_Dperp_SCPR);
	 push(@mediasDperpSCPL,$media_Dperp_SCPL);
	 push(@mediasDperpCPR,$media_Dperp_CPR);
	 push(@mediasDperpCPL,$media_Dperp_CPL);
	 push(@mediasDperpALICR,$media_Dperp_ALICR);
	 push(@mediasDperpALICL,$media_Dperp_ALICL);
	 push(@mediasDperpPLICR,$media_Dperp_PLICR);
	 push(@mediasDperpPLICL,$media_Dperp_PLICL);
	 push(@mediasDperpRLICR,$media_Dperp_RLICR);
	 push(@mediasDperpRLICL,$media_Dperp_RLICL);
	 push(@mediasDperpACRR,$media_Dperp_ACRR);
	 push(@mediasDperpACRL,$media_Dperp_ACRL);
	 push(@mediasDperpSCRR,$media_Dperp_SCRR);
	 push(@mediasDperpSCRL,$media_Dperp_SCRL);
	 push(@mediasDperpPCRR,$media_Dperp_PCRR);
	 push(@mediasDperpPCRL,$media_Dperp_PCRL);
	 push(@mediasDperpPTRR,$media_Dperp_PTRR);
	 push(@mediasDperpPTRL,$media_Dperp_PTRL);
	 push(@mediasDperpSSR,$media_Dperp_SSR);
	 push(@mediasDperpSSL,$media_Dperp_SSL);
	 push(@mediasDperpECR,$media_Dperp_ECR);
	 push(@mediasDperpECL,$media_Dperp_ECL);
	 push(@mediasDperpCGCR,$media_Dperp_CGCR);
	 push(@mediasDperpCGCL,$media_Dperp_CGCL);
	 push(@mediasDperpCGHR,$media_Dperp_CGHR);
	 push(@mediasDperpCGHL,$media_Dperp_CGHL);
	 push(@mediasDperpFXSTR,$media_Dperp_FXSTR);
	 push(@mediasDperpFXSTL,$media_Dperp_FXSTL);
	 push(@mediasDperpSLFR,$media_Dperp_SLFR);
	 push(@mediasDperpSLFL,$media_Dperp_SLFL);
	 push(@mediasDperpSFOR,$media_Dperp_SFOR);
	 push(@mediasDperpSFOL,$media_Dperp_SFOL);
	 push(@mediasDperpIFOR,$media_Dperp_IFOR);
	 push(@mediasDperpIFOL,$media_Dperp_IFOL);
	 push(@mediasDperpUNCR,$media_Dperp_UNCR);
	 push(@mediasDperpUNCL,$media_Dperp_UNCL);
	 push(@mediasDperpTAPR,$media_Dperp_TAPR);
	 push(@mediasDperpTAPL,$media_Dperp_TAPL);
	#$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz"); 
	$sh->rm(" *.xfm");
chdir("..");	 
chdir("..");
}