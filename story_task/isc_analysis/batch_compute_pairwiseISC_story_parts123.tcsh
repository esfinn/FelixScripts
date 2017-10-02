#!/usr/bin/env tcsh

set path = ( $path /data1/software/afni_16.3.05/)
set top_dir = /mri2data2/mri_group/emily_data/story_task/

set subj_list = (tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977)
set i = 0

foreach i (`seq 1 1 20`)
echo $i

foreach j (`seq 1 1 20`)
echo $j

if ($i < $j) then

set s1 = $subj_list[$i]
set s2 = $subj_list[$j]

echo $s1
echo $s2

3dTcorrelate -prefix ${s1}_{$s2}_story_audioTRs_part1_errts.pass1.fanaticor+tlrc -automask $top_dir/${s1}/${s1}_pass1.results/story_audioTRs_part1_errts.${s1}_pass1.fanaticor+tlrc.HEAD $top_dir/${s2}/${s2}_pass1.results/story_audioTRs_part1_errts.${s2}_pass1.fanaticor+tlrc.HEAD

3dTcorrelate -prefix ${s1}_{$s2}_story_audioTRs_part2_errts.pass1.fanaticor+tlrc -automask $top_dir/${s1}/${s1}_pass1.results/story_audioTRs_part2_errts.${s1}_pass1.fanaticor+tlrc.HEAD $top_dir/${s2}/${s2}_pass1.results/story_audioTRs_part2_errts.${s2}_pass1.fanaticor+tlrc.HEAD

3dTcorrelate -prefix ${s1}_{$s2}_story_audioTRs_part3_errts.pass1.fanaticor+tlrc -automask $top_dir/${s1}/${s1}_pass1.results/story_audioTRs_part3_errts.${s1}_pass1.fanaticor+tlrc.HEAD $top_dir/${s2}/${s2}_pass1.results/story_audioTRs_part3_errts.${s2}_pass1.fanaticor+tlrc.HEAD
endif

end
end
