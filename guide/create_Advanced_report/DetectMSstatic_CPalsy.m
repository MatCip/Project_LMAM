function MidSwing = DetectMSstatic_CPalsy(s, thd)
%%%%% detect MidSwings %%%%%%%%%%%%
if nargin == 1
    thd = 200; %
end

load IIR-LP4;

sf = filtfilt(Num, Den, s);
[dummy, MidSwing] = FindMinMax(sf, 40);

d = diff(MidSwing);
ff = find(d < thd);
MidSwing(ff) = [];