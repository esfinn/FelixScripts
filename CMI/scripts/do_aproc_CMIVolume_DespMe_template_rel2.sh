#!/bin/bash

module load afni

# Set top level directory structure
topdir=/data/finnes/CMI/
task=Movie_DespMe
fsroot=$topdir/scripts/freesurfer/
outdir=/data/CMI_preproc/

for subj in $@
do

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                                 \
        -script /data/finnes/CMI/scripts/afni_proc/procVol.$subj.$task -scr_overwrite                                   \
	-out_dir $outdir/$task/$subj.$task.volResults                                    \
        -blocks despike align tlrc volreg blur mask regress                \
        -copy_anat /data/finnes/CMI/scripts/freesurfer/$subj/SUMA/${subj}_SurfVol.nii  \
	-anat_has_skull yes \
        -anat_follower_ROI aaseg anat /data/finnes/CMI/scripts/freesurfer/$subj/SUMA/aparc.a2009s+aseg_rank.nii        \
                  -anat_follower_ROI aeseg epi /data/finnes/CMI/scripts/freesurfer/$subj/SUMA/aparc.a2009s+aseg_rank.nii        \
                  -anat_follower_ROI FSvent epi /data/finnes/CMI/scripts/freesurfer/$subj/SUMA/FSmask_vent.nii                  \
                  -anat_follower_ROI FSWMe epi /data/finnes/CMI/scripts/freesurfer/$subj/SUMA/FSmask_WM.nii                   \
                  -anat_follower_erode FSvent FSWMe                           \
        -dsets /data/DSST_dua/CMI/release_2/MRI/sub-${subj}/func/sub-${subj}_task-movieTP_bold.nii.gz        \
        -tcat_remove_first_trs 0                                            \
	-align_opts_aea -giant_move 					    \
	-tlrc_base $topdir/HaskinsPeds_NL_template1.0+tlrc.HEAD             \
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

 
