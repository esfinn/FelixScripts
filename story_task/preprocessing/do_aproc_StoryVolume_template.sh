#!/bin/bash

module load afni

# Set top level directory structure
topdir=/data/finnes/story_task/
task=StoryAll
fsroot=$topdir/preprocessing/freesurfer/

for subj in $@
do

# Input directory: FreeSurfer + @SUMA_MakeSpec_FS results
fsindir=$fsroot/$subj/SUMA/

# Output directory: name for output
outdir=$topdir/$subj

# Input data: FreeSurfer results - anatomy, ventricle and WM maps
fsanat=${subj}_SurfVol.nii
fsvent=FSmask_vent.nii
fswm=FSmask_WM.nii

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                                 \
        -script /$topdir/preprocessing/procVol.$subj.$task -scr_overwrite   \
	-out_dir /$topdir/$subj/$subj.$task.volResults       		    \
        -blocks despike align tlrc volreg blur mask regress 		    \
        -copy_anat /$fsindir/$fsanat    				    \
    		-anat_follower_ROI aaseg  anat $fsindir/aparc.a2009s+aseg_rank.nii  \
    		-anat_follower_ROI aeseg  epi  $fsindir/aparc.a2009s+aseg_rank.nii  \
    		-anat_follower_ROI FSvent epi  $fsindir/$fsvent                     \
    		-anat_follower_ROI FSWMe  epi  $fsindir/$fswm                       \
    		-anat_follower_erode FSvent FSWMe                                   \
        -dsets \
		/$topdir/$subj/${subj}_func_Story1_crop.nii.gz            \
		/$topdir/$subj/${subj}_func_Story2_crop.nii.gz            \
		/$topdir/$subj/${subj}_func_Story3_crop.nii.gz            \
        -tcat_remove_first_trs 0                                            \
	-align_opts_aea -giant_move 					    \
	-tlrc_base TT_N27+tlrc                                              \
   	-tlrc_NL_warp                                                       \
    	-volreg_align_to MIN_OUTLIER                                        \
    	-volreg_align_e2a                                                   \
    	-volreg_tlrc_warp                                                   \
	-blur_size 5						 	    \
    	-regress_ROI_PC FSvent 3                                            \
    	-regress_make_corr_vols aeseg FSvent                                \
    	-regress_anaticor_fast                                              \
    	-regress_anaticor_label FSWMe                                       \
    	-regress_censor_motion 0.3                                          \
    	-regress_censor_outliers 0.1                                        \
    	-regress_apply_mot_types demean deriv                               \
    	-regress_est_blur_epits                                             \
    	-regress_est_blur_errts                                             \
    	-regress_run_clustsim no					    \
	-bash -execute
done
