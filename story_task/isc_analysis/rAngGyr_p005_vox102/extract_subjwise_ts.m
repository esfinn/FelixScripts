

subj_list = {'tb2994'; 
'tb3132'; 
'tb3240';
'tb3279';
'tb3512';
'tb3552';
'tb3592';
'tb3602';
'tb3626';
'tb3646';
'tb3744';
'tb3757';
'tb3784';
'tb3810';
'tb3846';
'tb3858';
'tb3920';
'tb3929';
'tb3964';
'tb3977';
'tb4450';
'tb4547';
'tb4572';
};

for ss = 1:length(subj_list)
    tmp = importdata([subj_list{ss},'.StoryAll.volResults.txt']);
    all_subj_ts(:,ss) = tmp;
end

save('rAngGyr_p005_vox102_all_subj_ts.mat','all_subj_ts')




    
    
    
    
