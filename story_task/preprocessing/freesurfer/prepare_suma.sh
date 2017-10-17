#!/bin/bash

module load afni
module load freesurfer/6.0.0

source $FREESURFER_HOME/SetUpFreeSurfer.sh
export SUBJECTS_DIR=/data/finnes/story_task/preprocessing/freesurfer/

for aS in $@
do
cd $aS
@SUMA_Make_Spec_FS -sid $aS -NIFTI 
cd ..

done
