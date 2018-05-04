#!/bin/bash

module load afni
data_dir=/data/CMI_preproc/release_3/Movie_Present/
top_dir=/data/finnes/CMI/preprocessed_data/Movie_Present/

for subj in 

do

for task in Movie_Present
do

3dNetCorr -prefix /data/finnes/CMI/parcellation_analysis/${subj}.${task}.errts.fanaticor.shen268 \
-inset $data_dir/${subj}.${task}.volResults/errts.${subj}.fanaticor+tlrc.HEAD \
-in_rois /data/finnes/CMI/shen_2mm_268_parcellation_HaskinsPeds+tlrc.HEAD \
-fish_z \
-ts_out

done
done
