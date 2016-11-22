#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               #
#Ribeirao Preto,16 de janeiro de 2007                                                                                                                                         #
#versao 1.0                                                                                                                                                                                       #
# A teoria parao desenvolvimento desta ferramenta foi retirada da tese de doutorado de André Luiz Mendes Matos        #
# "Criação de um mapa voxel por voxel da distribuição espacial da transferencia de magnetização na suabstância          #
#                                                     Branca do cérebro humano de adultos normais"                                                                    #
#                                                   							                                                                           #
#                                                    - Análise do histograma do MTR da substância branca e cinzenta                                       #
#                                                    - Análise Golobal - mapas: média, desvio padrão, z-score                                                      #
#####################################################################
#@NAME       : DEMMT.pl
#@INPUT      : 
#@OUTPUT     : mapa_medio_MTR.mnc,mapa_medio_white_matter.mnc,mapa_medio_gray_matter.mnc,<mrs_id>_mt.mnc, and <mrs_id>_nnr.txt
#@RETURNS    : 
#@DESCRIPTION: Criação de um mapa voxel por voxel da distribuição espacial da transferencia de magnetização na suabstância Branca do cérebro humano.

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
mkdir("nift_files");
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
 chdir("nift_files");
	$sh->gzip("*.nii");
 chdir("..");
 
sub Processamento 
{print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
  print "\n\n".$pastas[0]."\n\n";
 
 $Stop = index($NomePasta,"_2");
 $NomePaciente = substr($NomePasta,0,$Stop);
 #$Stop = index($NomePasta,"_");
 #$PrimNome = substr($NomePasta,0,$Stop);
 #$sh->rm(" mincheader.txt");

#normalização D
#Variáveis Globais
 #variáveis dependentes da sequencia!Em caso de mudança de protocolo verificar
 $RSfa = 0.24169922;#Olhar no mapa de fa na tag (2005,140A)
 $RI = 0;#olha em qualquer uma das imagens na tag (2005,1409)
print "\n\n Normalizando o faMap\n";
 
 #@dMap = glob("./*_dMap.mnc.gz");
 @faMap = glob("./*_faMap.mnc.gz");
 #$sh->gunzip($dMap[0]);
 $sh->gunzip($faMap[0]);
 @faMap = glob("./*_faMap.mnc");
     
	 $sh->mincmath(" -const ".$RSfa." -mult ".$faMap[0]." faMap_mult.mnc");
	 $sh->mincmath(" -const ".$RI." -add faMap_mult.mnc faMap_add.mnc");
	 $sh->mincmath(" -const 1000 -div faMap_add.mnc faMap_normalizada.mnc");
	 $sh->rm("faMap_mult.mnc");
	 $sh->rm("faMap_add.mnc");
	 
print "\n\n convertendo de minc para nift\n";	 
$sh->mnc2nii(" -int faMap_normalizada.mnc ".$ARGV[0]."_".$NomePaciente."_faMap_normalizada.nii");
#$sh->rm("faMap_add.mnc");
chdir("..");
$sh->mv(" $arquivo/".$ARGV[0]."_".$NomePaciente."_faMap_normalizada.nii ./nift_files");
}