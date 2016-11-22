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
$NomePacienteAnter="";
@vector = glob("./*");
print " veja: ".$vector[0];
$teste = @vector;
$contador=0;
while($contador != $teste)
{
  $arquivo = $vector[0];
  
  #$Stop = index($arquivo,"_")-2;
  $Start = index($arquivo,"./") + 2;
  $NomePaciente = substr($arquivo,$Start);
  print "\n\n $NomePaciente \n\n";
  if($NomePaciente ne $NomePacienteAnter)
  {
    #&Organiza;
    print "O nome do paciente eh: ".$NomePaciente."\n";
	&Processamento;
    }   
  
  $NomePacienteAnter = $NomePaciente;
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

open(RELATDADOS, "> dados.txt");
    $tam =@nomes;
    print RELATDADOS "nome,volume(cm3) \r";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].",".$volumes[$c]."\r";
	  $c=$c+1;
	}

#*******************************************************Fim Main**************************************************************************************

#*****************************Função que organiza os arquivos dentro do diretório do respectivo paciente********************************************************
sub Organiza
{
  @vector2 = glob("./".$NomePaciente."*.mnc.gz");
  $tamVector = @vector2;
  $sh->mkdir( $NomePaciente);
  $cont=0; 
  while($cont!= $tamVector)
  {
  $sh->mv( $vector2[$cont]." ./".$NomePaciente);
  $cont=$cont+1;
  
  }
}
#*****************************************************************************************************************************************************



#***************************************************Função que efetua todo o processamento****************************************************************
sub Processamento
{print"\n\n Preparando arquivos...\n\n";
 chdir($NomePaciente);
 #@vector3 = glob("./".$NomePaciente."_1_*_mri.mnc.gz");

# &ClassificaImagem;

 $Stop = index($NomePaciente,"_");
 $PrimNome = substr($NomePaciente,0,$Stop);
 print "\n\n $PrimNome \n\n";
 
#******************************Renomeia os arquivos****************************************************
 #$sh->mv(" $vector3[0] ".$PrimNome."-bas_d1.mnc.gz");
 #$sh->mv(" $vector3[1] ".$PrimNome."-bas_d2.mnc.gz");
 #shift(@vector3);
 #shift(@vector3);
 
 #*****************************crinado a imagem e1******************************************************
 #@Im1 = grep(/(e1)/,@vector3);
 #print "\n veja isso : $Im1[0]\n\n";
 #print "\n veja isso : $Im1[1]\n\n";
 
 #$sh->mincconcat(" $Im1[0] $Im1[1] ".$PrimNome."-bas_e1.mnc");
 #$err1=$sh->echo($?);
 #**********************Correção de erro ******************************************
  #if($err1!=0)
 #{ 
   #fazendo a transformtion
  # $sh->mritoself(" -close ".$Im1[0]." ".$Im1[1]." ".$PrimNome."_e1TOe1.xfm");
   #$sh->mincresample(" ".$Im1[0]." ".$PrimNome."_e1TOe1.mnc -like ".$Im1[1]." -transformation ".$PrimNome."_e1TOe1.xfm");
   #$sh->mincconcat(" ".$PrimNome."_e1TOe1.mnc $Im1[1] ".$PrimNome."-bas_e1.mnc");
   #$errInt=$sh->echo($?);#se ainda não conseguiu concatenar
   #if($errInt==0)
   #{$err1=0;}
   #$sh->rm(" ".$PrimNome."_e1TOe1.xfm");
   #$sh->rm(" ".$PrimNome."_e1TOe1.mnc");
 #}
 #*********************************************************************************
 #$sh->gzip(" ".$PrimNome."-bas_e1.mnc");
 #$sh->rm(" $Im1[0]");
 #$sh->rm(" $Im1[1]");
 #**************************************************************************************************************************************************************
 #@Im2 = grep(/(e2)/,@vector3);
 #print "\n veja isso : $Im2[0]\n\n";
 #print "\n veja isso : $Im2[1]\n\n";
 #$sh->mincconcat(" $Im2[0] $Im2[1] ".$PrimNome."-bas_e2.mnc");
 #$err2=$sh->echo($?);
 #**********************Correção de erro ******************************************
 # if($err2!=0)
 { 
   #fazendo a transformtion
   #$sh->mritoself(" -close ".$Im2[0]." ".$Im2[1]." ".$PrimNome."_e2TOe2.xfm");
   #$sh->mincresample(" ".$Im2[0]." ".$PrimNome."_e2TOe2.mnc -like ".$Im2[1]." -transformation ".$PrimNome."_e2TOe2.xfm");
   #$sh->mincconcat(" ".$PrimNome."_e2TOe2.mnc $Im2[1] ".$PrimNome."-bas_e2.mnc");
   #$errInt=$sh->echo($?);#se ainda não conseguiu concatenar
   #if($errInt==0)
   #{$err1=0;}
   #$sh->rm(" ".$PrimNome."_e2TOe2.xfm");
   #$sh->rm(" ".$PrimNome."_e2TOe2.mnc");
 #}
 #*********************************************************************************
 #$sh->gzip(" ".$PrimNome."-bas_e2.mnc");
 #shift(@vector3);
 #shift(@vector3);
 #shift(@vector3);
 #shift(@vector3); 
 #$sh->rm(" $Im2[0]");
 #$sh->rm(" $Im2[1]");

 #print "\n veja isso : $vector3[0]\n\n";
 #print "\n veja isso : $vector3[1]\n\n";
 #$sh->mincconcat(" $vector3[0] $vector3[1] ".$PrimNome."-bas_gd.mnc");
 #$err3=$sh->echo($?);
 #if($err3!=0)
 #{ 
   #fazendo a transformtion
   #$sh->mritoself(" -close ".$Im3[0]." ".$Im3[1]." ".$PrimNome."_gdTOgd.xfm");
   #$sh->mincresample(" ".$Im3[0]." ".$PrimNome."_gdTOgd.mnc -like ".$Im3[1]." -transformation ".$PrimNome."_gdTOgd.xfm");
   #$sh->mincconcat(" ".$PrimNome."_gdTOgd.mnc $Im2[1] ".$PrimNome."-bas_gd.mnc");
   #$errInt=$sh->echo($?);#se ainda não conseguiu concatenar
   #if($errInt==0)
   #{$err1=0;}
   #$sh->rm(" ".$PrimNome."_gdTOdg.xfm");
   #$sh->rm(" ".$PrimNome."_gdTOgd.mnc");
 #}
 #$sh->gzip(" ".$PrimNome."-bas_gd.mnc");

 #******Verificação de erro**************************************

 #if($err1!=0 || $err2!=0 || $err3!=0 )
 #{
  #push(@errPaciente,$NomePaciente);

 #}
 #*************************************************************
 #undef @vector3;
 #undef @Im1;
 #undef @Im2;

 #******************************fim de Renomeia os arquivos****************************************************
 
 #******************************Processamento das imegens****************************************************
  
  print"\n\n Iniciando Processamento...\n\n";
  
  #**************************************************************************************
  print"\n\n 1° Passo) Iniciando nu_correct...\n\n";
  $sh->nu_correct("  -clobber ".$PrimNome."0_d1.mnc.gz ".$PrimNome."0_d1_nu.mnc");
  $sh->nu_correct("  -clobber ".$PrimNome."0_e1.mnc.gz ".$PrimNome."0_e1_nu.mnc");
  $sh->nu_correct("  -clobber ".$PrimNome."0_e2.mnc.gz ".$PrimNome."0_e2_nu.mnc");
  chdir("..");
  $sh->mv(" *.imp ".$NomePaciente);
  chdir($NomePaciente);
  print"\n\n Rodando denovo...\n\n";
  $sh->nu_correct("  -clobber ".$PrimNome."0_d1.mnc.gz ".$PrimNome."0_d1_nu.mnc");
  $errN1=$sh->echo($?);
  $sh->nu_correct("  -clobber ".$PrimNome."0_e1.mnc.gz ".$PrimNome."0_e1_nu.mnc");
  $errN2=$sh->echo($?);
  $sh->nu_correct("  -clobber ".$PrimNome."0_e2.mnc.gz ".$PrimNome."0_e2_nu.mnc");
  $errN3=$sh->echo($?);
  $sh->gzip(" ".$PrimNome."0_d1_nu.mnc");
  $sh->gzip(" ".$PrimNome."0_e1_nu.mnc");
  $sh->gzip(" ".$PrimNome."0_e2_nu.mnc");
  
  #******Verificação de erro**************************************

 if($errN1!=0 || $errN2!=0 || $errN3!=0 )
 {
  push(@errNPaciente,$NomePaciente);

 }
 #*************************************************************
 #**************************************************************************************
 
 #**************************************************************************************
  print"\n\n 2° Passo) Iniciando classify...\n\n";
  $sh->rm(" *.imp");
  $sh->perl(" /usr/local/mrs/scripts/prep_classify.pl ".$PrimNome."0 -patient");
  $errC1=$sh->echo($?);
  #******Verificação de erro**************************************

 if($errC1!=0)
 {
  push(@errCPaciente,$NomePaciente);
 }
 
 $sh->mincstats(" -range 1,99999999 -volume ".$PrimNome."0_brain.mnc.gz > volume.txt");
 $tag = $sh->grep(" Volume volume.txt");
 $temp = substr($tag,rindex($tag,":")+7);
 $volume = substr($temp,0,rindex($temp," "));
 $volumeConv = $volume/1000;
  print"\n\n volume: ".$volumeConv."\n\n";
  push(@nomes,$NomePaciente);
  push(@volumes,$volumeConv);

 #*************************************************************
  print"\n\n 3° Passo) Iniciando RelaxoN...\n\n";
  #require " /usr/local/mrs/scripts/relaxom1.pl";
  #&main; 
  $sh->perl(" /usr/local/mrs/scripts/relaxom1.pl");
 
  chdir("..");
  $sh->rm(" *.imp");
}
}
#*****************************************************************************************************************************************************
