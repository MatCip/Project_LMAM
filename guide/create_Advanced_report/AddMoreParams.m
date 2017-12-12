function res = AddMoreParams(res, s)
if nargin == 1
    s = [];
end

if isfield(res, 'Cycle')
    for i=1:length(res)
        res(i).Cycle = CalculateParameters(res(i).Cycle, s);
    end
else
    res = CalculateParameters(res, s);
end

%-----------------------------
function res = CalculateParameters(res, s)
k = length(res);
for j=1:k
    res(j).Cadence =2*( 60 / res(j).Gct);
    res(j).Swing = (res(j).SwingR + res(j).SwingL) / 2;
    res(j).Stance = (res(j).StanceR + res(j).StanceL) / 2;
    res(j).Shank = (res(j).ShankR + res(j).ShankL) / 2;
    res(j).Knee = (res(j).KneeR + res(j).KneeL) / 2;
    res(j).Thigh = (res(j).ThighR + res(j).ThighL) / 2;
    res(j).Stride = (res(j).StrideR + res(j).StrideL) / 2;
    res(j).Speed = (res(j).SpeedR + res(j).SpeedL) / 2;
    res(j).PeakSwingSpeed = (res(j).PeakSwingSpeedR + res(j).PeakSwingSpeedL) / 2;
end

if nargin == 2 && ~isempty(s)
    for j=1:k
        res(j).ArmSwingYawR = armswing(s(:,6), res(j).HsR, res(j).end);
        res(j).ArmSwingPitchR = armswing(s(:,7), res(j).HsR, res(j).end);
        res(j).ArmSwingYawL = armswing(s(:,8), res(j).HsR, res(j).end);
        res(j).ArmSwingPitchL = armswing(s(:,9), res(j).HsR, res(j).end);
        res(j).PeakArmSpeedR = armamp(s(:,6:7), res(j).HsR, res(j).end);
        res(j).PeakArmSpeedL = armamp(s(:,8:9), res(j).HsR, res(j).end);
        res(j).ArmSwingYaw = (res(j).ArmSwingYawR + res(j).ArmSwingYawL) / 2;
        res(j).ArmSwingPitch = (res(j).ArmSwingPitchR + res(j).ArmSwingPitchL) / 2;
        res(j).PeakArmSpeed = (res(j).PeakArmSpeedR + res(j).PeakArmSpeedL) / 2;
        mi = min([res(j).PeakArmSpeedL res(j).PeakArmSpeedR]);
        ma = max([res(j).PeakArmSpeedL res(j).PeakArmSpeedR]);
        res(j).ArmSpeedAsym = 100*(ma - mi) / ma;
    end 
end

%-----------------------------
function r = armswing(s, a, b)
if isnan(a) || isnan(b)
    r = NaN;
else
    r = range(cumtrapz(s(a:b))/200);
end

%-----------------------------
function r = armamp(s, a, b)
if isnan(a) || isnan(b)
    r = NaN;
else
    r = max(amp(s(a:b,:)));
end