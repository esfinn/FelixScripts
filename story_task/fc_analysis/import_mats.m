clear
clc

no_node = 268;

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

rest_mats = zeros(no_node,no_node,length(subj_list));
story_mats = zeros(no_node, no_node, length(subj_list));

for i = 1:length(subj_list)
    rest_mats(:,:,i) = import_3dNetCorr_fishz([subj_list{i},'_rest_pre_errts.pass1.fanaticor_000.netcc']);
    story_mats(:,:,i) = import_3dNetCorr_fishz([subj_list{i},'_story_audioTRs_errts.pass1.fanaticor_000.netcc']);
end