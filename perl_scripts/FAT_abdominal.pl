#!/usr/bin/perl 

###############################################################
#Autores:Paula Rejane Beserra Diniz e Carlos Garrido Salmon   #
#Ribeirao Preto-Vitoria da Conquista,03 de agosto de 2006      #
#versao 2 
###############################################################
#####################################################################
#@NAME       : Maps_values_extration_tool.pl
#@INPUT      : 
#@OUTPUT     : quantitative_MR_aseg.txt
#@RETURNS    : 
#@DESCRIPTION: Extração dos dados de MTR, relaxometria, FA, Difusibilidade paralela e difusibilidade perpendicular.

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();


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
 open(RELATDADOS, "> Data_Fat_Percentage.txt");
    $tam =@nomes;
	print RELATDADOS "name; Subcutaneous FAT(%); Intraperitoneal FAT (%)\n";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$media_fat_figado[$c].";".$media_fat_figado2[$c]."\n";
	 $c=$c+1;
	}

 open(RELATDADOS, "> Data_Fat_Volume.txt");
    $tam =@nomes;
	print RELATDADOS "name; Subcutaneous FAT(cm³); Intraperitoneal FAT (cm³)\n";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$volumes_subcutanea[$c].";".$volumes_peritonial[$c]."\n";
	 $c=$c+1;
	}

sub Processamento
{
 chdir($NomePasta);
 
 
 @vector = glob("./*_e*");

 $file = $vector[0];
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
 $Stop = index($NomePasta,"_".$ano);
 $PrimNome = substr($NomePasta,0,$Stop);
 $sh->rm(" mincheader.txt");
 
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 
 print"\n\n Iniciando FAT...\n\n";

$necos = @vector;
print"\n\n O valor do numero de echos eh $necos ...\n\n";
$sh->mincmath(" -double -sub ".$vector[1]." ".$vector[0]." subtracao.mnc");
$sh->mincmath(" -double -add ".$vector[1]." ".$vector[0]." soma.mnc");
$sh->mincmath(" -double -div  subtracao.mnc soma.mnc div.mnc");
$sh->mincmath(" -double -mult -const 100  div.mnc fat_map.mnc");
$sh->rm(" subtracao.mnc");
$sh->rm("soma.mnc");
$sh->rm("div.mnc");
$sh->gzip("fat_map.mnc");

@label=glob("./*_lbl.mnc*");
$sh->gzip($label[0]);
$arquivo = $label[0];
$Start = index($arquivo,"./") + 2;
$Stop = index($arquivo,".mnc")-2;
$lbl = substr($arquivo,$Start,$Stop);	

#####################################################################
#Volume

$sh->mincstats(" -volume ".$vector[0]." -mask ".$arquivo." -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));

 $volumeConv_subcutanea = $volume1/1000;
  print"\n\n volume do subcutanea: ". $volumeConv_subcutanea."\n\n";
  push(@volumes_subcutanea,$volumeConv_subcutanea);
  $sh->rm("volume1.txt");
  
  $sh->mincstats(" -volume ".$vector[0]." -mask ".$arquivo." -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));

 $volumeConv_peritonial = $volume1/1000;
  print"\n\n volume do peritonial: ". $volumeConv_peritonial."\n\n";
  push(@volumes_peritonial,$volumeConv_peritonial);
  $sh->rm("volume1.txt");

#FAT Percentage
$sh->res(" ".$lbl." fat_map ");

 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_fat_figado = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $desvpad_fat_figado = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_fat_figado2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $desvpad_fat_figado2 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

 $sh->rm($lbl."_res.mnc.gz");
  
  push(@media_fat_figado,$media_fat_figado);
  push(@media_fat_figado2,$media_fat_figado2);
  
 chdir("..");
}


