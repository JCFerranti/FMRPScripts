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

#=============================================================================
sub Processamento
{print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
  print "\n\n".$pastas[0]."\n\n";
 @d1 = glob("./*_0_d1.mnc.gz");
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
 
 $Stop = index($NomePasta,"_");
 $NomePaciente = substr($NomePasta,0,$Stop);
 $Stop = index($NomePasta,"_".$ano);
 $PrimNome = substr($NomePasta,0,$Stop);
 $sh->rm(" mincheader.txt");
 
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 print "\n\n Primeiro nome: $PrimNome \n\n";
  print "\n\n".$pastas [0]."\n\n";
#******************************Processamento das imegens********************************
  
  print"\n\n Iniciando Processamento...\n\n";
  
#**************************************************************************************

  
  #$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_0_e1.mnc.gz ");
  #$sh->rm(" ".$PrimNome."_".$ano.$mes.$dia."_0_e2.mnc.gz ");
 #procurando a DUAL para renomear
	    $marcador=0;
	    $i = 0;
	    $id1 = 0;
	    $id2 = 0;
	    #$eflag=0;
	    $impr=0;
		$idif=0;
		$igm=0;
		$idual=0;
		$idual2=0;
		$idmap =0;
		$ifamap =0;
	    
		print"\n\n Preparando arquivos...\n\n";
	    @vector4 = glob("./*");
	    $teste2 = @vector4;
		while($marcador != $teste2 )
			{ $file = $vector4[0];
		      $sh->mincheader(" $file > mincheader.txt ");
			  $tag = $sh->grep(" repetition_time mincheader.txt");
			  $temp = substr($tag,rindex($tag,"=")+2);
			  $repetition = substr($temp,0,rindex($temp," "));
			 
			  $procura = $sh->grep(" dicom_0x0010:el_0x0010 mincheader.txt");
			  $igual = substr($procura,rindex($procura,"=")+2);
			  $espaco = substr($igual,0,rindex($igual," "));
			  $Stop = index($espaco,'"') - 1;
			  $Start = index($espaco,'"') + 1;
			  $NomePaciente = substr($espaco,$Start,$Stop);
			  $NomePaciente =~ tr/A-Z/a-z/;
			  print "\n\n O nome do paciente é: $NomePaciente \n\n";
			  $NomePaciente = trim($NomePaciente);
			  $NomePaciente =~ s/ /_/g;
			 	 
			  $linha = $sh->grep(" dicom_0x0008:el_0x0020 mincheader.txt");
			  $te1 = substr($linha,rindex($linha,"=")+2);
			  
			  $sh->mincheader(" $file > mincheader.txt ");
			  $tag = $sh->grep(" echo_time mincheader.txt");
			  $temp = substr($tag,rindex($tag,"=")+2);
			  $echo_time = substr($temp,0,rindex($temp," "));
			print "\n\n repetion time:".$repetition."\n\n echo_time:".$echo_time."\n\n";
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
			  
		 
				  
			$tag4 = $sh->grep(" dicom_0x0008:el_0x103E mincheader.txt");
				  $temp2 = substr($tag4,rindex($tag4,"=")+2);
				  $tipo = substr($temp2,0,rindex($temp2," "));
				  $Stop = index($tipo,'"') - 1;
				  $Start = index($tipo,'"') + 1;
				  $tipo= substr($tipo,$Start,$Stop);
				  print "\n\n TIPO:$tipo \n\n";
				#d1 e d2 
	                if($tipo eq "sDUAL_TSE_0.4TE16 ")
						{ print"\n\n\ veja o nome do arquivo para DUAL:".$vector4[0]."\n\n";
											$start2 = index($vector4[0],"./") + 2;
											$file_dif = substr($vector4[0],$start2);
											$sh->gunzip($file_dif);
											$stopp = index($file_dif,".gz");
											$DUALname = substr($file_dif,0,$stopp);
											print"\n\n DUAL ".$file_dif."\n\n";
											$sh->mv(" ".$DUALname." ".$NomePaciente."_".$ano.$mes.$dia."_".$idual."_sDUAL.mnc");
											$sh->gzip(" ".$NomePaciente."_".$ano.$mes.$dia."_".$idual."_sDUAL.mnc");
											$idual = $idual + 1;	 
						} 	else{		
									if($tipo eq "DUAL_TSE_2D_FOVpeq")
									{   print"\n\n\ veja o nome do arquivo para DUAL:".$vector4[0]."\n\n";
										$start2 = index($vector4[0],"./") + 2;
										$file_dif = substr($vector4[0],$start2);
										$sh->gunzip($file_dif);
										$stopp = index($file_dif,".gz");
										$DUALname = substr($file_dif,0,$stopp);
										print"\n\n DUAL ".$file_dif."\n\n";
										$sh->mv(" ".$DUALname." ".$NomePaciente."_".$ano.$mes.$dia."_".$idual2."_DUAL.mnc");
										$sh->gzip(" ".$NomePaciente."_".$ano.$mes.$dia."_".$idual2."_DUAL.mnc");
										$idual2 = $idual2 + 1;
									}
								}	
				shift(@vector4);
				$marcador = $marcador + 1;
			    $sh->rm(" mincheader.txt");
		}

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

