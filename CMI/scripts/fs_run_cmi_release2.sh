#!/bin/bash

module load freesurfer/6.0.0
source $FREESURFER_HOME/SetUpFreeSurfer.sh
export SUBJECTS_DIR=/data/finnes/CMI/scripts/freesurfer/


for aS in $@
do
        echo "recon-all -all -s ${aS} -i /data/CMI/release_2/MRI/sub-${aS}/anat/sub-${aS}_T1w.nii.gz -3T -openmp 4"
        recon-all -all -s ${aS} -i /data/CMI/release_2/MRI/sub-${aS}/anat/sub-${aS}_T1w.nii.gz -3T -openmp 4
done
