#!/usr/bin/perl -W

#####################################################################
#Autor:Jaqueline Macarios e Rafael Menezes                                                                                                                                               #
#Ribeirao Preto,24 de janeiro de 2014                                                                                                                                         #
#versao 1.0                                                                                                                                                                                       #                                                      #
#                                                   							                                                                           #
#                                                    - Análise do histograma do MTR, Relaxometria, Difusão e FA do Tumor e da substância branca                                      #
#                                                    - Análise Golobal - mapas: média                                                      #
#####################################################################
#@NAME       : tumor.pl
#@INPUT      : 
#@OUTPUT     : quantitative_tumor.txt
#@RETURNS    : 
#@DESCRIPTION: Criação de um mapa voxel por voxel da distribuição espacial da transferencia de magnetização, Relaxometria, Difusão e FA na região tumoral e na suabstância Branca do cérebro humano.

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

open(RELATDADOS, "> dados_tumor.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Relaxo;MT;Dpara;Dperp;Dmedia;FA;Relaxo_WM;MT_WM;Dpara_WM;Dperp_WM;Dmedia;FA \r";
   #print RELATDADOS "nome;Media; Media; Desvio Padrão;Media; Desvio Padrão; Media; Desvio Padrão \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasrelaxoLt1[$c].";".$mediasmtLt1[$c].";".$mediasDparaL[$c].";".$mediasDperpL[$c].";".$mediasdMap[$c].";".$mediasfaMap[$c].";".$mediasrelaxoLt12[$c].";".$mediasmtLt12[$c].";".$mediasDparaL2[$c].";".$mediasDperpL2[$c].";".$mediasdMap2[$c].";".$mediasfaMap2[$c]."\r";
	  $c=$c+1;
	}	
	
&analise_global;
#=============================================================================
sub Processamento
{print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
  print "\n\n".$pastas[0]."\n\n";
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
 print "\n\n Primeiro nome: $PrimNome \n\n";
  print "\n\n".$pastas [0]."\n\n";
#******************************Processamento das imegens********************************
  
  print"\n\n Iniciando Processamento...\n\n";
   $sh->gzip(" ".$PrimNome."_".$ano.$mes.$dia."_lbl.mnc");
	   #$sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_lbl.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_lbl.mnc.gz");
#**************************************************************************************
   	 chdir("Analise_mt_relaxo");
	   
   #lesoes
  #Relaxo
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_relaxo");
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $sh->mincstats(" -histogram histogram_relaxo_lesao.txt ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Lt1 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");
 
  #MT
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_".$ano.$mes.$dia."_mt");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $sh->mincstats(" -histogram histogram_mt_lesao.txt ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_Lt1 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");
 
  #Dparalelo
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_Dpara ");
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $sh->mincstats(" -histogram histogram_dpara_lesao.txt ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_L = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");
 
  #Dperpendicular
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_Dperp ");
 $sh->mincstats(" -mean ".$PrimNome."_dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $sh->mincstats(" -histogram histogram_dperp_lesao.txt ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_L = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");

  #Dmédia
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl dMap_normalizada ");
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $sh->mincstats(" -histogram histogram_dmedia_lesao.txt dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");

  #FA
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl faMap_normalizada ");
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $sh->mincstats(" -histogram histogram_fa_lesao.txt faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_faMap = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");

  #Subst Branca
  #Relaxo
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_relaxo");
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $sh->mincstats(" -histogram histogram_relaxo_WM.txt ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_Lt12 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");

  #MT
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_".$ano.$mes.$dia."_mt");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $sh->mincstats(" -histogram histogram_mt_WM.txt ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_Lt12 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");
 
  #Dparalelo
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_Dpara ");
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $sh->mincstats(" -histogram histogram_dpara_WM.txt ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_L2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");
  
  #Dperpendicular
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_Dperp ");
 $sh->mincstats(" -mean ".$PrimNome."_dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $sh->mincstats(" -histogram histogram_dperp_WM.txt ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_L2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");

  #Dmédia
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl dMap_normalizada ");
 $sh->mincstats(" -mean dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $sh->mincstats(" -histogram histogram_dmedia_WM.txt dMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_dMap_2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");

  #FA
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl faMap_normalizada ");
 $sh->mincstats(" -mean faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $sh->mincstats(" -histogram histogram_fa_WM.txt faMap_normalizada.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 2");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_faMap_2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm($PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");
  
  push(@mediasrelaxoLt1,$media_relaxo_Lt1);
  push(@mediasmtLt1,$media_mt_Lt1);
  push(@mediasrelaxoLt12,$media_relaxo_Lt12);
  push(@mediasmtLt12,$media_mt_Lt12);
  
    
  push(@mediasDparaL,$media_Dpara_L);
  push(@mediasDperpL,$media_Dperp_L);
  push(@mediasdMap,$media_dMap);
  push(@mediasfaMap,$media_faMap);
  push(@mediasDparaL2,$media_Dpara_L2);
  push(@mediasDperpL2,$media_Dperp_L2);
  push(@mediasdMap2,$media_dMap_2);
  push(@mediasfaMap2,$media_faMap_2);  
  
  chdir("..");

  chdir(".."); 

}

