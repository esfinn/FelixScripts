#!/usr/bin/env tcsh

set path = ( $path /data1/software/afni_16.3.05/)
set top_dir = /mri2data2/mri_group/emily_data/story_task/

foreach fname (tb*tb*blur4_story_audioTRs_errts.pass1.fanaticor+tlrc.HEAD)

3dmaskave -mask $top_dir/isc_analysis/Clust_mask_0001+tlrc.HEAD ${fname} > $top_dir/isc_analysis/3dmaskave_txtfiles/3dmaskave_LSTS_seed1_${fname}.txt

end
