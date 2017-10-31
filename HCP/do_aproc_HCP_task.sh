#!/bin/bash

module load afni

# Set top level directory structure
topdir=/data/HCP/HCP_1200/
task=SOCIAL_LR

for subj in $@
do

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                                 \
        -script /data/????/scripts/procVol.$subj.$task -scr_overwrite                                   \
	-out_dir /data/????/preprocessed_data/$subj/$task.results                                    \
        -blocks regress                \
        -copy_anat $topdir/$subj/MNINonLinear/T1w_restore_brain.nii.gz  \
	-anat_has_skull no \
        -anat_follower_ROI aaseg anat $topdir/$subj/MNINonLinear/Results/aparc.a2009s+aseg.nii.gz        \
	-anat_follower_ROI aeseg epi $topdir/$subj/MNINonLinear/Results/aparc.a2009s+aseg.nii.gz        \
	-anat_follower_ROI WMe epi $topdir/$subj/MNINonLinear/ROIs/WMReg.2.nii.gz                   \
	-anat_follower_ROI CSF epi $topdir/$subj/MNINonLinear/ROIs/CSFReg.2.nii.gz                   \
        -anat_follower_erode CSF \ # [not doing this for WM bc this mask is already substantially eroded]                          \
        -dsets $topdir/$subj/MNINonLinear/Results/tfMRI_${task}/tfMRI_${task}.nii.gz        \
        -tcat_remove_first_trs 0                                            \
    	-regress_ROI_PC CSF 3                                            \
    	-regress_make_corr_vols aeseg CSF                                \
    	-regress_anaticor_fast                                              \
    	-regress_anaticor_label WMe                                       \
    	-regress_censor_motion 0.3                                          \
	-regress_motion_file $topdir/$subj/MNINonLinear/Results/tfMRI_${task}/Movement_Regressors_dt.txt \
    	 # -regress_apply_mot_types demean deriv [not doing this bc above file already contains 24 vectors: 6 original motion parameters, 6 derivatives, 6 demeaned and 6 detrended]                               \
    	-regress_est_blur_epits                                             \
    	-regress_est_blur_errts                                             \
    	-regress_run_clustsim no					    \
	-bash -execute
done

 
