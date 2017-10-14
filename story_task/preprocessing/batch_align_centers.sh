#!/bin/bash

module load afni

# for subj in tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977 tb4450 tb4547 tb4572

for subj in tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977

do

cd /data/finnes/story_task/${subj}/

@Align_Centers -base /usr/local/apps/afni/current/linux_openmp_64/TT_N27+tlrc -dset ${subj}_T1.nii.gz
# @Align_Centers -base /usr/local/apps/afni/current/linux_openmp_64/TT_N27+tlrc -dset tb*_s004_*stack4d_orig.nii -child tb*_s0[0-1][0-9]_*stack4d_orig.nii


done
