function m = binarySearch(x, a)
%       m = binarySearch(x, a)
% Returns the lower bound of index m in the sorted array a where you can find x
n1 = 1;
n2 = length(a);

if a(1) > x
    m = 0;
end

while(n1 < n2)
    m = fix((n1+n2) / 2);
    if m == n1
        if a(n2) < x
            m = n2;
        end
        return
    elseif a(m) > x
        n2 = m;
    elseif a(m) == x
        return
    else
        n1 = m;
    end
end
m = n1;        
