function filtered_altitude = filtering_barometer ( input_altitude , type , freq , normalizing )

if nargin<4 
    unfiltered_altitude = input_altitude ;
elseif strcmp(normalizing , 'mean_std') == 1
    unfiltered_altitude = normalized ( input_altitude , 2 ) ;
elseif strcmp(normalizing , 'mean') == 1
    unfiltered_altitude = input_altitude - mean (input_altitude) ;
end

if strcmp ( type , 'high' ) == 1
    
    d = fdesign.highpass('N,F3db',10,freq,200);
    Hd = design(d,'butter');
    high = filter(Hd,unfiltered_altitude);
    high = filter(Hd,high(length(high):-1:1));
    high = high(length(high):-1:1);
    filtered_altitude = high;
    
elseif strcmp ( type , 'low' ) == 1
    
    d=fdesign.lowpass('N,F3db',10,freq,200);
    Hd=design(d, 'butter');
    low=filter(Hd,unfiltered_altitude);
    low=filter(Hd,low(length(low):-1:1));
    low=low(length(low):-1:1);
    filtered_altitude = low;
    
end

% plot(unfiltered_altitude)
% hold on
% plot(filtered_altitude,'g')
% 
% d=fdesign.bandpass('N,F3dB1,F3dB2',10,0.3,1.5,200);
% BP=design(d,'butter');
% right_band=filter(BP,unfiltered_altitude);
% right_band=filter(BP,right_band(length(right_band):-1:1));
% right_band=right_band(length(right_band):-1:1);
% 
% left_band=filter(BP,sig_left);
% left_band=filter(BP,left_band(length(left_band):-1:1));
% left_band=left_band(length(left_band):-1:1);
% % plot(band)
% plot(unfiltered_altitude)
% hold on
% plot(low,'r')
% % hold on
% % plot(high,'g')
% 
% % f1=sig-high;
% % f2=f1-low;
% 
% k(1)=subplot(4,1,1)
% plot(gyro_right_sync)
% k(2)=subplot(4,1,2)
% plot(pk)
% k(3)=subplot(4,1,3)
% plot([a6-a9 a7-a9])
% k(4)=subplot(4,1,4)
% plot(sgolayfilt(unfiltered_altitude,1,21)-sgolayfilt(unfiltered_altitude,1,1001))
% linkaxes(k,'x')
% 
% figure
% plot(unfiltered_altitude)
% hold on
% plot(unfiltered_altitude-high,'g')
% 
% dt = 1/200;
% h = hilbert(right_band);
% unrolled_phase = unwrap(angle(h));
% inst_freq = diff(unrolled_phase)/dt/(2*pi);
% figure
% plot(inst_freq)
% 
% d = fdesign.peak('N,F0,BW,Ast',8,.015,.02,80);
% Hd = design(d,'cheby2');
% pk=filter(Hd,unfiltered_altitude);
% pk=filter(Hd,pk(length(pk):-1:1));
% pk=pk(length(pk):-1:1);
% plot(pk)