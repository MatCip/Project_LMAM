function [r, phi, tilt] = harmonics(s, m)
if nargin == 1
    m = 10;
end

[s, tilt] = precondition(s);

s = s(:);
n = length(s);
wt = [0:2*pi/n:2*pi*(1-1/n)]; 

for i = 1:m
    a(i) = exp(-j*wt*i)*s / n;
end

if nargout >= 2
    r = abs(a);
    phi = angle(a);
else
    r = a;
end

% ss = zeros(1, n);
% for i = 1:10
%     ss = ss + r(i)*cos(i*wt+phi(i));
% end
% 
% plot([s, ss'])

function [y, m] = precondition(c)

n = length(c);
m = (c(1)-c(n))/(1-n);

y = c(1:n-1) - (m*(0:n-2) + c(1))';
