function load_all(FileName_1,Path_1,FileName_2,Path_2,FileName_3,Path_3,FileName_4,Path_4,FileName_5,Path_5) 
s=strcat(Path_1,FileName_1);
mat_1=load(s);
trunk=mat_1.trunk;

disp([FileName_1,'    loaded']);


s=strcat(Path_2,FileName_2);
mat_1=load(s);
LShank=mat_1.LShank;
disp([FileName_2,'    loaded']);

s=strcat(Path_3,FileName_3);
mat_1=load(s);
RShank=mat_1.RShank;
disp([FileName_3,'    loaded']);

s=strcat(Path_4,FileName_4);
mat_1=load(s);
LThigh=mat_1.LThigh;
disp([FileName_4,'    loaded']);

s=strcat(Path_5,FileName_5);
mat_1=load(s);
RThigh=mat_1.RThigh;
disp([FileName_5,'    loaded']);

%% load the dimensions%%%%%%%%%%
[m1,n1]=size(LThigh.acc); [m2,n2]=size(RThigh.acc); [m3,n3]=size(LShank.acc);
[m4,n4]=size(RShank.acc);[m5,n5]=size(trunk.acc);
l=min([m1 m2 m3 m4 m5]);
%%%%%%%%%%%%%%%

l1=200*60*15;



%% reshaping the data and assigning the values%%%%
l2=l-l1;
acc1_LShank=LShank.acc(l1:l2,1); acc2_LShank=LShank.acc(l1:l2,2); acc3_LShank=LShank.acc(l1:l2,3);
gyr1_LShank=LShank.gyr(l1:l2,1); gyr2_LShank=LShank.gyr(l1:l2,2); gyr3_LShank=LShank.gyr(l1:l2,3);

acc1_RShank=RShank.acc(l1:l2,1); acc2_RShank=RShank.acc(l1:l2,2); acc3_RShank=RShank.acc(l1:l2,3);
gyr1_RShank=RShank.gyr(l1:l2,1); gyr2_RShank=-RShank.gyr(l1:l2,2); gyr3_RShank=RShank.gyr(l1:l2,3);

acc1_LThigh=-LThigh.acc(l1:l2,1); acc2_LThigh=LThigh.acc(l1:l2,2);acc3_LThigh=LThigh.acc(l1:l2,3);
gyr1_LThigh=LThigh.gyr(l1:l2,1); gyr2_LThigh=LThigh.gyr(l1:l2,2);gyr3_LThigh=LThigh.gyr(l1:l2,3);

acc1_RThigh=RThigh.acc(l1:l2,1); acc2_RThigh=RThigh.acc(l1:l2,2); acc3_RThigh=RThigh.acc(l1:l2,3);
gyr1_RThigh=RThigh.gyr(l1:l2,1); gyr2_RThigh=RThigh.gyr(l1:l2,2);gyr3_RThigh=RThigh.gyr(l1:l2,3);

acc1_trunk=trunk.acc(l1:l2,1); acc2_trunk=trunk.acc(l1:l2,2); acc3_trunk=trunk.acc(l1:l2,3);
gyr1_trunk=trunk.gyr(l1:l2,1); gyr2_trunk=trunk.gyr(l1:l2,2); gyr3_trunk=trunk.gyr(l1:l2,3);


%% decimating  NEW SAMPLE = (40/200) * OLD_VERSION
acc1_LThigh40=resample(acc1_LThigh,40,200);
acc2_LThigh40=resample(acc2_LThigh,40,200);
acc3_LThigh40=resample(acc3_LThigh,40,200);

acc1_RThigh40=resample(acc1_RThigh,40,200);
acc2_RThigh40=resample(acc2_RThigh,40,200);
acc3_RThigh40=resample(acc3_RThigh,40,200);

acc1_trunk40=resample(acc1_trunk,40,200);
acc2_trunk40=resample(acc2_trunk,40,200);
acc3_trunk40=resample(acc3_trunk,40,200);

gyr1_RShank40=resample(gyr1_RShank,40,200);
gyr2_RShank40=resample(gyr2_RShank,40,200);
gyr3_RShank40=resample(gyr3_RShank,40,200);

gyr1_LShank40=resample(gyr1_LShank,40,200);
gyr2_LShank40=resample(gyr2_LShank,40,200);
gyr3_LShank40=resample(gyr3_LShank,40,200);


%added
gyr1_trunk40=resample(gyr1_trunk,40,200);
gyr2_trunk40=resample(gyr2_trunk,40,200);
gyr3_trunk40=resample(gyr3_trunk,40,200);

gyr1_LThigh40=resample(gyr1_LThigh,40,200);
gyr2_LThigh40=resample(gyr2_LThigh,40,200);
gyr3_LThigh40=resample(gyr3_LThigh,40,200);

gyr1_RThigh40=resample(gyr1_RThigh,40,200);
gyr2_RThigh40=resample(gyr2_RThigh,40,200);
gyr3_RThigh40=resample(gyr3_RThigh,40,200);

acc1_RShank40=resample(acc1_RShank,40,200);
acc2_RShank40=resample(acc2_RShank,40,200);
acc3_RShank40=resample(acc3_RShank,40,200);

acc1_LShank40=resample(acc1_LShank,40,200);
acc2_LShank40=resample(acc2_LShank,40,200);
acc3_LShank40=resample(acc3_LShank,40,200);






%---filter & detrend barometer signal
bar_RShank=RShank.bar(l1:l2,1); 
bar_LShank=LShank.bar(l1:l2,1);
bar_LThigh=LThigh.bar(l1:l2,1);
bar_RThigh=RThigh.bar(l1:l2,1);
bar_trunk=trunk.bar(l1:l2,1);

bar_RShank40=resample(bar_RShank,40,200);
bar_LShank40=resample(bar_LShank,40,200);
bar_LThigh40=resample(bar_LThigh,40,200);
bar_RThigh40=resample(bar_RThigh,40,200);
bar_trunk40=resample(bar_trunk,40,200);

%% TRY TO EXTRACT  THE ALTR FROM PRESSURE

alt_RThigh=pressure2elevation(bar_RThigh40);
alt_RThigh_filt=detrend(sgolayfilt(alt_RThigh,1,1001));
 
alt_LThigh=pressure2elevation(bar_LThigh40);
alt_LThigh_filt=detrend(sgolayfilt(alt_LThigh,1,1001));
 
alt_RShank=pressure2elevation(bar_RShank40);
alt_RShank_filt=detrend(sgolayfilt(alt_RShank,1,1001));
 
alt_LShank=pressure2elevation(bar_LShank40);
alt_LShank_filt=detrend(sgolayfilt(alt_LShank,1,1001));

alt_trunk=pressure2elevation(bar_trunk40);
alt_trunk_filt=detrend(sgolayfilt(alt_trunk,1,1001));

average_alt=(alt_LShank_filt+alt_RShank_filt)/2;

%----filter thigh frontal acc signals----------
acc1_RThigh_lpf = sgolayfilt(acc1_RThigh40,1,1001);
acc2_RThigh_lpf = sgolayfilt(acc2_RThigh40,1,1001);
acc3_RThigh_lpf = sgolayfilt(acc3_RThigh40,1,1001);

acc1_LThigh_lpf = sgolayfilt(acc1_LThigh40,1,1001);
acc2_LThigh_lpf = sgolayfilt(acc2_LThigh40,1,1001);
acc3_LThigh_lpf = sgolayfilt(acc3_LThigh40,1,1001);

acc1_trunk_lpf = sgolayfilt(acc1_trunk40,1,1001);
acc2_trunk_lpf = sgolayfilt(acc2_trunk40,1,1001);
acc3_trunk_lpf = sgolayfilt(acc3_trunk40,1,1001);

%---filter trunk vertical acc
load FIR-2-3Hz-40;



f_avTrunk = -filtfilt(Num, 1, RemoveDrift40Hz(acc1_trunk40));
f_alTrunk = filtfilt(Num, 1, RemoveDrift40Hz(acc2_trunk40));
f_afTrunk = filtfilt(Num, 1, RemoveDrift40Hz(acc3_trunk40));

t=(1:length(acc1_trunk_lpf))/(40*60);

%% title('acc trunk')



% setappdata(axis_selection,'gyr2_LShank40',gyr2_LShank40);
% setappdata(axis_selection,'gyr3_LShank40',gyr3_LShank40);
% setappdata(axis_selection,'gyr1_RShank40',gyr1_RShank40);
% setappdata(axis_selection,'gyr2_RShank40',gyr2_RShank40);
% setappdata(axis_selection,'gyr3_RShank40',gyr3_RShank40);
% setappdata(axis_selection,'acc1_RThigh_lpf',acc1_RThigh_lpf);
% setappdata(axis_selection,'acc2_RThigh_lpf',acc2_RThigh_lpf);
% setappdata(axis_selection,'acc3_RThigh_lpf',acc3_RThigh_lpf);
% setappdata(axis_selection,'acc1_trunk_lpf',acc1_trunk_lpf);
% setappdata(axis_selection,'acc2_trunk_lpf',acc2_trunk_lpf);
% setappdata(axis_selection,'acc3_trunk_lpf',acc3_trunk_lpf);
% setappdata(axis_selection,'t',t);

trunk_cell={acc1_trunk,acc2_trunk,acc3_trunk};
thigh_cell={acc1_RThigh,acc2_RThigh,acc3_RThigh;acc1_LThigh,acc2_LThigh,acc3_LThigh};
shank_cell={gyr1_LShank,gyr2_LShank,gyr3_LShank;gyr1_RShank,gyr2_RShank,gyr3_RShank};


f=classification(gyr1_LShank40,gyr2_LShank40,gyr3_LShank40,  acc1_LShank40,acc2_LShank40,acc3_LShank40,  gyr1_RShank40,gyr2_RShank40,gyr3_RShank40, acc1_RShank40,acc2_RShank40,acc3_RShank40,    gyr1_LThigh40,gyr2_LThigh40,gyr3_LThigh40, acc1_LThigh_lpf,acc2_LThigh_lpf,acc3_LThigh_lpf,  gyr1_RThigh40,gyr2_RThigh40,gyr3_RThigh40,  acc1_RThigh_lpf,acc2_RThigh_lpf,acc3_RThigh_lpf,   gyr1_trunk40,gyr2_trunk40,gyr3_trunk40,  acc1_trunk_lpf,acc2_trunk_lpf,acc3_trunk_lpf,t,trunk_cell,thigh_cell,shank_cell,acc1_trunk40,acc2_trunk40,acc3_trunk40);

disp('quiiiiiii');
disp(f);



end