#!/usr/bin/env tcsh

module load afni
set here = $PWD

# set data directory and ref base

set top_dir   = /data/finnes/story_task/
set ref_base = /usr/local/apps/afni/current/linux_openmp_64/TT_N27+tlrc 

# set subj list
foreach subj (tb4450 tb4547 tb4572)

cd $top_dir/$subj/

# Do anatomicals
# @Align_Centers -base $ref_base -dset timtriob*MPR*.nii

# Do functionals
@Align_Centers -base $ref_base -dset "timtriob*bold_story1*.nii" -child "timtriob*bold*.nii"

cd ..
end
