function [posture,wk] = classifyPA_2ShanksThighTrunk(av_trunk,af_thigh,gp_Rshank,gp_Lshank,fs)

%input signals: 200Hz
%posture vector: 40Hz (symbolic sequence: 1=lying, 2=sitting, 3=standing; 4=walking)
%'wk' is a stucture containg the start, end and number of steps of each
%detected walking episode

%initialisations, resampling
load tf1-40;
af_thigh40 = resample(af_thigh, 40, fs);
av_trunk40 = resample(av_trunk, 40, fs);
gp_Rshank40 = resample(gp_Rshank, 40, fs);
gp_Lshank40 = resample(gp_Lshank, 40, fs);
len = length(af_thigh40);
posture = zeros(1,len); 
af_thigh_recf=zeros(1,len);
%%%%%
%LP filtering av_trunk
Wp = 4/160; Ws = 8/160;
[n,Wn] = buttord(Wp,Ws,3,60);
[bc,ac] = butter(n,Wn);
av_trunk40_lpf = filter(bc,ac,av_trunk40);
av_trunk40_lpf = sgolayfilt(av_trunk40_lpf,1,1001);

%%%%%%%%%%%%%%%% detect Sit & Stand periods %%%%%%%%%%%%%%%%%%%%%%%%%
%filter thigh frontal acceleration signal
af_thigh40_sg = sgolayfilt(af_thigh40,1,141);
af_thigh40_filt=af_thigh40_sg;
il=groupfind(af_thigh40_filt<=0.5);
for j=1:length(il(:,1))
    if il(j,2)-il(j,1)>=30*fs
        af_thigh40_filt(il(j,1):il(j,2))= avgfilter(af_thigh40_sg(il(j,1):il(j,2)),30*fs);
    end
end

il=groupfind(af_thigh40_filt<=0.5);
for j=1:length(il(:,1))
    if il(j,2)-il(j,1)>=10*fs
        af_thigh40_filt(il(j,1):il(j,2))= avgfilter(af_thigh40_sg(il(j,1):il(j,2)),10*fs);
    end
end

ih=groupfind(af_thigh40_filt>=0.5);
for j=1:length(ih(:,1))
    if ih(j,2)-ih(j,1)>=10*fs
        af_thigh40_filt(ih(j,1):ih(j,2))= avgfilter(af_thigh40_sg(ih(j,1):ih(j,2)),5*fs);
    end
end

ih=groupfind(af_thigh40_filt>=0.5);
for j=1:length(ih(:,1))
    if ih(j,2)-ih(j,1)>=10*fs
        af_thigh40_filt(ih(j,1):ih(j,2))= avgfilter(af_thigh40_sg(ih(j,1):ih(j,2)),5*fs);
    end
end

ih=groupfind(af_thigh40_filt>=0.75);
il=groupfind(af_thigh40_filt<=0.4);

for j=1:length(ih(:,1))
    af_thigh_recf((ih(j,1):ih(j,2)))=1;
end

for j=1:length(il(:,1))
    af_thigh_recf((il(j,1):il(j,2)))=-1;
end


if find(af_thigh_recf==0)
    iz=groupfind(af_thigh_recf==0);
    for j=1:length(iz(:,1))
        if mean(af_thigh40_filt((iz(j,1):iz(j,2)))) <0.5;
            af_thigh_recf((iz(j,1):iz(j,2)))=-1;
        else
            af_thigh_recf((iz(j,1):iz(j,2)))=1;
        end
    end
end

idx_HighLev=groupfind(af_thigh_recf==1);
idx_lowLev=groupfind(af_thigh_recf==-1);

for i=1:length(idx_HighLev(:,1))
    posture(idx_HighLev(i,1):idx_HighLev(i,2))=2;
end

for i=1:length(idx_lowLev(:,1))
    posture(idx_lowLev(i,1):idx_lowLev(i,2))=3;
end

%%%%%%%%%%%%% Detect walking periods %%%%%%%%%%%%%%%%%%%%%%%%%%%%
gp_shanks(:,1)=gp_Rshank; gp_shanks(:,2)=gp_Lshank;
gp_shanks = RemoveDrift200Hz(gp_shanks);
    
    R = DetectMS(gp_shanks(:,1));
    L = DetectMS(gp_shanks(:,2));
    
    wk = DetectWalking(R, L);
    
    %remove the extra fields
    wk = rmfield(wk, {'sSide', 'eSide', 'type', 'thr'});
    MidSwing = sort([R ; L]);
    wk = MatchWakingsWithSteps(wk, MidSwing);

    steps = [wk.steps];
    wk(steps <4) = [];

    n = size(gp_shanks, 1);
    if ~isempty(wk)
        for i=1:length(wk)
            wk(i).start = fix(wk(i).start/5);
            if wk(i).start == 0
                wk(i).start = 1;
            end
            wk(i).end = min(fix(wk(i).end/5), n);
            wk(i).MidSwing = wk(i).MidSwing / 5;
        end
    end
 
[~,m2]=size(wk);
start_wk=[];end_wk=[];
for i=1:m2
    start_wk(i)=wk(i).start;
    end_wk(i)=wk(i).end;
    steps(i)=wk(i).steps;
end

for j=1:length(start_wk)
    %if posture(start_wk(j):end_wk(j))~=2;    %this is to avoid confusion, e.g., leg swing during sitting  
        posture(start_wk(j):end_wk(j))=4;
    %end
end 
    
%%%%%%%%%%%% Detect lying periods %%%%%%%%%%%%%%%%%%%%%%%
%%%%%Detect lying periods new
th_av=0.1; th_ly=40*60*60;
if find(av_trunk40_lpf<=th_av)
    LyPeriods=groupfind(av_trunk40_lpf<=th_av);
    for j=1:length(LyPeriods(:,1))
        if LyPeriods(j,2)-LyPeriods(j,1)>=th_ly
            posture((LyPeriods(j,1):LyPeriods(j,2)))=1;
        end
    end
end
%%%%%%%%%%%

%plot filtered signals and classified postures
t=(1:length(av_trunk40))/(40*60);
figure
ax1=subplot(411);plot(t,av_trunk40);
title('av Trunk')
ax2=subplot(412);plot(t,af_thigh40_filt);
title('af Thigh')
ax3=subplot(413);plot(t,gp_Rshank40);
title('gp Shank')
ax4=subplot(414);plot(t,posture,'r','LineWidth',1);ylim([0.9 4.2])
title('posture classification')
linkaxes([ax4,ax3,ax2,ax1],'x');

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
function a = stdw(s, w)
n = fix(length(s)/w);
a = std(reshape(s(1:w*n), w, n));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function w = MatchWakingsWithSteps(w, MidSwing)
for i=1:length(w)
    steps = MidSwing(MidSwing >= w(i).start & MidSwing < w(i).end);
    w(i).steps = length(steps);
    w(i).MidSwing = steps;
end
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function s = RemoveDrift40Hz(x)
%   s = RemoveDrift40Hz(x)
% Removes gyro's drift using an IIR filter
s = filtfilt([1, -1], [1, -.9748], x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function s = RemoveDrift200Hz(x)
%   s = RemoveDrift(x)
% Removes gyro's drift using an IIR filter
s = filtfilt([1, -1], [1, -.995], x);
   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% detect MidSwings using shank sensors
function MidSwing = DetectMS(s, thd)
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [w, R, L] = DetectWalking(shanks, msLeft)
% [w, R, L] = DetectWalking(shanks, msLeft)
% find walking sequences based on MidSwings

if nargin == 1 
    R = DetectMSstatic(shanks(:,1));
    L = DetectMSstatic(shanks(:,2));
else
    R = shanks;
    L = msLeft;
end

nR = length(R);
nL = length(L);
nSeq = 1;
iR = 1;
iL = 1;
walking = 0;
thr = 700;

if isempty(R) || isempty(L)
    return;
end

if(R(1) < L(1))
    side = 1;
else
    side = 0;
end

w = struct('start', 0, 'end', 0, 'steps', 0, 'sSide', 0, 'eSide', 0, ...
    'type', 0, 'thr', 0);

while iR <= nR && iL <= nL
    if side == 1;
        if iR < nR
            if R(iR+1) < L(iL)
                if walking == 1 && (R(iR+1) - R(iR)) >= 300
                    walking = 0;
                    w(nSeq).steps = w(nSeq).steps+1;
                    w(nSeq).end = R(iR);
                    w(nSeq).eSide = side;
                    nSeq = nSeq + 1;
                end
                iR = iR + 1;
                continue;
            end
        end
        
        if L(iL)-R(iR) < thr
            if walking == 0
                walking = 1;
                w(nSeq).start = R(iR);
                w(nSeq).steps = 1;                
                w(nSeq).sSide = side;
                w(nSeq).type = 2;
            else
                w(nSeq).steps = w(nSeq).steps+1;
                thr = 300 + (L(iL)-w(nSeq).start)/w(nSeq).steps;
                w(nSeq).thr = thr;
            end
        else
            if walking == 1
                walking = 0;
                w(nSeq).steps = w(nSeq).steps+1;
                w(nSeq).end = R(iR);
                w(nSeq).eSide = side;
                nSeq = nSeq + 1;
            end
        end    
        iR = iR + 1;
        side = 0;
    else
        if iL < nL
            if L(iL+1) < R(iR)
                if walking == 1 && (L(iL+1) - L(iL)) >= 300
                    walking = 0;
                    w(nSeq).steps = w(nSeq).steps+1;
                    w(nSeq).end = L(iL);
                    w(nSeq).eSide = side;
                    nSeq = nSeq + 1;
                end
                iL = iL + 1;
                continue;
            end
        end
        
        if R(iR)-L(iL) < thr 
            if walking == 0
                walking = 1;
                w(nSeq).start = L(iL);
                w(nSeq).steps = 1;
                w(nSeq).sSide = side;
                w(nSeq).type = 2;
            else
                w(nSeq).steps = w(nSeq).steps+1;
                thr = 300 + (R(iR)-w(nSeq).start)/w(nSeq).steps;
                w(nSeq).thr = thr;
            end
        else
            if walking == 1
                walking = 0;
                w(nSeq).steps = w(nSeq).steps+1;
                w(nSeq).end = L(iL);
                w(nSeq).eSide = side;
                nSeq = nSeq + 1;
            end
        end    
        iL = iL + 1;
        side = 1;
    end 
end

if walking == 0 && nSeq == 1
    w = [];
end

if walking == 1 
    w(nSeq).steps = w(nSeq).steps+1;
    w(nSeq).eSide = side;
    
    if side == 1
        w(nSeq).end = R(iR);
    else
        w(nSeq).end = L(iL);
    end
end

for i=1:length(w)
    avg = (w(i).end-w(i).start) / w(i).steps;
    w(i).start = fix(max(1, w(i).start - avg));
    w(i).end = fix(w(i).end + avg/2);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function MidSwing = DetectMSstatic(s,thd);
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function w = FindSleeping
global a_theta accel;

w = [];
n = fix(length(a_theta)/40);
m = median(reshape(a_theta(1:40*n), 40, n));
am = median(reshape(accel(1:40*n), 40, n));

nSeq = 1;
sleeping = 0;

THD1 = tan(45 * pi/180);   
THD2 = tan(-50 * pi/180);
for i=1:n
    if m(i) > THD1 || m(i) < THD2 || am(i) < .7
        if sleeping == 0
            w(nSeq).start = i*40-39;
            w(nSeq).end = NaN;
            sleeping = 1;
        end
    else
        if sleeping == 1
            w(nSeq).end = (i-1)*40;
            if w(nSeq).end-w(nSeq).start > 10*40
                nSeq = nSeq+1;
            end
            sleeping = 0;
        end
    end
end

if sleeping == 1
    w(nSeq).end = n*40;
end

% if ~isempty(w)
%     [w.steps] = deal(0);
%     [w.MidSwing] = deal([]);
%     [w.type] = deal(-2);
%     [w.TR] = deal(0);
%     if w(end).end - w(end).start < 10*40
%         w(end) = [];
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Find the initial orientation of the sensor
function t = FindSensorInclination(walking)
global a_theta gSensorInclination;

if ~isempty(walking) && max([walking.steps]) >= 10
        w_time = [walking.end] - [walking.start];
        f = find(w_time >= 400);
        if ~isempty(f)
            w_std = zeros(length(f), 1);
            for i=1:length(f)
                w_std(i) = std(a_theta(walking(f(i)).start:walking(f(i)).end));
            end
            [mi, idx] = min(w_std);
            idx = f(idx);
        else
            [ma, idx] = max(w_time);
        end
        t = median(a_theta(walking(idx).start:walking(idx).end));
        gSensorInclination = t; 
else
    if ~isnan(gSensorInclination)
        t = gSensorInclination;
    else
        t = tan(-10*pi/180);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Check sensor's orientaion
function test = CorrectOrientation(walking)
global v gSensorOrientation;

s = 0;
n = 0;
if ~isempty(walking) && max([walking.steps]) >= 10
    for i=1:length(walking)
        if walking(i).steps >= 10
            s = s + sum(v(walking(i).start:walking(i).end));
            n = n + walking(i).end - walking(i).start + 1;
        end
    end
    s = s / n;
    % if oreintation is correct, the average vertical acceleration during
    % walking should be negative
    if s > 0
        test = 0;
    else
        test = 1;
    end
    gSensorOrientation = test;
else
    if ~isempty(gSensorOrientation) && ~isnan(gSensorOrientation)
        test = gSensorOrientation;
    else
        test = 1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [mi, ma] = FindMinMax(s, thr)
d = diff(s);
f = find( d(2:end) .* d(1:end-1) <= 0);
f = f + 1;

mi = f(d(f)>=0);
ma = f(d(f)<0);

if nargin == 2
    ma = ma(s(ma) > thr);
    mi = mi(s(mi) < -thr);
end