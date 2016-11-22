#!/usr/bin/perl

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
	print RELATDADOS "name; SubCutanea_Media FAT(%); SubCutanea_DesvioP FAT (%); Visceral_Media FAT(%); Visceral_DesvioP FAT (%); Figado_Media FAT(%); Figado_DesvioP FAT (%)\n";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$media_fat_sub[$c].";".$desvpad_fat_sub[$c].";".$media_fat_visc[$c].";".$desvpad_fat_visc[$c].";".$media_fat_figado[$c].";".$desvpad_fat_figado[$c]."\n";
	 $c=$c+1;
	}

 open(RELATDADOS, "> Data_Fat_Volume.txt");
    $tam =@nomes;
	print RELATDADOS "name; Subcutaneous FAT(cm³); Intraperitoneal FAT (cm³); Figado FAT(cm³)\n";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$volumes_subcutanea[$c].";".$volumes_peritonial[$c].";".$volumes_figado[$c]."\n";
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

#abdominal_fat_lbl.mnc label

@label=glob("./*_lbl.mnc*");
$sh->gzip($label[0]);
$arquivo = $label[0];
$Start = index($arquivo,"./") + 2;
$Stop = index($arquivo,".mnc")-2;
$lbl = substr($arquivo,$Start,$Stop);	

print"\n\n".$arquivo."\n\n";

#abdominal_fat_lbl.mnc label

$sh->gzip($label[0]);
$arquivo2 = $label[0];
$Start2 = index($arquivo2,"./") + 2;
$Stop2 = index($arquivo2,".mnc")-2;
$lbl2 = substr($arquivo2,$Start,$Stop);

print"\n\n".$arquivo2."\n\n";

#####################################################################
#Volume
 $sh->mincstats(" -volume ".$arquivo." -mask ".$arquivo." -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7); 
 $volume1 = substr($temp1,0,rindex($temp1," "));

 $volumeConv_subcutanea = $volume1/1000;
 print"\n\n volume do subcutanea: ". $volumeConv_subcutanea."\n\n";
 push(@volumes_subcutanea,$volumeConv_subcutanea);
 $sh->rm("volume1.txt");
  
 $sh->mincstats(" -volume ".$arquivo." -mask ".$arquivo." -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));
 
 $volumeConv_peritonial = $volume1/1000;
 print"\n\n volume do peritonial: ". $volumeConv_peritonial."\n\n";
 push(@volumes_peritonial,$volumeConv_peritonial);
 $sh->rm("volume1.txt");

 $sh->mincstats(" -volume ".$arquivo." -mask ".$arquivo." -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));
 
 $volumeConv_figado = $volume1/1000;
 print"\n\n volume do figado: ". $volumeConv_figado."\n\n";
 push(@volumes_figado,$volumeConv_figado);
 $sh->rm("volume1.txt");

 $sh->mincstats(" -volume ".$arquivo2." -mask ".$arquivo2." -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));
 
 $volumeConv_total = $volume1/1000;
 print"\n\n volume total: ". $volumeConv_total."\n\n";
 push(@volumes_total,$volumeConv_total);
 $sh->rm("volume1.txt");

#FAT Percentage
$sh->res(" ".$lbl." fat_map ");

 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_fat_sub = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvpad_fat_sub = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");

 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_fat_visc = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvpad_fat_visc = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@desvpad_fat_visc,$desvpad_fat_visc);

 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_fat_figado = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $desvpad_fat_figado = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@desvpad_fat_figado,$desvpad_fat_figado);
 
 $sh->rm($lbl."_res.mnc.gz");
  
 push(@media_fat_sub,$media_fat_sub);
 push (@desvpad_fat_sub, $desvpad_fat_sub);
 push(@media_fat_visc,$media_fat_visc);
 push(@media_fat_figado,$media_fat_figado);
 
  
 chdir("..");
}
