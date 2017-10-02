#!/usr/bin/env tcsh

module load afni
set top_dir = /data/CMI/MRI/RU/

# ls /data/CMI/MRI/RU/*/func/*Movie_Present.nii.gz > all_Movie_Present_runs.txt
# above line only needs to be run once, unless more data is acquired


set file_list = `cat all_Movie_Present_runs.txt`
set no_files = $#file_list

set i = 0
-------------------------------------where i stopped
foreach i (`seq 1 1 23`)

set s1 = $subj_list[$i]

# do one subject versus average of all other subjects
# grep -v "${s1}" all_filelist > tmp_filelist
# 3dMean -prefix tmp_mean `cat tmp_filelist`
# 3dTcorrelate -prefix ${s1}_toAll_blur4_story_audioTRs_errts.pass1.fanaticor+tlrc $top_dir/${s1}/${s1}_pass1.results/blur4_story_audioTRs_errts.${s1}_pass1.fanaticor+tlrc.HEAD tmp_mean

# do each possible pair of subjects
foreach j (`seq 1 1 23`)

if ($i < $j) then

echo $i
echo $j

set s2 = $subj_list[$j]

echo $s1
echo $s2

set file = "$top_dir/isc_analysis/pairwise_iscMaps/${s1}_{$s2}_blur4_story_audioTRs_noDetrend_errts.pass1.fanaticor+tlrc.HEAD"

if ( -f $file ) then
    echo Exists
else

3dTcorrelate \
-prefix $top_dir/isc_analysis/pairwise_iscMaps/${s1}_{$s2}_blur4_story_audioTRs_noDetrend_errts.pass1.fanaticor+tlrc \
-automask \
-polort -1 \
$top_dir/${s1}/${s1}_pass1.results/blur4_story_audioTRs_errts.${s1}_pass1.fanaticor+tlrc.HEAD $top_dir/${s2}/${s2}_pass1.results/blur4_story_audioTRs_errts.${s2}_pass1.fanaticor+tlrc.HEAD
# "$top_dir/${s1}/${s1}_pass1.results/blur4_story_audioTRs_errts.${s1}_pass1.fanaticor+tlrc[15-523,539-972,988-1301]" "$top_dir/${s2}/${s2}_pass1.results/blur4_story_audioTRs_errts.${s2}_pass1.fanaticor+tlrc[15-523,539-972,988-1301]"
#first run 0-523, second run 524-972, third run 973-1302
endif
endif

end
end

# 3dMean -prefix iscMean_n253_blur4_story_audioTRs_errts.pass1 tb*_tb*_spearman_blur4_story_audioTRs_errts.pass1.fanaticor+tlrc
