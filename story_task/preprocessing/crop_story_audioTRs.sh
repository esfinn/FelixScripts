#!/bin/bash

### this script not necessary bc you can specify sub-briks directly in afni_proc

module load afni

data_dir=/data/finnes/story_task/

cd $data_dir

for aSub in tb*
do

cd $data_dir/$aSub

3dTcat -prefix ${aSub}_func_Story1_crop.nii.gz ${aSub}_func_Story1.nii.gz[0-526]
3dTcat -prefix ${aSub}_func_Story2_crop.nii.gz ${aSub}_func_Story2.nii.gz[0-451]
3dTcat -prefix ${aSub}_func_Story3_crop.nii.gz ${aSub}_func_Story3.nii.gz[0-331]

done



