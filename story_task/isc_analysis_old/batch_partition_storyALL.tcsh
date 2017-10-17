#!/usr/bin/env tcsh

module load afni 
set top_dir = /data/finnes/story_task/

# template 1 (story runs are functional runs 4, 5, 6, following 1=rest_pre(360), 2=movie(440), 3=volcheck(40))
foreach subj (tb2994 tb3132 tb3592 tb3602 tb3626 tb3744 tb3757 tb3784 tb3810 tb3846 tb3858 tb3929 tb3964 tb3977)
cd $top_dir/$subj/${subj}_pass1_GSR.results
3dTcat -prefix story_audioTRs_errts.${subj}_pass1_GSR.tproject+tlrc 'errts.tb*_pass1_GSR.tproject+tlrc.HEAD[843-1366,1393-1841,1873-2201]'
end

# template 2
foreach subj (tb3240)
cd $top_dir/$subj/${subj}_pass1_GSR.results
3dTcat -prefix story_audioTRs_errts.${subj}_pass1_GSR.tproject+tlrc 'errts.tb*_pass1_GSR.tproject+tlrc.HEAD[860-1383,1410-1858,1890-2218]'
end

# template 3
foreach subj (tb3279 tb3512)
cd $top_dir/$subj/${subj}_pass1_GSR.results
3dTcat -prefix story_audioTRs_errts.${subj}_pass1_GSR.tproject+tlrc 'errts.tb*_pass1_GSR.tproject+tlrc.HEAD[883-1406,1433-1881,1913-2241]'
end

# template 4 
foreach subj (tb3552)
cd $top_dir/$subj/${subj}_pass1_GSR.results
3dTcat -prefix story_audioTRs_errts.${subj}_pass1_GSR.tproject+tlrc 'errts.tb*_pass1_GSR.tproject+tlrc.HEAD[989-1512,1539-1987,2019-2347]'
end

# template 5 
foreach subj (tb3646)
cd $top_dir/$subj/${subj}_pass1_GSR.results
3dTcat -prefix story_audioTRs_errts.${subj}_pass1_GSR.tproject+tlrc 'errts.tb*_pass1_GSR.tproject+tlrc.HEAD[878-1401,1428-1876,1908-2236]'
end

# template 6
foreach subj (tb3920)
cd $top_dir/$subj/${subj}_pass1_GSR.results
3dTcat -prefix story_audioTRs_errts.${subj}_pass1_GSR.tproject+tlrc 'errts.tb*_pass1_GSR.tproject+tlrc.HEAD[803-1326,1353-1801,1833-2161]'
end

exit
