#!/bin/bash

module load afni

topdir=/data/finnes/story_task/

# tb3552 excluded
subjlist=(tb2994 tb3132 tb3240 tb3279 tb3512 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977 tb4450 tb4547 tb4572)

subjlist_length=${#subjlist[@]}

for i in `seq 1 $subjlist_length`
do

s1=${subjlist[$i-1]}

for j in `seq 1 $subjlist_length`
do

s2=${subjlist[$j-1]}

if (($i<$j))
then

echo Doing ${s1} and ${s2}

filename=$topdir/isc_analysis/pairwise_iscMaps/${s1}_${s2}_StoryAll.volResults_errts.fanaticor_TTN27mask+tlrc.HEAD

# for making 
# echo ${s1} ${s2} $filename >> data_n22.txt

if [ -e $filename ]
then

echo ${s1} and ${s2} already exists

else
echo 3dTcorrelate -prefix $filename -polort -1 $topdir/$s1/${s1}.StoryAll.volResults/errts.${s1}.fanaticor+tlrc.HEAD $topdir/$s2/${s2}.StoryAll.volResults/errts.${s2}.fanaticor+tlrc.HEAD >> Tcorrelate_pairs_noAutomask.txt

fi
fi

done
done
