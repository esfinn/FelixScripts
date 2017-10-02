clear
clc

no_node = 268;
subj_list = {'tb2994'; 'tb3132'};

rest_mats = zeros(no_node,no_node,length(subj_list));
story_mats = zeros(no_node, no_node, length(subj_list));

for i = 1:length(subj_list)
    rest_mats(:,:,i) = import_3dNetCorr_fishz([subj_list{i},'_rest_pre_errts.pass1.fanaticor_000.netcc']);
    story_mats(:,:,i) = import_3dNetCorr_fishz([subj_list{i},'_story_audioTRs_errts.pass1.fanaticor_000.netcc']);
end