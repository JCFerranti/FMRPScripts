#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               #
#Ribeirao Preto,16 de janeiro de 2007                                                                                                                                         #
#versao 1.0                                                                                                                                                                                       #
#####################################################################
#@NAME       :segmenting_corpus_callosum.pl
#@INPUT      : 
#@OUTPUT     : 
#@RETURNS    : 
#@DESCRIPTION: segmentação automática do corpo caloso

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

 open(RELATDADOS, "> Dados_freesurfer.txt");
    $tam =@nomes;
    print RELATDADOS "Nome;substancia branca;substancia cinzenta \n";
$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$substanciabranca[$c].";".$substanciacinzenta[$c]."\n";
	   $c=$c+1;
	}
 
sub Processamento
{print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
 push(@nomes,$NomePasta);
 chdir("stats");
 
 
 #substância branca direito
 #$substbrancadir=$sh->awk("'NR==89 {print$4}' aseg.stats");
  system(" awk \' NR == 89 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $substbrancadir = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@substbrancadir,$substbrancadir);
 
 #substância branca esuqerdo
 #$substbrancaesq=$sh->awk("'NR==69 {print$4}' aseg.stats");
 system(" awk \' NR == 69 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $substbrancaesq  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 
 push(@substbrancaesq,$substbrancaesq);
 
 #substância cinzenta direita
 #$substcinzdir=$sh->awk("'NR==90 {print$4}' aseg.stats");
 system(" awk \' NR == 90 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $substcinzdir  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");

  push(@substcinzdir,$substcinzdir);
 
 #substância cinzenta esuqerdo
 #$substcinzesq=$sh->awk("'NR==70 {print$4}' aseg.stats");
  system(" awk \' NR == 70 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $substcinzesq  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@substcinzesq,$substcinzesq);
 
 #substancia branca do cerebelo direito
#$hipocampodir=$sh->awk("'NR==99 {print$4}' aseg.stats");
system(" awk \' NR == 93 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $substbrancadircerebelo  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 
 push(@substbrancadircerebelo,$substbrancadircerebelo);
 
#substancia branca do cerebelo esquerdo
#$hipocampoesq=$sh->awk("'NR==82 {print$4}' aseg.stats");
 system(" awk \' NR == 73 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $substbrancaesqcerebelo  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@substbrancaesqcerebelo,$substbrancaesqcerebelo);
 
 #substancia cinzenta cerebelo direito
#$ventricculodir=$sh->awk("'NR==91 {print$4}' aseg.stats");
  system(" awk \' NR == 94 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $substcinzdircerebelo = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@substcinzdircerebelo,$substcinzdircerebelo);
 
 #substancia cinzenta cerebelo esuqerdo
 #$ventricculoesq=$sh->awk("'NR==71 {print$4}' aseg.stats");
system(" awk \' NR == 74 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $substcinzesqcerebelo = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@substcinzesqcerebelo,$substcinzesqcerebelo);
 
 $substanciabranca = ($substbrancadir+$substbrancaesq+$substbrancaesqcerebelo+$substbrancadircerebelo)/1000;
 $substanciacinzenta = ($substcinzdir+$substcinzesq+$substcinzesqcerebelo+$substcinzdircerebelo)/1000;

push(@substanciabranca,$substanciabranca);
push(@substanciacinzenta,$substanciacinzenta);

 
 chdir("..");
 chdir("..");
 }
 
 sub trim {
  my $string = shift;
  for ($string) {
    s/^\s+//;
    s/\s+$//;
  }
  return $string;
}
