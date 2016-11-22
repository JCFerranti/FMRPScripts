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
@vectorpasta = glob("./*");
print " veja: ".$vectorpasta[0];
$teste = @vectorpasta;
print @vectorpasta;
$contador=0;
while($contador != $teste)
{
  $arquivo = $vectorpasta[0];
  
  #$Stop = index($arquivo,"_")-2;
  $Start = index($arquivo,"./") + 2;
  $NomePaciente = substr($arquivo,$Start);
  print "\n\n $NomePaciente \n\n";
  $Stop = index($NomePaciente,"_");
  $PrimNome = substr($NomePaciente,0,$Stop);
  if($PrimNome ne $PrimNomeAnter)
  {
    
    print "O nome do paciente eh: ".$NomePaciente."\n";
	push(@errCPaciente,$PrimNome);
    }   
  
  $PrimNomeAnter = $PrimNome;
  shift(@vectorpasta); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}

open(RELATERR, ">Relatorio_erros_EM_process.htm"); # Abrir arquivo HTML para escrita
print RELATERR "<html>\n<head>\n"; # Escrita no arquivo HTML
print RELATERR "<title>RELATÓRIO DE ERROS</title>\n";
print RELATERR "</headn\n<body bgcolor=#FFFFFF\n";

print RELATERR "<b><BR>*********************Relatorio*********************** <BR></b>";

if(@errCPaciente)
  { $tam =@errCPaciente;
    print RELATERR "<BR><b>Ocorreram erros nos seguintes pacientes :</b><BR>";
	$c=0;
	while($c != $tam)
	{ print RELATERR "<b>".$errCPaciente[$c]."<BR></b>";
	  $c=$c+1;
	}
  }
else {print RELATERR "<b><BR>NÃO ocorreram ERROS durante a relaxo <BR></b>";}
print RELATERR "<b><BR>*****************************************************<BR></b>";
close(RELATERR);