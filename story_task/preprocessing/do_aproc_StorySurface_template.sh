#!/bin/bash

# created by uber_subject.py: version 0.39 (March 21, 2016)
# creation date: Tue Oct 18 15:21:40 2016

for subj in $@
do

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                                 \
        -script /data/finnes/story_task/preprocessing/proc.$subj -scr_overwrite                                   \
	-out_dir /data/finnes/story_task/$subj/$subj.surfResults                                    \
        -blocks despike align volreg surf blur scale regress                 \
        -copy_anat /data/finnes/story_task/$subj/${subj}_T1_shft.nii      \
        -dsets ###### /data/CMI/MRI/RU/$subj/func/${subj}_Movie_Present.nii.gz        \
        -tcat_remove_first_trs 0                                            \
	-align_opts_aea -giant_move \
        -volreg_align_to MIN_OUTLIER                               \
        -volreg_align_e2a                                          \
        -blur_size 5 \
        -surf_anat /data/finnes/story_task/preprocessing/freesurfer/$subj/SUMA/${subj}_SurfVol.nii \
        -surf_spec /data/finnes/story_task/preprocessing/freesurfer/$subj/SUMA/${subj}_?h.spec \
        -regress_motion_per_run                                    \
	-regress_censor_motion 0.3                                 \
        -regress_censor_outliers 0.1                               \
        -regress_apply_mot_types demean deriv                      \
        -regress_run_clustsim no \
	-bash -execute
done

 
