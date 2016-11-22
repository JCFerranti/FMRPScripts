#!/usr/bin/perl

# ----------------------------------------------------------------------------
#@NAME       : prep_classify.pl
#@INPUT      : 
#@OUTPUT     : label bayes classified file called: <mrs_id>_<date>_bayes.mnc.gz
#@RETURNS    : 
#@DESCRIPTION: prepair and then classify brain tissue into 7 classes: 
#              0 - background and other (like blood vessels)
#              1 - csf
#              2 - partial volume class (mix of tisseue and csf) 
#              3 - grey matter
#              4 - white matter (NAWM in MS patients)
#              5 - lesions that are T1 hypointense
#              6 - lesions that are T1 isointense (but hyperintense on T2/PD)
#     
#              This script requires these programs:
#                 nu_correct
#                 mritoself
#                 mritotal
#                 xfminvert
#                 mincresample
#                 mincmath
#                 minc2analyze
#                 bet
#                 analyze2minc
#                 cutting_off_background
#                 brainmean3
#                 mincautobayes2
#                 classifier_postprocessor
#     
#              This script requires these models:
#                 fgpt model -> /hydra/home/simon/bin/2003_02_14_scripts/backup_2003_02_14_ms.fgpt (default)
#                 eyes and carotid model for controls -> /raid/ms/studies/segmentation/models/tal_eye_carotid_inv.mnc 
#                 eyes and carotid model for patients -> /raid/ms/studies/segmentation/models/tal_eye_carotid_cerebellum_brainstem_inv.mnc 
#                 tal eye model -> /raid/ms/studies/segmentation/models/tal_eye.mnc
#                
#              This script requires these four files at least:
#                 <mrs_id>_d1.mnc.gz or <mrs_id>_d1_nu.mnc.gz
#                 <mrs_id>_e1.mnc.gz or <mrs_id>_e1_nu.mnc.gz
#                 <mrs_id>_e2.mnc.gz or <mrs_id>_e2_nu.mnc.gz
#
#              This script looks for this file but is optional (see more at the
#              subrotine: resampling_T1_and_MT_into_T2_sapce
#                 <mrs_id>_MT.mnc.gz
#                
#@METHOD     : 
#@GLOBALS    : 
#@CALLS      : 
#@CREATED    : originally: ??? ???, Simon Francis - simon@mrs.mni.mcgill.ca
#              rewrite #1: October 2003, Andre Matos - amatos@mrs.mni.mcgill.ca
#@MODIFIED   : 1.1 - November 5 2003, Andre Matos
#                    If MT image does not exist skip the task to resample it
#                    into T2 space. Before if the image does not exist the script dies.
#                    changes was made into sub resampling_T1_and_MT_into_T2_sapce
#              1.2 - November 14 2003, Andre Matos
#                    If is missing the files <mrs_id>_d1.mnc.gz or <mrs_id>_e1.mnc.gz or 
#                    <mrs_id>_e2.mnc.gz so the script tries to look the files
#                    <mrs_id>_d1_nu.mnc.gz or <mrs_id>_d1_nu.mnc.gz or <mrs_id>_d1_nu.mnc.gz
#                    trying to avoid stop the script processing
#                    changes was made into sub resampling_T1_and_MT_into_T2_sapce
#              1.3 - November 20 2003, Andre Matos
#                    it was changed the script options:
#		                  	-debug to -verbose and -quite (default)
#			                  -force to -clobber and -noclobber (default)
#              1.4 - November 27 2003, Andre Matos
#                    it was changed the script options:
#                       extracts cerebellum and brainstem also for controls
#              1.5 - January 07 2004, Andre Matos
#                    it was changed the script options:
#                       run the classifier_postprocessor into controls
#
#
#@VERSION    : $Id: prep_classify.pl,v 1.4 2004/01/07 12:55:00 andre Exp $
#@COMMENTS   : 
#-----------------------------------------------------------------------------

use Sys::Hostname;

# Load required perl libraries
require 5.001;
if (-e "/raid/ms2/users/amatos/scripts/lib/mrslib.pl") {
	require "/raid/ms2/users/amatos/scripts/lib/mrslib.pl" || die "\nThe mrslib.pl is required to run this script $! \n";
} elsif (-e "/Users/amatos/scripts/lib/mrslib.pl") {
	require "/Users/amatos/scripts/lib/mrslib.pl" || die "\nThe mrslib.pl is required to run this script $! \n";
} elsif (-e "/usr/local/mrs/lib/mrslib.pl") {
	require "/usr/local/mrs/lib/mrslib.pl" || die "\nThe mrslib.pl is required to run this script $! \n";
}

#-----------------------------------------------------------------------
# get_arguments()
#     Routine to get argument values
#-----------------------------------------------------------------------

sub get_arguments {

  # Usage line
  $0 =~ /([^\/]+)$/;
  my $prog = $1;
  my $usage = "Usage: \tprep_classify.pl <fullpath/mrs_id> [<options>]\n\tprep_classify.pl -help\n";

  # Set default values
  my $mrs_id = undef;
  my $classify = "control";
  my $dateprocess = undef;
  my $askconf = "no";
  my $clobber = "no";
  my $verbose = "no";
  my $dateprocess = "2003_02_14";

  # Loop througt arguments
  while (@_) {
    $_ = shift;
    if (/^-control$/) { $classify = "control"; }
    elsif (/^-patient$/) { $classify = "patient"; }
    elsif (/^-date$/) { $dateprocess = shift; }
    elsif (/^-model$/) { $modelfgpt = shift; }
    elsif (/^-noask$/) { $askconf = "no"; }
    elsif (/^-ask$/) { $askconf = "yes"; }
    elsif (/^-clobber$/) { $clobber = "yes"; }
    elsif (/^-noclobber$/) { $clobber = "no"; }
    elsif (/^-verbose$/) { $verbose = "yes"; }
    elsif (/^-quite$/) { $verbose = "no"; }
    elsif (/^-h(|elp)$/) {
      die
"Command-specific options:
 -control:\tSpecify to process control samples (default)
 -patient:\tSpecify to process patient samples
 -date:\t\tSpecify a date to be insert into output file name
 \t\tformat: YYYY_MM_DD
 -model:\tSpecify which model, a file.fgpt, the classifier will use
 \t\tthe file path_of_the_fgpt is the model (leave empty to use the default)

General options:
 -noask:\tSpecify to not ask for confirmations during the process (default)
 -ask:\t\tSpecify to ask for confirmations during the process
 -clobber:\tClobber existing files
 -verbose:\tPrint out extra information
 -quite:\tPrint requested values only
 
Generic options for all commands:
 -help:\t\tPrint summary of comand-line options and abort

Example:
 prep_classify.pl /somedirectory/mrs_id -patient -date 2003_01_01

$usage
";
    }
    elsif (/^-./) { die "Unknown option \"$_\"\n"; }
    else {
       if (!defined($mrs_id)) {
          $mrs_id = $_;
       }
   }
  }

  # verify is the MRS_ID was input into the comand-line
  if (!defined($mrs_id)) {
     die $usage;
  }

  # return the valids arguments
  return($mrs_id, $classify, $dateprocess, $modelfgpt, $askconf, $clobber, $verbose);

}

#-----------------------------------------------------------------------
# process_n3_correction()
#     Routine to process the N3 NU correction
#     Phase I
#-----------------------------------------------------------------------

sub process_n3_correction {

  if ( (-e "${t1}_nu.mnc.gz") && (-e "${t2}_nu.mnc.gz") && (-e "${pd}_nu.mnc.gz") ) {
     if ($verbose eq "yes") { printf("The N3 NU correction was previously done. Moving along.............\n"); }
  } else {
     if ($verbose eq "yes") { printf("Performancing the N3 NU correction.................................\n"); }

    # Processing N3 nu_correct into the file mrs_id_e1.mnc.gz and get the file mrs_id_e1_nu.mnc as a result
     if (&shellcommand("nu_correct", "${pd}.mnc.gz ${pd}_nu.mnc -clobber", $verbose)) {
        die "(process_n3_correction) Error - when tring to run nu_correct - output: ${pd}_nu.mnc. Brain tissue classification was not done!\n";
     }

     # Processing N3 nu_correct into the file mrs_id_d1.mnc.gz and get the file mrs_id_d1_nu.mnc as a result
     if (&shellcommand("nu_correct", "${t1}.mnc.gz ${t1}_nu.mnc -clobber", $verbose)) {
        die "(process_n3_correction) Error - when tring to run nu_correct - output: ${t1}_nu.mnc. Brain tissue classification was not done!\n";
     }

     # Processing N3 nu_correct into the file mrs_id_e2.mnc.gz and get the file mrs_id_e2_nu.mnc as a result
     if (&shellcommand("nu_correct", "${t2}.mnc.gz ${t2}_nu.mnc -clobber", $verbose)) {
        die "(process_n3_correction) Error - when tring to run nu_correct - output: ${t2}_nu.mnc. Brain tissue classification was not done!\n";
     }

     # Removing all the temporality files
     if (&removefile("${mrs_id}*.imp", $verbose, $askconf)) {
        die "(process_n3_correction) Error - when tring to remove the file *.imp. Brain tissue classification was not done!\n";
     }

     # Compressing files
     if (&compres("${mrs_id}*_nu.mnc", $verbose, $askconf)) {
        die "(process_n3_correction) Error - when tring to compress the file ${mrs_id}*_nu.mnc. Brain tissue classification was not done!\n";
     }
     
     # Checking with the target files were created
     if ( (! -e "${t1}_nu.mnc.gz") || (! -e "${t2}_nu.mnc.gz") || (! -e "${pd}_nu.mnc.gz") ) {
        die "(process_n3_correction) Error - N3 NU correction was not correctly processed. Brain tissue classification was not done!\n";
     }     
     
  }

}

#-----------------------------------------------------------------------
# create_t2_native_space()
#     Routine to create T2 native space if does not exist
#     Phase II
#-----------------------------------------------------------------------

sub create_t2_native_space {

  if ( (-e "${mrs_id}_d1e2.xfm")  && (-e "${mrs_id}_e2d1.xfm") ) {
     if ($verbose eq "yes") { printf("XFM files to T2 native space already exist. Moving along...........\n"); }
  } else {
     if ($verbose eq "yes") { printf("Creating a T2 native space xfm reference file......................\n"); }

     # 
     if (&shellcommand("mritoself", "${t1}_nu.mnc.gz ${t2}_nu.mnc.gz ${mrs_id}_d1e2.xfm -clobber", $verbose)) {
        die "(create_t2_native_space) Error - when tring to run mritoself - output: ${t2}_nu.mnc.gz. Brain tissue classification was not done!\n";
     }

     # 
     if (&shellcommand("xfminvert", "${mrs_id}_d1e2.xfm ${mrs_id}_e2d1.xfm", $verbose)) {
        die "(create_t2_native_space) Error - when tring to run xfminvert - output: ${mrs_id}_e2d1.xfm. Brain tissue classification was not done!\n";
     }

     # Checking with the target files were created
    if ( (! -e "${mrs_id}_d1e2.xfm") || (! -e "${mrs_id}_e2d1.xfm") ) {
       die "(create_t2_native_space) Error - T2 native space was not correctly processed. Brain tissue classification was not done!\n";
    }     
  }

}

#-----------------------------------------------------------------------
# resampling_T1_and_MT_into_T2_sapce()
#     Routine to resample T1 and MT images into T2 native space
#     Phase III
#-----------------------------------------------------------------------

sub resampling_T1_and_MT_into_T2_sapce {

  if ( -e $mrs_id . "_d1e2_nu.mnc.gz" ) {
     if ($verbose eq "yes") { printf("T1 image is already resampled into T2 native space. Moving along...\n"); }
  } else {
     if ($verbose eq "yes") { printf("Resampling T1 image into T2 native space...........................\n"); }


     # Ressampling the T1 image into T2 native space and creating a file mrs_id_d1e2_nu.mnc
     if (&shellcommand("mincresample", "${t1}_nu.mnc.gz ${mrs_id}_d1e2_nu.mnc -like ${t2}_nu.mnc.gz -transformation ${t1}e2.xfm -clobber", $verbose)) {
        die "(resampling_T1_and_MT_into_T2_sapce) Error - when tring to run mincresample - output: ${mrs_id}_d1e2_nu.mnc. 
            Brain tissue classification was not done!\n";
     }

     # Compressing files
     if (&compres("${mrs_id}_d1e2_nu.mnc", $verbose, $askconf)) {
        die "(resampling_T1_and_MT_into_T2_sapce) Error - when tring to compress the file ${mrs_id}_d1e2_nu.mnc. Brain tissue classification was not done!\n";
     }

     # Checking with the target files were created
     if ( (! -e "${mrs_id}_d1e2_nu.mnc.gz") ) {
        die "(resampling_T1_and_MT_into_T2_sapce) Error - resampling T1 image into T2 native space was not correctly processed. 
            Brain tissue classification was not done!\n";
     }     
  }

#  if ( -e $mrs_id . "_MTe2.mnc.gz" ) {
#     if ($verbose eq "yes") { printf("MT image is already into T2 native space. Moving along.............\n"); }
#  } else {

  if ( -e $mrs_id . "_MTe2.mnc.gz" ) {
     if ($verbose eq "yes") { printf("MT image is already into T2 native space. Moving along.............\n"); }
  } elsif (! -e $mrs_id . "_MT.mnc.gz") {
     printf("Warning - Resampling MT image into T2 native space was not possible. MT image does not exist........\n");
  } else {
     if ($verbose eq "yes") { printf("Resampling MT image into T2 native space...........................\n"); }

     # Ressampling the MT image into T2 native space and creating a file mrs_id_MTe2.mnc
     if (&shellcommand("mincresample", "${mrs_id}_MT.mnc.gz ${mrs_id}_MTe2.mnc -like ${t2}_nu.mnc.gz -transformation ${t1}e2.xfm -clobber", $verbose)) {
        die "(resampling_T1_and_MT_into_T2_sapce) Error - when tring to run mincresample - output: ${mrs_id}_MTe2.mnc. Brain tissue classification was not done!\n";
     }

     # Compressing files
     if (&compres("${mrs_id}_MTe2.mnc", $verbose, $askconf)) {
        die "(resampling_T1_and_MT_into_T2_sapce) Error - when tring to compress the file ${mrs_id}_MTe2.mnc. Brain tissue classification was not done!\n";
     }

     # Checking with the target files were created
     if ( (! -e "${mrs_id}_MTe2.mnc.gz") ) {
        die "(resampling_T1_and_MT_into_T2_sapce) Error - resampling MT image into T2 native space was not correctly processed. 
           Brain tissue classification was not done!\n";
     }     
  }

}

#-----------------------------------------------------------------------
# extract_extra_cerebral_tissue()
#     Routine to extract brain tissue using BET
#     Phase IV
#-----------------------------------------------------------------------

sub extract_extra_cerebral_tissue {

 if ( (-e "${mrs_id}_brain_mask.mnc.gz") && (-e "${mrs_id}_brain.mnc.gz") ) {
     if ($verbose eq "yes") { printf("Brain mask already exists. Moving along............................\n"); }
  } else {
     if ($verbose eq "yes") { printf("Extracting extra-cerebral tissue and creating brain mask...........\n"); }


     # Decompress necessary files
     if (&decompres("${mrs_id}_d1e2_nu.mnc.gz", $verbose, $askconf)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to decompress the file ${mrs_id}_d1e2_nu.mnc.gz. Brain tissue classification was not done!\n";
     }

     # Converting minc files into analyze format
     if (&shellcommand("minc2analyze", "${mrs_id}_d1e2_nu", $verbose)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to run minc2analyze - input: ${mrs_id}_d1e2_nu. Brain tissue classification was not done!\n";
     }

     # Rename the analyze output files
     if (&movefile("${mrs_id}_d1e2_nu.hdr", "${mrs_id}_d1e2_nu_analyze.hdr", $verbose, $askconf)) {
        die "(normilize) Error - when tring to move the file ${mrs_id}_d1e2_nu_analyze.hdr. Brain tissue classification was not done!\n";
     }
     if (&movefile("${mrs_id}_d1e2_nu.img", "${mrs_id}_d1e2_nu_analyze.img", $verbose, $askconf)) {
        die "(normilize) Error - when tring to move the file ${mrs_id}_d1e2_nu_analyze.img. Brain tissue classification was not done!\n";
     }

     # Running the program BET to extract the extra-cerebral tissue
#     if (&shellcommand("bet", "${mrs_id}_d1e2_nu ${mrs_id}_brain -m", $verbose)) {
#        die "(extract_extra_cerebral_tissue) Error - when tring to run bet - input: ${mrs_id}_d1e2_nu. Brain tissue classification was not done!\n";
#     }
#     if (&shellcommand("bet", "${mrs_id}_d1e2_nu ${mrs_id} -s", $verbose)) {
#        die "(extract_extra_cerebral_tissue) Error - when tring to run bet - input: ${mrs_id}_d1e2_nu. Brain tissue classification was not done!\n";
#     }
#     if (&shellcommand("bet", "${mrs_id}_d1e2_nu ${mrs_id}_brain", $verbose)) {
#        die "(extract_extra_cerebral_tissue) Error - when tring to run bet - input: ${mrs_id}_d1e2_nu. Brain tissue classification was not done!\n";
#     }

     if (&shellcommand("bet", "${mrs_id}_d1e2_nu_analyze ${mrs_id}_brain -m", $verbose)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to run bet - input: ${mrs_id}_d1e2_nu_analyze. Brain tissue classification was not done!\n";
     }
     if (&shellcommand("bet", "${mrs_id}_d1e2_nu_analyze ${mrs_id} -s", $verbose)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to run bet - input: ${mrs_id}_d1e2_nu_analyze. Brain tissue classification was not done!\n";
     }
     if (&shellcommand("bet", "${mrs_id}_d1e2_nu_analyze ${mrs_id}_brain", $verbose)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to run bet - input: ${mrs_id}_d1e2_nu_analyze. Brain tissue classification was not done!\n";
     }

     # Converting analyze files into minc format
     if (&shellcommand("analyze2minc", "${mrs_id}_brain", $verbose)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to run analyze2minc - output: ${mrs_id}_brain. Brain tissue classification was not done!\n";
     }
     if (&shellcommand("analyze2minc", "${mrs_id}_brain_mask", $verbose)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to run analyze2minc - output: ${mrs_id}_brain_mask. Brain tissue classification was not done!\n";
     }

     # Removing all the temporality files
     if (&removefile("${mrs_id}*.hdr", $verbose, $askconf)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to remove the file ${mrs_id}*.hdr. Brain tissue classification was not done!\n";
     }
     if (&removefile("${mrs_id}*.img", $verbose, $askconf)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to remove the file ${mrs_id}*.img. Brain tissue classification was not done!\n";
     }

     # Compressing files
     if (&compres("${mrs_id}*.mnc", $verbose, $askconf)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to compress the file ${mrs_id}*.mnc. Brain tissue classification was not done!\n";
     }

     # Creating the referencial space file
     if (&shellcommand("mritoself", "${mrs_id}_brain.mnc.gz ${mrs_id}_d1e2_nu.mnc.gz ${mrs_id}_analyze2minc_res.xfm -clobber", $verbose)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to run mritoself - output: ${mrs_id}_d1e2_nu.mnc.gz. Brain tissue classification was not done!\n";
     }

     # Resampling the brain mask into the same space of d1e2 image
     if (&shellcommand("mincresample", "-nearest ${mrs_id}_brain_mask.mnc.gz ${mrs_id}_brain_mask.mnc -like ${mrs_id}_d1e2_nu.mnc.gz -transformation ${mrs_id}_analyze2minc_res.xfm -clobber", $verbose)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to run mincresample - output: ${mrs_id}_brain_mask.mnc. Brain tissue classification was not done!\n";
     }
        
     # Resampling the brain into the same space of d1e2 image
     if (&shellcommand("mincresample", "-nearest ${mrs_id}_brain.mnc.gz ${mrs_id}_brain.mnc -like ${mrs_id}_d1e2_nu.mnc.gz -transformation ${mrs_id}_analyze2minc_res.xfm -clobber", $verbose)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to run mincresample - output: ${mrs_id}_brain.mnc. Brain tissue classification was not done!\n";
     }

     # Compressing files
     if (&compres("${mrs_id}*.mnc", $verbose, $askconf)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to compress the file ${mrs_id}*.mnc. Brain tissue classification was not done!\n";
     }

     # Checking with the target files were created
     if ( (! -e "${mrs_id}_brain.mnc.gz") && (! -e "${mrs_id}_brain_mask.mnc.gz") && (! -e "${mrs_id}_analyze2minc_res.xfm") ) {
        die "(extract_extra_cerebral_tissue) Error - extracting extra-cerebral tissue and creating brain mask was not correctly processed. 
            Brain tissue classification was not done!\n";
     }     
  }

}

#-----------------------------------------------------------------------
# remove_eyes_and_carotid()
#     Routine to remove eyes, carotid, cerebellum and brainstem
#     Phase V
#-----------------------------------------------------------------------

sub remove_eyes_and_carotid {

  my $modelresample = "";
  if ($classify eq "control") {
#     $modelresample = "${modelsPath}/tal_eye_carotid_inv.mnc";
     $modelresample = "${modelsPath}/tal_eye_carotid_cerebellum_brainstem_inv.mnc";
  } else {
     $modelresample = "${modelsPath}/tal_eye_carotid_cerebellum_brainstem_inv.mnc";
  }


  if ( (-e "${mrs_id}_tale2.xfm") && (-e "${mrs_id}_e2tal.xfm") ) {
     if ($verbose eq "yes") { printf("Talairach coordinate of d1e2 file already exists. Moving along.....\n"); }
  } else {
     if ($verbose eq "yes") { printf("Creating the Talairach coordinate space of d1e2....................\n"); }

     #
     if (&shellcommand("mritotal", "${mrs_id}_d1e2_nu.mnc.gz ${mrs_id}_e2tal.xfm -clobber", $verbose)) {
        die "(remove_eyes_and_carotid) Error - when tring to run mritotal - output: ${mrs_id}_e2tal.xfm. Brain tissue classification was not done!\n";
     }

     #
     if (&shellcommand("xfminvert", "${mrs_id}_e2tal.xfm ${mrs_id}_tale2.xfm", $verbose)) {
        die "(remove_eyes_and_carotid) Error - when tring to run xfminvert - output: ${mrs_id}_tale2.xfm. Brain tissue classification was not done!\n";
     }
     
     
     # Removing all the temporality files
     if (&removefile("${mrs_id}_no_eye_no_carotid_native.mnc*", $verbose, $askconf)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to remove the file ${mrs_id}*.hdr. Brain tissue classification was not done!\n";
     }
     

     # Checking with the target files were created
     if ( (! -e "${mrs_id}_e2tal.xfm") && (! -e "${mrs_id}_tale2.xfm") ) {
        die "(remove_eyes_and_carotid) Error - Talairach coordinate space reference from d1e2 was not correctly processed. Brain tissue classification was not done!\n";
     }     
  }


  if ( (-e "${mrs_id}_no_eye_no_carotid_native.mnc.gz") ) {
     if ($verbose eq "yes") { printf("Eyes and carotid have already extracted. Moving along.............\n"); }
  } else {
     if ($verbose eq "yes") { printf("Removing Eyes and carotid.........................................\n"); }

     #
     if (&shellcommand("mincresample", "-nearest $modelresample ${mrs_id}_no_eye_no_carotid_native.mnc -like ${mrs_id}_d1e2_nu.mnc.gz -transformation ${mrs_id}_tale2.xfm -clobber", $verbose)) {
        die "(remove_eyes_and_carotid) Error - when tring to run mincresample - output: ${mrs_id}_no_eye_no_carotid_native.mnc. Brain tissue classification was not done!\n";
     }

     #
     if (&shellcommand("mincmath", "-and ${mrs_id}_brain_mask.mnc.gz ${mrs_id}_no_eye_no_carotid_native.mnc ${mrs_id}_brain_mask.mnc -clobber", $verbose)) {
        die "(remove_eyes_and_carotid) Error - when tring to run mincmath - output: ${mrs_id}_brain_mask.mnc. Brain tissue classification was not done!\n";
     }
   
     # Removing all the temporality files
     if (&removefile("${mrs_id}_no_eye_no_carotid_native.mnc*", $verbose, $askconf)) {
        die "(prenormalizeimages5) Error - when tring to remove the file ${mrs_id}_skull_mask.mnc*. Brain tissue classification was not done!\n";
     }
     
     if (&shellcommand("mincresample", "-nearest $modelresample ${mrs_id}_no_eye_no_carotid_native.mnc -like ${mrs_id}_d1e2_nu.mnc.gz -transformation ${mrs_id}_tale2.xfm -clobber", $verbose)) {
        die "(remove_eyes_and_carotid) Error - when tring to run mincresample - output: ${mrs_id}_no_eye_no_carotid_native.mnc. Brain tissue classification was not done!\n";
     }

     #
     if (&shellcommand("mincmath", "-and ${mrs_id}_brain_mask.mnc.gz ${mrs_id}_no_eye_no_carotid_native.mnc ${mrs_id}_brain_mask.mnc -clobber", $verbose)) {
        die "(remove_eyes_and_carotid) Error - when tring to run mincmath - output: ${mrs_id}_brain_mask.mnc. Brain tissue classification was not done!\n";
     }
     
     # Compressing files
     if (&compres("${mrs_id}*.mnc", $verbose, $askconf)) {
        die "(remove_eyes_and_carotid) Error - when tring to compress the file ${mrs_id}*.mnc. Brain tissue classification was not done!\n";
     }

     #
     if (&shellcommand("mincresample", "-nearest ${mrs_id}_brain_mask.mnc.gz ${mrs_id}_brain_mask.mnc -like ${mrs_id}_d1e2_nu.mnc.gz -clobber", $verbose)) {
        die "(remove_eyes_and_carotid) Error - when tring to run mincresample - output: ${mrs_id}_brain_mask.mnc. Brain tissue classification was not done!\n";
     }

     # Compressing files
     if (&compres("${mrs_id}_brain_mask.mnc", $verbose, $askconf)) {
        die "(remove_eyes_and_carotid) Error - when tring to compress the file ${mrs_id}_brain_mask.mnc. Brain tissue classification was not done!\n";
     }

     # Checking with the target files were created
     if ( (! -e "${mrs_id}_no_eye_no_carotid_native.mnc.gz") && (! -e "${mrs_id}_brain_mask.mnc.gz") ) {
        die "(remove_eyes_and_carotid) Error - Eyes and Carotid was not correctly processed. Brain tissue classification was not done!\n";
     }     
  }
}

#-----------------------------------------------------------------------
# prenormalizeimages()
#     Routine to process the step pre-normalize-images
#-----------------------------------------------------------------------

sub prenormalizeimages {

  my $taleyemodel = "${modelsPath}/tal_eye.mnc";

  if ( (-e "${mrs_id}_t1_brain.mnc.gz") && (-e "${mrs_id}_t2_brain.mnc.gz") && (-e "${mrs_id}_pd_brain.mnc.gz") &&
          (-e "${mrs_id}_t1_skull.mnc.gz") && (-e "${mrs_id}_t2_skull.mnc.gz") && (-e "${mrs_id}_pd_skull.mnc.gz") ) {
     if ($verbose eq "yes") { printf("The files have previously been pre-normalized5. Moving along...\n"); }
  } else {
     if ($verbose eq "yes") { printf("Pre-normalize Images_5 files...\n"); }

     # 
     if (&shellcommand("mincmath", "-mult ${mrs_id}_brain_mask.mnc.gz ${mrs_id}_d1e2_nu.mnc.gz ${mrs_id}_t1_brain.mnc -clobber", $verbose)) {
        die "(prenormalizeimages) Error - when tring to run mincmath - output: ${mrs_id}_t1_brain.mnc . Brain tissue classification was not done!\n";
     }
     if (&shellcommand("mincmath", "-mult ${mrs_id}_brain_mask.mnc.gz ${mrs_id}_e2_nu.mnc.gz ${mrs_id}_t2_brain.mnc -clobber", $verbose)) {
        die "(prenormalizeimages) Error - when tring to run mincmath - output: ${mrs_id}_t2_brain.mnc. Brain tissue classification was not done!\n";
     }
     if (&shellcommand("mincmath", "-mult ${mrs_id}_brain_mask.mnc.gz ${mrs_id}_e1_nu.mnc.gz ${mrs_id}_pd_brain.mnc -clobber", $verbose)) {
        die "(prenormalizeimages) Error - when tring to run mincmath - output: ${mrs_id}_pd_brain.mnc. Brain tissue classification was not done!\n";
     }

     # Cutting off background from the image
     if (&shellcommand("cutting_off_background", "${mrs_id}_d1e2_nu.mnc.gz ${mrs_id}_brain_mask.mnc.gz ${mrs_id}", $verbose)) {
        die "(prenormalizeimages) Error - when tring to run cutting_off_background - output: ${mrs_id}. Brain tissue classification was not done!\n";
     }

     # 
     if (&shellcommand("mincresample", "-nearest ${taleyemodel} ${mrs_id}_eye_mask.mnc -like ${mrs_id}_d1e2_nu.mnc.gz -transformation ${mrs_id}_tale2.xfm -clobber", $verbose)) {
        die "(prenormalizeimages) Error - when tring to run mincresample - output: ${mrs_id}_eye_mask.mnc. Brain tissue classification was not done!\n";
     }

     # 
     if (&shellcommand("mincmath", "-or ${mrs_id}_eye_mask.mnc ${mrs_id}_skull_mask.mnc ${mrs_id}_skull_mask_new.mnc -clobber", $verbose)) {
        die "(prenormalizeimages) Error - when tring to run mincmath - output: ${mrs_id}_skull_mask.mnc. Brain tissue classification was not done!\n";
     }
      
     # Removing all the temporality files
     if (&removefile("${mrs_id}_skull_mask.mnc*", $verbose, $askconf)) {
        die "(prenormalizeimages) Error - when tring to remove the file ${mrs_id}_skull_mask.mnc*. Brain tissue classification was not done!\n";
     }

     # Compressing files
     if (&compres("${mrs_id}*.mnc", $verbose, $askconf)) {
        die "(prenormalizeimages5) Error - when tring to compress the file ${mrs_id}*.mnc. Brain tissue classification was not done!\n";
     }
          
     # 
     if (&shellcommand("mincresample", "-nearest ${mrs_id}_skull_mask_new.mnc.gz ${mrs_id}_skull_mask.mnc -like ${mrs_id}_d1e2_nu.mnc.gz -clobber", $verbose)) {
        die "(prenormalizeimages) Error - when tring to run mincresample - output: ${mrs_id}_skull_mask.mnc. Brain tissue classification was not done!\n";
     }
        
     # Compressing files
     if (&compres("${mrs_id}_skull_mask.mnc", $verbose, $askconf)) {
        die "(prenormalizeimages) Error - when tring to compress the file ${mrs_id}_skull_mask.mnc. Brain tissue classification was not done!\n";
     }

     # Removing all the temporality files
     if (&removefile("${mrs_id}_skull_mask_new.mnc*", $verbose, $askconf)) {
        die "(prenormalizeimages) Error - when tring to remove the file ${mrs_id}_skull_mask_new.mnc*. Brain tissue classification was not done!\n";
     }
      
     # 
     if (&shellcommand("mincmath", "-mult ${mrs_id}_skull_mask.mnc.gz ${mrs_id}_d1e2_nu.mnc.gz ${mrs_id}_t1_skull.mnc -clobber", $verbose)) {
        die "(prenormalizeimages) Error - when tring to run mincmath - output: ${mrs_id}_t1_skull.mnc. Brain tissue classification was not done!\n";
     }
        
     # 
     if (&shellcommand("mincmath", "-mult ${mrs_id}_skull_mask.mnc.gz ${mrs_id}_e2_nu.mnc.gz ${mrs_id}_t2_skull.mnc -clobber", $verbose)) {
        die "(prenormalizeimages) Error - when tring to run mincmath - output: ${mrs_id}_t2_skull.mnc. Brain tissue classification was not done!\n";
     }

     # 
     if (&shellcommand("mincmath", "-mult ${mrs_id}_skull_mask.mnc.gz ${mrs_id}_e1_nu.mnc.gz ${mrs_id}_pd_skull.mnc -clobber", $verbose)) {
        die "(prenormalizeimages) Error - when tring to run mincmath - output: ${mrs_id}_pd_skull.mnc. Brain tissue classification was not done!\n";
     }

     # Compressing files
     if (&compres("${mrs_id}*.mnc", $verbose, $askconf)) {
        die "(prenormalizeimages) Error - when tring to compress the file ${mrs_id}*.mnc. Brain tissue classification was not done!\n";
     }

     # Checking with the target files were created
     if ( (! -e "${mrs_id}_t1_brain.mnc.gz") || (! -e "${mrs_id}_t2_brain.mnc.gz") || (! -e "${mrs_id}_pd_brain.mnc.gz") ||
          (! -e "${mrs_id}_t1_skull.mnc.gz") || (! -e "${mrs_id}_t2_skull.mnc.gz") || (! -e "${mrs_id}_pd_skull.mnc.gz") ||
          (! -e "${mrs_id}_skull_mask.mnc.gz") || (! -e "${mrs_id}_eye_mask.mnc.gz") ) {
        die "(prenormalizeimages) Error - Pre-normalize-images was not correctly processed. Brain tissue classification was not done!\n";
     }     
  }

}

#-----------------------------------------------------------------------
# normilize()
#     Routine to performance the intensity range normalization
#     Phase VI
#-----------------------------------------------------------------------

sub normilize {


  if ( (-e "${mrs_id}_d1e2_nu_brain_norm.mnc.gz") && (-e "${mrs_id}_e2_nu_brain_norm.mnc.gz") && (-e "${mrs_id}_e1_nu_brain_norm.mnc.gz") ) {
     if ($verbose eq "yes") { printf("The intensity range normalization already exists. Moving along.....\n"); }
  } else {
     if ($verbose eq "yes") { printf("Performance the intensity range normalization......................\n"); }

     if ($verbose eq "yes") { printf("pre-normalize necessary images...\n"); }
     &prenormalizeimages;
      
     # Moving files
     if (&movefile("${mrs_id}_t1_skull.mnc.gz", "${mrs_id}_d1e2_nu_brain_inv.mnc.gz", $verbose, $askconf)) {
        die "(normilize) Error - when tring to move the file ${mrs_id}_t1_skull.mnc.gz. Brain tissue classification was not done!\n";
     }
     if (&movefile("${mrs_id}_t2_skull.mnc.gz", "${mrs_id}_e2_nu_brain_inv.mnc.gz", $verbose, $askconf)) {
        die "(normilize) Error - when tring to move the file ${mrs_id}_t2_skull.mnc.gz. Brain tissue classification was not done!\n";
     }
     if (&movefile("${mrs_id}_pd_skull.mnc.gz", "${mrs_id}_e1_nu_brain_inv.mnc.gz", $verbose, $askconf)) {
        die "(normilize) Error - when tring to move the file ${mrs_id}_pd_skull.mnc.gz. Brain tissue classification was not done!\n";
     }

     if (&movefile("${mrs_id}_t1_brain.mnc.gz", "${mrs_id}_d1e2_nu_brain.mnc.gz", $verbose, $askconf)) {
        die "(normilize) Error - when tring to move the file ${mrs_id}_t1_brain.mnc.gz. Brain tissue classification was not done!\n";
     }
     if (&movefile("${mrs_id}_t2_brain.mnc.gz", "${mrs_id}_e2_nu_brain.mnc.gz", $verbose, $askconf)) {
        die "(normilize) Error - when tring to move the file ${mrs_id}_t2_brain.mnc.gz. Brain tissue classification was not done!\n";
     }
     if (&movefile("${mrs_id}_pd_brain.mnc.gz", "${mrs_id}_e1_nu_brain.mnc.gz", $verbose, $askconf)) {
        die "(normilize) Error - when tring to move the file ${mrs_id}_pd_brain.mnc.gz. Brain tissue classification was not done!\n";
     }

     # Decompress necessary files
     if (&decompres("${mrs_id}_d1e2_nu_brain_inv.mnc.gz", $verbose, $askconf)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to decompress the file ${mrs_id}_d1e2_nu.mnc.gz. Brain tissue classification was not done!\n";
     }
     if (&decompres("${mrs_id}_e2_nu_brain_inv.mnc.gz", $verbose, $askconf)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to decompress the file ${mrs_id}_d1e2_nu.mnc.gz. Brain tissue classification was not done!\n";
     }
     if (&decompres("${mrs_id}_e1_nu_brain_inv.mnc.gz", $verbose, $askconf)) {
        die "(extract_extra_cerebral_tissue) Error - when tring to decompress the file ${mrs_id}_d1e2_nu.mnc.gz. Brain tissue classification was not done!\n";
     }

     # Processing the intensity range normalization into t1, t2 and pd
     if (&shellcommand("brainmean3", "${mrs_id}_d1e2_nu_brain_inv.mnc 1000 0.95 ${mrs_id}_d1e2_nu_brain", $verbose)) {
        die "(normilize) Error - when tring to run brainmean3 - output: ${mrs_id}_d1e2_nu_brain. Brain tissue classification was not done!\n";
     }
     if (&shellcommand("brainmean3", "${mrs_id}_e2_nu_brain_inv.mnc 1000 0.5 ${mrs_id}_e2_nu_brain", $verbose)) {
        die "(normilize) Error - when tring to run brainmean3 - output: ${mrs_id}_e2_nu_brain. Brain tissue classification was not done!\n";
     }
     if (&shellcommand("brainmean3", "${mrs_id}_e1_nu_brain_inv.mnc 1000 0.75 ${mrs_id}_e1_nu_brain", $verbose)) {
        die "(normilize) Error - when tring to run brainmean3 - output: ${mrs_id}_e1_nu_brain. Brain tissue classification was not done!\n";
     }

     # Removing all the temporality files
#     if (&removefile("${mrs_id}_*brain_inv.mnc.gz", $verbose, $askconf)) {
#        die "(normilize) Error - when tring to remove the file ${mrs_id}_*brain_inv.mnc.gz. Brain tissue classification was not done!\n";
#     }
#     if (&removefile("${mrs_id}_*_brain.mnc.gz", $verbose, $askconf)) {
#        die "(normilize) Error - when tring to remove the file ${mrs_id}_*brain.mnc.gz. Brain tissue classification was not done!\n";
#     }

     # Compressing files
     if (&compres("${mrs_id}*.mnc", $verbose, $askconf)) {
        die "(normilize) Error - when tring to compress the file ${mrs_id}*.mnc. Brain tissue classification was not done!\n";
     }
  }

}

#-----------------------------------------------------------------------
# classification()
#     Routine to segment
#     Phase VII
#-----------------------------------------------------------------------

sub classification {

  if ($verbose eq "yes") { printf("\nPreparing to run the classification of the tissue...\n"); }

  my $mrs_id_output = $mrs_id;
  if (defined($dateprocess)) {
     $mrs_id_output = $mrs_id_output . "_" . $dateprocess;
  }

  my $options = "";
  if ($classify eq "control") {
     $options = " -mt -onepass -control";
  } else {
     $options = " -mt -onepass lesion 15";
  }

  # 
  if (&shellcommand("mincautobayes2", "$modelfgpt 75 ${mrs_id}_d1e2_nu_brain_norm.mnc.gz ${mrs_id}_e2_nu_brain_norm.mnc.gz ${mrs_id}_e1_nu_brain_norm.mnc.gz $mrs_id_output $options", $verbose)) {
     die "(classification) Error - when tring to run mincautobayes2 - output: ${mrs_id_output}. Brain tissue classification was not done!\n";
  }

  # 
#  if ($classify eq "patient") {
     if (&shellcommand("classifier_postprocessor", "$modelfgpt 75 ${mrs_id}_d1e2_nu_brain_norm.mnc.gz ${mrs_id}_e2_nu_brain_norm.mnc.gz ${mrs_id}_e1_nu_brain_norm.mnc.gz $mrs_id_output -mt -onepass", $verbose)) {
        die "(classification) Error - when tring to run classifier_postprocessor - output: ${mrs_id_output}. Brain tissue classification was not done!\n";
     }
#  }
  
  # Compressing files
  if (&compres("${mrs_id}*.mnc", $verbose, $askconf)) {
     die "(normilize) Error - when tring to compress the file ${mrs_id}*.mnc. Brain tissue classification was not done!\n";
  }

}

#-----------------------------------------------------------------------
# process
#     Routine to process the classification
#-----------------------------------------------------------------------

sub process {

  # create the output file name with or without the parameter date
  my $mrs_id_output = $mrs_id;
  if (defined($dateprocess)) {
     $mrs_id_output = $mrs_id_output . "_" . $dateprocess;
  }

  # verify if the samples has already processed
#  if ($classify eq "control") {
#     if ( (-e "${mrs_id_output}_bayes1.mnc.gz") && ($clobber eq "no") ) {
#        die ("\nMRS_ID was already processed. Use \"-clobber\" option to clobber (rewrite) existing files.\n\n");
#     }
#  } else {
     if ( (-e "${mrs_id_output}_bayes.mnc.gz") && ($clobber eq "no") ) {
        die ("\nMRS_ID was already processed. Use \"-clobber\" option to clobber (rewrite) existing files.\n\n");
     }
#  }

  # verify if it is control ou patient that is going to be processed
  if ($classify eq "control") {
    if ($verbose eq "yes") { printf("processing control...\n"); }
  } else {
    if ($verbose eq "yes") { printf("processing patient...\n"); }
#    &removefile("${mrs_id}*_nu_brain_norm*", $verbose, $askconf);
  }

  # verify if the modelfgpt files exists
  if ( !(-e $modelfgpt) ) {
     die ("Error - Missing the model file called: $modelfgpt. Brain tissue classification was not done!\n");
  }

  # verify required files to process Phase I
  if ( (!(-e "${t1}.mnc.gz")) || (!(-e "${t2}.mnc.gz")) || (!(-e "${pd}.mnc.gz")) ) {
     if ( (!(-e "${t1}_nu.mnc.gz")) || (!(-e "${t2}_nu.mnc.gz")) || (!(-e "${pd}_nu.mnc.gz")) ) {
        die("Error - Missing one of these files: ${t1}.mnc.gz/${t1}_nu.mnc.gz or ${t2}.mnc.gz/${t2}_nu.mnc.gz or ${pd}.mnc.gz/${pd}_nu.mnc.gz. Brain tissue classification was not done!\n");
     }
  }
  # process Phase I
  printf("Phase I - Processing N3 non-uniformity correction..................\n");
  &process_n3_correction;

  # verify required files to process Phase II
  if ( (!(-e "${t1}_nu.mnc.gz")) || (!(-e "${t2}_nu.mnc.gz")) ) {
     die("Error - Missing one of these files: ${t1}.mnc.gz or ${t2}.mnc.gz. Phase II was not processed. Brain tissue classification was not done!\n");
  }
  # process Phase II
  printf("Phase II - Create the T2 reference space xfm file..................\n");
  &create_t2_native_space;


  # verify required files to process Phase III
#  if ( (!(-e "${t1}_nu.mnc.gz")) || (!(-e "${t2}_nu.mnc.gz")) || (!(-e "${mrs_id}_MT.mnc.gz")) || (!(-e "${t1}e2.xfm")) ) {
#     die("Error - Missing one of these files: ${t1}.mnc.gz or ${t2}.mnc.gz or ${mrs_id}_MT.mnc.gz or ${t1}e2.xfm. Phase II was not processed. Brain tissue classification was not done!\n");
  if ( (!(-e "${t1}_nu.mnc.gz")) || (!(-e "${t2}_nu.mnc.gz")) || (!(-e "${t1}e2.xfm")) ) {
     die("Error - Missing one of these files: ${t1}.mnc.gz or ${t2}.mnc.gz or ${t1}e2.xfm. Phase II was not processed. Brain tissue classification was not done!\n");
  }
  # process Phase III
  printf("Phase III - Resampling T1 and MT into T2 native space..............\n");
  & resampling_T1_and_MT_into_T2_sapce;


  # verify required files to process Phase IV
  if ( !(-e "${mrs_id}_d1e2_nu.mnc.gz") ) {
     die("Error - Missing this file: ${mrs_id}_d1e2_nu.mnc.gz. Phase II was not processed. Brain tissue classification was not done!\n");
  }
  # process Phase IV
  printf("Phase IV - Extract the extra cerebral tissue.......................\n");
  &extract_extra_cerebral_tissue;


  # verify required files to process Phase V
  local($modelresample) = ("");
  if ($classify eq "control") {
#     $modelresample = "${modelsPath}/tal_eye_carotid_inv.mnc";
     $modelresample = "${modelsPath}/tal_eye_carotid_cerebellum_brainstem_inv.mnc";
  } else {
     $modelresample = "${modelsPath}/tal_eye_carotid_cerebellum_brainstem_inv.mnc";
  }

  if ( (!(-e "${mrs_id}_d1e2_nu.mnc.gz")) || (!(-e "${mrs_id}_brain_mask.mnc.gz")) || (!(-e $modelresample)) ) {
     die("Error - Missing one of these files: ${mrs_id}_d1e2_nu.mnc.gz or ${mrs_id}_brain_mask.mnc.gz or $modelresample. Phase V has not processed. Brain tissue classification was not done!\n");
  }
  # process Phase V
  printf("Phase V - remove_eyes_and_carotid......................\n");
  &remove_eyes_and_carotid;


  # verify required files to process Phase VI
  if ( (! -e "/raid/ms/studies/segmentation/models/tal_eye.mnc") && (! -e "${mrs_id}_d1e2_nu.mnc.gz") && (! -e "${mrs_id}_e2_nu.mnc.gz") && (! -e "${mrs_id}_e1_nu.mnc.gz") && (! -e "${mrs_id}_brain_mask.mnc.gz") && (! -e "${mrs_id}_tale2.xfm") ) {
     die("Error - Missing one of these files: /raid/ms/studies/segmentation/models/tal_eye.mnc or ${mrs_id}_d1e2_nu.mnc.gz or ${mrs_id}_e2_nu.mnc.gz or ${mrs_id}_e1_nu.mnc.gz or ${mrs_id}_brain_mask.mnc.gz or ${mrs_id}_tale2.xfm. Phase V has not processed. Brain tissue classification was not done!\n");
  }
  # process Phase VI
  printf("Phase VI - Intensity range normalization...............\n");
  &normilize;
  
  
  # verify required files to process Phase VII
  if ( (!(-e "${mrs_id}_brain_mask.mnc.gz")) || (!(-e "${mrs_id}_d1e2_nu_brain_norm.mnc.gz")) || (!(-e "${mrs_id}_e2_nu_brain_norm.mnc.gz")) || (!(-e "${mrs_id}_e1_nu_brain_norm.mnc.gz")) ) {
     die("Error - Missing one of these files: ${mrs_id}_brain_mask.mnc.gz or ${mrs_id}_d1e2_nu_brain_norm.mnc.gz or ${mrs_id}_e2_nu_brain_norm.mnc.gz or ${mrs_id}_e1_nu_brain_norm.mnc.gz. Phase VII was not processed. Brain tissue classification was not done!\n");
  }
  # process Phase VII
  printf("Phase VII - classification............................\n");
  &classification;
  
}

#-----------------------------------------------------------------------
# main
#-----------------------------------------------------------------------

# Get arguments
($mrs_id, $classify, $dateprocess, $modelfgpt, $askconf, $clobber, $verbose) = &get_arguments(@ARGV);

$host = hostname;

$modelfgptName = "backup_2003_02_14_ms.fgpt";
if ($host eq "mrspc" || $host eq "artemis") {
	$modelsPath = "/raid/ms/studies/segmentation/models";
	$modelfgptPath = "/hydra/home/simon/bin/2003_02_14_scripts";
} elsif ($host eq "Mineirinho.local") {
	$modelsPath = "/Users/amatos/images/models";
	$modelfgptPath = $modelsPath;
} else {
	$modelsPath = "/usr/local/mrs/models";
	$modelfgptPath = $modelsPath;
}	

$modelfgpt = "${modelfgptPath}/${modelfgptName}";

if ($verbose eq "yes") {
  printf("\n");
  printf("------------------------------------------------------------------------------------------------\n");
  printf("mrs_id.................................: $mrs_id\n");
  printf("type of classify.......................: $classify\n");
  printf("date to be include into bayes file name: $dateprocess\n");
  printf("which classifier model to use..........: $modelfgpt\n");
  printf("ask for confirmations?.................: $askconf\n");
  printf("clobber the bayes file?................: $clobber\n");
  printf("verbose all messages?..................: $verbose\n");
  printf("------------------------------------------------------------------------------------------------\n");
}

$pd = "${mrs_id}_e1";
$t2 = "${mrs_id}_e2";
$t1 = "${mrs_id}_d1";

# start the process
&process;


# end of program

