function plotpeak(x, p, p2, fs)

n = find(isnan(p));
p(n) = [];

if nargin == 2
    fs = 200;
    plot((1:length(x))/fs, x, p/fs, x(p), 'o')
    xlabel('sec');    
else
    if nargin == 3
        fs = 200;
    end
    n = find(isnan(p2));
    p2(n) = [];
    plot((1:length(x))/fs, x, p/fs, x(p), 'o', p2/fs, x(p2), 'x')
    xlabel('sec');
end

