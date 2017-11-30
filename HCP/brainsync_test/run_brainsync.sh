#!/bin/bash

module load afni

subj=100307
run1=rfMRI_REST1_LR_hp2000_clean #.nii.gz
run2=rfMRI_REST2_LR_hp2000_clean #.nii.gz

cd $subj

# first, voxelwise demean each run separately
3dTstat -prefix ${run1}_voxelmean ${run1}.nii.gz
3dcalc -a ${run1}.nii.gz -b ${run1}_voxelmean+tlrc. -expr 'a-b' -prefix ${run1}_demeaned

3dTstat -prefix ${run2}_voxelmean ${run2}.nii.gz
3dcalc -a ${run2}.nii.gz -b ${run2}_voxelmean+tlrc. -expr 'a-b' -prefix ${run2}_demeaned

# then run BrainSync to align run2 to run1 using the Q algorithm
3dBrainSync -inset1 ${run1}_demeaned+tlrc. -inset2 ${run2}_demeaned+tlrc. -Qprefix 3dBrainSyncQ_${run2}to${run1}

# then run 3dTcorrelate on the sync'd data
3dTcorrelate -polort -1 -prefix 3dTcorr_postSyncQ_${run1}_${run2} ${run1}_demeaned+tlrc. 3dBrainSyncQ_${run2}to${run1}+tlrc.
