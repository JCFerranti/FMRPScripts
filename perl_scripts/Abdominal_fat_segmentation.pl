#! /usr/bin/env perl

###############################################################
#Autores:Paula Rejane Beserra Diniz e Carlos Garrido Salmon   #
#Ribeirao Preto-Vitoria da Conquista,03 de agosto de 2006      #
#versao 2 
###############################################################
#####################################################################
#@NAME       : Maps_values_extration_tool.pl
#@INPUT      : 
#@OUTPUT     : quantitative_MR_aseg.txt
#@RETURNS    : 
#@DESCRIPTION: Extração dos dados de MTR, relaxometria, FA, Difusibilidade paralela e difusibilidade perpendicular.

# Modulo(Biblioteca) de acesso aos comandos do shell

use Shell; 
#use strict;
#use warnings "all";
use Getopt::Tabular;
use File::Basename;

my $sh = Shell->new();


#***********************************************************Main**************************************************************************************


print "\n*********************************************************************\n";

print "\n Starting Process...\n";
print "\n-- Please wait --\n";

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
    print "Patient name: ".$NomePasta."\n";
	&Processamento;
   }   
  $NomePastaAnter = $NomePasta;
  shift(@pastas ); #RETIRA O PRIMEIRO ELEMENTO DA LISTA
  $contador=$contador+1;
  
 }


sub Processamento
{
 chdir($NomePasta);
 #************************
 #$sh->rm("erosion*");
 #$sh->rm("dilation*");
 #$sh->rm("group*");
 #$sh->rm("total_adipose_tissue_lbl.mnc");
 #$sh->rm("partial_adipose_tissue_lbl.mnc");
 #$sh->rm("gordura*");
 # $sh->rm("Gordura*");
 #$sh->rm("normalized.mnc");
 #$sh->rm("pele.mnc");
 #$sh->rm("abdominal_fat_lbl.mnc");
 #****************************
 
 @vector = glob("./*_e*");

 $file = $vector[0];
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
 $sh->rm(" mincheader.txt");
 
 push(@nomes,$PrimNome."_".$ano."_".$mes."_".$dia);
 
 #$sh->rm($PrimNome."_native_corrected.mnc");
 #************segmentação
 print "\n Correct for non-uniformity (old versions of nu_correct, ex. v1.05, can fail with volumes with too long headers)\n";
    $sh->mv(" ".$vector[0]." ..");
	chdir("..");
	$sh->nu_correct(" ".$vector[0]." ".$PrimNome."_native_corrected.mnc");
	$sh->mv(" *.mnc ./".$NomePasta);
	$sh->mv(" *.mnc.gz ./".$NomePasta);
	$sh->rm(" *.imp");
	chdir($NomePasta);
  print "\n Normalizing the image between 0 and 100\n";
 &normalize;
 $sh->mincmath(" -const2 40 100 -segment normalized.mnc partial_adipose_tissue_lbl.mnc");
 print "\n Segmenting Subcutaneous and Intraperitoneal FAT\n";
 
 $sh->mincmorph(" -erosion partial_adipose_tissue_lbl.mnc erosion1.mnc");
 $sh->mincmorph(" -erosion erosion1.mnc erosion2.mnc");
 $sh->mincmorph(" -erosion erosion2.mnc erosion3.mnc");
 $sh->mincmorph(" -erosion erosion3.mnc erosion4.mnc");
 #$sh->mincmorph(" -erosion erosion4.mnc erosion5.mnc");
 $sh->mincmorph(" -dilation erosion4.mnc dilation1.mnc");
 $sh->mincmorph(" -dilation dilation1.mnc dilation2.mnc");
 $sh->mincmorph(" -dilation dilation2.mnc dilation3.mnc");
 $sh->mincmorph(" -dilation dilation3.mnc dilation4.mnc");
 $sh->mincmorph(" -group dilation4.mnc group.mnc");
 $sh->mincmath(" -const2 0.5 1.99 -segment group.mnc gordura_pele.mnc");
 
 $sh->rm("erosion*");
 $sh->rm("dilation*");
 $sh->rm("group*");
 
 $sh->mincmorph(" -dilation gordura_pele.mnc dilation1.mnc");
 $sh->mincmorph(" -dilation dilation1.mnc dilation2.mnc");
 $sh->mincmorph(" -dilation dilation2.mnc dilation3.mnc");
 $sh->mincmath(" -const2 1 999 -nsegment  dilation3.mnc pele.mnc");
 #$sh->mincmath(" -const2 1 999 -nsegment  gordura_pele.mnc pele.mnc");
 $sh->rm("erosion*");
 $sh->rm("dilation*");
 $sh->mincmath(" -const2 50 100 -segment normalized.mnc total_adipose_tissue_lbl.mnc");
 $sh->mincmath(" -mult pele.mnc total_adipose_tissue_lbl.mnc gordura_dentro_parte.mnc");
 $sh->mincdefrag(" gordura_dentro_parte.mnc Gordura_peritonial.mnc 1 6 800");
 $sh->mincmath(" -const 2 -mult Gordura_peritonial.mnc Gordura_peritonial_lbl.mnc");
 
 $sh->mincmath(" -add Gordura_peritonial_lbl.mnc gordura_pele.mnc abdominal_fat_lbl.mnc");
 #$sh->mincmorph(" -erosion gordura_dentro_parte.mnc erosion1.mnc");
 #$sh->mincmorph(" -erosion erosion1.mnc erosion2.mnc");
 #$sh->mincmorph(" -dilation erosion2.mnc dilation1.mnc");
 #$sh->mincmorph(" -dilation dilation1.mnc dilation2.mnc");
 #$sh->mincmorph(" -group dilation2.mnc group.mnc");
 $sh->rm("erosion*");
 $sh->rm("dilation*");
 $sh->rm("group*");
 $sh->rm("total_adipose_tissue_lbl.mnc");
 $sh->rm("partial_adipose_tissue_lbl.mnc");
 $sh->rm("gordura*");
 $sh->rm("Gordura*");
 #$sh->rm("normalized.mnc");
 $sh->rm("pele.mnc");
 #******************************
  chdir("..");
}


sub normalize{
my($Help, $Usage, $me, @opt_table, %opt);
my(@args, $infile, $outfile);

$me = basename($0);
%opt = ('verbose' => 0,
        'quiet', => 0,
        'clobber' => 0,
        'fake' => 0,
        'cutoff' => 0.01,
        'lowwer' => undef,
        'upper' => undef,
        'clamp' => 1,
        'out_floor' => 0,
        'out_ceil' => 100,
        );

# Check arguments
#&Getopt::Tabular::SetHelp ($Help, $Usage);
#&GetOptions (\@opt_table, \@ARGV) || exit 1;
#die $Usage if ($#ARGV != 1);
# until I get organised and do this properly

# set up and check for file names
$outfile = "normalized.mnc";
$infile = $PrimNome."_native_corrected.mnc";
die "$me: Couldn't find $infile\n\n" if (!-e $infile);
die "$me: $outfile exists!, use -clobber to overwrite\n\n" if (!$opt{'clobber'} && -e $outfile);

my($l_pct, $u_pct, $range, $eqn);

# figure out upper and lowwer bounds if required
if(!defined($opt{lower})){
   $l_pct = $opt{'cutoff'};
   print STDOUT "*** getting lower range of $infile [$l_pct]\n" if !$opt{quiet};
   chomp($opt{lower} = `mincstats -quiet -pctT $l_pct $infile`);
   }

if(!defined($opt{upper})){
   $u_pct = 100 - $opt{'cutoff'};
   print STDOUT "*** getting upper range of $infile [$u_pct]\n" if !$opt{quiet};
   chomp($opt{upper} = `mincstats -quiet -pctT $u_pct $infile`);
   }

# first rescale between 0 and 1
$range = $opt{upper} - $opt{lower};
if($opt{clamp}){
   $eqn = "((A[0] < $opt{lower}) ? 0.0 : (A[0] > $opt{upper}) ? 1.0 : (A[0]-$opt{lower})/$range)",
   }
else{
   $eqn = "(A[0]-$opt{lower})/$range",
   }
# the scale to required range
$eqn .= " * " . ($opt{out_ceil} - $opt{out_floor}) . " + $opt{out_floor};";

# do the rescaling
print STDOUT "*** scaling $infile in range [$opt{lower}:$opt{upper}]\n" if !$opt{'quiet'};
print STDOUT "*** outputting in the range  [$opt{out_floor}:$opt{out_ceil}]\n" if !$opt{'quiet'};
&do_cmd('minccalc', '-clobber', '-expression', 
        $eqn,
        $infile, $outfile);

}
sub do_cmd { 
   print STDOUT "@_\n" if $opt{'verbose'};
   if(!$opt{'fake'}){
      system(@_) == 0 or die;
      }
   }

sub print_version_info {
   print STDOUT "\n$PACKAGE version $VERSION\n".
                "Comments to $PACKAGE_BUGREPORT\n\n";
   exit;
   }
