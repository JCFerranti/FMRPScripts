#!/usr/bin/perl 

###############################################################
#Autores:Paula Rejane Beserra Diniz e Carlos Garrido Salmon   #
#Ribeirao Preto-Vitoria da Conquista,03 de agosto de 2006      #
#versao 2 
###############################################################

# Modulo(Biblioteca) de acesso aos comandos do shell
use Shell; 

my $sh = Shell->new();

sub main
{

 print"\n\n Iniciando RelaxoN...\n\n";

#print "Digite o número de ecos (coincide com o número de arquivos): ";

#$necos = <STDIN>;
#$chomp = chomp($necos);
#corrige o usuário caso tenha digitado 1 como numero de echos.(Esta ok!)
@vector = glob("./*_e*.mnc.gz");
print "Arquivos com ecos: ".$vector."\n"; 
#@Im1 = grep(/(e[0-9][0-9])/,@vector3);
$necos = @vector;
print"\n\n O valor do numero de echos eh $necos ...\n\n";
while($necos == 1)
{ 
	print "\n\n************ATENÇÃO:DEVE TER, AO MENOS, 2 ECHOS ***************************\n\n";
	print "Por favor digite:\n 1 para definir o numero de echos\n ou \n 2 se desejar sair do programa deseja sair\n\n";
	print "Resposta:";
	$resposta = <STDIN>;
	$chomp = chomp($resposta);
	if($resposta == 1)
		{print "\n\nDigite o número de ecos (coincide com o número de arquivos): ";
		 $necos = <STDIN>;
		 $chomp = chomp($necos);
		 }
		else
		{ print "\n\nATIVIDADE FINALIZADA\n";
		print "***************************************************************************\n";
		exit;
		}
		
}	
$kk = $necos;
$EcNu = 1;
$xs = 0;
$x2s = 0;
#print "\n Escolha o primeiro numero do echo\n\n";
#	print "Resposta:";
	#$resposta = <STDIN>;
	#$chomp = chomp($resposta);
	$resposta =1;
	
print "\n Iniciando Etapa 1...\n";	
while($kk != 0)
	{ 
        print "Contador: ".$kk."\n"; 
	 &BuscaImagem;
        print "Im: ".$Im."\n"; 
	#limpa o nome da imagem e guarda na variável 
	$Imagem = substr($Im,rindex($Im,"/")+1);	
	&ValorTempoEcho;
    	print "\n O valor do tempo de echo $resposta é: $TE ...\n";	
	#print "\nFazendo o logaritmo da imagem e$resposta ...\n";
	$sh->mincmath(" -clobber -double -log ".$Imagem." logy.mnc");
	
	#print "\n Multiplicando a imagem resultante do logaritmo pelo tempo de echo correspondente...\n";
	$sh->mincmath(" -clobber -double -mult -constant $TE logy.mnc xy.mnc");
	if($EcNu > 1)
		{$sh->mincmath(" -clobber -double -add xys.mnc xy.mnc xya.mnc");
	  	$sh->mincmath(" -clobber -double -add ys.mnc logy.mnc ya.mnc");
		$sh->mv("xya.mnc xys.mnc");
		$sh->mv("ya.mnc ys.mnc");}
	else
		{$sh->mv("xy.mnc xys.mnc");
		$sh->mv("logy.mnc ys.mnc");}

	$xs = $xs + $TE;
	$x2s = $x2s + $TE*$TE;

	$EcNu = $EcNu + 1;
	$kk= $kk - 1;
	$resposta = $resposta + 1;
	}

$sh->rm(" logy.mnc");

$sh->rm(" xy.mnc");
print "\n Iniciando Etapa 2...\n";
$Numer = $necos*$x2s - $xs*$xs;

$aDenom = 1/$Numer;

$sh->mincmath(" -double -mult -constant ".$xs." ys.mnc xsys.mnc");

$sh->mincmath(" -double -mult -constant ".$x2s." ys.mnc x2sys.mnc");

$sh->rm(" ys.mnc");

$sh->mincmath(" -double -mult -constant ".$necos." xys.mnc nxys.mnc");

$sh->mincmath(" -double -mult -constant ".$xs." xys.mnc xsxys.mnc");

$sh->rm(" xys.mnc");

$sh->mincmath(" -double -sub x2sys.mnc xsxys.mnc aNumer.mnc");

$sh->rm(" x2sys.mnc");

$sh->rm(" xsxys.mnc");

$sh->mincmath(" -double -sub xsys.mnc nxys.mnc Denom.mnc");
     
$sh->rm(" xsys.mnc");

$sh->rm(" nxys.mnc");

$sh->mincmath(" -double -invert -constant ".$Numer." Denom.mnc relaxosj.mnc");
     
$sh->rm(" Denom.mnc");



#$sh->mincmath(" -double -exp -constant ".$aDenom." aNumer.mnc density.mnc");

#$sh->rm(" aNumer.mnc");

print "\nGerando a imagem de Relaxometria...\n";

$sh->mincwindow(" relaxosj.mnc relaxom.mnc 1 1000");

#$sh->mincmath(" -segment -const2 1 1500 relaxosj.mnc");

print "\nGerando a imagem de Densidade de protons...\n";

$sh->mincmath(" -double -exp -constant ".$aDenom." aNumer.mnc density.mnc");

$sh->rm(" aNumer.mnc");

#$sh->mincmath(" -double -mult relaxosj.mnc density.mnc densitysc.mnc");

#$sh->rm(" density.mnc");

$sh->rm(" relaxosj.mnc");

#$resposta=0;
#while($resposta!=3)
#{
#	print "TRABALHO CONCLUIDO\n";
#	print "***************************************************************\n";
#	print "Deseja vizualizar a imagem ...\n";
#	print "Digite:\n a) 1 se desejar vizualizar a imagem de relaxometria.\n b) 2 se desejar vizualizar a imagem de densidade de protons. \n c) 3 se desejar sair do programa. \n";
#	print "Resposta:";
#	$resposta=<STDIN>;
#
#	if($resposta == 1)
#	  {$sh->xdisp(" relaxom.mnc");
#	  }
#	else
#	{ if($resposta == 2)
#	  {$sh->xdisp(" density.mnc");
#	  }
#	  else 
#	  {
#		if($resposta == 3)
#		{print "ATIVIDADE FINALIZADA\n";
#		 print "***************************************************************\n";
#		}
#	  }
#	}
}



#subrotina que faz a busca pela Imagem correspondente ao echo***********************************
sub BuscaImagem
{
	@vector = glob("./*_e*.mnc.gz");
        print "Arquivos com ecos: ".$vector."\n"; 
	for(@vector) 
	{
      if(/(e$resposta)/) # Todas as imagens que contenham a expressão
      {
         $Im = $_;
	
	  }
	}
}
# fim da busca pela imagem ******************************************************************

#subrotina para obter o tempo de echo da imagem************************************************
sub ValorTempoEcho
{	
        print "Imagem: ".$Imagem."\n"; 
        $sh->mincheader(" $Imagem > mincheader.txt");
	$vector = $sh->grep(" echo_time mincheader.txt");
	$temp = substr($vector,rindex($vector,"=")+2);
	$temp2 = substr($temp,0,rindex($temp," "));
	$TE = $temp2*1000;
	$sh->rm(" mincheader.txt");
}
# fim da busca pelo tempo de echo************************************************************

