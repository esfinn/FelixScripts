#!/bin/bash

module load afni

top_dir=/data/finnes/story_task/

for aS in tb2994  tb3240  tb3512  tb3592  tb3626  tb3744  tb3784  tb3846  tb3920  tb3964  tb4450  tb4572 tb3132  tb3279  tb3552  tb3602  tb3646  tb3757  tb3810  tb3858  tb3929  tb3977  tb4547
do

# do old way
# cd $top_dir/$aS/${aS}_pass1.results/

# EPI to anat
# @snapshot_volreg3 anat_final.${aS}_pass1+tlrc.HEAD pb03.${aS}_pass1.r04.blur+tlrc.HEAD checkEPI
# Anat to TT_N27
# @snapshot_volreg3 anat_final.${aS}_pass1+tlrc.HEAD /usr/local/apps/afni/current/linux_openmp_64/TT_N27+tlrc.HEAD checkQwarp

# do new way
cd $top_dir/$aS/${aS}.StoryAll.volResults/

# EPI to anat
@snapshot_volreg3 anat_final.${aS}+tlrc.HEAD pb03.${aS}.r01.blur+tlrc.HEAD checkEPI
# Anat to TT_N27
@snapshot_volreg3 anat_final.${aS}+tlrc.HEAD /usr/local/apps/afni/current/linux_openmp_64/TT_N27+tlrc.HEAD checkQwarp

done


