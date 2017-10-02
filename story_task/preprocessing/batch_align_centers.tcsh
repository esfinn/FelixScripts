#!/usr/bin/env tcsh

set path = ( $path /data1/software/afni_16.3.05/)
set here = $PWD

# set data directory and ref base

set top_dir   = /mri2data2/mri_group/emily_data/story_task/
set ref_base = "/data1/software/afni_16.3.05/TT_N27+tlrc."

# set subj list
foreach subj (tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3761 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977)

cd $top_dir/$subj/

# Do anatomicals
@Align_Centers -base $ref_base -dset tb*_s003*stack3d_orig.nii

# Do functionals
@Align_Centers -base $ref_base -dset tb*_s004_*stack4d_orig.nii -child "tb*_s0[0-1][0-9]_*_stack4d_orig.nii"

cd ..
end
