#!/bin/bash

module load afni

current=`pwd`

for aS in tb2994 tb3240 tb3512 tb3592 tb3626 tb3744 tb3784 tb3846 tb3920 tb3964 tb4450 tb4572 tb3132 tb3279 tb3552 tb3602 tb3646 tb3757 tb3810 tb3858 tb3929 tb3977 tb4547
do

echo $aS
cd /data/finnes/story_task/preprocessing/freesurfer/${aS}/SUMA/

# Select the ventricle maps from the FS output.
3dcalc -a aparc+aseg.nii -datum byte -prefix FSmask_vent.nii -expr 'amongst(a,4,43)'

# Select the WM maps from the FS output.
3dcalc -a aparc+aseg.nii -datum byte -prefix FSmask_WM.nii -expr 'amongst(a,2,7,41,46,251,252,253,254,255)'

cd $current

done
