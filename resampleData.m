% This function resamples data according to samplingRateHz
function resampled_data = resampleData(matFileContent, samplingRateHz)

%calculate resampled time
timeInterval = 1 / samplingRateHz;
resampled_time = matFileContent.time(1):timeInterval:matFileContent.time(end);

%use interpolation to get continuous data and resample for each axis
resampled_X = interp1(matFileContent.time, matFileContent.data(1, :), resampled_time);
resampled_Y = interp1(matFileContent.time, matFileContent.data(2, :), resampled_time);
resampled_Z = interp1(matFileContent.time, matFileContent.data(3, :), resampled_time);
resampled_data = [resampled_X; resampled_Y; resampled_Z];

end