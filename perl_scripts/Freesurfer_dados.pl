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
    print RELATDADOS "Nome;Cortex entorrinal direito;Cortex entorrinal esquerdo;temporal médio direito;temporal médio esquerdo;temporal superior direito;temporal superior esquerdo;temporal pole direito;temporal pole esquerdo;temporal transverso direito;temporal transverso esquerdo;temporal inferior direito;temporal inferior esquerdo;substância branca direito;substância branca esquerda;substância cinzenta direita;substância cinzenta esquerda;Hipocampo direito;Hipocampo esquerdo;Ventriculo lateral direito;Ventriculo lateral esquerdo;amigdala direita;amigda esquerda;CC_Posterior;CC_Mid_Posterior;CC_Central;CC_Mid_Anterior;CC_Anterior;Tálamo direito;Tálamo esquerdo \n";
$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$cortexentdir[$c].";".$cortexentesq[$c].";".$temporalmediodireito[$c].";".$temporalmedioesq[$c].";".$temporalsuperiordir[$c].";".$temporalsuperioresq[$c].";".$temporalpoledir[$c].";".$temporalpoleesq[$c].";".$temporaltransdir[$c].";".$temporaltransesq[$c].";".$temporalinfdir[$c].";".$temporalinfesq[$c].";".$substbrancadir[$c].";".$substbrancaesq[$c].";".$substcinzdir[$c].";".$substcinzesq[$c].";".$hipocampodir[$c].";".$hipocampoesq[$c].";".$ventricculodir[$c].";".$ventricculoesq[$c].";".$amigdaladir[$c].";".$amigdalaesq[$c].";".$CC_posterior[$c].";".$CC_Mid_Posterior[$c].";".$CC_Central[$c].";".$CC_Mid_Anterior[$c].";".$CC_Anterior[$c].";".$talamo_direito[$c].";".$talamo_esquerdo[$c]."\n";
	   $c=$c+1;
	}
 
sub Processamento
{print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
 push(@nomes,$NomePasta);
 chdir("stats");
 #Cortex entorrinal direito

 system(" awk \' NR == 58 {print \$4}\' rh.aparc.stats > teste1.txt");
  
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $cortexentdir  = trim($_);
  }
 close(TESTE);
 push(@cortexentdir,$cortexentdir);		 
  $sh->rm("teste1.txt");

 #Cortex entorrinal esquerdo
 #$cortexentesq=$sh->awk(" 'NR==58 {print$4}' lh.aparc.stats");
  system(" awk \' NR == 58 {print \$4}\' lh.aparc.stats > teste1.txt");
  
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $cortexentesq  = trim($_);
  }
 close(TESTE);
 push(@cortexentesq,$cortexentesq);	
 $sh->rm("teste1.txt");
 
 #temporal médio direito
 #$temporalmediodireito=$sh->awk(" 'NR==67 {print$4}' rh.aparc.stats");
   system(" awk \' NR == 67 {print \$4}\' rh.aparc.stats > teste1.txt");
  
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $temporalmediodireito  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@temporalmediodireito,$temporalmediodireito);	
 
 #temporal médioesquerdo
 #$temporalmedioesq=$sh->awk(" 'NR==67 {print$4}' lh.aparc.stats");
   system(" awk \' NR == 67 {print \$4}\' lh.aparc.stats > teste1.txt");
  
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $temporalmedioesq  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt"); 
 push(@temporalmedioesq,$temporalmedioesq);	
 
 #temporal superior direito
 #$temporalsuperiordir=$sh->awk(" 'NR==82 {print$4}' rh.aparc.stats");
  system(" awk \' NR == 82 {print \$4}\' rh.aparc.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $temporalsuperiordir  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt"); 
 push(@temporalsuperiordir,$temporalsuperiordir);	
 
 #temporal superior esquerdo
 #$temporalsuperioresq=$sh->awk("'NR==82 {print$4}' lh.aparc.stats");
 system(" awk \' NR == 82 {print \$4}\' lh.aparc.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $temporalsuperioresq  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt"); 
 push(@temporalsuperioresq,$temporalsuperioresq);	
 
 #temporal pole direito
#$temporalpoledir=$sh->awk("'NR==85 {print$4}' rh.aparc.stats");
  system(" awk \' NR == 85 {print \$4}\' rh.aparc.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $temporalpoledir  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");  
 push(@temporalpoledir,$temporalpoledir);

#temporal pole esuqerdo
#$temporalpoleesq=$sh->awk("'NR==85 {print$4}' lh.aparc.stats");
system(" awk \' NR == 85 {print \$4}\' lh.aparc.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $temporalpoleesq  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt"); 
 
 push(@temporalpoleesq,$temporalpoleesq);

#temporal transverso direito 
#$temporaltransdir=$sh->awk("'NR==86 {print$4}' rh.aparc.stats");
 system(" awk \' NR == 86 {print \$4}\' rh.aparc.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $temporaltransdir  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt"); 
 push(@temporaltransdir,$temporaltransdir);
 
 #temporal transverso esquerdo
 #$temporaltransesq=$sh->awk("'NR==86 {print$4}' lh.aparc.stats");
  system(" awk \' NR == 86 {print \$4}\' lh.aparc.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $temporaltransesq  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt"); 
 push(@temporaltransesq,$temporaltransesq);
 
 #temporal inferior direito
#$temporalinfdir=$sh->awk("'NR==61 {print$4}' rh.aparc.stats");
 system(" awk \' NR == 61 {print \$4}\' rh.aparc.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $temporalinfdir  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt"); 
 push(@temporalinfdir,$temporalinfdir);
 
  #temporal inferior esquerdo
 #$temporalinfesq=$sh->awk("'NR==61 {print$4}' lh.aparc.stats");
system(" awk \' NR == 61 {print \$4}\' lh.aparc.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $temporalinfesq  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt"); 
 push(@temporalinfesq,$temporalinfesq);
 
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
 
 #Hipocampo direito;
#$hipocampodir=$sh->awk("'NR==99 {print$4}' aseg.stats");
system(" awk \' NR == 99 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $hipocampodir  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 
 push(@hipocampodir,$hipocampodir);
 
#Hipocampo esquerdo;
#$hipocampoesq=$sh->awk("'NR==82 {print$4}' aseg.stats");
 system(" awk \' NR == 82 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $hipocampoesq  = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@hipocampoesq,$hipocampoesq);
 
 #Ventriculo lateral direito;
#$ventricculodir=$sh->awk("'NR==91 {print$4}' aseg.stats");
  system(" awk \' NR == 91 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $ventricculodir = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@ventricculodir,$ventricculodir);
 
 #Ventriculo lateral esquerdo;
 #$ventricculoesq=$sh->awk("'NR==71 {print$4}' aseg.stats");
system(" awk \' NR == 71 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $ventricculoesq = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@ventricculoesq,$ventricculoesq);
 
 #amigdala direita;
 #$amigdaladir=$sh->awk("'NR==100 {print$4}' aseg.stats");
 system(" awk \' NR == 100 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $amigdaladir = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@amigdaladir,$amigdaladir);
 
 #amigda esquerda;
#$amigdalaesq=$sh->awk("'NR==83 {print$4}' aseg.stats");
  system(" awk \' NR == 83 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $amigdalaesq = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@amigdalaesq,$amigdalaesq);
 
 #CC_Posterior;
 #$CC_posterior=$sh->awk("'NR==113 {print$4}' aseg.stats");
 system(" awk \' NR == 113 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $CC_posterior = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@CC_posterior,$CC_posterior);
 
 #CC_Mid_Posterior;
#$Mid_Posterior=$sh->awk("'NR==114 {print$4}' aseg.stats");
  system(" awk \' NR == 114 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $CC_Mid_Posterior = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 
 push(@CC_Mid_Posterior,$CC_Mid_Posterior);
 
 #CC_Central;
 #$CC_Central=$sh->awk("'NR==115 {print$4}' aseg.stats");
 system(" awk \' NR == 115 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $CC_Central = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@CC_Central,$CC_Central);
 
 #CC_Mid_Anterior;
#$CC_Mid_Anterior=$sh->awk("'NR==116 {print$4}' aseg.stats");
  system(" awk \' NR == 116 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $CC_Mid_Anterior = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@CC_Mid_Anterior,$CC_Mid_Anterior);
 
 #CC_Anterior
 #$CC_Anterior=$sh->awk("'NR==117 {print$4}' aseg.stats");
system(" awk \' NR == 117 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $CC_Anterior = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@CC_Anterior,$CC_Anterior);

	
 #Tálamo
system(" awk \' NR == 95 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $talamo_direito = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@talamo_direito,$talamo_direito);

#Tálamo
system(" awk \' NR == 75 {print \$4}\' aseg.stats > teste1.txt");
  open(TESTE, "<teste1.txt");
  while(<TESTE>) 
  {
   $talamo_esquerdo = trim($_);
  }
 close(TESTE);
 $sh->rm("teste1.txt");
 push(@talamo_esquerdo,$talamo_esquerdo);


 
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
