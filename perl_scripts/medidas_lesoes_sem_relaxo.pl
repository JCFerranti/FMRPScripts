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

open(RELATDADOS, "> dados_Relaxo_MT_Lesoes.txt");
    $tam =@nomes;
	print RELATDADOS " ,Relaxo, , MT ,,Dpara,,Dperp \r";
    print RELATDADOS "nome,Media,Desvio Padrão, Media, Desvio Padrão,Media, Desvio Padrão, Media, Desvio Padrão \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$mediasrelaxoLt1[$c].",".$desviorelaxoLt1[$c].",".$mediasmtLt1[$c].",".$desviomtLt1[$c].",".$mediasDparaL[$c].",".$desvioDparaL.",".$mediasDperpL[$c].",".$desvioDperpL."\r";
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
	   $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_lbl.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_lbl.mnc.gz");
#**************************************************************************************
   	 chdir("Analise_mt_relaxo");
	   
   #lesoes
 
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_".$ano.$mes.$dia."_mt");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_Lt1 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_Lt1 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");
  
  #Dparalelo
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_Dpara ");
 $sh->mincstats(" -mean ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dpara_L = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_Dpara.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_Dpara_L = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz");
  
  #Dperpendicular
 $sh->res(" ".$PrimNome."_".$ano.$mes.$dia."_lbl ".$PrimNome."_Dperp ");
 $sh->mincstats(" -mean ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_Dperp_L = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_Dperp.mnc.gz -mask ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_Dperp_L = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_lbl_res.mnc.gz"); 
  
  
  push(@mediasmtLt1,$media_mt_Lt1);
  
  push(@desviomtLt1,$desvio_mt_Lt1);
    
  push(@mediasDparaL,$media_Dpara_L);
  push(@mediasDperpL,$media_Dperp_L);
  push(@desvioDparaL,$desvio_Dpara_L);
  push(@desvioDperpL,$desvio_Dperp_L);
  chdir("..");

  chdir(".."); 

}

