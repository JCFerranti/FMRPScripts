#!/usr/bin/perl -W


###############################################################
#Autores:Paula Rejane Beserra Diniz  #
#Ribeirao Preto,11 de julho de 2006      #
#versao 1.0
###############################################################

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************


print "\n*********************************************************************\n";

print "\nIniciando Processamento...\n";
$NomePastaAnter="";
@vector = glob("./*");
print " veja: ".$vector[0];
$teste = @vector;
$contador=0;
while($contador != $teste)
{
  $pasta = $vector[0];
  
  #$Stop = index($arquivo,"_")-2;
  $Start = index($pasta,"./") + 2;
  $NomePasta = substr($pasta,$Start);
  print "\n\n $NomePasta \n\n";
  if($NomePasta ne $NomePastaAnter)
  {
    &Processamento;
    
  }   
  
  $NomePastaAnter = $NomePasta;
  shift(@vector); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}

open(RELATERR, ">Relatorio_erros_EM_process.htm"); # Abrir arquivo HTML para escrita
print RELATERR "<html>\n<head>\n"; # Escrita no arquivo HTML
print RELATERR "<title>RELATÓRIO DE ERROS</title>\n";
print RELATERR "</headn\n<body bgcolor=#FFFFFF\n";

print RELATERR "<b><BR>*********************Relatorio*********************** <BR></b>";
if(@errPaciente)
  { $tam =@errPaciente;
    print RELATERR "<b><BR> Ocorreram erros quando os arquivos foram renomeados em :<BR> </b>";
	$c=0;
	while($c != $tam)
	{ print RELATERR "<b>".$errPaciente[$c]."<BR></b>";
	  $c=$c+1;
	}
  }
else {print RELATERR "<b><BR>NÃO ocorreram ERROS quando os arquivos foram renomeados <BR></b>";}
print RELATERR "<b><BR>*****************************************************<BR></b>";

if(@errNPaciente)
  { $tam =@errNPaciente;
    print RELATERR "<b><BR>Ocorreram erros durante o NU_CORRECT em :<BR></b>";
	$c=0;
	while($c != $tam)
	{ print RELATERR "<b>".$errNPaciente[$c]."<BR></b>";
	  $c=$c+1;
	}
  }
else {print RELATERR "<BR> <b>NÃO ocorreram ERROS durante o NU_CORRECT<BR></b>";}
print RELATERR "<b><BR>*****************************************************<BR></b>";

print RELATERR "<b><BR>*****************************************************<BR></b>";

if(@errCPaciente)
  { $tam =@errCPaciente;
    print RELATERR "<BR><b>Ocorreram erros durante o Classifier em :</b><BR>";
	$c=0;
	while($c != $tam)
	{ print RELATERR "<b>".$errCPaciente[$c]."<BR></b>";
	  $c=$c+1;
	}
  }
else {print RELATERR "<b><BR>NÃO ocorreram ERROS durante o Classifier<BR></b>";}
print RELATERR "<b><BR>*****************************************************<BR></b>";
close(RELATERR);

#*******************************************************Fim Main**************************************************************************************


#***************************************************Função que efetua todo o processamento****************************************************************
sub Processamento
{print"\n\n Preparando arquivos...\n\n";
 chdir($NomePasta);
 @vector4 = glob("./*");
 $file = $vector4[0];
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
 
 $Stop = index($NomePasta,"_".$ano);
 $PrimNome = substr($NomePasta,0,$Stop);
 $sh->rm(" mincheader.txt");
 print "\n\n $PrimNome \n\n";

 #******************************Processamento das imegens****************************************************
  
  print"\n\n Iniciando Processamento...\n\n";
  
  #**************************************************************************************
  print"\n\n 1° Passo) Iniciando nu_correct...\n\n";
  $sh->nu_correct("  -clobber ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_d1_nu.mnc");
  $sh->nu_correct("  -clobber ".$PrimNome."_".$ano.$mes.$dia."_0_e1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_e1_nu.mnc");
  $sh->nu_correct("  -clobber ".$PrimNome."_".$ano.$mes.$dia."_0_e2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_e2_nu.mnc");
  chdir("..");
  $sh->mv(" *.imp ".$NomePasta);
  chdir($NomePasta);
  print"\n\n Rodando de novo...\n\n";
  $sh->nu_correct("  -clobber ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_d1_nu.mnc");
  $errN1=$sh->echo($?);
  $sh->nu_correct("  -clobber ".$PrimNome."_".$ano.$mes.$dia."_0_e1.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_e1_nu.mnc");
  $errN2=$sh->echo($?);
  $sh->nu_correct("  -clobber ".$PrimNome."_".$ano.$mes.$dia."_0_e2.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_e2_nu.mnc");
  $errN3=$sh->echo($?);
  $sh->gzip(" ".$PrimNome."_".$ano.$mes.$dia."_0_d1_nu.mnc");
  $sh->gzip(" ".$PrimNome."_".$ano.$mes.$dia."_0_e1_nu.mnc");
  $sh->gzip(" ".$PrimNome."_".$ano.$mes.$dia."_0_e2_nu.mnc");
  
  #******Verificação de erro**************************************

 if($errN1!=0 || $errN2!=0 || $errN3!=0 )
 {
  push(@errNPaciente,$NomePasta);

 }
 #*************************************************************
 #**************************************************************************************
 
 #**************************************************************************************
  print"\n\n 2° Passo) Iniciando classify...\n\n";
  $sh->rm(" *.imp");
  $sh->perl(" /usr/local/mrs/scripts/prep_classify.pl ".$PrimNome."_".$ano.$mes.$dia."_0 -control");
  $errC1=$sh->echo($?);
  #******Verificação de erro**************************************

 if($errC1!=0)
 {
  push(@errCPaciente,$NomePasta);
 }
 
  chdir("..");
  $sh->rm(" *.imp");
}

#*****************************************************************************************************************************************************
