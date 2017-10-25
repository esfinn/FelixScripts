clear
clc

subj_list = {'tb2994'; 
'tb3132'; 
'tb3240';
'tb3279';
'tb3512';
% 'tb3552';
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

seed_list = {'lTmpPole'}; %'rACC';'dmPFC';'lPrecun';'rAngGyr';'lLOC'};

data = struct;

for ss = 1:length(subj_list)
    for seed = 1:length(seed_list)
        tmp = importdata([seed_list{seed},'_p01_',subj_list{ss},'.StoryAll.volResults.txt']);
        data.(seed_list{seed})(:,ss) = tmp;
    end
end

save('ISClTmpPole_p01_indiv_subj_ts.mat','data')




    
    
    
    
