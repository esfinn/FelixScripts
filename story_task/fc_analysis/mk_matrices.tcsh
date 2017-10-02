#!/usr/bin/env tcsh

set top_dir = '/data/finnes/story_task'

# foreach subj (tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977)

foreach subj (tb4450 tb4547 tb4572)

cd $top_dir/$subj/${subj}_pass1.results

3dNetCorr -prefix $top_dir/fc_analysis/${subj}_story_audioTRs_errts.pass1.fanaticor \
-inset story_audioTRs_errts.${subj}_pass1.fanaticor+tlrc.HEAD \
-in_rois /data/NIMH_SFIM/CommonParcellations/ShenAtlas/shen_2.5mm_268_parcellation_adwarpTTN27+tlrc.HEAD \
-fish_z \
-ts_out

3dNetCorr -prefix $top_dir/fc_analysis/${subj}_rest_pre_errts.pass1.fanaticor \
-inset rest_pre_errts.${subj}_pass1.fanaticor+tlrc.HEAD  \
-in_rois /data/NIMH_SFIM/CommonParcellations/ShenAtlas/shen_2.5mm_268_parcellation_adwarpTTN27+tlrc.HEAD \
-fish_z \
-ts_out

end
