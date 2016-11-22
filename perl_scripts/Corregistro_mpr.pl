#!/usr/bin/perl -W

#####################################################################
#Autor:Jaqueline Macarios Silva e Silva                                                                                                                                               #
#Ribeirao Preto,28 de julho de 2011                                                                                                                                         #
#versao 1.0                                                                
#####################################################################                                                                                                                       #
############################################################
#@NAME       :Corregistro_mpr.pl
#@INPUT      : mpr.mnc d1.mnc label_aseg_freesurfer.mnc label_aparc_aseg_freesurfer.mnc label_wmparc_freesurfer.mnc
#@OUTPUT     : mpr_corregistrado.mnc label_aseg_freesurfer_corregistrado.mnc label_aparc_aseg_freesurfer_corregistrado.mnc label_wmparc_freesurfer_corregistrado.mnc
#@RETURNS    : 
#@DESCRIPTION: Corregistro de uma imagem 3DT1 com imagem de 3DMTR adquirida em datas diferentes.

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 

my $sh = Shell->new();

#***********************************************************Main**************************************************************************************


print "\n*********************************************************************\n";

print "\n Iniciando Corregistro...\n";
print "\n-- Por favor aguarde --\n";

@pastas = glob("./*");
$NomePastaAnter="";
$teste = @pastas ;
$contador=0;
mkdir("analise_da_amostra");
while($contador != $teste)
{
  $arquivo = $pastas[0];
  $Start = index($arquivo,"./") + 2;
  $NomePasta = substr($arquivo,$Start);
  if($NomePasta ne $NomePastaAnter)
  {  
	print "\n ======================================================================= \n";
  


#=============================================================================
sub Processamento
{
 print"\n\n Obtendo dados do paciente...\n\n";
 chdir($NomePasta);
  print "\n\n".$pastas[0]."\n\n";
 @d1 = glob("./*_0_mpr.mnc.gz");
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
  
  print"\n\n Iniciando Corregistro...\n\n";
  
#**************************************************************************************
  #---> Corregistrando o MPR
  print"\n\n 1ª etapa de 4) MPR...\n\n";
  $sh-> mritoself(" -lsq6 ".$PrimNome."_".$ano.$mes.$dia."_0_mpr.mnc.gz ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz transfor.xfm");
  $sh-> mincresample(" -nearest ".$PrimNome."_".$ano.$mes.$dia."_0_mpr.mnc.gz teste.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transform transfor.xfm");
  $sh-> mritoself(" -lsq9 teste.mnc ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz transfor2.xfm");
  $sh->mincresample(" -nearest teste.mnc ".$PrimNome."_".$ano.$mes.$dia."_0_mpr_corregistrado.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transform transfor2.xfm");
  $sh->rm(teste.mnc);

 #---> Corregistrando o Label aseg+aparc
  print"\n\n 2ª etapa de 4) Label aseg+aparc...\n\n";
  $sh-> mincresample(" -nearest ".$PrimNome."_".$ano.$mes.$dia."_0_mpr_aparc+aseg.mnc teste.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transform transfor.xfm");
  $sh-> mincresample(" -nearest teste.mnc ".$PrimNome."_".$ano.$mes.$dia."_0_mpr_aparc+aseg_corregistrado.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transform transfor2.xfm");  
  $sh->rm(teste.mnc);

#---> Corregistrando o Label aseg
  print"\n\n 3ª etapa de 4) Label aseg...\n\n";
  $sh-> mincresample(" -nearest ".$PrimNome."_".$ano.$mes.$dia."_0_mpr_aseg.mnc teste.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transform transfor.xfm");
  $sh-> mincresample(" -nearest teste.mnc ".$PrimNome."_".$ano.$mes.$dia."_0_mpr_aseg_corregistrado.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transform transfor2.xfm");  
  $sh->rm(teste.mnc);

#---> Corregistrando o Label wmparc
  print"\n\n 4ª etapa de 4) Label wmparc...\n\n";
  $sh-> mincresample(" -nearest ".$PrimNome."_".$ano.$mes.$dia."_0_mpr_wmparc.mnc teste.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transform transfor.xfm");
  $sh-> mincresample(" -nearest teste.mnc ".$PrimNome."_".$ano.$mes.$dia."_0_mpr_wmparc_corregistrado.mnc -like ".$PrimNome."_".$ano.$mes.$dia."_0_d1.mnc.gz -transform transfor2.xfm");  
  $sh->rm(teste.mnc);

 
  print"\n\n Modificando data no cabeçalho...\n\n";
  
#**************************************************************************************
 $sh-> minc_modify_header.exe -sinsert dicom_0x0008:el_0x0020=" nome do arquivo” ".$PrimNome."_".$ano.$mes.$dia."_0_mpr_corregistrado.mnc"

 }






