#!/usr/bin/perl -W

#####################################################################
#Autor: Carlos Garrido e Rodrigo Pessini                                                                                                                                       
#Ribeirao Preto, 04 de julho de 2012                                                                                                                                         
#versao 1.0                                                                                                                                                                                       #
# 
#####################################################################
#@NAME       : 
#@INPUT      : 
#@OUTPUT     : 
#@RETURNS    : 
#@DESCRIPTION: C

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

#=============================================================================
sub Processamento
{print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
  print "\n\n".$pastas[0]."\n\n";
 @d1 = glob("./*_0_e1.mnc.gz");
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
 
 
 print "\n\n Primeiro nome: $PrimNome \n\n";
  print "\n\n".$pastas [0]."\n\n";
#******************************Processamento das imegens********************************
  
  print"\n\n Iniciando Processamento...\n\n";
  

	 
	# $sh->rm(" *.xfm");
	# $sh->rm(" *grid_0.mnc");
	# relaxo
	# $sh->mkdir("Analise_mt_relaxo");
	
	print "\n\n".$pastas[0]."\n\n";

        
	 
        # $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e1.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e1.mnc.gz");
	# $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e2.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e2.mnc.gz");
	# $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e3.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e3.mnc.gz");
	# $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e4.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e4.mnc.gz");
	# $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e5.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e5.mnc.gz");
        # $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e6.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e6.mnc.gz");
	# $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e7.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e7.mnc.gz");
	# $sh->mv(" ./".$PrimNome."_".$ano.$mes.$dia."_0_e8.mnc.gz ./Analise_mt_relaxo/".$PrimNome."_".$ano.$mes.$dia."_0_e8.mnc.gz");

	
  	# chdir("Analise_mt_relaxo");
	 print"\n\n Gerando Relaxo...\n\n";
	 print "\n\n".$pastas[0]."\n\n";
	 print"\n\n 1° Passo) Iniciando RelaxoN...\n\n";
         require "/usr/local/bic/scripts/relaxon_t1rho2.pl";
         &main; 
         $sh->mv(" relaxom.mnc ./".$PrimNome."_relaxot1rho.mnc");
         $sh->mv(" density.mnc ./".$PrimNome."_density.mnc"); 
         $sh->gzip(" *.mnc");

  chdir("..");

  chdir(".."); 

}




