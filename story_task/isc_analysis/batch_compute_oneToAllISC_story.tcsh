#!/usr/bin/env tcsh

module load afni
set top_dir = /data/finnes/story_task/

set subj_list = (tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977 tb4450 tb4547 tb4572)
set i = 0

ls $top_dir/tb*/tb*pass1.results/blur4_story_audioTRs*HEAD > all_filelist

foreach i (`seq 1 1 23`)

set s1 = $subj_list[$i]
echo ${s1}

# do one subject versus average of all other subjects
grep -v "${s1}" all_filelist > tmp_filelist

3dMean -prefix tmp_mean `cat tmp_filelist`

3dTcorrelate -prefix $top_dir/isc_analysis/pairwise_iscMaps/${s1}_toAll_blur4_story_audioTRs_errts.pass1.fanaticor+tlrc $top_dir/${s1}/${s1}_pass1.results/blur4_story_audioTRs_errts.${s1}_pass1.fanaticor+tlrc.HEAD tmp_mean+tlrc.HEAD

rm tmp_filelist
rm tmp_mean*

end


