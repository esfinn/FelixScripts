#!/bin/bash

top_dir=/data/finnes/story_task/

for subj in tb2994 tb3132 tb3240 tb3279 tb3512 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977 tb4450 tb4547 tb4572
do

for task in Inscapes RestPre StoryAll
do

3dNetCorr -prefix $top_dir/fc_analysis/${subj}_${task}_errts.fanaticor \
-inset $top_dir/$subj/${subj}.${task}.volResults/errts.${subj}.fanaticor+tlrc.HEAD \
-in_rois /data/NIMH_SFIM/CommonParcellations/ShenAtlas/shen_2mm_268_parcellation_adwarpTTN27+tlrc.HEAD \
-fish_z \
-ts_out

done
done
