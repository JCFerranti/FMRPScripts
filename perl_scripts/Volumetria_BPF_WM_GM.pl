#!/usr/bin/perl -W


###############################################################
#Autores:Paula Rejane Beserra Diniz  #
#Ribeirao Preto,27 de junho de 2007      #
#Retorna o volume de substância Branca, cinzenta e líquor#
#versao 1.0#
###############################################################

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************
print "\n*********************************************************************\n";

print "\nIniciando Processamento...\n";
$NomePastaAnter="";
@vectorpasta = glob("./*");
$teste = @vectorpasta;
$contador=0;
while($contador != $teste)
{
  $arquivo = $vectorpasta[0];
  $Start = index($arquivo,"./") + 2;
  $NomePasta = substr($arquivo,$Start);

  if($NomePasta ne $NomePastaAnter)
  {
    print "O nome da pasta eh: ".$NomePasta."\n";
	&Processamento;
   }   
  
  $NomePastaAnter = $NomePasta;
  shift(@vectorpasta); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}

open(RELATDADOS, "> Dados_volume_classify_total_brain.txt");
    $tam =@nomes;
    print RELATDADOS "nome;CSF(cm3);GM(cm3);WM(cm3);Vol IC T(cm3);Vol enc(cm3);vol cerebelo_ponte_bulbo(cm3); BPF(%)\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$volumes_liquor[$c].";".$volumes_MC[$c].";".$volumes_MB[$c].";".$volumes_intracraniano[$c].";".$volumes_encefalo[$c].";".$volumes_cerebelo[$c].";".$volumes_BPF[$c]."\r";
	  $c=$c+1;
	}
sub Processamento
{   chdir($NomePasta);
    push(@nomes,$NomePasta);
	@vectorarquivo = glob("./*0_mpr.mnc.gz");
	$sh->gunzip(" ".$vectorarquivo[0]);
	@vectorarquivo = glob("./*0_mpr.mnc");
	print "\n\n".$vectorarquivo[0] ."\n\n";
	$arquivo = $vectorarquivo[0];
	print "\n\n".$arquivo."\n\n";
	$Start = index($arquivo,"./") + 2;
	$Stop = index($arquivo,"_")-2;
	$NomePaciente = substr($arquivo,$Start,$Stop);	
	$sh->gzip(" ".$vectorarquivo[0]);
	@vectorarquivo = glob("./*_0_mpr.mnc.gz");
	$arquivo1=$vectorarquivo[0];
	$Start = index($arquivo1,"./") + 2;
	$Stop = index($arquivo1,".mnc.gz")-2;
	$Nomed1 = substr($arquivo1,$Start,$Stop);
	print "\n\n".$Nomed1."\n\n";
	$sh->rm(" *_mpr_res.mnc.gz");
	 #*Calculo do volume do licor******************************************************************
 $sh->res(" ".$Nomed1." ".$NomePaciente."_classified");
 @vectorres = glob("./*_mpr_res.mnc.gz");
 $sh->mincstats(" -volume ".$vectorres[0]." -mask ".$NomePaciente."_classified.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volume1 = substr($temp1,0,rindex($temp1," "));

 $volumeConv_liquor = $volume1/1000;
  print"\n\n volume do liquor: ". $volumeConv_liquor."\n\n";
  push(@volumes_liquor,$volumeConv_liquor);
  $sh->rm("volume1.txt");
 
  #*Calculo do volume do massa cinzenta******************************************************************
 $sh->mincstats(" -volume ".$vectorres[0]." -mask ".$NomePaciente."_classified.mnc.gz -mask_binvalue 2 > volume3.txt");
 $tag3 = $sh->grep(" Volume volume3.txt");
 $temp3 = substr($tag3,rindex($tag3,":")+7);
 $volume3 = substr($temp3,0,rindex($temp3," "));
 
 $volumeConv_MC = $volume3/1000;
  print"\n\n volume da Massa Cinzenta: ".$volumeConv_MC."\n\n";
  push(@volumes_MC,$volumeConv_MC);
  $sh->rm("volume3.txt");
  
  #*Calculo do volume do massa branca******************************************************************
 $sh->mincstats(" -volume ".$vectorres[0]." -mask ".$NomePaciente."_classified.mnc.gz -mask_binvalue 3 > volume4.txt");
 $tag4 = $sh->grep(" Volume volume4.txt");
 $temp4 = substr($tag4,rindex($tag4,":")+7);
 $volume4 = substr($temp4,0,rindex($temp4," "));
 
 $volumeConv_MB = $volume4/1000;
  print"\n\n volume da Massa Branca: ".$volumeConv_MB."\n\n";
  push(@volumes_MB,$volumeConv_MB);
  $sh->rm("volume4.txt");
  
  #*volume cerebral********************************************************************
 $sh->mincstats(" -range 1,99999999 -volume ".$NomePaciente."_classified.mnc.gz > volume.txt");
 $tagi = $sh->grep(" Volume volume.txt");
 $tempi = substr($tagi,rindex($tagi,":")+7);
 $volumei = substr($tempi,0,rindex($tempi," "));
 $volumeConv_intracraniano = $volumei/1000;
  print"\n\n volume intra-craniano: ".$volumeConv_intracraniano."\n\n";
  push(@volumes_intracraniano,$volumeConv_intracraniano);
  $sh->rm("volume.txt");
 #*volume cerebral********************************************************************
  $sh->mincstats(" -range 1,1 -volume ".$NomePaciente."_encefalo.mnc.gz > volume.txt");
 $tagi = $sh->grep(" Volume volume.txt");
 $tempi = substr($tagi,rindex($tagi,":")+7);
 $volumei = substr($tempi,0,rindex($tempi," "));
 $volumeConv_encefalo = $volumei/1000;
  print"\n\n volume encefalo: ".$volumeConv_encefalo."\n\n";
  push(@volumes_encefalo,$volumeConv_encefalo);
  $sh->rm("volume.txt");
  
  #*volume cerebelo********************************************************************
 $volumeConv_cerebelo = $volumeConv_intracraniano - $volumeConv_encefalo;
  print"\n\n volume cerebelo: ".$volumeConv_cerebelo."\n\n";
  push(@volumes_cerebelo,$volumeConv_cerebelo);

  $BPF = (($volumeConv_intracraniano - $volumeConv_liquor)/$volumeConv_intracraniano)*100;
  print"\n\n BPF: ".$BPF."\n\n";
  push(@volumes_BPF,$BPF);


  chdir("..");

}