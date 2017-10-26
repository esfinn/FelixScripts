#!/bin/bash

module load afni

top_dir=/data/finnes/CMI/

for aS in 
do

cd $top_dir/$aS/${aS}.StoryAll.volResults/

# EPI to anat
@snapshot_volreg3 anat_final.${aS}+tlrc.HEAD pb03.${aS}.r01.blur+tlrc.HEAD checkEPI
# Anat to TT_N27
@snapshot_volreg3 anat_final.${aS}+tlrc.HEAD /usr/local/apps/afni/current/linux_openmp_64/TT_N27+tlrc.HEAD checkQwarp

done


