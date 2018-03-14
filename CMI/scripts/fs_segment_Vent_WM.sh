#!/bin/bash

module load afni

current=`pwd`

for aS in $@
do

echo $aS
cd /data/finnes/CMI/scripts/freesurfer/${aS}/SUMA/

# Select the ventricle maps from the FS output.
3dcalc -a aparc+aseg.nii -datum byte -prefix FSmask_vent.nii -expr 'amongst(a,4,43)'

# Select the WM maps from the FS output.
3dcalc -a aparc+aseg.nii -datum byte -prefix FSmask_WM.nii -expr 'amongst(a,2,7,41,46,251,252,253,254,255)'

cd $current

done
