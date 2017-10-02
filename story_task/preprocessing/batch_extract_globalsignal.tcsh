#!/usr/bin/env tcsh

module load afni
set here = $PWD

# set data directory and ref base

set top_dir   = /data/finnes/story_task/

# set subj list
foreach subj (tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977 tb4450 tb4547 tb4572)

cd $top_dir/$subj/{$subj}_pass1.results/

# get global signal
3dmaskave -quiet -mask full_mask.${subj}_pass1+tlrc.HEAD story_audioTRs_errts.${subj}_pass1.fanaticor+tlrc.HEAD > globsig_story_audioTRs_errts.${subj}_pass1.txt

end
