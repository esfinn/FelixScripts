
top_dir = '/data/HCP/HCP_900/s3/hcp/';

subj_list = load([top_dir,'U120.txt']);

subjLR_dir = '/MNINonLinear/Results/tfMRI_SOCIAL_LR/';
subjRL_dir = '/MNINonLinear/Results/tfMRI_SOCIAL_RL/';

fLR_name = 'SOCIAL_run*_TAB.txt';
fRL_name = 'SOCIAL_run*_TAB.txt';

% intialize table to save results
var_names = {'subj_id','movie_name','onset_time','duration','offset_time'};

allSubj_info_LR = struct;
allSubj_info_RL = struct;

% CountDownSlide.OnsetTime - onset time of countdown slides before task;
% the first row in the SyncSlide.OnsetTime column reflects the onset of the
% first TR in E-Prime clock; to ensure correct EV timing, that value should
% be subtracted from clock time for other trials

for i = 1:length(subj_list)
    
    sprintf('\nDoing subject %d',i)
    
    % Do LR first
    tmp_LR_fname = dir([top_dir,num2str(subj_list(i)),subjLR_dir,fLR_name]);
    tmp_LR = import_SOCIALrunTAB([top_dir,num2str(subj_list(i)),subjLR_dir,tmp_LR_fname.name]);
   
    % replace ? with [], get relevant rows
    tmp_movie_names = tmp_LR.Movie;
    tmp_movie_names = regexprep(tmp_movie_names,'?','');
    tmp_rows = find(~cellfun(@isempty,cellstr(tmp_movie_names)));
    
    % account for E-Prime <-> scanner offset
    tmp_delay = tmp_LR.CountDownSlideOnsetTime(1);
    
    % extract info
    tmp_tt = table;
    tmp_tt.movie_name = tmp_LR.Movie(tmp_rows);
    tmp_tt.onset_time = tmp_LR.MovieSlideOnsetTime(tmp_rows)-tmp_delay;
    tmp_tt.duration = tmp_LR.MovieSlideOnsetToOnsetTime(tmp_rows);
    tmp_tt.respslide_onset = tmp_LR.ResponseSlideOnsetTime(tmp_rows)-tmp_delay;
    
    % save info to mega-struct
    allSubj_info_LR.(['s',num2str(subj_list(i))]) = tmp_tt;
    clear tmp*
    
    % Now do RL
    tmp_RL_fname = dir([top_dir,num2str(subj_list(i)),subjRL_dir,fRL_name]);
    tmp_RL = import_SOCIALrunTAB([top_dir,num2str(subj_list(i)),subjRL_dir,tmp_RL_fname.name]);
    
    tmp_movie_names = tmp_RL.Movie;
    tmp_movie_names = regexprep(tmp_movie_names,'?','');
    tmp_rows = find(~cellfun(@isempty,cellstr(tmp_movie_names)));
    
    tmp_delay = tmp_RL.CountDownSlideOnsetTime(1);
    
    tmp_tt = table;
    tmp_tt.movie_name = tmp_RL.Movie(tmp_rows);
    tmp_tt.onset_time = tmp_RL.MovieSlideOnsetTime(tmp_rows)-tmp_delay;
    tmp_tt.duration = tmp_RL.MovieSlideOnsetToOnsetTime(tmp_rows);
    tmp_tt.respslide_onset = tmp_RL.ResponseSlideOnsetTime(tmp_rows)-tmp_delay;
    
    allSubj_info_RL.(['s',num2str(subj_list(i))]) = tmp_tt;
    
    clear tmp*
end