#!/usr/bin/perl 

###############################################################
#Autor:Carlos Garrido Salmon 
#Ribeirao Preto,04 de julho de 2011      #
#versao 1 
###############################################################
#####################################################################
#@NAME       : Muscle_Fat.pl
#@INPUT      : 
#@OUTPUT     : Muscle_Volume.txt Muscle_FAT.txt
#@RETURNS    : 
#@DESCRIPTION: Extração dos dados de volume e conteudo de gordura em ambos multifidos.

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();


#***********************************************************Main************************************************************


print "\n*********************************************************************\n";
print "\n Starting Process...\n";
print "\n-- Please wait --\n";
@pastas = glob("./*");							# Guarda no ponteiro pastas as pastas no diretorio corrente
$NomePastaAnter="";							# Inicialização vazia da variavel NomePastaAnter
$teste = @pastas ;							# Guarda na variavel teste o numero de pastas
$contador=0;								# Inicialização nula da variavel contador
while($contador != $teste)						# Ciclo variando pelas diferentes pastas
{									# Inicio do ciclo das pastas
  $arquivo = $pastas[0];						# Guarda na variavel arquivo o nome da primeira pasta
  $Start = index($arquivo,"./") + 2;					# Operacao para escolher exatamente o nome
  $NomePasta = substr($arquivo,$Start);					# Define a variavel NomePasta como o nome da primeira pasta na lista
  if($NomePasta ne $NomePastaAnter)					# Condicional verificando que as variaveis NomePastaAnterior e NomePasta sao diferentes
  {  									# Inicio da condicional de NomePasta	
    print "\n ==================================================== \n"; 
    print "Patient name: ".$NomePasta."\n";				# Visualiza o nomde do paciente como pasta
	&Processamento;							# Executa a sob-routina Processamento para cada paciente
   }   									# Fim da condicional de NomePasta		
  $NomePastaAnter = $NomePasta;						# Re-define a variavel NomePastaAnterior com a atual
  shift(@pastas ); 							# Retira o primeiro elemento da lista
  $contador=$contador+1;						# Incremento do contador
}									# Fim do ciclo das pastas			


#*****************************Geração de arquivos de resultados************************************************
 $tam =@nomes;								# Guarda na variavel teste o numero de nomes
#**************Resultados de conteudo de gordura**********************************
 open(RELATDADOS, "> Muscle_FAT.txt");				# Abertura de arquivo para salvar dados de conteudo de gordura
 print RELATDADOS "name; FAT_Direito1 (%); ±DP(%); FAT_Esquerdo2 (%); ±DP(%); FAT_Direito1 (%); ±DP(%); FAT_Esquerdo2 (%); ±DP(%);FAT_Direito1 (%); ±DP(%); FAT_Esquerdo2 (%); ±DP(%) \n";
 $c=0;
 while($c != $tam)
	{  
	 print RELATDADOS $nomes[$c].";".$FATL5S1D_mean[$c].";".$FATL5S1D_DP[$c].";".$FATL5S1E_mean[$c].";".$FATL5S1E_DP[$c].";".$FATL4L5D_mean[$c].";".$FATL4L5D_DP[$c].";".$FATL4L5E_mean[$c].";".$FATL4L5E_DP[$c].";".$FATL3L4D_mean[$c].";".$FATL3L4D_DP[$c].";".$FATL3L4E_mean[$c].";".$FATL3L4E_DP[$c]."\n";
	 $c=$c+1;
	}


#********************************************Processamento******************************************************
sub Processamento   							# Inicio de sub-rotina de processamento
{
 chdir($NomePasta);							# Definindo NomePasta como sub-diretorio corrente
 @vector = glob("./*_e*");
 $file = $vector[0];

  @axt1 = glob("./*_axt1.mnc.gz");                                     #localização do axial T1
 $axt1 = $axt1[0];

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
 $Stop = index($NomePasta,"_".$ano);
 $PrimNome = substr($NomePasta,0,$Stop);

  $procura = $sh->grep(" dicom_0x0010:el_0x0010 mincheader.txt");
   $igual = substr($procura,rindex($procura,"=")+2);
   $espaco = substr($igual,0,rindex($igual," "));
   $Stop = index($espaco,'"') - 1;
   $Start = index($espaco,'"') + 1;
   $NomePaciente = substr($espaco,$Start,$Stop);
   $NomePaciente =~ tr/A-Z/a-z/;
   #print "\n\n O nome do paciente é: $NomePaciente \n\n";
   $NomePaciente = trim($NomePaciente);
   $NomePaciente =~ s/ /_/g;

 $sh->rm(" mincheader.txt");
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 
#************************Geração do mapa de conteudo de gordura***************************************************
 #print"\n\n Iniciando FAT...\n\n";
 $sh->mincmath(" -double -sub ".$vector[1]." ".$vector[0]." subtracao.mnc");	# Subtracao das imagens in_phase e out_phase
 $sh->mincmath(" -double -add ".$vector[1]." ".$vector[0]." soma.mnc");		# Soma das imagens in_phase e out_phase
 $sh->mincmath(" -double -div  subtracao.mnc soma.mnc div.mnc");	# Divisao da subtracao e a soma
 $sh->mincmath(" -double -div  soma.mnc subtracao.mnc div1.mnc");	# Divisao da soma e a subtracao (para regioes de maior conteudo de gordura)
 $sh->mincmath(" -double -mult -const 100  div.mnc fat_map.mnc");	# Multiplicacao por 100 para levar a percentagem, criando o mapa em fat_map.mnc
 $sh->mincmath(" -double -mult -const 100  div1.mnc fat_map1.mnc");	# Multiplicacao por 100 para levar a percentagem, criando o mapa em fat_map1.mnc                             (para regioes de maior conteudo de gordura)
 $sh->rm(" subtracao.mnc");						# Elimina o arquivo subtracao
 $sh->rm("soma.mnc");							# Elimina o arquivo soma
 $sh->rm("div.mnc");							# Elimina o arquivo div
 $sh->rm("div1.mnc");							# Elimina o arquivo div1
 $sh->gzip("fat_map.mnc");						# Compactacao do arquivo com o mapa de conteudo de gordura
 $sh->gzip("fat_map1.mnc");						# Compactacao do arquivo com o mapa de conteudo de gordura (para regioes de maior conteudo de gordura)


@label=glob("./*_lbl1_muscle.mnc*");						# Guarda no ponteiro label os arquivos _label.mnc
#$sh->gzip($label[0]);							        # Compacta o primeiro arquivo do ponteiro label
$arquivo = $label[0];
$Start = index($arquivo,"./") + 2;
$Stop = index($arquivo,".mnc") - 2;
$lbl = substr($arquivo,$Start,$Stop);
print"\n\n LBL:".$lbl;
print"\n\n ARQUIVO:".$arquivo;


@labelfat=glob("./*_lbl1_fat.mnc*");

$arquivofat = $label[0];						  # Guarda no ponteiro label os arquivos _label.mnc (FAT)
$Start = index($arquivofat,"./") + 2;
$Stop = index($arquivofat,".mnc") - 2;
$lblfat = substr($arquivofat,$Start,$Stop);
print"\n\n LBL:".$lblfat;
print"\n\n ARQUIVOfat:".$arquivofat;

@labelmuscle=glob("./*_lbl1_muscle.mnc*");			          # Guarda no ponteiro label os arquivos _label.mnc (MUSCLE)

$arquivomuscle = $label[0];
$Start = index($arquivomuscle,"./") + 2;
$Stop = index($arquivomuscle,".mnc") - 2;
$lblmuscle = substr($arquivomuscle,$Start,$Stop);
print"\n\n LBL:".$lblmuscle;
print"\n\n ARQUIVOmuscle:".$arquivomuscle;

#************************Estimativa do conteudo de gordura***************************************************
 $sh->res($lbl,"fat_map");					# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 

 $sh->res($lblfat,"fat_map");					# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 

 $sh->res($lblfat1,"fat_map1");					# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 

 $sh->res($lblfat2,"fat_map1");					# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 

 $sh->res($lblfat3,"fat_ma1p");					# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 

 $sh->res($lblfat4,"fat_map1");					# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 

 $sh->res($lblfat5,"fat_map1");					# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 

 $sh->res($lblmuscle,"fat_map");				# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 

  $sh->res($lblmuscle1,"fat_map");				# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 

  $sh->res($lblmuscle2,"fat_map");				# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 
 
  $sh->res($lblmuscle3,"fat_map");				# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
 #print "lbl: ".$lbl."\n"; 

  $sh->res($lblmuscle4,"fat_map");				# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
  #print "lbl: ".$lbl."\n"; 

  $sh->res($lblmuscle5,"fat_map");				# Faz o reslice do arquivo de label em funcao do fat_map criando um novo arquivo 
  #print "lbl: ".$lbl."\n"; 

#************************Media em musculo multifidio direito L5S1**********************************************************
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $MUSCLEL5S1D_mean = substr($temp1,0,rindex($temp1," "));
 print "MUSCLEL5S1D_mean: ".$MUSCLEL5S1D_mean."\n";
 $sh->rm("volume1.txt");
 push(@MUSCLEL5S1D_mean,$MUSCLEL5S1D_mean);

#***********

 $sh->mincstats(" -mean fat_map1.mnc.gz -mask ".$lblfat."_res.mnc.gz > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FATL5S1D_mean = substr($temp1,0,rindex($temp1," "));
 print "FATL5S1D_mean: ".$FATL5S1D_mean."\n";
 $sh->rm("volume1.txt");
 push(@FATL5S1D_mean,$FATL5S1D_mean);





#************************Media em musculo multifidio direito L5S1**********************************************************
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FATL5S1D_mean = substr($temp1,0,rindex($temp1," "));
 print "FATL5S1D_mean: ".$FATL5S1D_mean."\n";
 $sh->rm("volume1.txt");
 push(@FATL5S1D_mean,$FATL5S1D_mean);
#************************Desvio padrao em multifidio direito L5S1**************************************************
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 1 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $FATL5S1D_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FATL5S1D_DP,$FATL5S1D_DP);
#************************Media em musculo multifidio esquerdo L5S1********************************************************** 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FATL5S1E_mean = substr($temp1,0,rindex($temp1," "));
 print "FATL5S1E_mean: ".$FATL5S1E_mean."\n";
 $sh->rm("volume1.txt");
 push(@FATL5S1E_mean,$FATL5S1E_mean);
#************************Desvio padrao em musculo multifidio esquerdo L5S1**************************************************
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 2 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $FATL5S1E_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FATL5S1E_DP,$FATL5S1E_DP);					
#************************Media em musculo multifidio direito L4L5**********************************************************
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FATL4L5D_mean = substr($temp1,0,rindex($temp1," "));
 print "FATL4L5D_mean: ".$FATL4L5D_mean."\n";
 $sh->rm("volume1.txt");
 push(@FATL4L5D_mean,$FATL4L5D_mean);
#************************Desvio padrao em multifidio direito L4L5**************************************************
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 8 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $FATL4L5D_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FATL4L5D_DP,$FATL4L5D_DP);
#************************Media em musculo multifidio esquerdo L4L5********************************************************** 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FATL4L5E_mean = substr($temp1,0,rindex($temp1," "));
 print "FATL4L5E_mean: ".$FATL4L5E_mean."\n";
 $sh->rm("volume1.txt");
 push(@FATL4L5E_mean,$FATL4L5E_mean);
#************************Desvio padrao em musculo multifidio esquerdo L4L5**************************************************
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 4 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $FATL4L5E_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FATL4L5E_DP,$FATL4L5E_DP);
#************************Media em musculo multifidio direito L3L4**********************************************************
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FATL3L4D_mean = substr($temp1,0,rindex($temp1," "));
 print "FATL3L4D_mean: ".$FATL3L4D_mean."\n";
 $sh->rm("volume1.txt");
 push(@FATL3L4D_mean,$FATL3L4D_mean);
#************************Desvio padrao em multifidio direito L3L4**************************************************
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 5 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $FATL3L4D_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FATL3L4D_DP,$FATL3L4D_DP);
#************************Media em musculo multifidio esquerdo L3L4********************************************************** 
 $sh->mincstats(" -mean fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 6 > volume1.txt");
 $tag1 = $sh->grep(" Mean volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $FATL3L4E_mean = substr($temp1,0,rindex($temp1," "));
 print "FATL3L4E_mean: ".$FATL3L4E_mean."\n";
 $sh->rm("volume1.txt");
 push(@FATL3L4E_mean,$FATL3L4E_mean);
#************************Desvio padrao em musculo multifidio esquerdo L3L4**************************************************
 $sh->mincstats(" -stddev fat_map.mnc.gz -mask ".$lbl."_res.mnc.gz -mask_binvalue 6 > volume1.txt");
 $tag1 = $sh->grep(" Stddev volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+13);
 $FATL5S1E_DP = substr($temp1,0,rindex($temp1," "));
 $sh->rm("volume1.txt");
 push(@FATL3L4E_DP,$FATL3L4E_DP);
 #$sh->rm($lbl."_res.mnc.gz");"\n";
	

# Apaga arquivo *_res.mnc.gz

#*********************Fim da estimativa do conteudo de gordura*************************************************

 chdir("..");							# Deixa no diretorio inicial		
}								# Fim do programa principal


#**************************************************************************************************************************************************
sub trim {
  my $string = shift;
  for ($string) {
    s/^\s+//;
    s/\s+$//;
  }
  return $string;
}

