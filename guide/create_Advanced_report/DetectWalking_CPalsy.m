function [w, R, L] = DetectWalking_CPalsy(shanks, msLeft)
%% [w, R, L] = DetectWalking(shanks, msLeft)
%% find walking sequences based on MidSwings

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
thr = 700;  %700
thr2=100;  %300
w = [];

if isempty(R) || isempty(L)
    return;
end

if(R(1) < L(1))
    side = 1;
else
    side = 0;
end

while iR <= nR && iL <= nL
    if side == 1;
        if iR < nR
            if R(iR+1) < L(iL)
                if walking == 1 && (R(iR+1) - R(iR)) >= thr2
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
                w(nSeq).type = -2;
            else
                w(nSeq).steps = w(nSeq).steps+1;
                thr = thr2 + (L(iL)-w(nSeq).start)/w(nSeq).steps;
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
                if walking == 1 && (L(iL+1) - L(iL)) >= thr2
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
                w(nSeq).type = -2;
            else
                w(nSeq).steps = w(nSeq).steps+1;
                thr = thr2 + (R(iR)-w(nSeq).start)/w(nSeq).steps;
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

%% correct the special case for the last walking period
% if ~isempty(w)
%     w(end).end = min(length(shanks), w(end).end);
% end
