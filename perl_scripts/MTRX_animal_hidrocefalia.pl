#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               #
#Ribeirao Preto,31 de Março de 2011                                                                                                                                        #
#versao 1.0                                                                                                                                                                                       #
#####################################################################
#@NAME       : MTRX_animal_hidrocefalia.pl
#@INPUT      : 
#@OUTPUT     : dados_Relaxo_hidrocefalia.txt, dados_MT_hidrocefalia.txt
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

open(RELATDADOS, "> dados_Relaxo_hidrocefalia.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Media do Ventrículos Laterais; Desvio Padrão do Ventrículos Laterais; Media do Encéfalo; DP do Encéfalo; Media da Região SubCortical Dorsal; DP da Região SubCortical Dorsal;Media da Região SubCortical Ventral ; Desvio Padrão da Região SubCortical Ventral;\n";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasrelaxolesado[$c].";".$desviorelaxolesado[$c].";".$mediasrelaxocontrole[$c].";".$desviorelaxocontrole[$c].";".$mediasrelaxoAnelFibroso[$c].";".$desviorelaxoAnelFibroso[$c].";".$mediasrelaxolesado2[$c].";".$desviorelaxolesado2[$c]."\n";
	  $c=$c+1;
	}
open(RELATDADOS, "> dados_MT_hidrocefalia.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Media do Ventrículos Laterais; Desvio Padrão do Ventrículos Laterais; Media do Encéfalo; DP do Encéfalo; Media da Região SubCortical Dorsal; DP da Região SubCortical Dorsal;Media da Região SubCortical Ventral ; Desvio Padrão da Região SubCortical Ventral;\n";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasmtlesado[$c].";".$desviomtlesado[$c].";".$mediasmtcontrole[$c].";".$desviomtcontrole[$c].";".$mediasmtAnelFibroso[$c].";".$desviomtAnelFibroso[$c].";".$mediasmtlesado2[$c].";".$desviomtlesado2[$c]."\n";
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
#******************************Processamento das imagens********************************
  
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
     #require "/usr/local/mni/scripts/relaxon.pl";
      require "/usr/local/bic/scripts/relaxon.pl";
     &main; 
     $sh->mv(" relaxom.mnc ./".$PrimNome."_relaxo.mnc");
     $sh->mv(" density.mnc ./".$PrimNome."_density.mnc"); 
     $sh->gzip(" *.mnc");
	 print "\n\n".$pastas[0]."\n\n";

$sh->gzip(" *.mnc");
@labeld1 = glob("./*_lbl.mnc.gz"); 
@adc = glob("./*_adc.mnc.gz");
$sh->mv(" ".$labeld1[0]." ./".$PrimNome."_0_lbl.mnc.gz");
$sh->mv(" ".$adc[0]." ./".$PrimNome."_0_adc.mnc.gz");

# Análises MT e Relaxo 
  print"\n\n Obtendo dados da Relaxo e do MT...\n\n";
print"\n\n relaxometria...\n\n";
  #Disco lesado
 $sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_relaxo ");
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lesado = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_lesado = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 #Disco controle Nucleo pulposo

 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_controle = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_controle = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

  #Disco Normal AnelFibroso
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_AnelFibroso = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_AnelFibroso = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 #Disco lesado2
 $sh->mincstats(" -mean ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_relaxo_lesado2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_relaxo.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_relaxo_lesado2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->rm(" ".$PrimNome."_0_lbl_res.mnc.gz");
 
 #MTR
# MTR_dir
print"\n\n MTR...\n\n"; 
 $sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_".$ano.$mes.$dia."_mt ");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_lesado = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_lesado = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_controle = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_controle = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_AnelFibroso = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_AnelFibroso = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 

 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_lesado2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 7 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvio_mt_lesado2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->rm(" ".$PrimNome."_0_lbl_res.mnc.gz");
 
 
 
  
   
  push(@mediasrelaxolesado,$media_relaxo_lesado);
  push(@mediasmtlesado,$media_mt_lesado);

  push(@desviorelaxolesado,$desvio_relaxo_lesado);
  push(@desviomtlesado,$desvio_mt_lesado);
 
  
  push(@mediasrelaxocontrole,$media_relaxo_controle);
  push(@mediasmtcontrole,$media_mt_controle);
 
  push(@desviorelaxocontrole,$desvio_relaxo_controle);
  push(@desviomtcontrole,$desvio_mt_controle);
 
  
  push(@mediasrelaxolesado2,$media_relaxo_lesado2);
  push(@mediasmtlesado2,$media_mt_lesado2);
  
  push(@mediasrelaxoAnelFibroso,$media_relaxo_AnelFibroso);
  push(@mediasmtAnelFibroso,$media_mt_AnelFibroso);

  push(@desviorelaxoAnelFibroso,$desvio_relaxo_AnelFibroso);
  push(@desviomtAnelFibroso,$desvio_mt_AnelFibroso);
 
 
  push(@desviorelaxolesado2,$desvio_relaxo_lesado2);
  push(@desviomtlesado2,$desvio_mt_lesado2);

  
  

  chdir(".."); 

}


