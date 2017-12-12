function [Hs,To]=DetectHsTo(s)
% 	[Hs, To]=DetectHsTo(s)
% Detects the Hs and To peaks in the shank's signal s

[min_peak, max_peak] = FindMinMax(s);
%%%%% detect MidSwings %%%%%%%%%%%%
MidSwing = DetectMS(s);

%%%%% detect Heel-strike %%%%%%%%%%%
n = length(MidSwing);
nmp = length(min_peak);
Hs = zeros(length(MidSwing),1);
for i=1:n
    [peak, idx] = FindFirstAfter(MidSwing(i), min_peak);
    Hs(i) = NaN;
    if idx == 0
        continue;
    end
    while(idx <= nmp)
        dist = min_peak(idx) - MidSwing(i);
        if dist >= 300
            break;
        elseif s(min_peak(idx)) < 0 
            Hs(i) = min_peak(idx);
            break;
        end
        idx = idx + 1;
    end
end

%%%%% detect Toe-Off %%%%%%%%%%%
load lowpass30
sf = filtfilt(Num, 1, s);
[min_peak, max_peak] = FindMinMax(sf);

n = length(MidSwing);
To = zeros(n,1);
for i=1:n
    [peak, idx] = FindFirstBefore(MidSwing(i), min_peak);
    To(i) = NaN;
    while(idx > 1)
        dist = MidSwing(i) - min_peak(idx);
        if dist >= 300
            break;
        elseif s(min_peak(idx)) < -20 
            To(i) = min_peak(idx);
            break;
        end
        idx = idx - 1;
    end
end