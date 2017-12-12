function ss = hcompose(r, phi, n, tilt)

m = length(r);
wt = [0:2*pi/n:2*pi*(1-1/n)]';
a = r.*exp(i*phi);

x = 0;
for k = 1:m
    x = x + 2*a(k)*exp(i*k*wt);
end

ss = real(x);

if nargin == 4
    ss = ss + tilt*[1:n]';
end