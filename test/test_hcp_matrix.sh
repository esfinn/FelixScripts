module load afni
3dNetCorr -prefix /data/finnes/test/100307_afni_shen268_test_matrix 
-fish_z -in_rois shen_1mm_268_parcellation.nii.gz+tlrc -inset 
/data/HCP/HCP_900/s3/hcp/100307/MNINonLinear/Results/rfMRI_REST1_LR/rfMRI_REST1_LR_hp2000_clean.nii.gz 
