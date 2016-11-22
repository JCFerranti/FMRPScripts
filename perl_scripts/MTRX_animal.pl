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

open(RELATDADOS, "> dados_Relaxo_hipocampo.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Media_direito;Desvio Padrão direito; Media esquerdo; Desvio Padrão esquerdo \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasrelaxodir[$c].";".$desviorelaxodir[$c].";".$mediasrelaxoesq[$c].";".$desviorelaxoesq[$c]."\r";
	  $c=$c+1;
	}
open(RELATDADOS, "> dados_MT_hipocampo.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Media_direito;Desvio Padrão direito; Media esquerdo; Desvio Padrão esquerdo \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasmtdir[$c].";".$desviomtdir[$c].";".$mediasmtesq[$c].";".$desviomtesq[$c]."\r";
	  $c=$c+1;
	}
open(RELATDADOS, "> dados_adc_hipocampo.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Media_direito;Desvio Padrão direito; Media esquerdo; Desvio Padrão esquerdo \r";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$mediasadcdir[$c].";".$desvioadcdir[$c].";".$mediasadcesq[$c].";".$desvioadcesq[$c]."\r";
	  $c=$c+1;
	}
	
#=============================================================================
sub Processamento
{print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
  print "\n\n".$pastas[0]."\n\n";
 @d1 = glob("./*_0_d1.mnc.gz");
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
  
#**************************************************************************************
  #---> Gerando a Imagem de MTR
  print"\n\n 1ª etapa de 6) MTR...\n\n";
  
  #$sh->mritoself(" -close ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.xfm");
  #$sh->mincresample(" ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transformation ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.xfm");
  
  #$sh->mincmath(" -pd -const 10 ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_d2tod1.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
  $sh->mincmath(" -pd -const 10 ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
	
	 print"\n\n Gerando Relaxo...\n\n";
	 print "\n\n".$pastas[0]."\n\n";
	 print"\n\n 1° Passo) Iniciando RelaxoN...\n\n";
     require "/usr/local/bic/scripts/relaxon.pl";
     &main; 
     $sh->mv(" relaxom.mnc ./".$PrimNome."_relaxo.mnc");
     $sh->mv(" density.mnc ./".$PrimNome."_density.mnc"); 
     $sh->gzip(" *.mnc");
	 print "\n\n".$pastas[0]."\n\n";

@label = glob("./*_lbl.mnc.gz"); 
@adc = glob("./*_adc.mnc.gz");
$sh->mv(" ".$label[0]." ./".$PrimNome."_0_lbl.mnc.gz");
$sh->mv(" ".$adc[0]." ./".$PrimNome."_0_adc.mnc.gz");

# Análises MT e Relaxo 
  print"\n\n Obtendo dados da Relaxo e do MT...\n\n";
#Subtsancia relaxo_dir
 $sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_relaxo ");
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_dir = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_dir = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 #relaxo_esq
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_esq = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_esq = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_0_lbl_res.mnc.gz");
 
 #MTR
# MTR_dir
 
 $sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_".$ano.$mes.$dia."_mt ");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_dir = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_dir = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_esq = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_esq = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 $sh->rm(" ".$PrimNome."_0_lbl_res.mnc.gz");
 
 #ADC
# ADC
 
 $sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_0_adc ");
 $sh->mincstats(" -mean ".$PrimNome."_0_adc.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_adc_dir = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_0_adc.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_adc_dir = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 
  $sh->mincstats(" -mean ".$PrimNome."_0_adc.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_adc_esq = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_0_adc.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_adc_esq = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->rm(" ".$PrimNome."_0_lbl_res.mnc.gz");
  
   
  push(@mediasrelaxodir,$media_relaxo_dir);
  push(@mediasmtdir,$media_mt_dir);
  push(@mediasadcdir,$media_adc_dir);
  push(@desviorelaxodir,$desvio_relaxo_dir);
  push(@desviomtdir,$desvio_mt_dir);
  push(@desvioadcdir,$desvio_adc_dir);
  
  push(@mediasrelaxoesq,$media_relaxo_esq);
  push(@mediasmtesq,$media_mt_esq);
  push(@mediasadcesq,$media_adc_esq);
  push(@desviorelaxoesq,$desvio_relaxo_esq);
  push(@desviomtesq,$desvio_mt_esq);
  push(@desvioadcesq,$desvio_adc_esq);
  
  

  chdir(".."); 

}


