#!/usr/bin/env tcsh

set path = ( $path /data1/software/afni_16.3.05/)
set top_dir   = /mri2data2/mri_group/emily_data/story_task/

foreach subj (tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977)

cd $top_dir/$subj/${subj}_pass1.results/

3dmerge -1blur_fwhm 4.0 -doall -prefix blur4_story_audioTRs_errts.${subj}_pass1.fanaticor story_audioTRs_errts.${subj}_pass1.fanaticor+tlrc.HEAD
3dmerge -1blur_fwhm 4.0 -doall -prefix blur4_inscapes_errts.${subj}_pass1.fanaticor inscapes_errts.${subj}_pass1.fanaticor+tlrc.HEAD
3dmerge -1blur_fwhm 4.0 -doall -prefix blur4_rest_pre_errts.${subj}_pass1.fanaticor rest_pre_errts.${subj}_pass1.fanaticor+tlrc.HEAD

end
