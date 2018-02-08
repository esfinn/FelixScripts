% optical_flow(movie_prefix,method,play_movie)
%   movie_prefix - name prefix of saved .mat with pre-loaded 'frames' mat
%   method - 'Horn-Schunck' (default) | 'Lucas-Kanade'
%
% Jeff Eilbott, 2014, jeilbott@surveybott.com

function out = optical_flow(movie_prefix,method,play_movie)
out = [];

opticalFlow = vision.OpticalFlow('ReferenceFrameDelay', 1);

% set of method: Horn-Schunck | Lucas-Kanade
methods = {'Horn-Schunck','Lucas-Kanade'};
if ~exist('method','var') 
    method = opticalFlow.Method;
elseif any(strcmpi(method,methods))
    opticalFlow.Method = method;
else
   warning('Invalid method ''%s'', using default (%s)',method,methods{1});
   method = methods{1};
   opticalFlow.Method = method;
end

if ~exist('play_movie','var')
   play_movie = 0; 
end

if play_movie
    shapeInserter = vision.ShapeInserter('Shape','Lines','BorderColor','Custom', 'CustomBorderColor', 255);
    videoPlayer = vision.VideoPlayer('Name','Motion Vector');
    opticalFlow.OutputValue = 'Horizontal and vertical components in complex form';
end

% get stills
path = '/Users/Jeff/temp/inscapes/video/still_mats/';
d = dir([path movie_prefix '*.mat']);

% print info
fprintf('Analyzing ''%s''\n',movie_prefix);
fprintf('\tmethod:\t\t%s\n',opticalFlow.Method);
fprintf('\tfr_skip:\t%d\n',opticalFlow.ReferenceFrameDelay);
fprintf('\toutput:\t%s\n',opticalFlow.OutputValue);
count = 1;

for i=1:length(d)
   fprintf('\nLoading ''%s''...',d(i).name);
   load([path d(i).name]);
   
   frames_n = size(frames,3);
   fprintf('done (%d frames)\n',frames_n)
   
   for j=1:frames_n
       frame = frames(:,:,j);
       of = step(opticalFlow, frame);
       if play_movie
           lines = videooptflowlines(of, 50);
           if ~isempty(lines)
               lines_out =  step(shapeInserter, frame, lines);
               step(videoPlayer, lines_out);
           end
       else
           out(count,1) = mean(mean(of,2),1);
       end
       
       if ~mod(count,10)
           fprintf('\t%d\n',count);
       end
       count = count + 1;
   end
end

%Close the video reader and player

if play_movie
    release(videoPlayer);
end

end