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

for i = 1:length(subj_list)
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

% look at two groups: nodes where one group is more correlated than the
% other
g1 = [1 3 5 6 12 13 16 18 19 21 23]; % high tone
g2 = [2 4 7 8 9 10 11 14 15 17 22]; % low tone

for n = 1:no_node;
    [h_tmp, p_tmp, ci_tmp, stats_tmp] = ttest2(nonzeros(triu(all_node_corr(g1,g1,n),1)),nonzeros(triu(all_node_corr(g2,g2,n),1)));
    h(n) = h_tmp;
    p(n) = p_tmp;
    ci(n,:) = ci_tmp;
    stats(n) = stats_tmp;
end

% permutation test
all_subs = [g1 g2];
no_iter = 1000;

h_rand = zeros(no_iter,no_node);
p_rand = zeros(no_iter,no_node);

for i = 1:no_iter
    rr = all_subs(randperm(length(all_subs)));
    g1_rr = rr(1:11);
    g2_rr = rr(12:end);
    
    for n = 1:no_node
        [h_tmp, p_tmp] = ttest2(nonzeros(triu(all_node_corr(g1_rr,g1_rr,n),1)),nonzeros(triu(all_node_corr(g2_rr,g2_rr,n),1)));
        h_rand(i,n) = h_tmp;
        p_rand(i,n) = p_tmp;
    end
end

sig_nodes = find(p<prctile(p_rand,5))

figure; plot(smoothdata(nanmean(squeeze(all_subj_ts(:,31,g1))'))); hold on; plot(smoothdata(nanmean(squeeze(all_subj_ts(:,31,g2))')));
legend('G1','G2');

% look at two groups: nodes where within-group correlation is higher than
% between-group correlation

for n = 1:no_node
    [h_tmp, p_tmp, ci_tmp, stats_tmp] = ttest2([nonzeros(triu(all_node_corr(g1,g1,n),1));nonzeros(triu(all_node_corr(g2,g2,n),1))],...
        nonzeros(triu(all_node_corr(g1,g2,n),1)));
    h_wi(n) = h_tmp;
    p_wi(n) = p_tmp;
    ci_wi(n,:) = ci_tmp;
    stats_wi(n) = stats_tmp;
end

% permutation test
all_subs = [g1 g2];
no_iter = 1000;

h_wi_rand = zeros(no_iter,no_node);
p_wi_rand = zeros(no_iter,no_node);

for i = 1:no_iter
    rr = all_subs(randperm(length(all_subs)));
    g1_rr = rr(1:11);
    g2_rr = rr(12:end);
    
    for n = 1:no_node
        [h_tmp, p_tmp] = ttest2([nonzeros(triu(all_node_corr(g1_rr,g1_rr,n),1));nonzeros(triu(all_node_corr(g2_rr,g2_rr,n),1))],...
            nonzeros(triu(all_node_corr(g1_rr,g2_rr,n),1)));
        h_wi_rand(i,n) = h_tmp;
        p_wi_rand(i,n) = p_tmp;
    end
end

sig_wi_nodes = find(p_wi<prctile(p_wi_rand,5))

figure; plot(smoothdata(nanmean(squeeze(all_subj_ts(:,176,g1))'))); hold on; plot(smoothdata(nanmean(squeeze(all_subj_ts(:,176,g2))')));
legend('G1','G2');
