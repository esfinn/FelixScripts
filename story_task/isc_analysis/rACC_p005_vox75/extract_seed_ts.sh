#!/bin/bash

module load afni

for i in tb2994 tb3240 tb3512 tb3592 tb3626 tb3744 tb3784 tb3846 tb3920 tb3964 tb4450 tb4572 tb3132 tb3279 tb3552 tb3602 tb3646 tb3757 tb3810 tb3858 tb3929 tb3977 tb4547

do

3dmaskave -quiet -mask rACC_p005_vox75_mask_0003+tlrc.HEAD /data/finnes/story_task/${i}/${i}.StoryAll.volResults/errts.${i}.fanaticor+tlrc.HEAD > ${i}.StoryAll.volResults.txt

done
exit 0
