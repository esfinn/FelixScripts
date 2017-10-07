#!/bin/bash

module load freesurfer/6.0.0
source $FREESURFER_HOME/SetUpFreeSurfer.sh
export SUBJECTS_DIR=/data/finnes/story_task/preprocessing/freesurfer/


for aS in $@
do
        echo "recon-all -s ${aS} -i /data/finnes/story_task/${aS}/${aS}_T1.nii -3T -all -openmp 4"
        recon-all -s ${aS} -i /data/finnes/story_task/${aS}/${aS}_T1.nii -3T -all -openmp 4
done
