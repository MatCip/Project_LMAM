function r = AutoGaitAnalyze_CPalsy(shank, thigh, Height,path_out,thres_step)

s(:,1) = RemoveDrift(shank(:,1));
s(:,2) = RemoveDrift(shank(:,2));

ws = DetectWalking_CPalsy(s);
if ~isempty(ws)
    ws(end).end = min(length(shank), ws(end).end);
end
thres=10;
r = [];
%%% check to see if some detected walking trials would be 
%%% broken in to two trials if a dynamic treshold is used
f = find([ws.steps] > 10); %10

k = 1;
for i=f
    wd = DetectWalkingDynamic(s(ws(i).start:ws(i).end, :));
    if ~isempty(wd)
        for j=1:length(wd)
            w(k) = wd(j);
            w(k).start = w(k).start + ws(i).start - 1;
            w(k).end = w(k).end + ws(i).start - 1;
            k = k+1;
        end
    end
end

if ~isempty(w)
    w(end).end = min(length(shank), w(end).end);
end


if nargin > 1 && ~isempty(thigh)
    s(:,1) = thigh(:,1);
    s(:,2) = shank(:,1);
    s(:,3) = shank(:,2);
    if size(thigh,2) == 2
        s(:,4) = thigh(:,2);
    end
else
    s(:,1) = shank(:,1);
    s(:,2) = shank(:,2);
end

if nargin < 3
    height = 100;
end

r = [];
f = find([w.steps] > thres_step); % 15
k = 1;
for i=f
    %res = GaitAnalyze(s(w(i).start:w(i).end, :)); %, height);
    res = GaitAnalyze_CPalsy(s(w(i).start:w(i).end, :),Height(1),Height(2),path_out);
    bad = sum(isnan([res.Limp])/length(res));
        
    if bad < .2
        r(k).Cycle = res;
        r(k).start = w(i).start;
        r(k).end = w(i).end;
        r(k).steps = w(i).steps;
        k = k+1;
    end
end
fname = 'GaitAnalysisReport.xls';
SaveGaitResults1(fname, r,path_out,[]);