#!/usr/bin/env tcsh

set top_dir '/data/finnes/story_task'

foreach subj (tb2994 tb3132 tb3240 tb3279 tb3512 tb3552 tb3592 tb3602 tb3626 tb3646 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3920 tb3929 tb3964 tb3977)

echo $subj | 3dinfo $top_dir/$subj/${subj}_pass1.results/story_audioTRs_errts.${subj}_pass1.fanaticor+tlrc.HEAD | grep -o "HEAD.*"

end