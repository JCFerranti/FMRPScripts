#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz                                                                                                                                               #
#Ribeirao Preto,31 de Março de 2011                                                                                                                                        #
#versao 1.0                                                                                                                                                                                       #
#####################################################################
#@NAME       : process_MT_mama.pl
#@INPUT      : dimagem d1,d2 e label
#@OUTPUT     : dados_MT_tumor.txt
#@RETURNS    : 
#@DESCRIPTION: Calculo do mapa de MTR e extração dos valores de MTR dos labels
#
########################################
# Protocolo de processamento
# CA de mama
# Requisito: Label 1- Tumor
#                  2- Tecido fibroglandular
#                  3- Gordura
########################################

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************


print "\n*********************************************************************\n";

print "\n Iniciando Processo...\n";
print "\n-- Por favor aguarde --\n";
@vector = glob("./*");
$NomePacienteAnter="";


$teste = @vector;
$contador=0;
#mkdir("analise_da_amostra");
while($contador != $teste)
{
  $arquivo = $vector[0];
  

  $Start = index($arquivo,"./") + 2;
  $NomePaciente = substr($arquivo,$Start);
  if($NomePaciente ne $NomePacienteAnter)
  {
	print "\n ======================================================================= \n";
    #print "O nome do paciente eh: ".$NomePaciente."\n";
	&Processamento;
  }   
  
  $NomePacienteAnter = $NomePaciente;
  shift(@vector); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
}

open(RELATDADOS, "> dados_MT_tumor.txt");
    $tam =@nomes;
	print RELATDADOS "nome;Tumor; Tecido fibroglandular saudável; Gordura;\n";
	$c=0;
	while($c != $tam)
	{  
	   print RELATDADOS $nomes[$c].";".$mediasmttumor[$c].";".$mediasmtTfibroglandular[$c].";".$mediasmtgordura[$c]."\n";
	  $c=$c+1;
	}


#=============================================================================
sub Processamento
{print"\n\n Obtendo dados do paciente:".$NomePaciente."\n\n";
 chdir($NomePaciente);
  $ruido = 15;
  @d1 = glob("./*_d1.mnc.gz"); #com o pulso
  @d2 = glob("./*_d2.mnc.gz"); #sem o pulso 
  @label = glob("./*_lbl.mnc.gz"); 
 
  
 $Stop = index($NomePaciente,"_");
 $PrimNome = substr($NomePaciente,0,$Stop);
  print "\n\n".$d1[0]."\n\n";
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
 
 $Stop = index($NomePaciente,"_");
 #$NomePaciente = substr($NomePasta,0,$Stop);
 $Stop = index($NomePaciente,"_".$ano);
 $PrimNome = substr($NomePaciente,0,$Stop);
 $sh->rm(" mincheader.txt");
 
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 print "\n\n Primeiro nome: $PrimNome \n\n";
 $sh->mv(" ".$label[0]." ./".$PrimNome."_0_lbl.mnc.gz");  
 #print "\n\n".$pastas [0]."\n\n";
  $sh->mv(" ".$d1[0]." ..");
  $sh->mv(" ".$d2[0]." ..");
	chdir("..");
	$sh->nu_correct("  -distance 30 ".$d1[0]." nu_".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc");
  $sh->nu_correct("  -distance 30 ".$d2[0]." nu_".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc");
	$sh->mv(" *.mnc ./".$NomePaciente);
  $sh->mv(" *.mnc.gz ./".$NomePaciente);
	$sh->rm(" *.imp");
	chdir($NomePaciente);
   
 
 #print "\n\n Primeiro nome: $PrimNome \n\n";
 
#******************************Processamento das imegens********************************
  
  print"\n\n Iniciando Processamento...\n\n";
  
#**************************************************************************************
  #---> Gerando a Imagem de MTR
  print"\n\n Gerando o mapa de MTR...\n\n";

  $sh->mincmath(" -pd -const ".$ruido." nu_".$PrimNome."_".$ano.$mes.$dia."_0_d2.mnc nu_".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
  $sh->gzip(" ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc");
  
 #---> Obtendo dados do label
  print"\n\n Gerando o mapa de MTR...\n\n";
 
 $sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_".$ano.$mes.$dia."_mt ");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_tumor= substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 #$sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 #$tag1 = $sh->grep(" Stddev volume1.txt");
 #$temp1 = substr($tag1,rindex($tag1,":")+13);
 #$desvio_mt_tumor = substr($temp1,0,rindex($temp1," "));
 #$sh->rm("volume1.txt");
 
 #$sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_".$ano.$mes.$dia."_mt ");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_Tfibroglandular = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 #$sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 #$tag1 = $sh->grep(" Stddev volume1.txt");
 #$temp1 = substr($tag1,rindex($tag1,":")+13);
 #$desvio_mt_Tfibroglandular  = substr($temp1,0,rindex($temp1," "));
 #$sh->rm("volume1.txt");
 
 #$sh->res(" ".$PrimNome."_0_lbl ".$PrimNome."_".$ano.$mes.$dia."_mt ");
 $sh->mincstats(" -mean ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $media_mt_gordura = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 
 #$sh->mincstats(" -stddev ".$PrimNome."_".$ano.$mes.$dia."_mt.mnc.gz -mask ".$PrimNome."_0_lbl_res.mnc.gz -mask_binvalue 3 > volume1.txt");
 #$tag1 = $sh->grep(" Stddev volume1.txt");
 #$temp1 = substr($tag1,rindex($tag1,":")+13);
 #$desvio_mt_gordura = substr($temp1,0,rindex($temp1," "));
 #$sh->rm("volume1.txt"); 
 
 #fornado a matrix de dados
	 push(@mediasmttumor,$media_mt_tumor);
   push(@mediasmtTfibroglandular,$media_mt_Tfibroglandular);
   push(@mediasmtgordura,$media_mt_gordura);

   
   
chdir("..");
}