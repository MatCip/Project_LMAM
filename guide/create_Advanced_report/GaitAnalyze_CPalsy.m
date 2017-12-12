function res = GaitAnalyze_CPalsy(ss, L1, L2)
%function   res = GaitAnalyze(s, h)
% Does a gait analysis of the s signal. h parameter is the height of the
% subject. The order of the channels is:
% s(:,1) = right thigh
% s(:,2) = right shank
% s(:,3) = left shank
% s(:,4) = left thigh
%%%%%%%%%%%%%%%%%%%%%%% drift cancelation %%%%%%%%%%%%%%%%%%%%
global shanks thighs;
shanks = [];
thighs = [];

if nargin == 1
    L1 = 170;  %% use 170cm if the height is unknown
    
    % Added by David: Otherwise not logical.
    height = L1;
    L1 = .245*height; 
    L2 = .246*height;   
end

% DAVID: If only 2 inputs, then L1 is body height. With 3 inputs, L1 and L2 have
% the correct length.
if nargin == 2  
    height = L1;
    L1 = .245*height;  
    L2 = .246*height;
end

n = size(ss, 2);

if n == 2
    shanks(:,1) = RemoveDrift(ss(:,1));
    shanks(:,2) = RemoveDrift(ss(:,2));
%     figure
%     hold on
%     plot(shanks(:,1), shanks(:,2));
%     pause
    thighs = [];
elseif n == 3
    shanks(:,1) = RemoveDrift(ss(:,2));
    shanks(:,2) = RemoveDrift(ss(:,3));
    thighs(:,1) = RemoveDrift(ss(:,1));
    thighs(:,2) = 0;
elseif n == 4
    shanks(:,1) = RemoveDrift(ss(:,2));
    shanks(:,2) = RemoveDrift(ss(:,3));
    thighs(:,1) = RemoveDrift(ss(:,1));
    thighs(:,2) = RemoveDrift(ss(:,4));
    
    %figure
%     hold on
%     subplot(211),plot(shanks(:,1),'b'),plot(shanks(:,2),'k');
%     hold off
%     subplot(212),plot(thighs(:,1),'b'),plot(thighs(:,2),'k');
end

C = CalcCycles;

if n == 2
     res = CalcAllVirtual(C, L1, L2);
elseif n == 3
    res = CalcAll3(C, L1, L2);
elseif n == 4
    res = CalcAll4(C, L1, L2);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Cycle = CalcAll3(C, L1, L2)
global shanks;
Cycle = C;
L1 = L1 / 100;
L2 = L2 / 100;

for i=1:length(Cycle)
    %%%%%%%%%%%%%%%%%%%%%%% Temporal parameters %%%%%%%%%%%%%%%%%%%%%
    Cycle(i).Gct = Cycle(i).end - Cycle(i).HsR;
    Cycle(i).SwingR = 100 * (Cycle(i).end - Cycle(i).ToR) / Cycle(i).Gct;
    Cycle(i).SwingL = 100 * (Cycle(i).HsL - Cycle(i).ToL) / Cycle(i).Gct;
    Cycle(i).StanceR = 100 * (Cycle(i).ToR - Cycle(i).HsR) / Cycle(i).Gct;
    Cycle(i).StanceL = 100 * (Cycle(i).end - Cycle(i).HsL + Cycle(i).ToL - Cycle(i).HsR) / Cycle(i).Gct;
    Cycle(i).IDS = 100 * (Cycle(i).ToL - Cycle(i).HsR) / Cycle(i).Gct;
    Cycle(i).TDS = 100 * (Cycle(i).ToR - Cycle(i).HsL) / Cycle(i).Gct;
    Cycle(i).DS = Cycle(i).IDS + Cycle(i).TDS;
    Cycle(i).Limp = abs(Cycle(i).IDS - Cycle(i).TDS);
    Cycle(i).Gct = Cycle(i).Gct / 200;
    
    %%%%%%%%%%%%%%%%%%%%%%% Spatial parameters %%%%%%%%%%%%%%%%%%%
    
    %%%%%% right swing 
    alpha = naninteg(1, Cycle(i).ToR, Cycle(i).end);
    beta = naninteg(2, Cycle(i).ToR, Cycle(i).end);               
    d1d2 = SolveGaitModel(alpha(end) - alpha(1), beta(end)-beta(1), L1, L2);
    %%%%%% left stance
    if i == 1       
        Cycle(i).StrideR = NaN;
        Cycle(i).SpeedR = NaN;
    else
        %alpha = naninteg(4, Cycle(i-1).HsL, Cycle(i).ToL);
        alpha = naninteg(1, Cycle(i).HsR, Cycle(i).ToR);
        beta = naninteg(3, Cycle(i-1).HsL, Cycle(i).ToL);
        d3 = SolveGaitModel(beta(end)-beta(1), alpha(end) - alpha(1), L2, L1);
        Cycle(i).StrideR = d1d2 + d3;
        Cycle(i).SpeedR = Cycle(i).StrideR / Cycle(i).Gct;
    end
    %%%%%% Left swing
    %alpha = naninteg(4, Cycle(i).ToL, Cycle(i).HsL);
    alpha = naninteg(1, Cycle(i).ToR, Cycle(i).end);
    beta = naninteg(3, Cycle(i).ToL, Cycle(i).HsL);
    d1d2 = SolveGaitModel(alpha(end) - alpha(1), beta(end)-beta(1), L1, L2);
    %%%%%% Rigth stance
    alpha = naninteg(1, Cycle(i).HsR, Cycle(i).ToR);
    beta = naninteg(2, Cycle(i).HsR, Cycle(i).ToR);
    d3 = SolveGaitModel(beta(end)-beta(1), alpha(end) - alpha(1), L2, L1);
    Cycle(i).StrideL = d1d2 + d3;
    Cycle(i).SpeedL = Cycle(i).StrideL / Cycle(i).Gct;
    
    %%%%%%%%%%%%%%%%%%%%%%% Range of Angels %%%%%%%%%%%%%%%%%%%%%
    if isnan(Cycle(i).HsR) || isnan(Cycle(i).end)
        Cycle(i).ShankR = NaN;
        Cycle(i).ShankL = NaN;
        Cycle(i).ThighR = NaN;
        Cycle(i).ThighL = NaN;
        Cycle(i).KneeR = NaN;
        Cycle(i).KneeL = NaN;
    else
        Cycle(i).ShankR = range(naninteg(2, Cycle(i).HsR, Cycle(i).end));
        Cycle(i).ShankL = range(naninteg(3, Cycle(i).HsR, Cycle(i).end));
        Cycle(i).ThighR  = range(naninteg(1, Cycle(i).HsR, Cycle(i).end));
        Cycle(i).ThighL = Cycle(i).ThighR;
        Cycle(i).KneeR = range(naninteg(1, Cycle(i).HsR, Cycle(i).end) - naninteg(2, Cycle(i).HsR, Cycle(i).end));
        Cycle(i).KneeL = NaN;
    end
    
    %%%%%%%%%%%%%%%%%%%%%%% Midswing Speeds %%%%%%%%%%%%%%%%%%%%
    if isnan(Cycle(i).HsR) || isnan(Cycle(i).end)
        Cycle(i).PeakSwingSpeedR = NaN;
        Cycle(i).PeakSwingSpeedL = NaN;
    else
        Cycle(i).PeakSwingSpeedR = max(shanks(Cycle(i).HsR:Cycle(i).end, 1));
        Cycle(i).PeakSwingSpeedL = max(shanks(Cycle(i).HsR:Cycle(i).end, 2));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Cycle = CalcAll4(C, L1, L2)
global shanks;
Cycle = C;
L1 = L1 / 100;
L2 = L2 / 100;

for i=1:length(Cycle)
    %%%%%%%%%%%%%%%%%%%%%%% Temporal parameters %%%%%%%%%%%%%%%%%%%%%
    Cycle(i).Gct = Cycle(i).end - Cycle(i).HsR;
    Cycle(i).SwingR = 100 * (Cycle(i).end - Cycle(i).ToR) / Cycle(i).Gct;
    Cycle(i).SwingL = 100 * (Cycle(i).HsL - Cycle(i).ToL) / Cycle(i).Gct;
    Cycle(i).StanceR = 100 * (Cycle(i).ToR - Cycle(i).HsR) / Cycle(i).Gct;
    Cycle(i).StanceL = 100 * (Cycle(i).end - Cycle(i).HsL + Cycle(i).ToL - Cycle(i).HsR) / Cycle(i).Gct;
    Cycle(i).IDS = 100 * (Cycle(i).ToL - Cycle(i).HsR) / Cycle(i).Gct;
    Cycle(i).TDS = 100 * (Cycle(i).ToR - Cycle(i).HsL) / Cycle(i).Gct;
    Cycle(i).DS = Cycle(i).IDS + Cycle(i).TDS;
    Cycle(i).Limp = abs(Cycle(i).IDS - Cycle(i).TDS);
    Cycle(i).Gct = Cycle(i).Gct / 200;
    
    %%%%%%%%%%%%%%%%%%%%%%% Spatial parameters %%%%%%%%%%%%%%%%%%%
    
    %%%%%% right swing 
    alpha = naninteg(1, Cycle(i).ToR, Cycle(i).end);
    beta = naninteg(2, Cycle(i).ToR, Cycle(i).end);
        % Added by David (2 Lines)
%         Cycle(i).alpha_SwingR = alpha;
%         Cycle(i).beta_SwingR = beta;               
    d1d2 = SolveGaitModel(alpha(end) - alpha(1), beta(end)-beta(1), L1, L2);
    %%%%%% left stance
    if i == length(Cycle)       
        Cycle(i).StrideR = NaN;
        Cycle(i).SpeedR = NaN;
    else
        alpha = naninteg(4, Cycle(i).HsL, Cycle(i+1).ToL);
        beta = naninteg(3, Cycle(i).HsL, Cycle(i+1).ToL);
            % Added by David (2 Lines)
%             Cycle(i).alpha_StanceL = alpha;
%             Cycle(i).beta_StanceL = beta;
        d3 = SolveGaitModel(beta(end)-beta(1), alpha(end) - alpha(1), L2, L1);
        Cycle(i).StrideR = d1d2 + d3;
        Cycle(i).SpeedR = Cycle(i).StrideR / Cycle(i).Gct;
    end
    %%%%%% Left swing
    alpha = naninteg(4, Cycle(i).ToL, Cycle(i).HsL);
    beta = naninteg(3, Cycle(i).ToL, Cycle(i).HsL);
        % Added by David (2 Lines)
%         Cycle(i).alpha_SwingL = alpha;
%         Cycle(i).beta_SwingL = beta;               
    d1d2 = SolveGaitModel(alpha(end) - alpha(1), beta(end)-beta(1), L1, L2);
    %%%%%% Rigth stance
    alpha = naninteg(1, Cycle(i).HsR, Cycle(i).ToR);
    beta = naninteg(2, Cycle(i).HsR, Cycle(i).ToR);
        % Added by David (2 Lines)
%         Cycle(i).alpha_StanceR = alpha;
%         Cycle(i).beta_StanceR = beta;
    d3 = SolveGaitModel(beta(end)-beta(1), alpha(end) - alpha(1), L2, L1);
    Cycle(i).StrideL = d1d2 + d3;
    Cycle(i).SpeedL = Cycle(i).StrideL / Cycle(i).Gct;
    
    %%%%%%%%%%%%%%%%%%%%%%% Range of Angels %%%%%%%%%%%%%%%%%%%%%
    if isnan(Cycle(i).HsR) || isnan(Cycle(i).end)
        Cycle(i).ShankR = NaN;
        Cycle(i).ShankL = NaN;
    else
        Cycle(i).ShankR = range(naninteg(2, Cycle(i).HsR, Cycle(i).end));
        Cycle(i).ShankL = range(naninteg(3, Cycle(i).HsR, Cycle(i).end));
        Cycle(i).ThighR  = range(naninteg(1, Cycle(i).HsR, Cycle(i).end));
        Cycle(i).KneeR = range(naninteg(1, Cycle(i).HsR, Cycle(i).end) - naninteg(2, Cycle(i).HsR, Cycle(i).end));
        Cycle(i).ThighL  = range(naninteg(4, Cycle(i).HsR, Cycle(i).end));
        Cycle(i).KneeL = range(naninteg(4, Cycle(i).HsR, Cycle(i).end) - naninteg(3, Cycle(i).HsR, Cycle(i).end));
    end
    
    %%%%%%%%%%%%%%%%%%%%%%% Midswing Speeds %%%%%%%%%%%%%%%%%%%%
    if isnan(Cycle(i).HsR) || isnan(Cycle(i).end)
        Cycle(i).PeakSwingSpeedR = NaN;
        Cycle(i).PeakSwingSpeedL = NaN;
    else
        Cycle(i).PeakSwingSpeedR = max(shanks(Cycle(i).HsR:Cycle(i).end, 1));
        Cycle(i).PeakSwingSpeedL = max(shanks(Cycle(i).HsR:Cycle(i).end, 2));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Cycle = CalcAllVirtual(C, L1, L2)
global shanks;
load thighPredictors;
Cycle = C;
L1 = L1 / 100;
L2 = L2 / 100;

for i=1:length(Cycle)
    %%%%%%%%%%%%%%%%%%%%%%% Temporal parameters %%%%%%%%%%%%%%%%%%%%%
    Cycle(i).Gct = Cycle(i).end - Cycle(i).HsR;
    Cycle(i).SwingR = 100 * (Cycle(i).end - Cycle(i).ToR) / Cycle(i).Gct;
    Cycle(i).SwingL = 100 * (Cycle(i).HsL - Cycle(i).ToL) / Cycle(i).Gct;
    Cycle(i).StanceR = 100 * (Cycle(i).ToR - Cycle(i).HsR) / Cycle(i).Gct;
    Cycle(i).StanceL = 100 * (Cycle(i).end - Cycle(i).HsL + Cycle(i).ToL - Cycle(i).HsR) / Cycle(i).Gct;
    Cycle(i).IDS = 100 * (Cycle(i).ToL - Cycle(i).HsR) / Cycle(i).Gct;
    Cycle(i).TDS = 100 * (Cycle(i).ToR - Cycle(i).HsL) / Cycle(i).Gct;
    Cycle(i).DS = Cycle(i).IDS + Cycle(i).TDS;
    Cycle(i).Limp = abs(Cycle(i).IDS - Cycle(i).TDS);
    Cycle(i).Gct = Cycle(i).Gct / 200;
    
    %%%%%%%%%%%%%%%%%%%%%%% Spatial parameters %%%%%%%%%%%%%%%%%%%
    
    if ~isnan(Cycle(i).HsR) && ~isnan(Cycle(i).end)
        shankAngleR = cumtrapz(shanks(Cycle(i).HsR:Cycle(i).end,1))/200;
        thighAngleR = VirtualInteg(Cycle(i).HsR, Cycle(i).end, 1, xHsHs);
        
        Cycle(i).ShankR = range(shankAngleR);
        Cycle(i).ThighR  = range(thighAngleR);
        Cycle(i).KneeR = range(thighAngleR - shankAngleR); 
    else
        Cycle(i).ShankR = NaN;
        Cycle(i).ThighR = NaN;
        Cycle(i).KneeR = NaN;
        shankAngleR = NaN;
        thighAngleR = NaN;
    end
    
    if ~isnan(Cycle(i).ToL) && i < length(Cycle) && ~isnan(Cycle(i+1).ToL)
        shankAngleL = cumtrapz(shanks(Cycle(i).ToL:Cycle(i+1).ToL,2))/200;
        thighAngleL = VirtualInteg(Cycle(i).ToL, Cycle(i+1).ToL, 2, xToTo);
        
        Cycle(i).ShankL = range(shankAngleL);
        Cycle(i).ThighL  = range(thighAngleL);
        Cycle(i).KneeL = range(thighAngleL - shankAngleL);
    else
        Cycle(i).ShankL = NaN;
        Cycle(i).ThighL = NaN;
        Cycle(i).KneeL = NaN;
        shankAngleL = NaN;
        thighAngleR = NaN;
    end
    
    if i == length(Cycle) || isnan(Cycle(i).DS) || isnan(Cycle(i+1).ToL)
        Cycle(i).StrideR = NaN;
        Cycle(i).SpeedR = NaN;
        Cycle(i).StrideL = NaN;
        Cycle(i).SpeedL = NaN;
    else
        tToR = Cycle(i).ToR - Cycle(i).HsR + 1;
        tHsL = Cycle(i).HsL - Cycle(i).ToL + 1;
        
        %%%%%% right swing 
        alpha = thighAngleR(end) - thighAngleR(tToR);
        beta = shankAngleR(end) - shankAngleR(tToR);               
        d1d2 = SolveGaitModel(alpha, beta, L1, L2);
        
        %%%%%% left stance
        alpha = thighAngleL(end) - thighAngleL(tHsL);
        beta = shankAngleL(end) - shankAngleL(tHsL);
        d3 = SolveGaitModel(beta, alpha, L2, L1);
        
        Cycle(i).StrideR = d1d2 + d3;
        Cycle(i).SpeedR = Cycle(i).StrideR / Cycle(i).Gct;
    
        %%%%%% Left swing
        alpha = thighAngleL(tHsL)-thighAngleL(1);
        beta = shankAngleL(tHsL)-shankAngleL(1);
        d1d2 = SolveGaitModel(alpha, beta, L1, L2);
        %%%%%% Rigth stance
        alpha = thighAngleR(tToR) - thighAngleR(1);
        beta = shankAngleR(tToR) - shankAngleR(1);
        d3 = SolveGaitModel(beta, alpha, L2, L1);
        
        Cycle(i).StrideL = d1d2 + d3;
        Cycle(i).SpeedL = Cycle(i).StrideL / Cycle(i).Gct;
    end
      
    %%%%%%%%%%%%%%%%%%%%%%% Midswing Speeds %%%%%%%%%%%%%%%%%%%%
    if isnan(Cycle(i).HsR) || isnan(Cycle(i).end)
        Cycle(i).PeakSwingSpeedR = NaN;
        Cycle(i).PeakSwingSpeedL = NaN;
    else
        Cycle(i).PeakSwingSpeedR = max(shanks(Cycle(i).HsR:Cycle(i).end, 1));
        Cycle(i).PeakSwingSpeedL = max(shanks(Cycle(i).HsR:Cycle(i).end, 2));
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function d = SolveGaitModel(alpha, beta, l1, l2)
if isnan(alpha) || isnan(beta)
    d = NaN;
else 
    alpha = abs(alpha * pi / 180);
    beta = abs(beta * pi / 180);
    
    gamma = (pi - alpha) / 2;
    phi = (pi - 2*beta + alpha) / 2;
    
    d_ = l1 * sqrt(2*(1 - cos(alpha)));
    
    M1 = sin(phi) * d_ / sin(beta);
    M2 = sin(gamma) * d_ / sin(beta);
    
    d = sqrt((l2+M2)^2 + (l2+M1)^2 - 2*(l2+M2)*(l2+M1)*cos(beta));
    %d = sqrt((l2+M2).^2 + (l2+M1).^2 - 2*(l2+M2)*(l2+M1)*cos(beta));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Cycle = CalcCycles
global shanks;
[HsR,ToR] = DetectHsTo(shanks(:,1));
[HsL,ToL] = DetectHsTo(shanks(:,2));


PlotHsTo(ToR, HsR, ToL, HsL);

Cycle = [];
for i=1:length(HsR)-1
    Cycle(i).HsR = HsR(i);
    Cycle(i).ToR = FindFirstAfter(Cycle(i).HsR, ToR);
    if Cycle(i).ToR == HsR(i) || Cycle(i).ToR >= HsR(i+1)
        Cycle(i).ToR = NaN;
    end
    
    Cycle(i).ToL = FindFirstAfter(Cycle(i).HsR, ToL);
    if Cycle(i).ToL > Cycle(i).ToR
        Cycle(i).ToL = NaN;
    end
    
    Cycle(i).HsL = FindFirstAfter(Cycle(i).ToL, HsL);
    if Cycle(i).HsL > Cycle(i).ToR || Cycle(i).HsL == Cycle(i).ToL
        Cycle(i).HsL = NaN;
    end
    
    Cycle(i).end = HsR(i+1);
    if Cycle(i).HsR == Cycle(i).end
        Cycle(i).end = NaN;
    end
end

%%% patch %%%%
if ~isempty(Cycle) && isnan(Cycle(end).ToR) && isnan(Cycle(end).ToL) && isnan(Cycle(end).HsL)
    Cycle(end) = [];
end

%%% filter %%%
k = 1;
while k < length(Cycle)
    if Cycle(k).ToR == Cycle(k+1).ToR;
        Cycle(k) = [];
    else
        k = k + 1;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function i = naninteg(n, a, b)
global shanks thighs;

if isnan(a) || isnan(b)
    i = NaN;
else
    switch n
        case 1 
            i = cumtrapz(thighs(a:b, 1))/200;
        case 2
            i = cumtrapz(shanks(a:b, 1))/200;
        case 3
            i = cumtrapz(shanks(a:b, 2))/200;
        case 4
            i = cumtrapz(thighs(a:b, 2))/200;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function angle = VirtualInteg(a, b, side, x)
global shanks;

nHarm = (size(x, 2)-1)/2;

if isnan(a) || isnan(b) || a == b
    angle = NaN;
else
    if side == 1
        teta1 = cumtrapz(shanks(a:b, 1))/200;
        teta2 = cumtrapz(shanks(a:b, 2))/200;
    else
        teta1 = cumtrapz(shanks(a:b, 2))/200;
        teta2 = cumtrapz(shanks(a:b, 1))/200;
    end
    [r1, phi1, m1] = harmonics(teta1, nHarm);
    [r2, phi2, m2] = harmonics(teta2, nHarm);
    
    predictors = [r1 phi1 m1 r2 phi2 m2 1];
   
    y = predictors * x;
    
    angle = hcompose(y(1:nHarm), y(nHarm+1:2*nHarm), b-a+1, y(nHarm*2+1));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function PlotHsTo(ToR, HsR, ToL, HsL)
global shanks;
%figure(1)
subplot(211); plotpeak(shanks(:,1), ToR, HsR);
title('Shank Angular Rate [DEG/SEC]')
ylabel('Right Shank (deg/s)')

subplot(212); plotpeak(shanks(:,2), ToL, HsL);
ylabel('Left Shank (deg/s)');
