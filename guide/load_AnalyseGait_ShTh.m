
function load_AnalyseGait_ShTh(config_all)
%% femur_length,tibia_length need to be given by user 


%function GaitAnalysis_CP(tail)
%LegDim=[.245*tail; .246*tail]; 
if(config_all==1)
    
full_config_struct=load('function_interaction/full_config_struct_gait.mat');
else
    full_config_struct=load('function_interaction/parts_struct_gait.mat');
end

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


% load left thigh
FileName_4=full_config_struct.FileName_LT;
Path_4=full_config_struct.PathName_LT;
s=strcat(Path_4,FileName_4);
mat_1=load(s);
LThigh=mat_1.LThigh;
disp([FileName_4,'    loaded']);
thigh_configuration=1; 

%load right thigh
FileName_5=full_config_struct.FileName_RT;
Path_5=full_config_struct.PathName_RT;
s=strcat(Path_5,FileName_5);
mat_1=load(s);
RThigh=mat_1.RThigh;
disp([FileName_5,'    loaded']);
thigh_configuration=3; 




[m1,n1]=size(LThigh.acc); [m2,n2]=size(RThigh.acc); [m3,n3]=size(LShank.acc);
[m4,n4]=size(RShank.acc);
l=min([m1 m2 m3 m4 ]);
l1=200*60*15;
l2=l-l1;
gyr1_LShank=LShank.gyr(l1:l2,1); gyr2_LShank=LShank.gyr(l1:l2,2); gyr3_LShank=LShank.gyr(l1:l2,3);
gyr1_RShank=RShank.gyr(l1:l2,1); gyr2_RShank=-RShank.gyr(l1:l2,2); gyr3_RShank=RShank.gyr(l1:l2,3);

gyr1_LThigh=LThigh.gyr(l1:l2,1); gyr2_LThigh=LThigh.gyr(l1:l2,2);gyr3_LThigh=LThigh.gyr(l1:l2,3);
gyr1_RThigh=RThigh.gyr(l1:l2,1); gyr2_RThigh=RThigh.gyr(l1:l2,2);gyr3_RThigh=RThigh.gyr(l1:l2,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 t=(1:length(gyr1_LThigh))/(200*60);
% figure
% %title('acc trunk')
% ax1=subplot(411),plot(t,gyr1_RThigh,'r','LineWidth',1)
% title('gyro Right thigh')
% hold on
% plot(t,gyr2_RThigh,'k','LineWidth',1)
% plot(t,gyr3_RThigh,'b','LineWidth',1)
% legend('gyr1','gyr2','gyr3');
% hold off
% 
% ax2=subplot(412),plot(t,gyr1_LThigh,'r','LineWidth',1)
% title('acc Left thigh')
% hold on
% plot(t,gyr2_LThigh,'k','LineWidth',1)
% plot(t,gyr3_LThigh,'b','LineWidth',1)
% legend('gyr1','gyr2','gyr3');
% 
% ax3=subplot(413), plot(t,gyr1_RShank,'r','LineWidth',1)
% title('gyro Right shank')
% hold on
% plot(t,gyr2_RShank,'k','LineWidth',1)
% plot(t,gyr3_RShank,'b','LineWidth',1)
% legend('gyr1','gyr2','gyr3');
% 
% ax4=subplot(414), plot(t,gyr1_LShank,'r','LineWidth',1)
% title('gyro Left shank')
% hold on
% plot(t,gyr2_LShank,'k','LineWidth',1)
% plot(t,gyr3_LShank,'b','LineWidth',1)
% legend('gyr1','gyr2','gyr3');
% xlabel('Time(min)');
% linkaxes([ax4 ax3, ax2 ,ax1],'x')


analyze_gait(gyr1_LThigh,gyr2_LThigh,gyr3_LThigh,gyr1_RThigh,gyr2_RThigh,gyr3_RThigh,gyr1_LShank,gyr2_LShank,gyr3_LShank,gyr1_RShank,gyr2_RShank,gyr3_RShank,t);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pitch_RShank=gyr3_RShank;
% Pitch_RThigh=gyr1_RThigh;
% 
% Pitch_LShank=-gyr3_LShank;
% Pitch_LThigh=gyr1_LThigh;
% 
% Shanks=[Pitch_RShank';Pitch_LShank']';
% Thighs=[Pitch_RThigh';Pitch_LThigh']';
% 
% figure
% ax1=subplot(211), plot(t,Pitch_RShank,'LineWidth',1)
% hold on
% ax1=subplot(211), plot(t,Pitch_RThigh,'LineWidth',1)
% legend('RShank','RThigh');
% hold off
% ax2=subplot(212), plot(t,Pitch_LShank,'LineWidth',1)
% hold on
% ax2=subplot(212), plot(t,Pitch_LThigh,'LineWidth',1)
% legend('LShank','LThigh');
% xlabel('Time(min)');
% linkaxes([ax2,ax1],'x');
% 
% pause
% close all
% res_gait = AutoGaitAnalyze_CPalsy(Shanks,Thighs,LegDim);
% save res_gait res_gait
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%extract kinematical curves for maximamal detected walking episode
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% find maximal walking episode
% [m1,n1]=size(res_gait);
% steps=[];
% for j=1:n1
%     steps(j)=res_gait(j).steps;
% end
% maxSteps=max(steps);
% indx_maxsteps=find(steps==maxSteps);
% 
% ShankAngleR_maxWalk = [];
% ThighAngleR_maxWalk = [];
% KneeAngleR_maxWalk = [];
%         
% ShankAngleL_maxWalk = [];
% ThighAngleL_maxWalk = [];
% KneeAngleL_maxWalk = [];
% 
% for j=indx_maxsteps:indx_maxsteps
%     [m2,n2]=size(res_gait(j).Cycle);
%      StanceR=nanmean([res_gait(j).Cycle(:).StanceR]);
%      StanceL=nanmean([res_gait(j).Cycle(:).StanceL]);
%     for k=1:n2-1
%         if isnan(res_gait(j).Cycle(k).HsR)==0 && isnan(res_gait(j).Cycle(k+1).HsR)==0 && isnan(res_gait(j).Cycle(k).HsL)==0 && isnan(res_gait(j).Cycle(k+1).HsL)==0
%             l1R=res_gait(j).start+res_gait(j).Cycle(k).HsR;
%             l2R=res_gait(j).start+res_gait(j).Cycle(k+1).HsR;
%             l1L=res_gait(j).start+res_gait(j).Cycle(k).HsL;
%             l2L=res_gait(j).start+res_gait(j).Cycle(k+1).HsL;
%             Pitch_RShank_Temp=Pitch_RShank(l1R:l2R);
%             Pitch_LShank_Temp=Pitch_LShank(l1L:l2L);
%             Pitch_RThigh_Temp=Pitch_RThigh(l1R:l2R);
%             Pitch_LThigh_Temp=Pitch_LThigh(l1L:l2L);
%             
%             ShankAngleR_Temp=cumtrapz(Pitch_RShank_Temp)/200;
%             ShankAngleR_maxWalk=[ShankAngleR_maxWalk resample(ShankAngleR_Temp,200,length(ShankAngleR_Temp))];
%             
%             ShankAngleL_Temp=cumtrapz(Pitch_LShank_Temp)/200;
%             ShankAngleL_maxWalk=[ShankAngleL_maxWalk resample(ShankAngleL_Temp,200,length(ShankAngleL_Temp))];
%             
%             ThighAngleR_Temp=cumtrapz(Pitch_RThigh_Temp)/200;
%             ThighAngleR_maxWalk=[ThighAngleR_maxWalk resample(ThighAngleR_Temp,200,length(ThighAngleR_Temp))];
%             
%             ThighAngleL_Temp=cumtrapz(Pitch_LThigh_Temp)/200;
%             ThighAngleL_maxWalk=[ThighAngleL_maxWalk resample(ThighAngleL_Temp,200,length(ThighAngleL_Temp))];
%             
%             KneeAngleR_Temp=ThighAngleR_Temp-ShankAngleR_Temp;
%             KneeAngleR_maxWalk=[KneeAngleR_maxWalk resample(KneeAngleR_Temp,200,length(KneeAngleR_Temp))];
%             
%             KneeAngleL_Temp=ThighAngleL_Temp-ShankAngleL_Temp;
%             KneeAngleL_maxWalk=[KneeAngleL_maxWalk resample(KneeAngleL_Temp,200,length(KneeAngleL_Temp))];
%         end
%    end
% end
% 
% 
% save ShankAngleR_maxWalk ShankAngleR_maxWalk;
% save ThighAngleR_maxWalk ThighAngleR_maxWalk;
% save KneeAngleR_maxWalk KneeAngleR_maxWalk;
%         
% save ShankAngleL_maxWalk ShankAngleL_maxWalk;
% save ThighAngleL_maxWalk ThighAngleL_maxWalk;
% save KneeAngleL_maxWalk KneeAngleL_maxWalk;
%   
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% filename = 'GaitAnalysisReport.xls';
% sheet = 1;
% xlRange = 'B4:X400';
% 
% walking_params_new = xlsread(filename,sheet,xlRange);
% save walking_params_new walking_params_new
