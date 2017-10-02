
no_node = 268;
no_ts = 1302;

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

all_subj_ts = zeros(no_ts, no_node, length(subj_list));

for i = 1:length(subj_list);
    filename = [subj_list{i}, '_story_audioTRs_errts.pass1.fanaticor_000.netts'];
    tmp = importdata(filename);
    all_subj_ts(:,:,i) = tmp';
end

% take into account zero'd time points??
all_subj_ts(logical(all_subj_ts==0)) = NaN;
all_node_corr = zeros(length(subj_list),length(subj_list),no_node);

for n = 1:no_node;
    tmp  = corr(squeeze(all_subj_ts(:,n,:)),'rows','complete');
    mean_node_corr(n,1) = mean(nonzeros(triu(tmp,1)));
    median_node_corr(n,1) = median(nonzeros(triu(tmp,1)));
    std_node_corr(n,1) = std(nonzeros(triu(tmp,1)));
    all_node_corr(:,:,n) = tmp;
end

coefvar_node_corr = std_node_corr./mean_node_corr;

nn = 259;
mean_ts = mean(squeeze(all_subj_ts(:,nn,:)),2);
figure(1); h = plot(squeeze(all_subj_ts(:,nn,:)));
hold on; plot(mean_ts,'k-','linewidth',3); hold off;

% load LIWC results
liwc = table2array(liwc_data);
liwc_cc = corr(zscore(liwc(1:20,9:end))');

for n = 1:no_node;
    [node_liwc_cc(n), node_liwc_p(n)] = corr(nonzeros(triu(all_node_corr(:,:,n),1)),nonzeros(triu(liwc_cc,1)));
end

[node_liwc_cc_sort, node_liwc_cc_ind] = sort(node_liwc_cc,'descend');
