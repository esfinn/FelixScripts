#!/bin/bash

module load afni

# Set top level directory structure
topdir=/data/finnes/story_task/
task=Inscapes

for subj in $@
do

# Output directory: name for output
outdir=$topdir/$subj

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                                 \
        -script /$topdir/preprocessing/procVol.$subj.${task} -scr_overwrite   \
	-out_dir /$topdir/$subj/$subj.$task.volResults      		    \
        -blocks despike align tlrc volreg blur mask regress 		    \
        -copy_anat /$topdir/$subj/${subj}_T1_shft.nii.gz  	                                            \
        -dsets \
		/$topdir/$subj/${subj}_func_Inscapes.nii.gz            \
        -tcat_remove_first_trs 0                                            \
	-align_opts_aea -ginormous_move 			            \
	-tlrc_base TT_N27+tlrc                                              \
   	-tlrc_NL_warp                                         	            \
    	-volreg_align_to MIN_OUTLIER                                        \
    	-volreg_align_e2a                                                   \
    	-volreg_tlrc_warp                                                   \
	-blur_size 5						 	    \
        -mask_segment_anat yes                                     	    \
        -mask_import Tvent /data/finnes/story_task/template_ventricle_2.0+tlrc \
        -mask_intersect Svent CSFe Tvent  				    \
    	-regress_ROI_PC Svent 3                                            \
    	-regress_make_corr_vols WMe Svent                                \
    	-regress_anaticor_fast                                              \
    	-regress_censor_motion 0.3                                          \
    	-regress_censor_outliers 0.1                                        \
    	-regress_apply_mot_types demean deriv                               \
    	-regress_est_blur_epits                                             \
    	-regress_est_blur_errts                                             \
    	-regress_run_clustsim yes					    \
	-bash -execute
done
