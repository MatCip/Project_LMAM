% pressure2elevation Converts pressure data to corresponding elevation
%    elevation = pressure2elevation(pressure, initialElevation, referencePressure)
%    referencePressure Reference pressure at sea level. Default 1013.25 hPa
%    initialElevation Elevation at beginning of measurements

function elevation = pressure2elevation(pressure, initialElevation, referencePressure)

if nargin<2
    initialElevation = 0; % m
end

if nargin<3
    referencePressure = 1013.25; % hPa
end
% % % % pressure(isnan(pressure))=0;
% % % % idx=groupfind(pressure==0)
% % % % pressure(idx(1,1):idx(1,2))=pressure(idx(1,2)+1);
% % % % if length(idx(:,1))>=2
% % % % pressure(idx(2,1):idx(2,2))=pressure(idx(1,2)+5);
% % % % end
% Convert into altitude (meters over sea level)
% From http://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=4510374
elevation = 44330.*(1-(pressure./referencePressure).^0.19);
%mean(elevation(1:100))
% Set to correct height
if initialElevation ~= 0
    elevation = elevation - (mean(elevation(1:100))-initialElevation);
end
