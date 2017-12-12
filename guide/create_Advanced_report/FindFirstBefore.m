function [t, k] = FindFirstBefore(x, a)
k = 0;
t = NaN;
if isnan(x) | isempty(a)
    return;
elseif a(1) >= x
    return;
else
    k = binarySearch(x, a);
    if k == 0
        return
    else
        t = a(k);
    end
end