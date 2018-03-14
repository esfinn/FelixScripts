#!/bin/bash

module load freesurfer/6.0.0
source $FREESURFER_HOME/SetUpFreeSurfer.sh
export SUBJECTS_DIR=/data/finnes/CMI/scripts/freesurfer/


for aS in $@
do
        echo "recon-all -all -s ${aS} -i /data/CMI/MRI/RU/$aS/anat/${aS}_T1w_MEMPRAGE_SAG_RMS.nii.gz -3T -openmp 4"
        recon-all -all -s ${aS} -i /data/CMI/MRI/RU/$aS/anat/${aS}_T1w_MEMPRAGE_SAG_RMS.nii.gz -3T -openmp 4
done
