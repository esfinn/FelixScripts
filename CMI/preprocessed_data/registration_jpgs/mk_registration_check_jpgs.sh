#!/bin/bash

module load afni

top_dir=/data/finnes/CMI/preprocessed_data/Movie_Present/

for aS in $@
do

# EPI to anat
@snapshot_volreg3 $top_dir/${aS}.Movie_Present.volResults/anat_final.${aS}+tlrc.HEAD $top_dir/${aS}.Movie_Present.volResults/pb03.${aS}.r01.blur+tlrc.HEAD /data/finnes/CMI/preprocessed_data/registration_jpgs/${aS}_MoviePresent_checkEPI
# Anat to Haskins Peds atlas
@snapshot_volreg3 $top_dir/${aS}.Movie_Present.volResults/anat_final.${aS}+tlrc.HEAD /data/finnes/CMI/HaskinsPeds_NL_template1.0+tlrc.HEAD /data/finnes/CMI/preprocessed_data/registration_jpgs/${aS}_MoviePresent_checkQwarp

done


