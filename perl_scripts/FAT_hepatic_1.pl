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
 open(RELATDADOS, "> Data_FAT_hepatic.txt");
    $tam =@nomes;
	print RELATDADOS " ; ; ; Percentagem de Gordura (%) \n";
	print RELATDADOS "nome; ROI1;ROI2;ROI3;ROI4 \n";
	$c=0;
	while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$media_fat_figado[$c].";".$media_fat_figado2[$c].";".$media_fat_figado3[$c].";".$media_fat_figado4[$c]."\n";
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
$sh->mincmath(" -double -sub ".$vector[1]." ".$vector[0]." subtracao.mnc"); #Subtração das imagens in_phase e out_phase
#$sh->mincmath(" -double -add ".$vector[1]." ".$vector[0]." soma.mnc");      #Soma das imagens in_phase e out_phase		
$sh->mincmath(" -double -div  subtracao.mnc ".$vector[1]." div.mnc");             #Divisão da subtração e a soma
$sh->mincmath(" -double -mult -const 50 div.mnc fat_map1.mnc");             #Multiplicação por 100 para elevar a porcentagem, criando o mapa fat_map.mnc
$sh->mincwindow("fat_map1.mnc fat_map.mnc 0 100");

$sh->rm(" subtracao.mnc");
#$sh->rm("soma.mnc");
$sh->rm("div.mnc");
$sh->rm("fat_map1.mnc");  #linha 106
$sh->gzip("fat_map.mnc");

@label=glob("./*_lbl.mnc*");
$sh->gzip($label[0]);
#@label=glob("./*_lbl.mnc*");
$arquivo = $label[0];
$Start = index($arquivo,"./") + 2;
$Stop = index($arquivo,".mnc")-2;
$lbl = substr($arquivo,$Start,$Stop);	

#####################################################################

$sh->res(" ".$lbl." fat_map ");

 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_fat_figado = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 print "O valor de media_fat_figado e:" .$media_fat_figado; 

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

 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_fat_figado3 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $desvpad_fat_figado3 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_fat_figado4 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $desvpad_fat_figado4 = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 $sh->rm($lbl."_res.mnc.gz");
  
  push(@media_fat_figado,$media_fat_figado);
  push(@media_fat_figado2,$media_fat_figado2);
  push(@media_fat_figado3,$media_fat_figado3);
  push(@media_fat_figado4,$media_fat_figado4);
  
 chdir("..");
}


