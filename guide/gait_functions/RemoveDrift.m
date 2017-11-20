function s = RemoveDrift(x)
%   s = RemoveDrift(x)
% Removes gyro's drift using an IIR filter
s = filtfilt([1, -1], [1, -.995], x);