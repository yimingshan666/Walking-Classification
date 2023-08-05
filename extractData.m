% This Function extracts data from a specified folder by using the given 
% samplingRateHz and windowWidthSeconds. 
% The input 'matFileContent' will be overwritten later, so you can type anything.
% You can call function like this: [X,Y]=extractData(a,"Group1_Walk1_N.mat",60,3.4)
% Just make sure the filename exists
% If the resampling rate is higher than the original data sampling rate, it will make the model unstable.


function [X,Y]=extractData(matFileContent,filename,samplingRateHz,windowWidthSeconds)

%without addpath, Matlab sometimes report errors.
addpath("TrainingData");
addpath("TestData");

matFileContent=load(filename);

% Resample data
resampled_data = resampleData(matFileContent, samplingRateHz);

% Perform windowing
X = performWindowing(resampled_data, samplingRateHz, windowWidthSeconds);

% Construct categorical array Y of class labels from filename
if contains(filename, '_N.mat')
    Y = categorical(ones(size(X, 1), 1), 1, 'Normal walk'); %same length as X
elseif contains(filename, '_S.mat')
    Y = categorical(ones(size(X, 1), 1), 1, 'Silly walk');
else
    error('Invalid filename format'); %check filename format
end

end




