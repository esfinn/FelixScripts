#!/bin/bash

module load afni

task=Movie_Present
topdir=/data/CMI_preproc/$task
speechdir=/data/finnes/CMI/renamed_raw_transcripts
outdir=/data/CMI_preproc/pairwise_iscMaps/$task
subj_fname=subjlist_fmri_speech.txt
job_fname=Tcorrelate_pairs_05142018.txt

rm $job_fname
rm $subj_fname

# get list of subjects that have complete preprocessed data ("errts" file)
subjlist_fmri=($(ls $topdir/*/errts*fanaticor*HEAD | cut -f 6 -d "/" | cut -f 2 -d "."))

# get list of subjects that have speech data
subjlist_speech=($(ls $speechdir/*txt | cut -f 6 -d "/" | cut -f 1 -d "."))

subjlist=()
for item1 in "${subjlist_fmri[@]}"; do
    for item2 in "${subjlist_speech[@]}"; do
        if [[ $item1 = $item2 ]]; then
            subjlist+=("$item1")
        fi
    done
done

# save subjlist
# echo "${subjlist[@]}" >> $subj_fname
printf '%s\n' "${subjlist[@]}" >> $subj_fname

# for making input file to 3dLME
# echo -e "Subj\tSubj2\tInputFile" >> data_SRSn68.txt

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

filename=$outdir/${s1}_${s2}_${task}.volResults_errts.fanaticor+tlrc.HEAD

# for making input file to 3dLME
# echo -e "${s1}\t${s2}\t$filename" >> data_SRSn68.txt

if [[ -e $filename ]]
then

echo ${s1} and ${s2} already exists

else
# 3dTcorrelate -prefix $filename -polort -1 $topdir/${s1}.${task}.volResults/errts.${s1}.fanaticor+tlrc.HEAD $topdir/${s2}.${task}.volResults/errts.${s2}.fanaticor+tlrc.HEAD

# for making text file of swarm jobs
echo 3dTcorrelate -prefix $filename -polort -1 $topdir/${s1}.${task}.volResults/errts.${s1}.fanaticor+tlrc.HEAD $topdir/${s2}.${task}.volResults/errts.${s2}.fanaticor+tlrc.HEAD >> $job_fname

fi
fi

done
done
