#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               #
#Ribeirao Preto,31 de Março de 2011                                                                                                                                        #
#versao 1.0                                                                                                                                                                                       #
#####################################################################
#@NAME       : MTRX_animal_lesao_disco.pl
#@INPUT      : 
#@OUTPUT     : dados_Relaxo_lesao.txt, dados_MT_lesao.txt
#@RETURNS    : 
#@DESCRIPTION: Calculo de mapas e extração dos valores desses mapas

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

open(RELATDADOS, "> dados_Relaxo_lesao.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Media do Disco Distal; Desvio Padrão do Disco distal; Media do Disco Intermediário; Desvio Padrão do disco intermediário; Media do Disco inferior; Desvio Padrão do disco proximal;\n";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasrelaxosuperior[$c].";".$desviorelaxosuperior[$c].";".$mediasrelaxomedial[$c].";".$desviorelaxomedial[$c].";".$mediasrelaxoinferior[$c].";".$desviorelaxoinferior[$c]."\n";
	  $c=$c+1;
	}
open(RELATDADOS, "> dados_MT_lesao.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Media do Disco Distal; Desvio Padrão do Disco distal; Media do Disco Intermediário; Desvio Padrão do disco intermediário; Media do Disco inferior; Desvio Padrão do disco proximal;\n";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasmtsuperior[$c].";".$desviomtsuperior[$c].";".$mediasmtmedial[$c].";".$desviomtmedial[$c].";".$mediasmtinferior[$c].";".$desviomtinferior[$c]."\n";
	  $c=$c+1;
	}
open(RELATDADOS, "> dados_adc_lesao.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Media do Disco Distal; Desvio Padrão do Disco distal; Media do Disco Intermediário; Desvio Padrão do disco intermediário; Media do Disco inferior; Desvio Padrão do disco proximal;\n";
	$c=0;
	while($c != $tam)
	{  
	  print RELATDADOS $nomes[$c].";".$mediasadcsuperior[$c].";".$desvioadcsuperior[$c].";".$mediasadcmedial[$c].";".$desvioadcmedial[$c].";".$mediasadcinferior[$c].";".$desvioadcinferior[$c]."\n";
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
 #$NomePaciente = substr($NomePasta,0,$Stop);
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
  
  $sh->mincmath(" -pd -const 10 ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
 
	
	 print"\n\n Gerando Relaxo...\n\n";
	 print "\n\n".$pastas[0]."\n\n";
	 print"\n\n 1° Passo) Iniciando RelaxoN...\n\n";
     require "/usr/local/mni/scripts/relaxon.pl";
     &main; 
     $sh->mv(" relaxom.mnc ./".$PrimNome."_relaxo.mnc");
     $sh->mv(" density.mnc ./".$PrimNome."_density.mnc"); 
     $sh->gzip(" *.mnc");
	 print "\n\n".$pastas[0]."\n\n";

$sh->gzip(" *.mnc");
@label = glob("./*_lbl.mnc.gz"); 
@adc = glob("./*_adc.mnc.gz");
$sh->mv(" ".$label[0]." ./".$PrimNome."_0_lbl.mnc.gz");
$sh->mv(" ".$adc[0]." ./".$PrimNome."_0_adc.mnc.gz");

# Análises MT e Relaxo 
  print"\n\n Obtendo dados da Relaxo e do MT...\n\n";
print"\n\n relaxometria...\n\n";
  #Disco Distal (lesado)
 $sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_relaxo ");
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_superior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_superior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 #Disco Intermediario (Normal)

 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_medial = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_medial = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

 
 #Disco proximal (lesado)
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_inferior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_inferior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->rm(" ".$PrimNome."_0_lbl_res.mnc.gz");
 
 #MTR
# MTR_dir
print"\n\n MTR...\n\n"; 
 $sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_".$ano.$mes.$dia."_mt ");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_superior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_superior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_medial = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_medial = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 

 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_inferior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_inferior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->rm(" ".$PrimNome."_0_lbl_res.mnc.gz");
 
 
 #ADC
# ADC
 print"\n\n ADC...\n\n";
 $sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_0_adc ");
 $sh->mincstats(" -mean ".$PrimNome."_0_adc.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_adc_superior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_0_adc.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_adc_superior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 
  $sh->mincstats(" -mean ".$PrimNome."_0_adc.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_adc_medial = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_0_adc.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_adc_medial = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean ".$PrimNome."_0_adc.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_adc_inferior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_0_adc.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_adc_inferior = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->rm(" ".$PrimNome."_0_lbl_res.mnc.gz");
  
   
  push(@mediasrelaxosuperior,$media_relaxo_superior);
  push(@mediasmtsuperior,$media_mt_superior);
  push(@mediasadcsuperior,$media_adc_superior);
  push(@desviorelaxosuperior,$desvio_relaxo_superior);
  push(@desviomtsuperior,$desvio_mt_superior);
  push(@desvioadcsuperior,$desvio_adc_superior);
  
  push(@mediasrelaxomedial,$media_relaxo_medial);
  push(@mediasmtmedial,$media_mt_medial);
  push(@mediasadcmedial,$media_adc_medial);
  push(@desviorelaxomedial,$desvio_relaxo_medial);
  push(@desviomtmedial,$desvio_mt_medial);
  push(@desvioadcmedial,$desvio_adc_medial);
  
  push(@mediasrelaxoinferior,$media_relaxo_inferior);
  push(@mediasmtinferior,$media_mt_inferior);
  push(@mediasadcinferior,$media_adc_inferior);
  push(@desviorelaxoinferior,$desvio_relaxo_inferior);
  push(@desviomtinferior,$desvio_mt_inferior);
  push(@desvioadcinferior,$desvio_adc_inferior);
  
  

  chdir(".."); 

}


