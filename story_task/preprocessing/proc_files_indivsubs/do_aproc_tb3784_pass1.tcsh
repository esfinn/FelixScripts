#!/usr/bin/env tcsh

# created by uber_subject.py: version 0.39 (March 21, 2016)
# creation date: Tue Oct 18 15:21:40 2016

set path = ( $path /data1/software/afni_16.3.05/)
set here = $PWD

# set data directories
set top_dir   = /mri2data2/mri_group/emily_data/story_task/tb3784/

# set subject and group identifiers
set subj      = tb3784_pass1
set group_id  = hc

set ref_base = /data1/software/afni_16.3.05/TT_N27+tlrc

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                                 \
        -script proc.$subj -scr_overwrite                                   \
	-out_dir $top_dir/$subj.results                                    \
        -blocks despike align tlrc volreg blur mask regress                 \
        -copy_anat $top_dir/tb3784_s003_constable_????????_stack3d_orig_shft.nii \
        -tcat_remove_first_trs 0                                            \
        -dsets                                                              \
            $top_dir/tb3784_s???_constable_????????_stack4d_orig_shft.nii        \
        -tlrc_base $ref_base                                    \
        -volreg_align_to MIN_OUTLIER                               \
        -volreg_align_e2a                                          \
        -volreg_warp_dxyz 2.5									   \
        -volreg_tlrc_warp                                          \
        -tlrc_NL_warp                                              \
        -mask_segment_anat yes                                     \
        -mask_import Tvent /mri2data2/mri_group/emily_data/story_task/template_ventricle_2.5mm+tlrc           \
        -mask_intersect Svent CSFe Tvent                           \
        -regress_ROI_PC Svent 3                                    \
        -regress_make_corr_vols WMe Svent                          \
        -regress_anaticor_fast                                     \
        -regress_censor_motion 0.3                                 \
        -regress_censor_outliers 0.1                               \
        -regress_apply_mot_types demean deriv                      \
        -regress_est_blur_epits                                    \
        -regress_est_blur_errts                                    \
        -regress_run_clustsim no

exit

 
