function MidSwing = DetectMS(s, thd)
%%%%% detect MidSwings %%%%%%%%%%%%
if nargin == 1
    thd = 100;
end

load IIR-LP4;

sf = filtfilt(Num, Den, s);
[dummy, MidSwing] = FindMinMax(sf, 40);

dynamic_thd = max([20, 0.50 * mean(sf(MidSwing))]);
[dummy, MidSwing] = FindMinMax(sf, dynamic_thd);

d = diff(MidSwing);
ff = find(d < thd);
MidSwing(ff) = [];