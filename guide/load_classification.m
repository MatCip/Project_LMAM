function load_classification(config_all) 
if(config_all==1)
    
full_config_struct=load('function_interaction/full_config_struct.mat');
disp('quiiiiiiii');
else
    full_config_struct=load('function_interaction/parts_struct.mat');
    disp('quaaaa');
end
thigh_configuration=0;

%load trunk
FileName_1=full_config_struct.FileName_trunk;
Path_1=full_config_struct.PathName_trunk;
s=strcat(Path_1,FileName_1);
mat_1=load(s);
trunk=mat_1.trunk;
disp([FileName_1,'    loaded']);

%load left shank
FileName_2=full_config_struct.FileName_LS;
Path_2=full_config_struct.PathName_LS;
s=strcat(Path_2,FileName_2);
mat_1=load(s);
LShank=mat_1.LShank;
disp([FileName_2,'    loaded']);


%load right shank
FileName_3=full_config_struct.FileName_RS;
Path_3=full_config_struct.PathName_RS;
s=strcat(Path_3,FileName_3);
mat_1=load(s);
RShank=mat_1.RShank;
disp([FileName_3,'    loaded']);


 try
step=1;
FileName_4=full_config_struct.FileName_LT;
Path_4=full_config_struct.PathName_LT;
s=strcat(Path_4,FileName_4);
mat_1=load(s);
LThigh=mat_1.LThigh;
disp([FileName_4,'    loaded']);
thigh_configuration=1;  %only left thigh

step=2;
FileName_5=full_config_struct.FileName_RT;
Path_5=full_config_struct.PathName_RT;
s=strcat(Path_5,FileName_5);
mat_1=load(s);
RThigh=mat_1.RThigh;
disp([FileName_5,'    loaded']);
thigh_configuration=3; %both

 catch
     
  if(step==1)
      try
         FileName_5=full_config_struct.FileName_RT;
         Path_5=full_config_struct.PathName_LT; 
         s=strcat(Path_5,FileName_5);
         mat_1=load(s);
         RThigh=mat_1.RThigh;
         disp([FileName_5,'    loaded']);
         thigh_configuration=2;  %only right thigh
      catch
          addpath(genpath('error_functions'))
                error_selection
      end
 end




 end





%% load the dimensions%%%%%%%%%%

[m3,n3]=size(LShank.acc);
[m4,n4]=size(RShank.acc);
[m5,n5]=size(trunk.acc);


if(thigh_configuration==3)
[m1,n1]=size(LThigh.acc); 
[m2,n2]=size(RThigh.acc);
l=min([m1 m2 m3 m4 m5]);
else
    if(thigh_configuration==1)
        [m1,n1]=size(LThigh.acc); 
        l=min([m1 m3 m4 m5]);
    else
        [m2,n2]=size(RThigh.acc);
        l=min([m2 m3 m4 m5]);
        
    end
end


%%%%%%%%%%%%%%%

l1=200*60*15;



%% reshaping the data and assigning the values%%%%
l2=l-l1;
acc1_LShank=LShank.acc(l1:l2,1); acc2_LShank=LShank.acc(l1:l2,2); acc3_LShank=LShank.acc(l1:l2,3);
gyr1_LShank=LShank.gyr(l1:l2,1); gyr2_LShank=LShank.gyr(l1:l2,2); gyr3_LShank=LShank.gyr(l1:l2,3);

acc1_RShank=RShank.acc(l1:l2,1); acc2_RShank=RShank.acc(l1:l2,2); acc3_RShank=RShank.acc(l1:l2,3);
gyr1_RShank=RShank.gyr(l1:l2,1); gyr2_RShank=-RShank.gyr(l1:l2,2); gyr3_RShank=RShank.gyr(l1:l2,3);

if(thigh_configuration==3)
acc1_LThigh=-LThigh.acc(l1:l2,1); acc2_LThigh=LThigh.acc(l1:l2,2);acc3_LThigh=LThigh.acc(l1:l2,3);
gyr1_LThigh=LThigh.gyr(l1:l2,1); gyr2_LThigh=LThigh.gyr(l1:l2,2);gyr3_LThigh=LThigh.gyr(l1:l2,3);

acc1_RThigh=RThigh.acc(l1:l2,1); acc2_RThigh=RThigh.acc(l1:l2,2); acc3_RThigh=RThigh.acc(l1:l2,3);
gyr1_RThigh=RThigh.gyr(l1:l2,1); gyr2_RThigh=RThigh.gyr(l1:l2,2);gyr3_RThigh=RThigh.gyr(l1:l2,3);
else
    if(thigh_configuration==1)
        acc1_LThigh=-LThigh.acc(l1:l2,1); acc2_LThigh=LThigh.acc(l1:l2,2);acc3_LThigh=LThigh.acc(l1:l2,3);
        gyr1_LThigh=LThigh.gyr(l1:l2,1); gyr2_LThigh=LThigh.gyr(l1:l2,2);gyr3_LThigh=LThigh.gyr(l1:l2,3);
    else
    acc1_RThigh=RThigh.acc(l1:l2,1); acc2_RThigh=RThigh.acc(l1:l2,2); acc3_RThigh=RThigh.acc(l1:l2,3);
    gyr1_RThigh=RThigh.gyr(l1:l2,1); gyr2_RThigh=RThigh.gyr(l1:l2,2);gyr3_RThigh=RThigh.gyr(l1:l2,3);
    end
end


acc1_trunk=trunk.acc(l1:l2,1); acc2_trunk=trunk.acc(l1:l2,2); acc3_trunk=trunk.acc(l1:l2,3);
gyr1_trunk=trunk.gyr(l1:l2,1); gyr2_trunk=trunk.gyr(l1:l2,2); gyr3_trunk=trunk.gyr(l1:l2,3);


%% decimating  NEW SAMPLE = (40/200) * OLD_VERSION
if(thigh_configuration==3)
acc1_LThigh40=resample(acc1_LThigh,40,200);
acc2_LThigh40=resample(acc2_LThigh,40,200);
acc3_LThigh40=resample(acc3_LThigh,40,200);

acc1_RThigh40=resample(acc1_RThigh,40,200);
acc2_RThigh40=resample(acc2_RThigh,40,200);
acc3_RThigh40=resample(acc3_RThigh,40,200);
else
    if(thigh_configuration==1)
        acc1_LThigh40=resample(acc1_LThigh,40,200);
        acc2_LThigh40=resample(acc2_LThigh,40,200);
        acc3_LThigh40=resample(acc3_LThigh,40,200);
    else
        acc1_RThigh40=resample(acc1_RThigh,40,200);
        acc2_RThigh40=resample(acc2_RThigh,40,200);
        acc3_RThigh40=resample(acc3_RThigh,40,200);
    end
end


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


if(thigh_configuration==3)
    gyr1_LThigh40=resample(gyr1_LThigh,40,200);
    gyr2_LThigh40=resample(gyr2_LThigh,40,200);
    gyr3_LThigh40=resample(gyr3_LThigh,40,200);

    gyr1_RThigh40=resample(gyr1_RThigh,40,200);
    gyr2_RThigh40=resample(gyr2_RThigh,40,200);
    gyr3_RThigh40=resample(gyr3_RThigh,40,200);
else
    if(thigh_configuration==1)
        gyr1_LThigh40=resample(gyr1_LThigh,40,200);
        gyr2_LThigh40=resample(gyr2_LThigh,40,200);
        gyr3_LThigh40=resample(gyr3_LThigh,40,200);
    else
        gyr1_RThigh40=resample(gyr1_RThigh,40,200);
        gyr2_RThigh40=resample(gyr2_RThigh,40,200);
        gyr3_RThigh40=resample(gyr3_RThigh,40,200);
    end
end




acc1_RShank40=resample(acc1_RShank,40,200);
acc2_RShank40=resample(acc2_RShank,40,200);
acc3_RShank40=resample(acc3_RShank,40,200);

acc1_LShank40=resample(acc1_LShank,40,200);
acc2_LShank40=resample(acc2_LShank,40,200);
acc3_LShank40=resample(acc3_LShank,40,200);






%---filter & detrend barometer signal
bar_RShank=RShank.bar(l1:l2,1); 
bar_LShank=LShank.bar(l1:l2,1);

if(thigh_configuration==3)
   bar_LThigh=LThigh.bar(l1:l2,1);
   bar_RThigh=RThigh.bar(l1:l2,1);
else
    if(thigh_configuration==1)
         bar_LThigh=LThigh.bar(l1:l2,1);
    else
         bar_RThigh=RThigh.bar(l1:l2,1);
    end
end

bar_trunk=trunk.bar(l1:l2,1);



bar_RShank40=resample(bar_RShank,40,200);
bar_LShank40=resample(bar_LShank,40,200);

if(thigh_configuration==3)
   bar_LThigh40=resample(bar_LThigh,40,200);
    bar_RThigh40=resample(bar_RThigh,40,200);
else
    if(thigh_configuration==1)
         bar_LThigh40=resample(bar_LThigh,40,200);
    else
         bar_RThigh40=resample(bar_RThigh,40,200);
    end
end

bar_trunk40=resample(bar_trunk,40,200);

%% TRY TO EXTRACT  THE ALTR FROM PRESSURE
addpath(genpath('physical_activity_functions'))


if(thigh_configuration==3)
           alt_RThigh=pressure2elevation(bar_RThigh40);
        alt_RThigh_filt=detrend(sgolayfilt(alt_RThigh,1,1001));

        alt_LThigh=pressure2elevation(bar_LThigh40);
        alt_LThigh_filt=detrend(sgolayfilt(alt_LThigh,1,1001));
else
    if(thigh_configuration==1)
          alt_LThigh=pressure2elevation(bar_LThigh40);
        alt_LThigh_filt=detrend(sgolayfilt(alt_LThigh,1,1001));
    else
        alt_RThigh=pressure2elevation(bar_RThigh40);
        alt_RThigh_filt=detrend(sgolayfilt(alt_RThigh,1,1001));
    end
end

alt_RShank=pressure2elevation(bar_RShank40);
alt_RShank_filt=detrend(sgolayfilt(alt_RShank,1,1001));
 
alt_LShank=pressure2elevation(bar_LShank40);
alt_LShank_filt=detrend(sgolayfilt(alt_LShank,1,1001));

alt_trunk=pressure2elevation(bar_trunk40);
alt_trunk_filt=detrend(sgolayfilt(alt_trunk,1,1001));

average_alt=(alt_LShank_filt+alt_RShank_filt)/2;

%----filter thigh frontal acc signals----------

if(thigh_configuration==3)
          acc1_RThigh_lpf = sgolayfilt(acc1_RThigh40,1,1001);
        acc2_RThigh_lpf = sgolayfilt(acc2_RThigh40,1,1001);
        acc3_RThigh_lpf = sgolayfilt(acc3_RThigh40,1,1001);

        acc1_LThigh_lpf = sgolayfilt(acc1_LThigh40,1,1001);
        acc2_LThigh_lpf = sgolayfilt(acc2_LThigh40,1,1001);
        acc3_LThigh_lpf = sgolayfilt(acc3_LThigh40,1,1001);
else
    if(thigh_configuration==1)
         acc1_LThigh_lpf = sgolayfilt(acc1_LThigh40,1,1001);
        acc2_LThigh_lpf = sgolayfilt(acc2_LThigh40,1,1001);
        acc3_LThigh_lpf = sgolayfilt(acc3_LThigh40,1,1001);
    else
          acc1_RThigh_lpf = sgolayfilt(acc1_RThigh40,1,1001);
        acc2_RThigh_lpf = sgolayfilt(acc2_RThigh40,1,1001);
        acc3_RThigh_lpf = sgolayfilt(acc3_RThigh40,1,1001);
    end
end


acc1_trunk_lpf = sgolayfilt(acc1_trunk40,1,1001);
acc2_trunk_lpf = sgolayfilt(acc2_trunk40,1,1001);
acc3_trunk_lpf = sgolayfilt(acc3_trunk40,1,1001);

%---filter trunk vertical acc
addpath(genpath('physical_activity_functions'))
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


if(thigh_configuration==3)
  thigh_cell={acc1_RThigh,acc2_RThigh,acc3_RThigh;acc1_LThigh,acc2_LThigh,acc3_LThigh};
else
    if(thigh_configuration==1)
        acc1_RThigh=0;
        acc2_RThigh=0;
        acc3_RThigh=0;
        gyr1_RThigh40=0;
        gyr2_RThigh40=0;
        gyr3_RThigh40=0;
        acc1_RThigh_lpf=false;
        acc2_RThigh_lpf=false;
        acc3_RThigh_lpf=false;
         thigh_cell={acc1_RThigh,acc2_RThigh,acc3_RThigh;acc1_LThigh,acc2_LThigh,acc3_LThigh};
    else
        acc1_LThigh=0;
        acc2_LThigh=0;
        acc3_LThigh=0;
        gyr1_LThigh40=0;
        gyr2_LThigh40=0;
        gyr3_LThigh40=0;
        acc1_LThigh_lpf=false;
        acc2_LThigh_lpf=false;
        acc3_LThigh_lpf=false;
        thigh_cell={acc1_RThigh,acc2_RThigh,acc3_RThigh;acc1_LThigh,acc2_LThigh,acc3_LThigh};
    end
end


trunk_cell={acc1_trunk,acc2_trunk,acc3_trunk};

shank_cell={gyr1_LShank,gyr2_LShank,gyr3_LShank;gyr1_RShank,gyr2_RShank,gyr3_RShank};


f=classification(gyr1_LShank40,gyr2_LShank40,gyr3_LShank40,  acc1_LShank40,acc2_LShank40,acc3_LShank40,  gyr1_RShank40,gyr2_RShank40,gyr3_RShank40, acc1_RShank40,acc2_RShank40,acc3_RShank40,    gyr1_LThigh40,gyr2_LThigh40,gyr3_LThigh40, acc1_LThigh_lpf,acc2_LThigh_lpf,acc3_LThigh_lpf,  gyr1_RThigh40,gyr2_RThigh40,gyr3_RThigh40,  acc1_RThigh_lpf,acc2_RThigh_lpf,acc3_RThigh_lpf,   gyr1_trunk40,gyr2_trunk40,gyr3_trunk40,  acc1_trunk_lpf,acc2_trunk_lpf,acc3_trunk_lpf,t,trunk_cell,thigh_cell,shank_cell,acc1_trunk40,acc2_trunk40,acc3_trunk40,average_alt,thigh_configuration);

disp('quiiiiiii');
disp(f);



end