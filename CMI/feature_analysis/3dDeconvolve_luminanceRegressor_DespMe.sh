#!/bin/bash

topdir=/data/finnes/CMI/

for subj in $@ 
do

cd $topdir/preprocessed_data/Movie_DespMe/${subj}.Movie_DespMe.volResults/

3dDeconvolve -input pb03.$subj.r*.blur+tlrc.HEAD                           \
    -censor censor_${subj}_combined_2.1D                                   \
    -ortvec ROIPC.FSvent.1D ROIPC.FSvent                                     \
    -polort 5 -float                                                       \
    -num_stimts 13                                                         \
    -stim_file 1 motion_demean.1D'[0]' -stim_base 1 -stim_label 1 roll_01  \
    -stim_file 2 motion_demean.1D'[1]' -stim_base 2 -stim_label 2 pitch_01 \
    -stim_file 3 motion_demean.1D'[2]' -stim_base 3 -stim_label 3 yaw_01   \
    -stim_file 4 motion_demean.1D'[3]' -stim_base 4 -stim_label 4 dS_01    \
    -stim_file 5 motion_demean.1D'[4]' -stim_base 5 -stim_label 5 dL_01    \
    -stim_file 6 motion_demean.1D'[5]' -stim_base 6 -stim_label 6 dP_01    \
    -stim_file 7 motion_deriv.1D'[0]' -stim_base 7 -stim_label 7 roll_02   \
    -stim_file 8 motion_deriv.1D'[1]' -stim_base 8 -stim_label 8 pitch_02  \
    -stim_file 9 motion_deriv.1D'[2]' -stim_base 9 -stim_label 9 yaw_02    \
    -stim_file 10 motion_deriv.1D'[3]' -stim_base 10 -stim_label 10 dS_02  \
    -stim_file 11 motion_deriv.1D'[4]' -stim_base 11 -stim_label 11 dL_02  \
    -stim_file 12 motion_deriv.1D'[5]' -stim_base 12 -stim_label 12 dP_02  \
    -stim_file 13 $topdir/feature_analysis/meanGrayLevels_DespMe_750x1.txt -stim_label 13 meanGrayLevels \
    -fout -tout -x1D XplusMeanGrayLevels.xmat.1D -xjpeg XplusMeanGrayLevels.jpg                                \
    -x1D_uncensored XplusMeanGrayLevels.nocensor.xmat.1D                                     \
    -fitts fitts.MeanGrayLevels.${subj}                                                     \
    -errts errts.MeanGrayLevels.${subj}                                                   \
    -bucket stats.MeanGrayLevels.${subj} \
    -jobs 12 
done
