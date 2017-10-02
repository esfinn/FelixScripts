#!/usr/bin/env tcsh

foreach i (tb2994	tb3240	tb3512	tb3592	tb3626	tb3744	tb3784	tb3846	tb3920	tb3964	tb4450	tb4572 tb3132	tb3279	tb3552	tb3602	tb3646	tb3757	tb3810	tb3858	tb3929	tb3977	tb4547)

@snapshot_volreg3 /data/finnes/story_task/TT_N27+tlrc.HEAD \
    /data/finnes/story_task/${i}/${i}_pass1.results/anat_final.${i}_pass1+tlrc.HEAD \
    /data/finnes/story_task/preprocessing/TT_N27.anat_final.${i}_pass1.jpg

end
