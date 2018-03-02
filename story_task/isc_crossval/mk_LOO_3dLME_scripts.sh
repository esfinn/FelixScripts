#!/bin/bash

module load afni
module load R

subjlist=(tb2994 tb3132 tb3240 tb3279 tb3512 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977 tb4450 tb4547 tb4572)

gptsalist=(22 16 18 20 18 18 19 38 17 23 24 40 17 20 17 21 16 19 18 16 19 18)

subjlist_length=${#subjlist[@]}

for subj in `seq 1 $subjlist_length`
do

ss=${subjlist[$subj-1]}