#!/usr/bin/perl -W


###############################################################
#Autores:Paula Rejane Beserra Diniz  #
#Ribeirao Preto,11 de julho de 2006      #
#Este script renomeia e classifica os arquivos minc dentro de um diretorio
#versao 2.0
###############################################################

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************
print "\n*********************************************************************\n";

print "\nIniciando Processamento...\n";

    &OrganizaPastas;
	&Classifica;

    

#*******************************************************Fim Main**************************************************************************************


sub Classifica
{   
	@vector6 = glob("./*");
	$teste6 = @vector6;
	$marc=0;
	while($marc != $teste6 )
	{ 	$marcador=0;
	    $i = 0;
	    $id1 = 0;
	    $id2 = 0;
	    $eflag=0;
	    $impr=0;
	    print"\n\n Preparando arquivos...\n\n";
	    chdir($vector6[0]);
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
			
			 if($repetition == 0.034)
				{ $tag2 = $sh->grep(" dicom_0x0018:el_0x0021 mincheader.txt");
				  $temp2 = substr($tag2,rindex($tag2,"=")+2);
				  $MT1 = substr($temp2,0,rindex($temp2," "));
				  $Stop = index($MT1,'"') - 1;
				  $Start = index($MT1,'"') + 1;
				  $MT = substr($MT1,$Start,$Stop);
				

					if($MT eq "NONE" )
					{   
					    $Start2 = index($vector4[0],"./") + 2;
			            $d1 = substr($vector4[0],$Start2);
					    $sh->gunzip($d1);
						$Stopp = index($d1,".gz");
			            $d1name = substr($d1,0,$Stopp);
						$sh->mv(" $d1name ".$NomePaciente."_".$ano.$mes.$dia."_".$id1."_d1.mnc");
					    $sh->gzip(" ".$NomePaciente."_".$ano.$mes.$dia."_".$id1."_d1.mnc");
					    $id1 = $id1+1;
						
					}
					else
					{  
					  $Start3 = index($vector4[0],"./") + 2;
			          $d2 = substr($vector4[0],$Start3);
					  $sh->gunzip($d2);
					  $Stopp = index($d2,".gz");
			          $d2name = substr($d2,0,$Stopp);
					  $sh->mv(" $d2name ".$NomePaciente."_".$ano.$mes.$dia."_".$id2."_d2.mnc");
					  $sh->gzip(" ".$NomePaciente."_".$ano.$mes.$dia."_".$id2."_d2.mnc");
					  $id2 =$id2+1;
					  
					}	 
				} else
					{
						if($repetition == 0.56 || $repetition == 0.54)
						{	
						 	print"\n\n\ veja o nome do arquivo para gd:".$vector4[0]."\n\n";
							$start2 = index($vector4[0],"./") + 2;
							$file_GD = substr($vector4[0],$start2);
							$sh->gunzip($file_GD);
							$stopp = index($file_GD,".gz");
							$GDname = substr($file_GD,0,$stopp);
							print"\n\n GD:".$file_GD."\n\n";
							$sh->mv(" ".$GDname." ".$NomePaciente."_".$ano.$mes.$dia."_".$i."_gd.mnc");
						    $sh->gzip(" ".$NomePaciente."_".$ano.$mes.$dia."_".$i."_gd.mnc");
							$i = $i + 1;
				            				
									
						} else
							{ 	if($repetition == 0.0097 )
							    {	
								 	print"\n\n\ veja o nome do arquivo para mpr:".$vector4[0]."\n\n";
									$start2 = index($vector4[0],"./") + 2;
									$file_mpr = substr($vector4[0],$start2);
									$sh->gunzip($file_mpr);
									$stopp = index($file_mpr,".gz");
									$mprname = substr($file_mpr,0,$stopp);
									print"\n\n MPR:".$file_mpr."\n\n";
									$sh->mv(" ".$mprname." ".$NomePaciente."_".$ano.$mes.$dia."_".$impr."_mpr.mnc");
								    $sh->gzip(" ".$NomePaciente."_".$ano.$mes.$dia."_".$impr."_mpr.mnc");
									$impr = $impr + 1;
							    } else
									{
										if($vector4[0] ne "" && $eflag  == 0 )
										{    $eflag = 1;
											#*****************************crinado a imagem e1******************************************************
											 @Im1 = grep(/(e1)/,@vector4);
											 $tamV=@Im1;
											 print "tem ".$tamV." e1\n\n";
											 $verif=0;
											 $ind=0;
											 while($verif != $tamV)
											{
												 $start2 = index($Im1[$ind],"./") + 2;
												 $file_e1 = substr($Im1[$ind],$start2);
												 $sh->gunzip($file_e1);
												 $stopp = index($file_e1,".gz");
												 $e1name1 = substr($file_e1,0,$stopp);
												 print"\n\n E1 :".$file_e1."\n\n";
												 $sh->mv(" $e1name1 ".$NomePaciente."_".$ano.$mes.$dia."_".$ind."_e1.mnc");
												 $sh->gzip(" ".$NomePaciente."_".$ano.$mes.$dia."_".$ind."_e1.mnc");
												
												 $verif=$verif+1;
												 $ind=$ind+1;
											}
											 
											 @Im2 = grep(/(e2)/,@vector4);
											 $tamV=@Im2;
											 print "tem ".$tamV." e2";
											 $verif=0;
											 $ind=0;
											 while($verif != $tamV)
											{
												 $start2 = index($Im2[$ind],"./") + 2;
												 $file_e1 = substr($Im2[$ind],$start2);
												 $sh->gunzip($file_e1);
												 $stopp = index($file_e1,".gz");
												 $e1name1 = substr($file_e1,0,$stopp);
												 print"\n\n E2 :".$file_e1."\n\n";
												 $sh->mv(" $e1name1 ".$NomePaciente."_".$ano.$mes.$dia."_".$ind."_e2.mnc");
												 $sh->gzip(" ".$NomePaciente."_".$ano.$mes.$dia."_".$ind."_e2.mnc");
												
												 $verif=$verif+1;
												 $ind=$ind+1;
											}
											 
											 @Im3 = grep(/(e3)/,@vector4);
											 $tamV=@Im3;
											 print "tem ".$tamV." e3";
											 $verif=0;
											 $ind=0;
											 while($verif != $tamV)
											{
												 $start2 = index($Im3[$ind],"./") + 2;
												 $file_e1 = substr($Im3[$ind],$start2);
												 $sh->gunzip($file_e1);
												 $stopp = index($file_e1,".gz");
												 $e1name1 = substr($file_e1,0,$stopp);
												 print"\n\n E3 :".$file_e1."\n\n";
												 $sh->mv(" $e1name1 ".$NomePaciente."_".$ano.$mes.$dia."_".$ind."_e3.mnc");
												 $sh->gzip(" ".$NomePaciente."_".$ano.$mes.$dia."_".$ind."_e3.mnc");
												
												 $verif=$verif+1;
												 $ind=$ind+1;
											}
											 
											 @Im4 = grep(/(e4)/,@vector4);
											 $tamV=@Im4;
											 print "tem ".$tamV." e4";
											 $verif=0;
											 $ind=0;
											 while($verif != $tamV)
											{
												 $start2 = index($Im4[$ind],"./") + 2;
												 $file_e1 = substr($Im4[$ind],$start2);
												 $sh->gunzip($file_e1);
												 $stopp = index($file_e1,".gz");
												 $e1name1 = substr($file_e1,0,$stopp);
												 print"\n\n E4 :".$file_e1."\n\n";
												 $sh->mv(" $e1name1 ".$NomePaciente."_".$ano.$mes.$dia."_".$ind."_e4.mnc");
												 $sh->gzip(" ".$NomePaciente."_".$ano.$mes.$dia."_".$ind."_e4.mnc");
												
												 $verif=$verif+1;
												 $ind=$ind+1;
											}
										}
									}
						    }
					}
				shift(@vector4);
				$marcador = $marcador + 1;
			}
		shift(@vector6);
		$marc = $marc + 1;
		$sh->rm(" mincheader.txt");
		chdir("..");	
	}
	
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


#*****************************************************************************************************************************************************
sub OrganizaPastas
{  $marcadororg=0;
	print"\n\n Preparando arquivos...\n\n";
	@vector5 = glob("./*");
	$testeorg = @vector5;
	while($marcadororg != $testeorg )
	{
	 $file1 = $vector5[0];
     $sh->mincheader(" $file1 > mincheader.txt");
	 $tag = $sh->grep(" repetition_time mincheader.txt");
	 $procura = $sh->grep(" dicom_0x0010:el_0x0010 mincheader.txt");
	 $igual = substr($procura,rindex($procura,"=")+2);
	 $espaco = substr($igual,0,rindex($igual," "));
	 $Stop = index($espaco,'"') - 1;
	 $Start = index($espaco,'"') + 1;
	 $NomePaciente = substr($espaco,$Start,$Stop);
	 $NomePaciente =~ tr/A-Z/a-z/;
	 print "\n\n $NomePaciente \n\n";
	 $NomePaciente = trim($NomePaciente);
	 $NomePaciente =~ s/ /_/g;
	 
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
     
	 $NomePacienteAnterorg="";
	 $NomePacienteArq = $NomePaciente."_".$ano.$mes.$dia;
	 if($NomePacienteArq ne $NomePacienteAnterorg)
		{
			print "O nome do paciente eh: ".$NomePaciente."\n";
			$sh->mkdir($NomePaciente."_".$ano."_".$mes."_".$dia);
			$cont=0;
  			
			  $sh->mv( $file1." ./".$NomePaciente."_".$ano."_".$mes."_".$dia);
			  $cont=$cont+1;
			 		
		}    
  
	  $NomePacienteAnterorg = $NomePacienteArq;
	  shift(@vector5);
	  $sh->rm(" mincheader.txt");
	  $marcadororg = $marcadororg + 1;
	}
	
}

