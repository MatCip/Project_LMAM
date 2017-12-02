
function PlotGaitResults3(RightLegLength,LeftLegLength,path_out)
%style='Heading 1';
style='Titolo 1'; % if Word configured in French

Rll=RightLegLength/100;
Lll=LeftLegLength/100;
% Rll=(Rfemur_length+Rtibia_length)/100;
% Lll=(Lfemur_length+Ltibia_length)/100;
ll=(Rll+Lll)/2;
%ll=0.78; %leg length in meters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load ref data: gait parameters control group
load RefValuesGaitParams_TD 
load limp_TD_gr1w 
load cad_TD_gr1w 
load steps_TD_gr1w 
load speed_TD_gr1w 
load Nspeed_TD_gr1w 
load ds_TD_gr1w 
load gct_TD_gr1w 
load slR_TD_gr1w 
load slL_TD_gr1w 
load NslR_TD_gr1w 
load NslL_TD_gr1w 
load swingR_TD_gr1w 
load swingL_TD_gr1w 
load stanceR_TD_gr1w
load stanceL_TD_gr1w 
load ShAngR_TD_gr1w 
load ShAngL_TD_gr1w 
load ThAngR_TD_gr1w 
load ThAngL_TD_gr1w 
load KnAngR_TD_gr1w 
load KnAngL_TD_gr1w 
load SR_sl_TD_gr1w 
load SR_sw_TD_gr1w 
load SR_st_TD_gr1w 
load SR_knan_TD_gr1w 

cad_TD=cad_TD_gr1w'; 
limp_TD=limp_TD_gr1w; 
steps_TD=steps_TD_gr1w; 
speed_TD=speed_TD_gr1w; 
Nspeed_TD=Nspeed_TD_gr1w; 
ds_TD=ds_TD_gr1w; 
gct_TD=gct_TD_gr1w; 
slR_TD=slR_TD_gr1w; 
slL_TD=slL_TD_gr1w; 
NslR_TD=NslR_TD_gr1w; 
NslL_TD=NslL_TD_gr1w; 
swingR_TD=swingR_TD_gr1w; 
swingL_TD=swingL_TD_gr1w; 
stanceR_TD=stanceR_TD_gr1w;
stanceL_TD=stanceL_TD_gr1w; 
ShAngR_TD=ShAngR_TD_gr1w; 
ShAngL_TD=ShAngL_TD_gr1w; 
ThAngR_TD=ThAngR_TD_gr1w;  
ThAngL_TD=ThAngL_TD_gr1w; 
KnAngR_TD=KnAngR_TD_gr1w; 
KnAngL_TD=KnAngL_TD_gr1w; 
SR_sl_TD=SR_sl_TD_gr1w; 
SR_sw_TD=SR_sw_TD_gr1w; 
SR_st_TD=SR_st_TD_gr1w; 
SR_knan_TD=SR_knan_TD_gr1w; 


[mc,nc]=size(cad_TD)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load([path_out,'/walking_params_new'])

[nb_trials,nb_params]=size(walking_params_new)
MeanParamsGait_all=[]; SDParamsGait_all=[];MeanParamsGait=[]; SDParamsGait=[];
k=2;
for j=1:nb_trials
  MeanParamsGait_all(k-1,:)=xlsread([path_out,'/GaitAnalysisReport.xls'],k,'B3:AE3') ;
  SDParamsGait_all(k-1,:)=xlsread([path_out,'/GaitAnalysisReport.xls'],k,'B4:AE4') ;
  k=k+1;
end
PATH_GAIT=[path_out,'/gait_results']
mkdir (PATH_GAIT);

%select to compare with TD group only walking episodes (speed<=1.25m/s))
th_sp=1.25;
k1=find(MeanParamsGait_all(:,16)<=th_sp);
steps=2*walking_params_new(:,1);
m_steps=steps(k1);
MeanParamsGait=MeanParamsGait_all(k1,:);
SDParamsGait=SDParamsGait_all(k1,:);
save MeanParamsGait MeanParamsGait
save SDParamsGait SDParamsGait
clear walking_params_new

%%asymmetry
for j=1:length(k1)
    SR_sl(j)=SymmetryRatio(MeanParamsGait(j,14),MeanParamsGait(j,15));
    SI_sl(j)=SymmetryIndex(MeanParamsGait(j,14),MeanParamsGait(j,15));
    GA_sl(j)=GaitAsymmetry(MeanParamsGait(j,14),MeanParamsGait(j,15));
    
    SR_sw(j)=SymmetryRatio(MeanParamsGait(j,4),MeanParamsGait(j,5));
    SI_sw(j)=SymmetryIndex(MeanParamsGait(j,4),MeanParamsGait(j,5));
    GA_sw(j)=GaitAsymmetry(MeanParamsGait(j,4),MeanParamsGait(j,5));
    
    SR_st(j)=SymmetryRatio(MeanParamsGait(j,7),MeanParamsGait(j,8));
    SI_st(j)=SymmetryIndex(MeanParamsGait(j,7),MeanParamsGait(j,8));
    GA_st(j)=GaitAsymmetry(MeanParamsGait(j,7),MeanParamsGait(j,8));
    
    SR_skan(j)=SymmetryRatio(MeanParamsGait(j,20),MeanParamsGait(j,21));
    SI_skan(j)=SymmetryIndex(MeanParamsGait(j,20),MeanParamsGait(j,21));
    GA_skan(j)=GaitAsymmetry(MeanParamsGait(j,20),MeanParamsGait(j,21));
    
    SR_than(j)=SymmetryRatio(MeanParamsGait(j,23),MeanParamsGait(j,24));
    SI_than(j)=SymmetryIndex(MeanParamsGait(j,23),MeanParamsGait(j,24));
    GA_than(j)=GaitAsymmetry(MeanParamsGait(j,23),MeanParamsGait(j,24));
    
    SR_knan(j)=SymmetryRatio(MeanParamsGait(j,26),MeanParamsGait(j,27));
    SI_knan(j)=SymmetryIndex(MeanParamsGait(j,26),MeanParamsGait(j,27));
    GA_knan(j)=GaitAsymmetry(MeanParamsGait(j,26),MeanParamsGait(j,27));
end
%%%%%%%%%%%%%%%%%%%%%%%%
m_cad=MeanParamsGait(:,1);
m_gct=MeanParamsGait(:,2);
m_speed=MeanParamsGait(:,16);
m_DS=MeanParamsGait(:,11);
m_limp=MeanParamsGait(:,12);
m_sl_R=MeanParamsGait(:,14);
m_sl_L=MeanParamsGait(:,15);
m_swing_R=MeanParamsGait(:,4);
m_swing_L=MeanParamsGait(:,5);
m_stance_R=MeanParamsGait(:,7);
m_stance_L=MeanParamsGait(:,8);
m_ShAng_R=MeanParamsGait(:,20);
m_ShAng_L=MeanParamsGait(:,21);
m_ThAng_R=MeanParamsGait(:,23);
m_ThAng_L=MeanParamsGait(:,24);
m_KnAng_R=MeanParamsGait(:,26);
m_KnAng_L=MeanParamsGait(:,27);
m_Nspeed=MeanParamsGait(:,16)/ll;
m_Nsl_R=MeanParamsGait(:,14)/Rll;
m_Nsl_L=MeanParamsGait(:,15)/Lll;
m_SR_sl=mean(SR_sl);
m_SI_sl=mean(SI_sl);
m_GA_sl=mean(GA_sl);
m_SR_st=mean(SR_st);
m_SI_st=mean(SI_st);
m_GA_st=mean(GA_st);
m_SR_sw=mean(SR_sw);
m_SI_sw=mean(SI_sw);
m_GA_sw=mean(GA_sw);
m_SR_knan=mean(SR_knan);
m_SI_knan=mean(SI_knan);
m_GA_knan=mean(GA_knan);



sd_cad=SDParamsGait(:,1);
sd_gct=SDParamsGait(:,2);
sd_speed=SDParamsGait(:,16);
sd_DS=SDParamsGait(:,11);
sd_limp=SDParamsGait(:,12);
sd_sl_R=SDParamsGait(:,14);
sd_sl_L=SDParamsGait(:,15);
sd_swing_R=SDParamsGait(:,4);
sd_swing_L=SDParamsGait(:,5);
sd_stance_R=SDParamsGait(:,7);
sd_stance_L=SDParamsGait(:,8);
sd_ShAng_R=SDParamsGait(:,20);
sd_ShAng_L=SDParamsGait(:,21);
sd_ThAng_R=SDParamsGait(:,23);
sd_ThAng_L=SDParamsGait(:,24);
sd_KnAng_R=SDParamsGait(:,26);
sd_KnAng_L=SDParamsGait(:,27);
sd_SR_sl=std(SR_sl);
sd_SI_sl=std(SI_sl);
sd_GA_sl=std(GA_sl);
sd_SR_st=std(SR_st);
sd_SI_st=std(SI_st);
sd_GA_st=std(GA_st);
sd_SR_sw=std(SR_sw);
sd_SI_sw=std(SI_sw);
sd_GA_sw=std(GA_sw);
sd_SR_knan=std(SR_knan);
sd_SI_knan=std(SI_knan);
sd_GA_knan=std(GA_knan);

sd_Nspeed=SDParamsGait(:,16)/ll;
sd_Nsl_R=SDParamsGait(:,14)/Rll;
sd_Nsl_L=SDParamsGait(:,15)/Lll;


%%%%%%%%%%%%%%%%%%%%%%%%
[mp,np]=size(m_cad)
[m,n]=size(MeanParamsGait)
m=m+1;
xt=1:m;



fig125=figure   %cadence
set(fig125,'visible','off');
subplot(121);
x(1:m)=RefValuesGaitParams_TD(3,1);
a(1:m)=RefValuesGaitParams_TD(3,1)+RefValuesGaitParams_TD(3,2);
b(1:m)=RefValuesGaitParams_TD(3,1)-RefValuesGaitParams_TD(3,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
set(gca,'Fontsize',12)
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_cad,m_cad)
set(h(1),'FaceColor','b');
xlabel('walking periods')
ylabel('steps/min')
xlim(gca,[0,m]);
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(122),boxplot([cad_TD; m_cad],group); set(gca,'Fontsize',12)
ylim(gca,[40,180]); 
%xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Cadence','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/Cadence');
savefig(fig125,[path,'.fig']);
saveas(fig125,path,'bmp')


% saveas(fig1,'Cadence','')
% saveas(fig1,'Cadence','bmp')

% 

% 
fig2=figure %speed
set(fig2,'visible','off');
subplot(121);
x(1:m)=RefValuesGaitParams_TD(1,1);
a(1:m)=RefValuesGaitParams_TD(1,1)+RefValuesGaitParams_TD(1,2);
b(1:m)=RefValuesGaitParams_TD(1,1)-RefValuesGaitParams_TD(1,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_speed,m_speed)
set(h(1),'FaceColor','b');
set(h(1),'erasemode','background');
xlabel('walking periods')
ylabel('m/s')
set(gca,'Fontsize',12)
xlim(gca,[0,m]);
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(122),boxplot([speed_TD; m_speed],group); set(gca,'Fontsize',12);
%xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Speed','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/Speed');
savefig(fig2,[path,'.fig']);
saveas(fig2,path,'bmp')
% 
fig22=figure %normalized speed
set(fig22,'visible','off');
subplot(121);
x(1:m)=RefValuesGaitParams_TD(2,1);
a(1:m)=RefValuesGaitParams_TD(2,1)+RefValuesGaitParams_TD(2,2);
b(1:m)=RefValuesGaitParams_TD(2,1)-RefValuesGaitParams_TD(2,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_Nspeed,m_Nspeed)
set(h(1),'FaceColor','b');
set(h(1),'erasemode','background');
xlabel('walking periods')
ylabel('m/s')
set(gca,'Fontsize',12)
xlim(gca,[0,m]);
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(122),boxplot([Nspeed_TD; m_Nspeed],group); set(gca,'Fontsize',12);
%xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Normalized Speed','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/Normalized_Speed');
savefig(fig22,[path,'.fig']);
saveas(fig22,path,'bmp')

% 
% 
fig3=figure  %double support
set(fig3,'visible','off');
subplot(121);
x(1:m)=RefValuesGaitParams_TD(5,1);
a(1:m)=RefValuesGaitParams_TD(5,1)+RefValuesGaitParams_TD(5,2);
b(1:m)=RefValuesGaitParams_TD(5,1)-RefValuesGaitParams_TD(5,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_DS,m_DS)
set(h(1),'FaceColor','b');
xlabel('walking periods')
ylabel('% gait cycle')
xlim(gca,[0,m]);
ylim(gca,[0,60]);
set(gca,'Fontsize',12)
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(122),boxplot([ds_TD; m_DS],group); set(gca,'Fontsize',12);
%xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Double Support','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/Double_Support');
savefig(fig3,[path,'.fig']);
saveas(fig3,path,'bmp')
% 
% 
fig3b=figure  %gct
set(fig3b,'visible','off');
subplot(121);
x(1:m)=RefValuesGaitParams_TD(4,1);
a(1:m)=RefValuesGaitParams_TD(4,1)+RefValuesGaitParams_TD(4,2);
b(1:m)=RefValuesGaitParams_TD(4,1)-RefValuesGaitParams_TD(4,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_gct,m_gct)
set(h(1),'FaceColor','b');
xlabel('walking periods')
ylabel('(s)')
xlim(gca,[0,m]);
set(gca,'Fontsize',12)
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(122),boxplot([gct_TD; m_gct],group); set(gca,'Fontsize',12);
%xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Gait cycle time','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/Gait_cycle_time');
savefig(fig3b,[path,'.fig']);
saveas(fig3b,path,'bmp')
% 
% %%%%%%%%%%%%%%%%%%
% 
fig4=figure  %shank angle
set(fig4,'visible','off');
limy=max([RefValuesGaitParams_TD(14,1)+RefValuesGaitParams_TD(14,2),RefValuesGaitParams_TD(15,1)+RefValuesGaitParams_TD(15,2),max(m_ShAng_R)+max(sd_ShAng_R),max(m_ShAng_L)+max(sd_ShAng_L)]);
subplot(221)
title('right')
x(1:m)=RefValuesGaitParams_TD(14,1);
a(1:m)=RefValuesGaitParams_TD(14,1)+RefValuesGaitParams_TD(14,2);
b(1:m)=RefValuesGaitParams_TD(14,1)-RefValuesGaitParams_TD(14,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]); ylim(gca,[0,limy]);
hold on
h=barwitherr_ani(sd_ShAng_R,m_ShAng_R)
set(h(1),'FaceColor',[0 0.5 0]);
xlabel('walking periods')
ylabel('degrees')
xlim(gca,[0,m]); ylim(gca,[0,limy]);
set(gca,'Fontsize',12)
hold off

subplot(222)
title('left')
x(1:m)=RefValuesGaitParams_TD(15,1);
a(1:m)=RefValuesGaitParams_TD(15,1)+RefValuesGaitParams_TD(15,2);
b(1:m)=RefValuesGaitParams_TD(15,1)-RefValuesGaitParams_TD(15,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);ylim(gca,[0,limy]);
hold on
h=barwitherr_ani(sd_ShAng_L,m_ShAng_L)
set(h(1),'FaceColor',[0.5 0 0.5]);
xlabel('walking periods')
%ylabel('degrees')
xlim(gca,[0,m]); ylim(gca,[0,limy]);
set(gca,'Fontsize',12)
hold off
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(223),boxplot([ShAngR_TD; m_ShAng_R],group); set(gca,'Fontsize',12),ylim(gca,[min([m_ShAng_R' m_ShAng_L' ShAngR_TD' ShAngL_TD']),max([m_ShAng_R' m_ShAng_L' ShAngR_TD' ShAngL_TD'])]); ylabel('degrees')
%xticklabel_rotate([],10,[],'Fontsize',12)
subplot(224),boxplot([ShAngL_TD; m_ShAng_L],group); ylim(gca,[min([m_ShAng_R' m_ShAng_L' ShAngR_TD' ShAngL_TD']),max([m_ShAng_R' m_ShAng_L' ShAngR_TD' ShAngL_TD'])]);set(gca,'Fontsize',12)
%xticklabel_rotate([],10,[],'Fontsize',12)
supertitle('Sagital Shank Angle:Right,Left','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/ShankAngle');
savefig(fig4,[path,'.fig']);
saveas(fig4,path,'bmp')

% %%%%%%%%%%%%%%%%%%
limy=max([RefValuesGaitParams_TD(16,1)+RefValuesGaitParams_TD(16,2),RefValuesGaitParams_TD(17,1)+RefValuesGaitParams_TD(17,2),max(m_ThAng_R)+max(sd_ThAng_R),max(m_ThAng_L)+max(sd_ThAng_L)]);
fig4x=figure  %Thigh angle
set(fig4x,'visible','off');
subplot(221)
title('right')
x(1:m)=RefValuesGaitParams_TD(16,1);
a(1:m)=RefValuesGaitParams_TD(16,1)+RefValuesGaitParams_TD(16,2);
b(1:m)=RefValuesGaitParams_TD(16,1)-RefValuesGaitParams_TD(16,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]); ylim(gca,[0,limy]);
hold on
h=barwitherr_ani(sd_ThAng_R,m_ThAng_R)
set(h(1),'FaceColor',[0 0.5 0]);
xlabel('walking periods')
ylabel('degrees')
xlim(gca,[0,m]); ylim(gca,[0,limy]);
set(gca,'Fontsize',12)
hold off

subplot(222)
x(1:m)=RefValuesGaitParams_TD(17,1);
a(1:m)=RefValuesGaitParams_TD(17,1)+RefValuesGaitParams_TD(17,2);
b(1:m)=RefValuesGaitParams_TD(17,1)-RefValuesGaitParams_TD(17,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]); ylim(gca,[0,limy]);
hold on
h=barwitherr_ani(sd_ThAng_L,m_ThAng_L)
set(h(1),'FaceColor',[0.5 0 0.5]);
xlabel('walking periods')
%ylabel('degrees')
xlim(gca,[0,m]); ylim(gca,[0,limy]);
set(gca,'Fontsize',12)
hold off
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(223),boxplot([ThAngR_TD; m_ThAng_R],group); set(gca,'Fontsize',12),ylim(gca,[min([m_ThAng_R' m_ThAng_L' ThAngR_TD' ThAngL_TD']),max([m_ThAng_R' m_ThAng_L' ThAngR_TD' ThAngL_TD'])]); ylabel('degrees')
%xticklabel_rotate([],10,[],'Fontsize',12)
subplot(224),boxplot([ThAngL_TD; m_ThAng_L],group); ylim(gca,[min([m_ThAng_R' m_ThAng_L' ThAngR_TD' ThAngL_TD']),max([m_ThAng_R' m_ThAng_L' ThAngR_TD' ThAngL_TD'])]);set(gca,'Fontsize',12)
%xticklabel_rotate([],10,[],'Fontsize',12)
supertitle('Sagital Thigh Angle:Right,Left','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/ThighAngle');
savefig(fig4x,[path,'.fig']);
saveas(fig4x,path,'bmp')
% 
%
fig4y=figure  %Knee angle
set(fig4y,'visible','off');
limy=max([RefValuesGaitParams_TD(18,1)+RefValuesGaitParams_TD(18,2),RefValuesGaitParams_TD(19,1)+RefValuesGaitParams_TD(19,2),max(m_KnAng_R)+max(sd_KnAng_R),max(m_KnAng_L)+max(sd_KnAng_L)]);
subplot(221)
title('right')
x(1:m)=RefValuesGaitParams_TD(18,1);
a(1:m)=RefValuesGaitParams_TD(18,1)+RefValuesGaitParams_TD(18,2);
b(1:m)=RefValuesGaitParams_TD(18,1)-RefValuesGaitParams_TD(18,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_KnAng_R,m_KnAng_R)
set(h(1),'FaceColor',[0 0.5 0]);
xlabel('walking periods')
ylabel('degrees')
xlim(gca,[0,m]); 
set(gca,'Fontsize',12)
hold off

subplot(222)
title('left')
x(1:m)=RefValuesGaitParams_TD(19,1);
a(1:m)=RefValuesGaitParams_TD(19,1)+RefValuesGaitParams_TD(19,2);
b(1:m)=RefValuesGaitParams_TD(19,1)-RefValuesGaitParams_TD(19,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_KnAng_L,m_KnAng_L)
set(h(1),'FaceColor',[0.5 0 0.5]);
xlabel('walking periods')
%ylabel('degrees')
xlim(gca,[0,m]); 
set(gca,'Fontsize',12)
hold off
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(223),boxplot([KnAngR_TD; m_KnAng_R],group);  set(gca,'Fontsize',12),ylim(gca,[min([m_KnAng_R' m_KnAng_L' KnAngR_TD' KnAngL_TD']),max([m_KnAng_R' m_KnAng_L' KnAngR_TD' KnAngL_TD'])]); ylabel('degrees')
%xticklabel_rotate([],10,[],'Fontsize',12)
subplot(224),boxplot([KnAngL_TD; m_KnAng_L],group);  ylim(gca,[min([m_KnAng_R' m_KnAng_L' KnAngR_TD' KnAngL_TD']),max([m_KnAng_R' m_KnAng_L' KnAngR_TD' KnAngL_TD'])]);set(gca,'Fontsize',12)
%xticklabel_rotate([],10,[],'Fontsize',12)
supertitle('Sagital Knee Angle:Right,Left','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/KneeAngle');
savefig(fig4y,[path,'.fig']);
saveas(fig4y,path,'bmp')
% 
% %%%%%%%%%%%%%%%%%%
% 
fig5=figure  %stride length
set(fig5,'visible','off');
limy=max([RefValuesGaitParams_TD(6,1)+RefValuesGaitParams_TD(6,2),RefValuesGaitParams_TD(7,1)+RefValuesGaitParams_TD(7,2),max(m_sl_R)+max(sd_sl_R),max(m_sl_L)+max(sd_sl_L)]);
subplot(221)
x(1:m)=RefValuesGaitParams_TD(6,1);
a(1:m)=RefValuesGaitParams_TD(6,1)+RefValuesGaitParams_TD(6,2);
b(1:m)=RefValuesGaitParams_TD(6,1)-RefValuesGaitParams_TD(6,2);
plot(x,'r','LineWidth',4)
ylim(gca,[0,2.5]); 
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
ylim(gca,[0,2.5]); 
hold on
h=barwitherr_ani(sd_sl_R,m_sl_R)
set(h(1),'FaceColor',[0 0.5 0]);
xlabel('walking periods')
ylabel('m')
xlim(gca,[0,m]); 
ylim(gca,[0,2.5]); 
set(gca,'Fontsize',12)
hold off

subplot(222)
x(1:m)=RefValuesGaitParams_TD(7,1);
a(1:m)=RefValuesGaitParams_TD(7,1)+RefValuesGaitParams_TD(7,2);
b(1:m)=RefValuesGaitParams_TD(7,1)-RefValuesGaitParams_TD(7,2);
plot(x,'r','LineWidth',4)
ylim(gca,[0,2.5]); 
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
ylim(gca,[0,2.5]); 
hold on
h=barwitherr_ani(sd_sl_L,m_sl_L)
set(h(1),'FaceColor',[0.5 0 0.5]);
xlabel('walking periods')
%ylabel('degrees')
xlim(gca,[0,m]);
ylim(gca,[0,2.5]); 
set(gca,'Fontsize',12)
hold off
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(223),boxplot([slR_TD; m_sl_R],group);set(gca,'Fontsize',12),ylim(gca,[min([m_sl_R' m_sl_L' slR_TD' slL_TD']),max([2])]); ylabel('m')
%xticklabel_rotate([],10,[],'Fontsize',12)
ylim(gca,[0,2]); 
subplot(224),boxplot([slL_TD; m_sl_L],group); ylim(gca,[min([m_sl_R' m_sl_L' slR_TD' slL_TD']),max([2])]);set(gca,'Fontsize',12)
ylim(gca,[0,2]); 
%xticklabel_rotate([],10,[],'Fontsize',12)
supertitle('Stride Length:Right,Left','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/StrideLength');
savefig(fig5,[path,'.fig']);
saveas(fig5,path,'bmp')
% %%%%%%%%%%%%%%
% 
fig5y=figure  %stride length
set(fig5y,'visible','off');
limy=max([RefValuesGaitParams_TD(8,1)+RefValuesGaitParams_TD(8,2),RefValuesGaitParams_TD(9,1)+RefValuesGaitParams_TD(9,2),max(m_Nsl_R)+max(sd_Nsl_R),max(m_Nsl_L)+max(sd_Nsl_L)]);
subplot(221)
x(1:m)=RefValuesGaitParams_TD(8,1);
a(1:m)=RefValuesGaitParams_TD(8,1)+RefValuesGaitParams_TD(8,2);
b(1:m)=RefValuesGaitParams_TD(8,1)-RefValuesGaitParams_TD(8,2);
plot(x,'r','LineWidth',4)
ylim(gca,[0,2.5]);
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
ylim(gca,[0,2.5]);
hold on
h=barwitherr_ani(sd_Nsl_R,m_Nsl_R)
set(h(1),'FaceColor',[0 0.5 0]);
xlabel('walking periods')
ylabel('m')
xlim(gca,[0,m]); 
ylim(gca,[0,2.5]); 
set(gca,'Fontsize',12)
hold off

subplot(222)
x(1:m)=RefValuesGaitParams_TD(9,1);
a(1:m)=RefValuesGaitParams_TD(9,1)+RefValuesGaitParams_TD(9,2);
b(1:m)=RefValuesGaitParams_TD(9,1)-RefValuesGaitParams_TD(9,2);
plot(x,'r','LineWidth',4)
ylim(gca,[0,2.5]); 
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
ylim(gca,[0,2.5]); 
hold on
h=barwitherr_ani(sd_Nsl_L,m_Nsl_L)
set(h(1),'FaceColor',[0.5 0 0.5]);
xlabel('walking periods')
%ylabel('degrees')
xlim(gca,[0,m]); 
ylim(gca,[0,2.5]); 
set(gca,'Fontsize',12)
hold off
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(223),boxplot([NslR_TD; m_Nsl_R],group); set(gca,'Fontsize',12),ylim(gca,[min([m_Nsl_R' m_Nsl_L' NslR_TD' NslL_TD']),max([m_Nsl_R' m_Nsl_L' NslR_TD' NslL_TD'])]); ylabel('m')
%xticklabel_rotate([],10,[],'Fontsize',12)
ylim(gca,[0,2]); 
subplot(224),boxplot([NslL_TD; m_Nsl_L],group); ylim(gca,[min([m_Nsl_R' m_Nsl_L' NslR_TD' NslL_TD']),max([m_Nsl_R' m_Nsl_L' NslR_TD' NslL_TD'])]);set(gca,'Fontsize',12)
%xticklabel_rotate([],10,[],'Fontsize',12)
ylim(gca,[0,2]); 
supertitle('Normalized Stride Length:Right,Left','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/Normal_Stride_length');
savefig(fig5y,[path,'.fig']);
saveas(fig5y,path,'bmp')
% %%%%%%%%%%%%%%
% 
% 
fig6=figure  %swing 
set(fig6,'visible','off');
limy=max([RefValuesGaitParams_TD(12,1)+RefValuesGaitParams_TD(12,2),RefValuesGaitParams_TD(13,1)+RefValuesGaitParams_TD(13,2),max(m_swing_R)+max(sd_swing_R),max(m_swing_L)+max(sd_swing_L)]);
subplot(221)
x(1:m)=RefValuesGaitParams_TD(12,1);
a(1:m)=RefValuesGaitParams_TD(12,1)+RefValuesGaitParams_TD(12,2);
b(1:m)=RefValuesGaitParams_TD(12,1)-RefValuesGaitParams_TD(12,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_swing_R,m_swing_R)
set(h(1),'FaceColor',[0 0.5 0]);
xlabel('walking periods')
ylabel('%')
xlim(gca,[0,m]); 
set(gca,'Fontsize',12)
hold off

subplot(222)
title('left')
x(1:m)=RefValuesGaitParams_TD(13,1);
a(1:m)=RefValuesGaitParams_TD(13,1)+RefValuesGaitParams_TD(13,2);
b(1:m)=RefValuesGaitParams_TD(13,1)-RefValuesGaitParams_TD(13,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_swing_L,m_swing_L)
set(h(1),'FaceColor',[0.5 0 0.5]);
xlabel('walking periods')
%ylabel('degrees')
xlim(gca,[0,m]); 
set(gca,'Fontsize',12)
hold off
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(223),boxplot([swingR_TD; m_swing_R],group); set(gca,'Fontsize',12),ylim(gca,[min([m_swing_R' m_swing_L' swingR_TD' swingL_TD']),max([m_swing_R' m_swing_L' swingR_TD' swingL_TD'])]); ylabel('%')
%xticklabel_rotate([],10,[],'Fontsize',12)
subplot(224),boxplot([swingL_TD; m_swing_L],group); ylim(gca,[min([m_swing_R' m_swing_L' swingR_TD' swingL_TD']),max([m_swing_R' m_swing_L' swingR_TD' swingL_TD'])]);set(gca,'Fontsize',12)
%xticklabel_rotate([],10,[],'Fontsize',12)
supertitle('Swing:Right,Left','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/Swing');
savefig(fig6,[path,'.fig']);
saveas(fig6,path,'bmp')
% %%%%%%%%%%%%%%
% 
fig7=figure  %stance
set(fig7,'visible','off');
limy=max([RefValuesGaitParams_TD(10,1)+RefValuesGaitParams_TD(10,2),RefValuesGaitParams_TD(11,1)+RefValuesGaitParams_TD(11,2),max(m_stance_R)+max(sd_stance_R),max(m_stance_L)+max(sd_stance_L)]);
subplot(221)
x(1:m)=RefValuesGaitParams_TD(10,1);
a(1:m)=RefValuesGaitParams_TD(10,1)+RefValuesGaitParams_TD(10,2);
b(1:m)=RefValuesGaitParams_TD(10,1)-RefValuesGaitParams_TD(10,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_stance_R,m_stance_R)
set(h(1),'FaceColor',[0 0.5 0]);
xlabel('walking periods')
ylabel('%')
xlim(gca,[0,m]); 
set(gca,'Fontsize',12)
hold off

subplot(222)
title('left')
x(1:m)=RefValuesGaitParams_TD(11,1);
a(1:m)=RefValuesGaitParams_TD(11,1)+RefValuesGaitParams_TD(11,2);
b(1:m)=RefValuesGaitParams_TD(11,1)-RefValuesGaitParams_TD(11,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_stance_L,m_stance_L)
set(h(1),'FaceColor',[0.5 0 0.5]);
xlabel('walking periods')
%ylabel('degrees')
xlim(gca,[0,m]); 
set(gca,'Fontsize',12)
hold off
hold off
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(223),boxplot([stanceR_TD; m_stance_R],group); set(gca,'Fontsize',12),ylim(gca,[min([m_stance_R' m_stance_L' stanceR_TD' stanceL_TD']),max([m_stance_R' m_stance_L' stanceR_TD' stanceL_TD'])]); ylabel('%')
%xticklabel_rotate([],10,[],'Fontsize',12)
subplot(224),boxplot([stanceL_TD; m_stance_L],group); ylim(gca,[min([m_stance_R' m_stance_L' stanceR_TD' stanceL_TD']),max([m_stance_R' m_stance_L' stanceR_TD' stanceL_TD'])]);set(gca,'Fontsize',12)
%xticklabel_rotate([],10,[],'Fontsize',12)
supertitle('Stance:Right,Left','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/Stance');
savefig(fig7,[path,'.fig']);
saveas(fig7,path,'bmp')
%%%%%%%%%%%%%%

% 
% % % % % fig20=figure %symmetry
% % % % % subplot(221);
% % % % % title('SrideLength')
% % % % % mas=[mean(SR_sl_TD); m_SR_sl];
% % % % % sas=[std(SR_sl_TD); sd_SR_sl];
% % % % % barwitherr_ani(mas,sas);
% % % % % set(gca,'XTickLabel',{'TD group','CP patient'})
% % % % % title('StrideLength')
% % % % % ylabel('Symmetry Index')
% % % % % %xticklabel_rotate([],45,[],'Fontsize',12)
% % % % % 
% % % % % subplot(224);
% % % % % title('Stance')
% % % % % mas=[mean(SR_st_TD); m_SR_st];
% % % % % sas=[std(SR_st_TD); sd_SR_st];
% % % % % barwitherr_ani(mas,sas);
% % % % % set(gca,'XTickLabel',{'TD group','CP patient'})
% % % % % title('Stance')
% % % % % %xticklabel_rotate([],45,[],'Fontsize',12)
% % % % % 
% % % % % subplot(223);
% % % % % title('Swing')
% % % % % mas=[mean(SR_sw_TD); m_SR_sw];
% % % % % sas=[std(SR_sw_TD); sd_SR_sw];
% % % % % barwitherr_ani(mas,sas);
% % % % % set(gca,'XTickLabel',{'TD group','CP patient'})
% % % % % ylabel('Symmetry Index')
% % % % % title('Swing')
% % % % % %xticklabel_rotate([],45,[],'Fontsize',12)
% % % % % 
% % % % % subplot(222);
% % % % % title('KneeAngle')
% % % % % mas=[mean(SR_knan_TD); m_SR_knan];
% % % % % sas=[std(SR_knan_TD); sd_SR_knan];
% % % % % barwitherr_ani(mas,sas);
% % % % % set(gca,'XTickLabel',{'TD group','CP patient'})
% % % % % maxy=max(m_SR_knan)+max(sd_SR_knan);
% % % % % ylim(gca,[0,maxy]);
% % % % % title('KneeAngle')
% % % % % %xticklabel_rotate([],45,[],'Fontsize',12)
% % % % % 
% % % % % %supertitle('Symmetry Index','FontSize',14,'Color','k')
% % % % % savefig(fig20,'SymmetryIndex.fig');
% % % % % % saveas(fig20,'SymmetryIndex','bmp')
% % % % % % saveas(fig20,'SymmetryIndex','bmp')
% % % % % saveas(fig20,'SymmetryIndex','jpg')

%%%%%%%%%%%%%%
fig20=figure %symmetry
set(fig20,'visible','off');
subplot(221);
title('SrideLength')
mas=[RefValuesGaitParams_TD(20,1); m_SR_sl];
sas=[RefValuesGaitParams_TD(20,2); sd_SR_sl];
barwitherr_ani(mas,sas);
set(gca,'XTickLabel',{'TD group','CP patient'})
title('StrideLength')
ylabel('Symmetry Index')
%xticklabel_rotate([],45,[],'Fontsize',12)

subplot(224);
title('Stance')
mas=[RefValuesGaitParams_TD(22,1); m_SR_st];
sas=[RefValuesGaitParams_TD(22,2); sd_SR_st];
barwitherr_ani(mas,sas);
set(gca,'XTickLabel',{'TD group','CP patient'})
title('Stance')
%xticklabel_rotate([],45,[],'Fontsize',12)

subplot(223);
title('Swing')
mas=[RefValuesGaitParams_TD(21,1); m_SR_sw];
sas=[RefValuesGaitParams_TD(21,2); sd_SR_sw];
barwitherr_ani(mas,sas);
set(gca,'XTickLabel',{'TD group','CP patient'})
ylabel('Symmetry Index')
title('Swing')
%xticklabel_rotate([],45,[],'Fontsize',12)

subplot(222);
title('KneeAngle')
mas=[RefValuesGaitParams_TD(23,1); m_SR_knan];
sas=[RefValuesGaitParams_TD(23,2); sd_SR_knan];
barwitherr_ani(mas,sas);
set(gca,'XTickLabel',{'TD group','CP patient'})
title('KneeAngle')
maxy=abs(m_SR_knan+sd_SR_knan);
ylim(gca,[0,maxy]);
title('KneeAngle')
%xticklabel_rotate([],45,[],'Fontsize',12)

supertitle('Symmetry Index','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/Symmetry_index');
savefig(fig20,[path,'.fig']);
saveas(fig20,path,'bmp')



%%%%%%%%%%%%%






fig21=figure   %Limp
set(fig21,'visible','off');
subplot(121);
x(1:m)=RefValuesGaitParams_TD(24,1);
a(1:m)=RefValuesGaitParams_TD(24,1)+RefValuesGaitParams_TD(24,2);
b(1:m)=RefValuesGaitParams_TD(24,1)-RefValuesGaitParams_TD(24,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
set(gca,'Fontsize',12)
xlim(gca,[0,m]);
ylim(gca,[0,max(m_limp)+max(sd_limp)]);
hold on
h=barwitherr_ani(sd_limp,m_limp)
set(h(1),'FaceColor','b');
xlabel('walking periods')
ylabel('%')
xlim(gca,[0,m]);
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(122),boxplot([limp_TD; m_limp],group); set(gca,'Fontsize',12)
%ylim(gca,[40,180]); 
%xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Limp','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/Limp');
savefig(fig21,[path,'.fig']);
saveas(fig21,path,'bmp')
% 

fig22=figure   %steps 
set(fig22,'visible','off');
subplot(121);
x(1:m)=RefValuesGaitParams_TD(25,1);
a(1:m)=RefValuesGaitParams_TD(25,1)+RefValuesGaitParams_TD(25,2);
b(1:m)=RefValuesGaitParams_TD(25,1)-RefValuesGaitParams_TD(25,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
set(gca,'Fontsize',12)
xlim(gca,[0,m]);
hold on
h=bar(m_steps)
set(h(1),'FaceColor','b');
xlabel('walking periods')
ylabel('%')
xlim(gca,[0,m]);
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(122),boxplot([steps_TD'; m_steps],group); set(gca,'Fontsize',12)
%ylim(gca,[40,180]); 
%xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Steps Per Walking Periods','FontSize',14,'Color','k')
path=strcat(PATH_GAIT,'/StepsPerWalkingPeriods');
savefig(fig22,[path,'.fig']);
saveas(fig22,path,'bmp')



%%%%%%%%Plot Kinematical Curves
%%%%%%%%%%%%%%%%%%%%%%%%%
load Mean_ShankAngleR_maxWalk_TD 
load Mean_ThighAngleR_maxWalk_TD 
load Mean_KneeAngleR_maxWalk_TD 
load Mean_ShankAngleL_maxWalk_TD 
load Mean_ThighAngleL_maxWalk_TD 
load Mean_KneeAngleL_maxWalk_TD 

load SD_ShankAngleR_maxWalk_TD 
load SD_ThighAngleR_maxWalk_TD 
load SD_KneeAngleR_maxWalk_TD 
load SD_ShankAngleL_maxWalk_TD 
load SD_ThighAngleL_maxWalk_TD 
load SD_KneeAngleL_maxWalk_TD 

load ([path_out,'/mat_folder/ShankAngleR_maxWalk']) 
load ([path_out,'/mat_folder/ThighAngleR_maxWalk']) 
load ([path_out,'/mat_folder/KneeAngleR_maxWalk']) 
load ([path_out,'/mat_folder/ShankAngleL_maxWalk']) 
load ([path_out,'/mat_folder/ThighAngleL_maxWalk']) 
load ([path_out,'/mat_folder/KneeAngleL_maxWalk']) 



[n,m]=size(ShankAngleR_maxWalk);
%%%%%%%%%%%%%%%%%%
Time=[0:0.5:99.5];  
%
fig25=figure
set(fig25,'visible','off');
subplot(231)
hold on
for j=1:m
    plot(Time,ShankAngleR_maxWalk(:,j)','g','linewidth',1)
end
plot(Time,Mean_ShankAngleR_maxWalk_TD ,'r','LineWidth',4)
plot(Time,nanmean(ShankAngleR_maxWalk,2),'k','linewidth',4)
ylabel('Right (degrees)');
ylim(gca,[-100,100]);
hold off

subplot(232)
hold on
for j=1:m
    plot(Time,ThighAngleR_maxWalk(:,j)','g','linewidth',1)
end
plot(Time,Mean_ThighAngleR_maxWalk_TD ,'r','LineWidth',4)
plot(Time,nanmean(ThighAngleR_maxWalk,2),'k','linewidth',4)
ylim(gca,[-100,100]);
hold off

subplot(233)
hold on
for j=1:m
    plot(Time,KneeAngleR_maxWalk(:,j)','g','linewidth',1)
end
plot(Time,Mean_KneeAngleR_maxWalk_TD ,'r','LineWidth',4)
plot(Time,nanmean(KneeAngleR_maxWalk,2),'k','linewidth',4)
ylim(gca,[-100,100]);
hold off

subplot(234)
hold on
for j=1:m
    plot(Time,ShankAngleL_maxWalk(:,j)','g','linewidth',1)
end
plot(Time,Mean_ShankAngleL_maxWalk_TD ,'r','LineWidth',4)
plot(Time,nanmean(ShankAngleL_maxWalk,2),'k','linewidth',4)
ylabel('Left (degrees)')
ylim(gca,[-100,100]);
hold off

subplot(235)
hold on
for j=1:m
    plot(Time,ThighAngleL_maxWalk(:,j)','g','linewidth',1)
end
plot(Time,Mean_ThighAngleL_maxWalk_TD ,'r','LineWidth',4)
plot(Time,nanmean(ThighAngleL_maxWalk,2),'k','linewidth',4)
xlabel('% gait cycle')
ylim(gca,[-100,100]);
hold off

subplot(236)
hold on
for j=1:m
    plot(Time,KneeAngleL_maxWalk(:,j)','g','linewidth',1)
end
plot(Time,Mean_KneeAngleL_maxWalk_TD ,'r','LineWidth',4)
plot(Time,nanmean(KneeAngleL_maxWalk,2),'k','linewidth',4)
ylim(gca,[-100,100]);
hold off
supertitle('Angles: Shank; Thigh; Knee','FontSize',14,'Color','k')

path=strcat(PATH_GAIT,'/KinematicalCurves_MaxWalk');
savefig(fig25,[path,'.fig']);
saveas(fig25,path,'bmp')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcul KS statistical distances
[h,p,ks2stat_cad] = kstest2(cad_TD,m_cad);
[h,p,ks2stat_Nspeed] = kstest2(Nspeed_TD,m_Nspeed);
[h,p,ks2stat_NslR] = kstest2(NslR_TD,m_Nsl_R); 
[h,p,ks2stat_NslL] = kstest2(NslL_TD,m_Nsl_L);
[h,p,ks2stat_swingR] = kstest2(swingR_TD,m_swing_R);
[h,p,ks2stat_swingL] = kstest2(swingL_TD,m_swing_L);
[h,p,ks2stat_stanceR] = kstest2(stanceR_TD,m_stance_R);
[h,p,ks2stat_stanceL] = kstest2(stanceL_TD,m_stance_L);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Write PA parameters to Word Table

WordFileName='TableGaitMetrics.doc';
mkdir('temp_word')
cd('temp_word')
pathword=pwd;
FileSpec = fullfile(pathword,WordFileName);
[ActXWord,WordHandle]=StartWord(FileSpec);
fprintf('Gait metrics will be save in %s\n',FileSpec);   
text='Gait Metrics';
WordText(ActXWord,text,style,[1,1]);%enter before and after text 
DataCell={' ','TD group','CP Baseline','CP FollowUp 1','CP FollowUp 2','CP FollowUp 3';
              'Mean Cadence (steps/min)', num2str(mean(cad_TD)) ,num2str(mean(m_cad)),'','','';
              'Median Cadence (steps/min)', num2str(median(cad_TD)),num2str(median(m_cad)),'','','';
              'Maximum Cadence (steps/min)', num2str(max(cad_TD)) ,num2str(max(m_cad)),'','','';
              'Mean Speed (m/s)', num2str(mean(speed_TD)) ,num2str(mean(m_speed)),'','','';
              'Median Speed (m/s)', num2str(median(speed_TD)),num2str(median(m_speed)),'','','';
              'Maximum Speed (m/s)', num2str(max(speed_TD)) ,num2str(max(m_speed)),'','','';
              'Mean Normalized Speed (m/s)', num2str(mean(Nspeed_TD)) ,num2str(mean(m_Nspeed)),'','','';
              'Median Normalized Speed (m/s)', num2str(median(Nspeed_TD)),num2str(median(m_Nspeed)),'','','';
              'Maximum Normalized Speed (m/s)', num2str(max(Nspeed_TD)) ,num2str(max(m_Nspeed)),'','','';
              'Mean Normalized Stride Length RL (m)', num2str(mean(NslR_TD)) ,num2str(mean(m_Nsl_R)),'','','';
              'Median Normalized Stride Length RL (m)', num2str(median(NslR_TD)),num2str(median(m_Nsl_R)),'','','';
              %'Maximum Normalized Stride Length RL (m)', num2str(max(NslR_TD)) ,num2str(max(m_Nsl_R)),'','','';
              'Mean Normalized Stride Length LL (m)', num2str(mean(NslL_TD)) ,num2str(mean(m_Nsl_L)),'','','';
              'Median Normalized Stride Length LL (m)', num2str(median(NslL_TD)),num2str(median(m_Nsl_L)),'','','';
             % 'Maximum Normalized Stride Length LL (m)', num2str(max(NslL_TD)) ,num2str(max(m_Nsl_L)),'','','';
              'Mean Swing RL(%gct)', num2str(mean(swingR_TD)) ,num2str(mean(m_swing_R)),'','','';
              'Median Swing RL(%gct)', num2str(median(swingR_TD)),num2str(median(m_swing_R)),'','','';
              %'Maximum Swing RL(%gct)', num2str(max(swingR_TD)) ,num2str(max(m_swing_R)),'','','';
              'Mean Swing LL(%gct)', num2str(mean(swingL_TD)) ,num2str(mean(m_swing_L)),'','','';
              'Median Swing LL(%gct)', num2str(median(swingL_TD)),num2str(median(m_swing_L)),'','','';
              %'Maximum Swing LL(%gct)', num2str(max(swingL_TD)) ,num2str(max(m_swing_L)),'','','';
              'Mean Stance RL(%gct)', num2str(mean(stanceR_TD)) ,num2str(mean(m_stance_R)),'','','';
              'Median Stance RL(%gct)', num2str(median(stanceR_TD)),num2str(median(m_stance_R)),'','','';
             % 'Maximum Stance RL(%gct)', num2str(max(stanceR_TD)) ,num2str(max(m_stance_R)),'','','';
              'Mean Stance LL(%gct)', num2str(mean(stanceL_TD)) ,num2str(mean(m_stance_L)),'','','';
              'Median Stance LL(%gct)', num2str(median(stanceL_TD)),num2str(median(m_stance_L)),'','','';
              %'Maximum Stance LL(%gct)', num2str(max(stanceL_TD)) ,num2str(max(m_stance_L)),'','','';
              'Statistical Distance Cadence','',num2str(ks2stat_cad),'','','';
              'Statistical Distance Normalized Speed','',num2str(ks2stat_Nspeed),'','','';
              'Statistical Distance Normalized Stride Length RL','',num2str(ks2stat_NslR),'','','';
              'Statistical Distance Normalized Stride Length LL','',num2str(ks2stat_NslL),'','','';
              'Statistical Distance Swing RL','',num2str(ks2stat_swingR),'','','';
              'Statistical Distance Swing LL','',num2str(ks2stat_swingL),'','','';
              'Statistical Distance Stance RL','',num2str(ks2stat_stanceR),'','','';
              'Statistical Distance Stance LL','',num2str(ks2stat_stanceL),'','','';}
 [NoRows,NoCols]=size(DataCell);          
    %create table with data from DataCell
 WordCreateTable(ActXWord,NoRows,NoCols,DataCell,1);%enter before table
 CloseWord(ActXWord,WordHandle,FileSpec); 
 disp(path_out);
 copyfile(pathword,path_out);
 
 
 
end
