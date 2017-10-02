#!/usr/bin/env tcsh

module load afni
set top_dir = /data/finnes/story_task/

# template 1
foreach subj (tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977)
cd $top_dir/$subj/${subj}_pass1_GSR.results
3dTcat -prefix rest_pre_errts.${subj}_pass1_GSR.tproject+tlrc 'errts.tb*_pass1_GSR.tproject+tlrc.HEAD[0-359]'
end



exit
