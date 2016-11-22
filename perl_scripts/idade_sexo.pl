#!/usr/bin/perl -W
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

open(RELATDADOS, "> Dados_sexo_idade.txt");
    $tam =@nomes;
    print RELATDADOS "nome,Idade,Sexo,Registro,Data Exame\r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$idade1[$c].",".$sexo1[$c].",".$registro1[$c].",".$dia1[$c]."/".$mes1[$c]."/".$ano1[$c]."\r";
	  $c=$c+1;
	}
sub Processamento
{   chdir($NomePasta);
    push(@nomes,$NomePasta);
	@d1 = glob("./*_0_mpr.mnc.gz");
	$file = $d1[0];
	$sh->mincheader(" $file > mincheader.txt ");
	$linha = $sh->grep(" dicom_0x0010:el_0x0040 mincheader.txt");
	$te1 = substr($linha,rindex($linha,"=")+2);
	$Stop = rindex($te1,'"');
	$te = substr($te1,0,$Stop);
	$start = index($te,'"')+1;
	$stop = index($te,' "')+4;
	$sexo = substr($te,$start,$stop);
	#if($sexo eq "M ")
	#{
	# $sexo=1
	#}else{
	#	if($sexo eq "F ")
	#	{
	#	  $sexo=2
	#	}
	#}	
	push(@sexo1,$sexo);
	$linha = $sh->grep(" dicom_0x0010:el_0x1010 mincheader.txt");
	$te1 = substr($linha,rindex($linha,"=")+2);
	$Stop = rindex($te1,'"');
	$te = substr($te1,0,$Stop);
	$start = index($te,'"')+1;
	$stop = index($te,'Y"')+4;
	$idade = substr($te,$start,$stop);	
	push(@idade1,$idade);

	$linha = $sh->grep(" dicom_0x0010:el_0x0020 mincheader.txt");
	  $te1 = substr($linha,rindex($linha,"=")+2);
	  $Stop = rindex($te1,'"');
	  $te = substr($te1,0,$Stop);
	  $start = index($te,'"')+1;
	  $stop = index($te,'"')+8;
	$registro = substr($te,$start,$stop);	
	push(@registro1,$registro);
	
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
     push(@dia1,$dia);
	 push(@mes1,$mes);
	 push(@ano1,$ano);
	$sh->rm(" mincheader.txt");
	chdir("..");
}