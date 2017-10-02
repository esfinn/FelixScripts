#!/usr/bin/env tcsh

set path = ( $path /data1/software/afni_16.3.05/)
set top_dir = /mri2data2/mri_group/emily_data/story_task/

# template 1
foreach subj (tb2994 tb3132 tb3279 tb3512 tb3592 tb3602 tb3626 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977)
cd $top_dir/$subj/${subj}_pass1.results
3dTcat -prefix inscapes_errts.${subj}_pass1.fanaticor+tlrc 'errts.tb*_pass1.fanaticor+tlrc.HEAD[363-782]'
end

# tb3240
cd $top_dir/tb3240/tb3240_pass1.results
3dTcat -prefix inscapes_errts.tb3240_pass1.fanaticor+tlrc 'errts.tb*_pass1.fanaticor+tlrc.HEAD[380-799]'

# tb3552
cd $top_dir/tb3552/tb3552_pass1.results
3dTcat -prefix inscapes_errts.tb3552_pass1.fanaticor+tlrc 'errts.tb*_pass1.fanaticor+tlrc.HEAD[443-862]'

# tb3646
cd $top_dir/tb3646/tb3646_pass1.results
3dTcat -prefix inscapes_errts.tb3646_pass1.fanaticor+tlrc 'errts.tb*_pass1.fanaticor+tlrc.HEAD[398-817]'


exit
