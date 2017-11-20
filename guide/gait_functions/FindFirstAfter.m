function [t, i] = FindFirstAfter(x, a)
%   [t, i] = FindFirstAfter(x, a)
% Finds the first elemet of a, bigger than or equal to x
i = 0;
t = NaN;
if isnan(x) | isempty(a)
    return;
elseif a(end) <= x
    return;
else
    k = binarySearch(x, a);
    if k == 0
        i = k;
        return
    end
    for i=k:length(a)
        if a(i) >= x
            t = a(i);
            return;
        end
    end
end
