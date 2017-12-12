function MidSwing = DetectMSstatic(s, thd)
%%%%% detect MidSwings %%%%%%%%%%%%
if nargin == 1
    thd = 100;
end

load IIR-LP4;

sf = filtfilt(Num, Den, s);
[dummy, MidSwing] = FindMinMax(sf, 40);

d = diff(MidSwing);
ff = find(d < thd);
MidSwing(ff) = [];