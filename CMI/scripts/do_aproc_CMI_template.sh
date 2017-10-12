#!/bin/bash

# created by uber_subject.py: version 0.39 (March 21, 2016)
# creation date: Tue Oct 18 15:21:40 2016

for subj in $@
do

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                                 \
        -script /data/finnes/CMI/scripts/proc.$subj -scr_overwrite                                   \
	-out_dir /data/finnes/CMI/preprocessed_data/$subj.results                                    \
        -blocks despike align volreg surf blur scale regress                 \
        -copy_anat /data/CMI/MRI/RU/$subj/anat/${subj}_T1w_MEMPRAGE_SAG_RMS.nii.gz \
        -anat_follower_ROI aaseg anat aparc.a2009s+aseg.nii        \
                  -anat_follower_ROI aeseg epi /data/finnes/CMI/scripts/singlesub_preprocessing/freesurfer/$subj/SUMA/aparc.a2009s+aseg.nii        \
                  -anat_follower_ROI FSvent epi /data/finnes/CMI/scripts/singlesub_preprocessing/freesurfer/$subj/SUMA/FT_vent.nii                  \
                  -anat_follower_ROI FSWe epi /data/finnes/CMI/scripts/singlesub_preprocessing/freesurfer/$subj/SUMA/FT_white.nii                   \
                  -anat_follower_erode FSvent FSWe                           \
        -dsets /data/CMI/MRI/RU/$subj/func/${subj}_Movie_Present.nii.gz        \
        -tcat_remove_first_trs 0                                            \
	-align_opts_aea -giant_move \
        -volreg_align_to MIN_OUTLIER                               \
        -volreg_align_e2a                                          \
        -blur_size 5 \
        -surf_anat /data/finnes/CMI/scripts/singlesub_preprocessing/freesurfer/$subj/SUMA/${subj}_SurfVol.nii \
        -surf_spec /data/finnes/CMI/scripts/singlesub_preprocessing/freesurfer/$subj/SUMA/${subj}_?h.spec \
        -regress_motion_per_run                                    \
	-regress_ROI_PC FSvent 3                                   \
        -regress_make_corr_vols aeseg FSvent                       \
        -regress_anaticor_fast                                     \
        -regress_anaticor_label FSWe                               \
	-regress_censor_motion 0.3                                 \
        -regress_censor_outliers 0.1                               \
        -regress_apply_mot_types demean deriv                      \
        -regress_run_clustsim no

done

 
