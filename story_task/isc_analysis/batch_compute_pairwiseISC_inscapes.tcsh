#!/usr/bin/env tcsh

set path = ( $path /data1/software/afni_16.3.05/)
set top_dir = /data/finnes/story_task/

set subj_list = (tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977 tb4450 tb4547 tb4572)
set i = 0

foreach i (`seq 1 1 23`)

foreach j (`seq 1 1 23`)

set s1 = $subj_list[$i]
set s2 = $subj_list[$j]

if ($i < $j) then

if (-e $top_dir/isc_analysis/pairwise_iscMaps/${s1}_${s2}_blur4_inscapes_errts.pass1.fanaticor+tlrc.HEAD) then
echo "File already exists for $s1 and $s2"
else

echo "Corrating $s1 and $s2"

3dTcorrelate -prefix ./pairwise_iscMaps/${s1}_${s2}_blur4_inscapes_errts.pass1.fanaticor+tlrc -automask $top_dir/${s1}/${s1}_pass1.results/blur4_inscapes_errts.${s1}_pass1.fanaticor+tlrc.HEAD $top_dir/${s2}/${s2}_pass1.results/blur4_inscapes_errts.${s2}_pass1.fanaticor+tlrc.HEAD
endif
endif

end
end

# 3dMean -prefix iscMean_n190_blur4_inscapes_errts.pass1 ./pairwise_iscMaps/tb*tb*blur4_inscapes_errts.pass1.fanaticor+tlrc

exit
