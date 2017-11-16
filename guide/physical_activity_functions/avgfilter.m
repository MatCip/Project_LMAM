% function for calculating moving average of signal x. Average of for n:th
% value calculated from window n-win/2-1...n...n+win/2-1, where N is the chosen length of
% the window. Odd N values recommended. 
% 
% x_avg = avgfilter(x,window)
%
% Input
% x           input signal
% window      width of the moving average window (samples)
%
% Eero Ahtola 2006

function x_avg = avgfilter(x,window)

[M,N]=size(x);
if N>M
    x=x';
end
xN=max(M,N);

shift=floor(window/2);      %half of the window
window=2*shift+1;           %Must be an odd integer
% x(end+1:end+shift)=x(end);  %padding with the last sampe

%LP filter
B=(1/window)*ones(window,1);
A=1;
LPx=filter(B,A,x);

first_samples=zeros(shift,1);
last_samples=zeros(shift,1);
for i=1:shift
    first_samples(i)=mean(x(1:2*i-1));
    last_samples(i)=mean(x(end-2*(shift-i):end));
end

x_avg=[first_samples; LPx(window:end); last_samples];

if N>M
    x_avg=x_avg';
end

% %Shift values win/2
% for i=1:length(x)-shift;
%     x_avg(i)=x_avg(i+shift);
% end
% 
% %check the length
% x_avg=x_avg(1:N);
