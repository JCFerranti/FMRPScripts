#!/usr/bin/perl -W

###################################################################################################
#Autor:Paula Rejane Beserra Diniz 
#paula.rejane@gmail.com                                                                                                                                              #
#Ribeirao Preto,31 de Março de 2011                                                                                                                                        #
#versao 1.0                                                                                                                                                                                       #
###################################################################################################
#@NAME       :process_CSTract.pl
#@INPUT      : os mapas, MPR e o atlas
#@OUTPUT     : Dados_Relaxometria_CSTract.txt,Dados_MTR_CSTract.txt,Dados_faMap_CSTract.txt
#              Dados_Difusibilidade_media_CSTract.txt, Dados_Dperp_CSTract.txt
#@RETURNS    : 
#@DESCRIPTION: segmentação do trato corticoespinal e extração dos valores de MTR,tempo de relaxação,
#              FA, difusibilidade média, Difusibilidade paralela e difusibilidade perpendicular
###################################################################################################
# Copyright Paula Rejane Beserra Diniz, Universidade de São Paulo.
# Permission to use, copy, and modify this software and its
# documentation for any purpose and without fee is hereby granted,
# provided that the above copyright notice appear in all copies.  The
# author and the University of São Paulo make no representations about the
# suitability of this software for any purpose.  It is provided "as is"
# without express or implied warranty.
###################################################################################################

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
 
 	open(RELATDADOS, "> Dados_Relaxometria_CSTract.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Corticospinal tract right;Corticospinal tract left;\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasrelaxoCSTR[$c].";".$mediasrelaxoCSTL[$c]."\r";
	   $c=$c+1;
	}
	
	 open(RELATDADOS, "> Dados_MTR_CSTract.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Corticospinal tract right;Corticospinal tract left;\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasmtCSTR[$c].";".$mediasmtCSTL[$c]."\r";
	   $c=$c+1;
	}
	
	open(RELATDADOS, "> Dados_faMap_CSTract.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Corticospinal tract right;Corticospinal tract left;\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasfaCSTR[$c].";".$mediasfaCSTL[$c]."\r";
	   $c=$c+1;
	}
	
	open(RELATDADOS, "> Dados_Difusibilidade_media_CSTract.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Corticospinal tract right;Corticospinal tract left;\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasdMapCSTR[$c].";".$mediasdMapCSTL[$c]."\r";
	   $c=$c+1;
	}
	
	open(RELATDADOS, "> Dados_Dpara_CSTract.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Corticospinal tract right;Corticospinal tract left;\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasDparaCSTR[$c].";".$mediasDparaCSTL[$c]."\r";
	   $c=$c+1;
	}
	
	open(RELATDADOS, "> Dados_Dperp_CSTract.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Corticospinal tract right;Corticospinal tract left;\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasDperpCSTR[$c].";".$mediasDperpCSTL[$c]."\r";
	   $c=$c+1;
	}
  
  print "\n\n\n Trabalho realizado \n\n";
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
 #$NomePaciente = substr($NomePasta,0,$Stop);
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
 $sh->mincresample(" -nearest_neighbour -short /usr/local/mni/data/mni_autoreg/CSTract.mnc ".$PrimNome."_".$ano.$mes.$dia."_lbl.mnc -like /usr/local/mni/data/mni_autoreg/icbm_avg_152_t1_tal_lin.mnc -invert_transformation -transformation ".$PrimNome."_".$ano.$mes.$dia."_d1.xfm");
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
	#relaxometria
	$sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_label ".$PrimNome."_relaxo ");
	# Corticospinal tract right 
	$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 1 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_relaxo_CSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Corticospinal tract left
	$sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 2 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_relaxo_CSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");  
	 
	 #fornado a matrix de dados
	 push(@mediasrelaxoCSTR,$media_relaxo_CSTR);
	 push(@mediasrelaxoCSTL,$media_relaxo_CSTL);
	 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz"); 
    
    #MTR
	$sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_label ".$PrimNome."_".$ano.$mes.$dia."_mt");
	#Corticospinal tract right
	$sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 1 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_mt_CSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	 #Corticospinal tract left
	 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 2 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_mt_CSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	
	 
	 #fornado a matrix de dados
	 push(@mediasmtCSTR,$media_mt_CSTR);
	 push(@mediasmtCSTL,$media_mt_CSTL);
	 
	$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz"); 
	
	#FA
	#$sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_label faMap_normalizada ");
	$sh->minctracc(" -identity -lsq6  -use_nonisotropic ../".$vectorarquivo[0]." faMap_normalizada.mnc.gz transform.xfm");
	$sh->mincresample(" -nearest_neighbour -short ".$PrimNome."_".$ano.$mes.$dia."_label.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc -like faMap_normalizada.mnc.gz -transform transform.xfm");
	$sh->gzip(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc"); 
	
		     #Corticospinal tract right
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 1 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_CSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Corticospinal tract left
	 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 2 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_fa_CSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	  
	 
	 #fornado a matrix de dados
	 
	 push(@mediasfaCSTR,$media_fa_CSTR);
	 push(@mediasfaCSTL,$media_fa_CSTL);
	 
	#$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz"); 
	  
	 #Difusibilidade_media
	#$sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_label dMap_normalizada ");
	
	 
	     #Corticospinal tract right
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 1 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_CSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Corticospinal tract left
	 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 2 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_dMap_CSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   
	 
	 #fornado a matrix de dados
	
	 push(@mediasdMapCSTR,$media_dMap_CSTR);
	 push(@mediasdMapCSTL,$media_dMap_CSTL);
	 
	#$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz"); 
	 
	 #Dpara
	#$sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_label ".$PrimNome."_Dpara ");
	
	 
	     #Corticospinal tract right
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 1 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_CSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Corticospinal tract left
	 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 2 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dpara_CSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   
	 
	 #fornado a matrix de dados
	
	 push(@mediasDparaCSTR,$media_Dpara_CSTR);
	 push(@mediasDparaCSTL,$media_Dpara_CSTL);
	 
	#$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz"); 
	#print "\n\n\n Dpara: ".$media_Dpara_CSTL."\n\n";
	#Dperp
	#$sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_label ".$PrimNome."_Dperp ");
	
	 
	     #Corticospinal tract right
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 1 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_CSTR = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   #Corticospinal tract left
	 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz -mask_binvalue 2 > volume1.txt");
	 $tag1 = $sh->grep(" Mean volume1.txt");
	 $temp1 = substr($tag1,rindex($tag1,":")+15);
	 $media_Dperp_CSTL = substr($temp1,0,rindex($temp1," "));
	 $sh->rm("volume1.txt");
	 
	   
	 #fornado a matrix de dados
	 push(@mediasDperpCSTR,$media_Dperp_CSTR);
	 push(@mediasDperpCSTL,$media_Dperp_CSTL);
	 #$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_label_res.mnc.gz"); 
   
   
	$sh->rm(" *.xfm");
chdir("..");	 
chdir("..");
}