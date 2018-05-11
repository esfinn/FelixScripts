#!/bin/bash

module load afni

task=Movie_DespMe
data_dir=/data/CMI_preproc/$task/

# get all subjects that have preprocessed data for this task available
subjects=$(ls /data/CMI_preproc/$task/*volResults/errts*fanaticor+tlrc.HEAD | cut -f 5 -d "/" | cut -c -12)


# make timeseries and matrices
for subj in ${subjects[@]}

do

for task in ${task[@]}
do

3dNetCorr -prefix /data/finnes/CMI/parcellation_analysis/${subj}.${task}.errts.fanaticor.shen268 \
-inset $data_dir/${subj}.${task}.volResults/errts.${subj}.fanaticor+tlrc.HEAD \
-in_rois /data/finnes/CMI/shen_2mm_268_parcellation_HaskinsPeds+tlrc.HEAD \
-fish_z \
-ts_out

done
done
