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

open(RELATDADOS, "> Dados_volume_hipocampo_animais.txt");
    $tam =@nomes;
    print RELATDADOS "nome;Hipocampo ipisilateral (mm³);Hipocampo contralateral (mm³);\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$volumes_ipsilateral[$c].";".$volumes_contralateral[$c]."\r";
	  $c=$c+1;
	}
sub Processamento
{   chdir($NomePasta);
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
 $Stop = index($NomePasta,"_".$ano);
 $PrimNome = substr($NomePasta,0,$Stop);
 $sh->rm(" mincheader.txt");
 
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
	
	@vectorarquivo = glob("./*_0_sDUAL.mnc.gz");
	$arquivo1=$vectorarquivo[0];
	$Start = index($arquivo1,"./") + 2;
	$Stop = index($arquivo1,".mnc.gz")-2;
	$Nomed1 = substr($arquivo1,$Start,$Stop);
	print "\n\n".$Nomed1."\n\n";
	$sh->rm(" *_lbl_res.mnc.gz");
	 #*Calculo do volume do licor******************************************************************
 $sh->res(" ".$PrimNome."_0_lbl ".$Nomed1);

 $sh->mincstats(" -volume ".$Nomed1.".mnc.gz  -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Volume volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $volumeipsilateral = substr($temp1,0,rindex($temp1," "));
  push(@volumes_ipsilateral,$volumeipsilateral);
 $sh->rm("volume1.txt");
   
  #*Calculo do volume do massa cinzenta******************************************************************
 $sh->mincstats(" -volume ".$Nomed1.".mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume3.txt");
 $tag3 = $sh->grep(" Volume volume3.txt");
 $temp3 = substr($tag3,rindex($tag3,":")+7);
 $volumecontralateral = substr($temp3,0,rindex($temp3," "));
  push(@volumes_contralateral,$volumecontralateral);
  $sh->rm("volume3.txt");
  
 $sh->rm(" *_lbl_res.mnc.gz");


  chdir("..");

}