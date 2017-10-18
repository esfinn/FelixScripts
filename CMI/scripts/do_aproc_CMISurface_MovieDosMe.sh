#!/bin/bash

# created by uber_subject.py: version 0.39 (March 21, 2016)
# creation date: Tue Oct 18 15:21:40 2016

module load afni

task=Movie_DosMe

for subj in $@
do

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                                 \
        -script /data/finnes/CMI/scripts/proc.$subj -scr_overwrite      		 \
	-out_dir /data/finnes/CMI/preprocessed_data/Movie_DosMe/$subj.$task.surfResults  \
        -blocks despike align volreg surf blur scale regress                 		 \
        -copy_anat /data/CMI/MRI/RU/$subj/anat/${subj}_T1w_MEMPRAGE_SAG_RMS.nii.gz       \
        -dsets /data/CMI/MRI/RU/$subj/func/${subj}_Movie_DosMe.nii.gz        \
        -tcat_remove_first_trs 0                                             \
	-align_opts_aea -giant_move \
        -volreg_align_to MIN_OUTLIER                               \
        -volreg_align_e2a                                          \
        -blur_size 5 \
        -surf_anat /data/finnes/CMI/scripts/freesurfer/$subj/SUMA/${subj}_SurfVol.nii \
        -surf_spec /data/finnes/CMI/scripts/freesurfer/$subj/SUMA/${subj}_?h.spec \
        -regress_motion_per_run                                    \
	-regress_censor_motion 0.3                                 \
        -regress_censor_outliers 0.1                               \
        -regress_apply_mot_types demean deriv                      \
        -regress_run_clustsim no \
	-bash -execute
done

 
