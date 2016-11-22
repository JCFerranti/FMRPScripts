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
 

 #******************************fim de Renomeia os arquivos****************************************************
 
 #******************************Processamento das imegens****************************************************
  
 print"\n\n Iniciando Processamento...\n\n";
  
  #**************************************************************************************
  print"\n\n 1° Passo) Iniciando nu_correct...\n\n";
  $sh->nu_correct("  -clobber ".$PrimNome."-bas_d1.mnc.gz ".$PrimNome."-bas_d1_nu.mnc");
  $sh->nu_correct("  -clobber ".$PrimNome."-bas_e1.mnc.gz ".$PrimNome."-bas_e1_nu.mnc");
  $sh->nu_correct("  -clobber ".$PrimNome."-bas_e2.mnc.gz ".$PrimNome."-bas_e2_nu.mnc");
  chdir("..");
  $sh->mv(" *.imp ".$NomePaciente);
  chdir($NomePaciente);
  print"\n\n Rodando denovo...\n\n";
  $sh->nu_correct("  -clobber ".$PrimNome."-bas_d1.mnc.gz ".$PrimNome."-bas_d1_nu.mnc");
  $errN1=$sh->echo($?);
  $sh->nu_correct("  -clobber ".$PrimNome."-bas_e1.mnc.gz ".$PrimNome."-bas_e1_nu.mnc");
  $errN2=$sh->echo($?);
  $sh->nu_correct("  -clobber ".$PrimNome."-bas_e2.mnc.gz ".$PrimNome."-bas_e2_nu.mnc");
  $errN3=$sh->echo($?);
  $sh->gzip(" ".$PrimNome."-bas_d1_nu.mnc");
  $sh->gzip(" ".$PrimNome."-bas_e1_nu.mnc");
  $sh->gzip(" ".$PrimNome."-bas_e2_nu.mnc");
  
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
  $sh->perl(" /usr/local/mrs/scripts/prep_classify.pl ".$PrimNome."-bas -patient");
  $errC1=$sh->echo($?);
    #******Verificação de erro**************************************

 if($errC1!=0)
 {
  push(@errCPaciente,$NomePaciente);

 }
 #*************************************************************
   
  chdir("..");
  $sh->rm(" *.imp");

}
#*****************************************************************************************************************************************************
