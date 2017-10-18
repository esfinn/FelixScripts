#!/bin/bash

module load afni

top_dir=/data/finnes/story_task/

subjlist=(tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977 tb4450 tb4547 tb4572)
subjlist_length=${#subjlist[@]}

i=0
j=0

for i in `seq $subjlist_length`
do

s1=${subjlist[$i-1]}

# do each possible pair of subjects

for j in `seq $subjlist_length`
do

if (($i<$j))
then

s2=${subjlist[$j-1]}

echo $s1
echo $s2

# check to see if LH file already exists

file_name_l=$top_dir/isc_analysis/pairwise_iscMaps/${s1}_${s2}_StoryAll_surfResults_errts.lh.niml.dset

if [ -e $file_name_l ]
then
    echo Exists
else

# if not, create it
3dTcorrelate \
-prefix $file_name_l \
-polort -1 \
$top_dir/${s1}/${s1}.StoryAll.surfResults/errts.${s1}.lh.niml.dset.tproject.niml.dset $top_dir/${s2}/${s2}.StoryAll.surfResults/errts.${s2}.lh.niml.dset.tproject.niml.dset 

fi

# check to see if RH file already exists

file_name_r=$top_dir/isc_analysis/pairwise_iscMaps/${s1}_${s2}_StoryAll_surfResults_errts.rh.niml.dset

if [ -e $file_name_r ]
then
    echo Exists
else

# if not, create it
3dTcorrelate \
-prefix $file_name_r \
-polort -1 \
$top_dir/${s1}/${s1}.StoryAll.surfResults/errts.${s1}.rh.niml.dset.tproject.niml.dset $top_dir/${s2}/${s2}.StoryAll.surfResults/errts.${s2}.rh.niml.dset.tproject.niml.dset 

fi
fi

done
done
