%This function converts the data into window forms according to samplingRateHz and windowWidthSeconds
function X = performWindowing(data, samplingRateHz, windowWidthSeconds)
 
% Calculate the number of windows
windowWidth = windowWidthSeconds * samplingRateHz;
windowWidth = floor(windowWidth / 2) * 2;
windowAmount = floor((size(data, 2) - windowWidth) / (windowWidth / 2)) + 1;

X = cell(windowAmount, 1);%N×1 cell

% assign class labels
for i = 1:windowAmount
    startIdx = (i - 1) * (windowWidth / 2) + 1;
    endIdx = (i + 1) * (windowWidth / 2);
    X{i} = data(:, startIdx:endIdx);
end

end