% Emilie Sinkler
% January 2016
% Converts all the csv files into mat files and saves them in the 
% directory ../WAIS_Divide_Data/MatFileOutput

clc
clear all
close all

%Set path to which files will be saved (CHANGE FOR DIFFERENT COMPUTER)
desiredFolder = fullfile(['/Users/emiliesinkler/Documents/UAF/RESEARCH/'...
    'WAIS_Divide_Data/NEW0816/ProgramOutput'],'OriginalMatFiles_0816');

% If the folder doesn't exist, create it.
if ~exist(desiredFolder, 'dir')
    mkdir(desiredFolder); 
end


%Find all CSV files in this directory
filenames = dir('*.csv');

% Exception for reading in because TEXT FILE
% NOTE: If you have a .csv for WAISUp2, get rid of lines 25, 42-44, 46
% a = strcat('''', 'WAISUp2.csv', '''');

%Go through all files and write to MAT FILE
for ii = 37 %1:length(filenames)
    disp 'Processing:';
    file = mat2str(filenames(ii).name); %Makes name piece of structure into string
    disp(file);

    % Remove 'WAIS' and '.csv' to name mat file more simply (examples: D1.mat, U1.mat)
    % NOTE: If the files are not named WAISD1, WAISU1, etc. this will cause
    % problems
    Name = regexp(file, '[DUBu]\w*', 'match'); 
    
    % read in file, ignoring first 2 lines (header and units)
    % NOTE: If you try to load more than one at a time, it will overwrite
    % since they are all called 'M'
    %if file == 'WAISUp2.csv', read in as txt file
%     if isequal(file, a)
%         M = dlmread(filenames(ii).name, '', 2, 0);
%     else
        M = csvread(filenames(ii).name, 2, 0);
%     end
    
%     %Save the header values! DOES NOT WORK
%     fileID = fopen(filenames(ii).name);
%     linenum = 1; 
%     Heading = textscan(fileID, '%s', 'delimiter', '/n', 'headerlines', linenum-1);
%     fclose(all);

    savename = fullfile(desiredFolder, Name{1});
    
    save(savename, 'M');
%     eval(sprintf('%s = M;',a));
%     eval(sprintf('save %s;',a));
    clear M 
end
disp 'Done';


