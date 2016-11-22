#!/usr/bin/perl -W

#####################################################################
#Autor:Paula Rejane Beserra Diniz and Gustavo Bonugli                                                                                                                                              #
#Ribeirao Preto,20 de setembro de 2013                                                                                                                                         #
#versao 1.0                                                                                                                                                                                       #
#
#####################################################################
#@NAME       : AreaMuscleFat.pl
#@INPUT      : imagem axial T1 da lombar(termianção axt1); arquivo contendo os labels dos musculos no nível dos discos L5S1, L4L5 e L3L4 (terminação _multifidus_disk_lbl)
#@OUTPUT     : <name_patients>_lbl1_fat.mnc; <name_patients>_lbl1_fat.mnc; Area_muscle.txt; Area_fat.txt
#@RETURNS    : 
#@DESCRIPTION: Realiza a segmentação da gordura e do músculo dentro das regiões de interesse e calcula da área das mesmas.

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

#*****************************Geração de arquivos de resultados************************************************
 $tam =@nomes;								# Guarda na variavel teste o numero de nomes
#**************Resultados de AREA do musculo*************************************
 open(RELATDADOS, "> Area_Muscle.txt");				# Abertura de arquivo para salvar dados de volume
 #print RELATDADOS "name; Direito_L5S1(cm³); Esquerdo_L5S1(cm³); Direito_L4L5(cm³); Esquerdo_L4L5(cm³); Direito_L3L4(cm³); Esquerdo_L3L4(cm³)\n";
  print RELATDADOS "name; Esquerdo_L5S1(mm²);Direito_L5S1(mm²); Esquerdo_L4L5(mm²); Direito_L4L5(mm²); Esquerdo_L3L3(mm²); Direito_L3L4(mm²)\n";				
									# Salva o cabeçalho no arquivo Vertebral_Volume.txt
 $c=0;									# Inicialização nula da variavel c que contabiliza os pacientes
 while($c != $tam)							# Ciclo variando pelos diferentes pacientes
	{  								# Inicio do ciclo de pacientes
	  #print RELATDADOS $nomes[$c].";".$areaMusclelbl1[$c].";".$areaMusclelbl2[$c].";".$areaMusclelbl3[$c].";".$areaMusclelbl4[$c].";".$areaMusclelbl5[$c].";".$areaMusclelbl6[$c]."\n";
          print RELATDADOS $nomes[$c].";".$areaMusclelbl1[$c].";".$areaMusclelbl2[$c]."\n";
	  $c=$c+1;							# Incremento do contador c
	}								# Fim do ciclo de pacientes

#**************Resultados de AREA da Gordura*************************************
 open(RELATDADOS, "> Area_fat.txt");				# Abertura de arquivo para salvar dados de volume
 #print RELATDADOS "name; Direito_L5S1(cm³); Esquerdo_L5S1(cm³); Direito_L4L5(cm³); Esquerdo_L4L5(cm³); Direito_L3L4(cm³); Esquerdo_L3L4(cm³)\n";		
  print RELATDADOS "name; Esquerdo_L5S1(mm²);Direito_L5S1(mm²); Esquerdo_L4L5(mm²); Direito_L4L5(mm²); Esquerdo_L3L3(mm²); Direito_L3L4(mm²)\n";
                                                                        # Salva o cabeçalho no arquivo Vertebral_Volume.txt
 $c=0;									# Inicialização nula da variavel c que contabiliza os pacientes
 while($c != $tam)							# Ciclo variando pelos diferentes pacientes
	{  								# Inicio do ciclo de pacientes
	 #print RELATDADOS $nomes[$c].";".$areaFatlbl1[$c].";".$areaFatlbl2[$c].";".$areaFatlbl3[$c].";".$areaFatlbl4[$c].";".$areaFatlbl5[$c].";".$areaFatlbl6[$c]."\n";
         print RELATDADOS $nomes[$c].";".$areaFatlbl1[$c].";".$areaFatlbl2[$c]."\n";
         $c=$c+1;							# Incremento do contador c
	}				                                # Fim do ciclo de pacientes
#**************Resultados de MAX*************************************
 open(RELATDADOS, "> max_histo.txt");				# Abertura de arquivo para salvar dados de volume
 #print RELATDADOS "name; Direito_L5S1(cm³); Esquerdo_L5S1(cm³); Direito_L4L5(cm³); Esquerdo_L4L5(cm³); Direito_L3L4(cm³); Esquerdo_L3L4(cm³)\n";		
  print RELATDADOS "name; Esquerdo_L5S1(mm²); Direito_L5S1(mm²); Esquerdo_L4L5(mm²); Direito_L4L5(mm²); Esquerdo_L3L3(mm²); Direito_L3L4(mm²)\n";
                                                                        # Salva o cabeçalho no arquivo Vertebral_Volume.txt
 $c=0;									# Inicialização nula da variavel c que contabiliza os pacientes
 while($c != $tam)							# Ciclo variando pelos diferentes pacientes
	{  								# Inicio do ciclo de pacientes
	 #print RELATDADOS $nomes[$c].";".$max1[$c].";".$max2[$c].";".$max3[$c].";".$max4[$c].";".$max5[$c].";".$max6[$c]."\n";
         print RELATDADOS $nomes[$c].";".$max1[$c].";".$max2[$c]"\n";
         $c=$c+1;							# Incremento do contador c
	}				                                # Fim do ciclo de pacientes
#**************Resultados de Min*************************************
 open(RELATDADOS, "> min_histo.txt");				# Abertura de arquivo para salvar dados de volume
 #print RELATDADOS "name; Direito_L5S1(cm³); Esquerdo_L5S1(cm³); Direito_L4L5(cm³); Esquerdo_L4L5(cm³); Direito_L3L4(cm³); Esquerdo_L3L4(cm³)\n";		
  print RELATDADOS "name; Esquerdo_L5S1(mm²);Direito_L5S1(mm²); Esquerdo_L4L5(mm²); Direito_L4L5(mm²); Esquerdo_L3L3(mm²); Direito_L3L4(mm²)\n";
                                                                        # Salva o cabeçalho no arquivo Vertebral_Volume.txt
 $c=0;									# Inicialização nula da variavel c que contabiliza os pacientes
 while($c != $tam)							# Ciclo variando pelos diferentes pacientes
	{  								# Inicio do ciclo de pacientes
	 #print RELATDADOS $nomes[$c].";".$min1[$c].";".$min2[$c].";".$min3[$c].";".$min4[$c].";".$min5[$c].";".$min6[$c]."\n";
         print RELATDADOS $nomes[$c].";".$min1[$c].";".$min2[$c]"\n";
         $c=$c+1;							# Incremento do contador c
	}				                                # Fim do ciclo de pacientes
#**************Resultados de Threshold*************************************
 open(RELATDADOS, "> threshold_histo.txt");				# Abertura de arquivo para salvar dados de volume
 #print RELATDADOS "name; Direito_L5S1(cm³); Esquerdo_L5S1(cm³); Direito_L4L5(cm³); Esquerdo_L4L5(cm³); Direito_L3L4(cm³); Esquerdo_L3L4(cm³)\n";		
  print RELATDADOS "name; Esquerdo_L5S1(mm²);Direito_L5S1(mm²); Esquerdo_L4L5(mm²); Direito_L4L5(mm²); Esquerdo_L3L3(mm²); Direito_L3L4(mm²)\n";
                                                                        # Salva o cabeçalho no arquivo Vertebral_Volume.txt
 $c=0;									# Inicialização nula da variavel c que contabiliza os pacientes
 while($c != $tam)							# Ciclo variando pelos diferentes pacientes
	{  								# Inicio do ciclo de pacientes
	 #print RELATDADOS $nomes[$c].";".$thr1[$c].";".$thr2[$c].";".$thr3[$c].";".$thr4[$c].";".$thr5[$c].";".$thr6[$c]."\n";
         print RELATDADOS $nomes[$c].";".$thr1[$c].";".$thr2[$c]."\n";
         $c=$c+1;							# Incremento do contador c
	}				                                # Fim do ciclo de pacientes
#=============================================================================
sub Processamento
{print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
  #print "\n\n".$pastas[0]."\n\n";
 @d1 = glob("./*_axt1.mnc.gz");# arquivo base do processamento
 $file = $d1[0];
 #print "\n\n".$file."\n\n";
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
  
   $Stop = index($file ,".mnc.gz");
   $NomePaciente2 = substr($file,0,$Stop);
   $Stop = index($NomePasta,"_".$ano);
   $PrimNome = substr($NomePasta,0,$Stop);
   print "\n\n Paciente 2:".$NomePaciente2."\n\n";
   
   push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia); 

  print "\n\n".$pastas [0]."\n\n";
#******************************Processamento das imegens********************************
  
  print"\n\n Iniciando Processamento...\n\n";
  
#**************************************************************************************
 
 
 @class = glob("./*_lbl*");#localização do label
 $classif = $class[0];
 @axt1 = glob("./*_axt1.mnc.gz");#localização do axial T1
 $axt1 = $axt1[0];

 $sh->gzip("*");
 $sh->res(" ".$PrimNome."_multifidus_disk_lbl ".$NomePaciente2." ");

 @class = glob("./*_lbl_res.mnc.gz");#localização do label
 $classif = $class[0];

# Nivel L5S1 ESQUERDO #########################Função que segmenta o musculo e a gordura e calcula as áreas ############################
 print"\n\nCalculo do thresold label 1";
 $sh->mincstats(" -max ".$axt1." -mask ".$classif." -mask_binvalue 1 > volume1.txt"); 
 $tag1 = $sh->grep(" Max volume1.txt");
 #print"\n\n Tag1=".$tag1;
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 #print"\n\n Temp1=".$temp1;
 $max = $temp1;
 $max1 = $max;
 push (@max1, $max1);
 $sh->rm("volume1.txt");

 $sh->mincstats(" -min ".$axt1." -mask ".$classif." -mask_binvalue 1 > volume1.txt"); 
 $tag1 = $sh->grep(" Min volume1.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 #$min= substr($temp1,0,rindex($temp1," "));
 $min= $temp1;
 $min1 = $min;
 push (@min1, $min1);
 $sh->rm("volume1.txt");

 $chomp = chomp($max);
 $chomp = chomp($min);
 $thrsum = $max+$min;
 $thr = $thrsum/2;
 $thr1 = $thr;
 push (@thr1, $thr1);

 #segmentar a imagem com o label
 #print"Segmentação"
 $sh-> mincmath(" -const2 1 1.999 -segment ".$classif." ".$NomePaciente."_lbl1.mnc");
 $sh-> mincmath(" -mult ".$NomePaciente."_lbl1.mnc ".$axt1." ".$NomePaciente."_seg_lbl1_axt1.mnc");
 $sh-> mincmath(" -const2 ".$min." ".$thr." -segment ".$NomePaciente."_seg_lbl1_axt1.mnc ".$NomePaciente."_lbl1_muscle.mnc");
 #print"\n\n mincmath( -const2 0 ".$thr." -segment ".$NomePaciente."_seg_lbl1_axt1.mnc ".$NomePaciente."_lbl1_fat.mnc)";
 $sh-> mincmath(" -const2 ".$thr." ".$max." -segment ".$NomePaciente."_seg_lbl1_axt1.mnc ".$NomePaciente."_lbl1_fat.mnc");
 #print"\n\n mincmath( -const2 ".$thr." ".$max." -segment ".$NomePaciente."_seg_lbl1_axt1.mnc ".$NomePaciente."_lbl1_fat.mnc";
 
 $sh->rm($NomePaciente."_lbl1.mnc");
 $sh->rm($NomePaciente."_seg_lbl1_axt1.mnc");
 #$sh->rm(" ".$PrimNome."_multifidus_disk_lbl_res.mnc.gz");

 #Calcula as áreas
 #Nunca modificar o valor do label aqui!!
 #Músculo
 $sh->mincstats(" -volume ".$axt1." -mask ".$NomePaciente."_lbl1_muscle.mnc -mask_binvalue 1 > volume1_muscle.txt");
 $tag1 = $sh->grep(" Volume volume1_muscle.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $areaMusclelbl1 = substr($temp1,0,rindex($temp1," "))/8; #em mm². Está dividido por 8 por que a sequencia tem 8 mm de espessura
 push(@areaMusclelbl1,$areaMusclelbl1);
 $sh->rm("volume1_muscle.txt");
 
 #print"\n\n Área do Músculo:".$areamusculolbl1;
 #Gordura
 $sh->mincstats(" -volume ".$axt1." -mask ".$NomePaciente."_lbl1_fat.mnc -mask_binvalue 1 > volume1_fat.txt");
 $tag1 = $sh->grep(" Volume volume1_fat.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $areaFatlbl1 = substr($temp1,0,rindex($temp1," "))/8; #em mm². Está dividido por 8 por que a sequencia tem 8 mm de espessura
 push(@areaFatlbl1,$areaFatlbl1);
 $sh->rm("volume1_fat.txt");
 #print"\n\n Área do Gordura:".$areamusculolbl1;


# Nivel L5S1 ESQUERDO #########################Função que segmenta o musculo e a gordura e calcula as áreas ############################

 $sh->mincstats(" -max ".$axt1." -mask ".$classif." -mask_binvalue 2 > volume2.txt"); 
 $tag1 = $sh->grep(" Max volume2.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $max = $temp1;
 $max2 = $max;
 push (@max2, $max2);
 $sh->rm("volume2.txt");

 $sh->mincstats(" -min ".$axt1." -mask ".$classif." -mask_binvalue 2 > volume2.txt"); 
 $tag1 = $sh->grep(" Min volume2.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+15);
 $min= $temp1;
 $min2 = $min;
 push (@min2, $min2);
 $sh->rm("volume2.txt");

 $chomp = chomp($max);
 $chomp = chomp($min);
 $thrsum = $max+$min;
 $thr = $thrsum/2;
 $thr2 = $thr;
 push (@thr2, $thr2);

 #segmentar a imagem com o label
 #print"Segmentação"
 $sh-> mincmath(" -const2 2 2.999 -segment ".$classif." ".$NomePaciente."_lbl2.mnc");
 $sh-> mincmath(" -mult ".$NomePaciente."_lbl2.mnc ".$axt1." ".$NomePaciente."_seg_lbl2_axt1.mnc");
 $sh-> mincmath(" -const2 ".$min." ".$thr." -segment ".$NomePaciente."_seg_lbl2_axt1.mnc ".$NomePaciente."_lbl2_muscle.mnc");
 $sh-> mincmath(" -const2 ".$thr." ".$max." -segment ".$NomePaciente."_seg_lbl2_axt1.mnc ".$NomePaciente."_lbl2_fat.mnc");
 
 $sh->rm($NomePaciente."_lbl2.mnc");
 $sh->rm($NomePaciente."_seg_lbl2_axt1.mnc");
 #$sh->rm(" ".$PrimNome."_multifidus_disk_lbl_res.mnc.gz");

 #Calcula as áreas
 #Nunca modificar o valor do label aqui!!
 #Músculo
 $sh->mincstats(" -volume ".$axt1." -mask ".$NomePaciente."_lbl2_muscle.mnc -mask_binvalue 1 > volume2_muscle.txt");
 $tag1 = $sh->grep(" Volume volume2_muscle.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $areaMusclelbl2 = substr($temp1,0,rindex($temp1," "))/8; #em mm². Está dividido por 8 por que a sequencia tem 8 mm de espessura
 push(@areaMusclelbl2,$areaMusclelbl2);
 $sh->rm("volume2_muscle.txt");
 
 #Gordura
 $sh->mincstats(" -volume ".$axt1." -mask ".$NomePaciente."_lbl2_fat.mnc -mask_binvalue 1 > volume1_fat.txt");
 $tag1 = $sh->grep(" Volume volume2_fat.txt");
 $temp1 = substr($tag1,rindex($tag1,":")+7);
 $areaFatlbl2 = substr($temp1,0,rindex($temp1," "))/8; #em mm². Está dividido por 8 por que a sequencia tem 8 mm de espessura
 push(@areaFatlbl2,$areaFatlbl2);
 $sh->rm("volume2_fat.txt");


 #*************************************************************
  chdir(".."); 

}

#**************************************************************************************************************************************************
sub trim {
  my $string = shift;
  for ($string) {
    s/^\s+//;
    s/\s+$//;
  }
  return $string;
}
