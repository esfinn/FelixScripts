#!/usr/bin/env tcsh

set path = ( $path /data1/software/afni_16.3.05/)
set top_dir = /mri2data2/mri_group/emily_data/story_task/

# template 1 
foreach subj (tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977)
cd $top_dir/$subj/${subj}_pass1.results
3dTcat -prefix story_audioTRs_part1_errts.${subj}_pass1.fanaticor+tlrc 'story_audioTRs_errts.tb*_pass1.fanaticor+tlrc.HEAD[0-523]'
3dTcat -prefix story_audioTRs_part2_errts.${subj}_pass1.fanaticor+tlrc 'story_audioTRs_errts.tb*_pass1.fanaticor+tlrc.HEAD[524-972]'
3dTcat -prefix story_audioTRs_part3_errts.${subj}_pass1.fanaticor+tlrc 'story_audioTRs_errts.tb*_pass1.fanaticor+tlrc.HEAD[972-1301]'
end

exit
