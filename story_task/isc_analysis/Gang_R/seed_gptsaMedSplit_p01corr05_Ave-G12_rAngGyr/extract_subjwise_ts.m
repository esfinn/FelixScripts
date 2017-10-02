

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
    tmp = importdata(['seed_gptsaMedSplit_p01corr05_G2-G1_lTmpPole_',subj_list{ss},'_story_audioTRs.txt']);
    all_subj_ts(:,ss) = tmp;
end

save('seed_gptsaMedSplit_p01corr05_G2minusG1_lTmpPole_all_subj_ts.mat','all_subj_ts')

window = 20; % in TRs (but TR = 1sec)

% do non-overlapping windows

no_windows = floor(1302/window);
extra = rem(1302,window); % account for remaining TRs (tack them onto the last window)
window_sizes = repmat(window,no_windows,1);
window_sizes(end) = window_sizes(end)+extra;

clear median_corr mean_corr mad_corr std_corr

for w = 1:no_windows
    
    w_length = window_sizes(w);
    
    t_start = 1+w*window-window;
    t_end = w*window;
    
    if w==no_windows
        t_end = 1302;
    end
    
    cc = corr(all_subj_ts(t_start:t_end,:));
    median_corr(w,:) = median(nonzeros(triu(cc,1)));
    mad_corr(w,:) = mad(nonzeros(triu(cc,1)));
    
    mean_corr(w,:) = mean(nonzeros(triu(cc,1)));
    std_corr(w,:) = std(nonzeros(triu(cc,1)));
end

figure(1); errorbar(median_corr,mad_corr); xlabel(sprintf('Time window (window length %d s), nonoverlapping',window)); ylabel('Median ISC (Bars: MAD ISC)');
figure(2); errorbar(mean_corr,std_corr)


no_clust = 2;
metric = 'correlation';

all_subj_ts_z = zscore(all_subj_ts);

[cidx,cmeans] = kmeans(all_subj_ts_z',no_clust,'distance',metric);
figure(3); silhouette(all_subj_ts_z',cidx,metric);

for cc = 1:no_clust;
    ts_cc_mean(:,cc) = mean(all_subj_ts_z(:,logical(cidx==cc)),2);
    ts_cc_std(:,cc) = std(all_subj_ts_z(:,logical(cidx==cc))')';
    
    figure(4); errorbar(ts_cc_mean(:,cc),ts_cc_std(:,cc)); hold on;
end

    
    
    
    