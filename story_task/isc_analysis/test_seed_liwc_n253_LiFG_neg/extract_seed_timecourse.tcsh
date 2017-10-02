module load afni

set top_dir = /data/finnes/story_task/

foreach i (tb2994 tb3240 tb3512 tb3592 tb3626 tb3744 tb3784 tb3846 tb3920 tb3964 tb4450 tb4572 tb3132 tb3279 tb3552 tb3602 tb3646 tb3757 tb3810 tb3858 tb3929 tb3977 tb4547)

3dmaskave -mask liwc_n253_LiFG_neg+tlrc.HEAD -quiet $top_dir/${i}/${i}_pass1.results/blur4_story_audioTRs_errts.${i}_pass1.fanaticor+tlrc.HEAD > ${i}_story_audioTRs_liwc_n253_LiFG_neg.txt

end