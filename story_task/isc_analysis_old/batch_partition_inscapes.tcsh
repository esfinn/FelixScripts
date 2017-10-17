#!/usr/bin/env tcsh

set path = ( $path /data1/software/afni_16.3.05/)
set top_dir = /data/finnes/story_task/

# template 1
foreach subj (tb4450 tb4547 tb4572)
cd $top_dir/$subj/${subj}_pass1.results
3dTcat -prefix inscapes_errts.${subj}_pass1.fanaticor+tlrc 'errts.tb*_pass1.fanaticor+tlrc.HEAD[3-422]'
end


exit
