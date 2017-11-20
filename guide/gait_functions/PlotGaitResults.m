
function PlotGaitResults(RightLegLength,LeftLegLength)
Rll=RightLegLength/100;
Lll=LeftLegLength/100;
% Rll=(Rfemur_length+Rtibia_length)/100;
% Lll=(Lfemur_length+Ltibia_length)/100;
ll=(Rll+Lll)/2;
%ll=0.78; %leg length in meters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load ref data: gait parameters control group
load RefValuesGaitParams_TD 
load cad_TD 
load speed_TD 
load Nspeed_TD 
load ds_TD 
load gct_TD 
load slR_TD 
load slL_TD 
load NslR_TD 
load NslL_TD 
load swingR_TD 
load swingL_TD 
load stanceR_TD 
load stanceL_TD 
load ShAngR_TD 
load ShAngL_TD 
load ThAngR_TD 
load ThAngL_TD 
load KnAngR_TD 
load KnAngL_TD 
[mc,nc]=size(cad_TD)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load walking_params_new

[nb_trials,nb_params]=size(walking_params_new)
MeanParamsGait=[]; SDParamsGait=[];
for j=2:nb_trials+1
  MeanParamsGait(j-1,:)=xlsread('GaitAnalysisReport.xls',j,'B3:AE3') ;
  SDParamsGait(j-1,:)=xlsread('GaitAnalysisReport.xls',j,'B4:AE4') ;
end
save MeanParamsGait MeanParamsGait
save SDParamsGait SDParamsGait
clear walking_params_new

%%asymmetry
[m,n]=size(MeanParamsGait);
for j=1:m
    SR_sl(j)=SymmetryRatio(MeanParamsGait(j,14),MeanParamsGait(j,15));
    SI_sl(j)=SymmetryIndex(MeanParamsGait(j,14),MeanParamsGait(j,15));
    GA_sl(j)=GaitAsymmetry(MeanParamsGait(j,14),MeanParamsGait(j,15));
    
    SR_sw(j)=SymmetryRatio(MeanParamsGait(j,4),MeanParamsGait(j,5));
    SI_sw(j)=SymmetryIndex(MeanParamsGait(j,4),MeanParamsGait(j,5));
    GA_sw(j)=GaitAsymmetry(MeanParamsGait(j,4),MeanParamsGait(j,5));
    
    SR_st(j)=SymmetryRatio(MeanParamsGait(j,7),MeanParamsGait(j,8));
    SI_st(j)=SymmetryIndex(MeanParamsGait(j,7),MeanParamsGait(j,8));
    GA_st(j)=GaitAsymmetry(MeanParamsGait(j,7),MeanParamsGait(j,8));
    
    SR_skan(j)=SymmetryRatio(MeanParamsGait(j,20),MeanParamsGait(j,20));
    SI_skan(j)=SymmetryIndex(MeanParamsGait(j,20),MeanParamsGait(j,20));
    GA_skan(j)=GaitAsymmetry(MeanParamsGait(j,20),MeanParamsGait(j,20));
    
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
[m,n]=size(MeanParamsGait);
xt=1:m;

fig1=figure   %cadence
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
%xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Cadence','FontSize',14,'Color','k')
savefig(fig1,'Cadence.fig');
% saveas(fig1,'Cadence','png')
% saveas(fig1,'Cadence','tif')
saveas(fig1,'Cadence','jpg')
% 

% 
fig2=figure %speed
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
savefig(fig2,'Speed.fig');
% saveas(fig2,'Speed','png')
% saveas(fig2,'Speed','tif')
saveas(fig2,'Speed','jpg')
% 
fig22=figure %normalized speed
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
savefig(fig22,'NormalizedSpeed.fig');
% saveas(fig22,'NormalizedSpeed','png')
% saveas(fig22,'NormalizedSpeed','tif')
saveas(fig22,'NormalizedSpeed','jpg')

% 
% 
fig3=figure  %double support
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
savefig(fig3,'DoubleSupport.fig');
% saveas(fig3,'DoubleSupport','png')
% saveas(fig3,'DoubleSupport','tif')
saveas(fig3,'DoubleSupport','jpg')
% 
% 
fig3b=figure  %gct
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
savefig(fig3b,'GaitCycleTime.fig');
% saveas(fig3b,'GaitCycleTime','png')
% saveas(fig3b,'GaitCycleTime','tif')
saveas(fig3b,'GaitCycleTime','jpg')
% 
% %%%%%%%%%%%%%%%%%%
% 
fig4=figure  %shank angle
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
savefig(fig4,'ShankAngle.fig');
% saveas(fig4,'ShankAngle','png')
% saveas(fig4,'ShankAngle','tif')
saveas(fig4,'ShankAngle','jpg')

% %%%%%%%%%%%%%%%%%%
limy=max([RefValuesGaitParams_TD(16,1)+RefValuesGaitParams_TD(16,2),RefValuesGaitParams_TD(17,1)+RefValuesGaitParams_TD(17,2),max(m_ThAng_R)+max(sd_ThAng_R),max(m_ThAng_L)+max(sd_ThAng_L)]);
fig4x=figure  %Thigh angle
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
savefig(fig4x,'ThighAngle.fig');
% saveas(fig4x,'ThighAngle','png')
% saveas(fig4x,'ThighAngle','tif')
saveas(fig4x,'ThighAngle','jpg')
% 
%
fig4y=figure  %Knee angle
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
savefig(fig4y,'KneeAngle.fig');
% saveas(fig4y,'KneeAngle','png')
% saveas(fig4y,'KneeAngle','tif')
saveas(fig4y,'KneeAngle','jpg')
% 
% %%%%%%%%%%%%%%%%%%
% 
fig5=figure  %stride length
limy=max([RefValuesGaitParams_TD(6,1)+RefValuesGaitParams_TD(6,2),RefValuesGaitParams_TD(7,1)+RefValuesGaitParams_TD(7,2),max(m_sl_R)+max(sd_sl_R),max(m_sl_L)+max(sd_sl_L)]);
subplot(221)
x(1:m)=RefValuesGaitParams_TD(6,1);
a(1:m)=RefValuesGaitParams_TD(6,1)+RefValuesGaitParams_TD(6,2);
b(1:m)=RefValuesGaitParams_TD(6,1)-RefValuesGaitParams_TD(6,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_sl_R,m_sl_R)
set(h(1),'FaceColor',[0 0.5 0]);
xlabel('walking periods')
ylabel('m')
xlim(gca,[0,m]); 
ylim(gca,[0,4]); 
set(gca,'Fontsize',12)
hold off

subplot(222)
x(1:m)=RefValuesGaitParams_TD(7,1);
a(1:m)=RefValuesGaitParams_TD(7,1)+RefValuesGaitParams_TD(7,2);
b(1:m)=RefValuesGaitParams_TD(7,1)-RefValuesGaitParams_TD(7,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_sl_L,m_sl_L)
set(h(1),'FaceColor',[0.5 0 0.5]);
xlabel('walking periods')
%ylabel('degrees')
xlim(gca,[0,m]);
ylim(gca,[0,4]); 
set(gca,'Fontsize',12)
hold off
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(223),boxplot([slR_TD; m_sl_R],group);set(gca,'Fontsize',12),ylim(gca,[min([m_sl_R' m_sl_L' slR_TD' slL_TD']),max([2])]); ylabel('m')
%xticklabel_rotate([],10,[],'Fontsize',12)
subplot(224),boxplot([slL_TD; m_sl_L],group); ylim(gca,[min([m_sl_R' m_sl_L' slR_TD' slL_TD']),max([2])]);set(gca,'Fontsize',12)
%xticklabel_rotate([],10,[],'Fontsize',12)
supertitle('Stride Length:Right,Left','FontSize',14,'Color','k')
savefig(fig5,'StrideLength.fig');
% saveas(fig5,'StrideLength','png')
% saveas(fig5,'StrideLength','tif')
saveas(fig5,'StrideLength','jpg')
% %%%%%%%%%%%%%%
% 
fig5y=figure  %stride length
limy=max([RefValuesGaitParams_TD(8,1)+RefValuesGaitParams_TD(8,2),RefValuesGaitParams_TD(9,1)+RefValuesGaitParams_TD(9,2),max(m_Nsl_R)+max(sd_Nsl_R),max(m_Nsl_L)+max(sd_Nsl_L)]);
subplot(221)
x(1:m)=RefValuesGaitParams_TD(8,1);
a(1:m)=RefValuesGaitParams_TD(8,1)+RefValuesGaitParams_TD(8,2);
b(1:m)=RefValuesGaitParams_TD(8,1)-RefValuesGaitParams_TD(8,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_Nsl_R,m_Nsl_R)
set(h(1),'FaceColor',[0 0.5 0]);
xlabel('walking periods')
ylabel('m')
xlim(gca,[0,m]); 
ylim(gca,[0,4]); 
set(gca,'Fontsize',12)
hold off

subplot(222)
x(1:m)=RefValuesGaitParams_TD(9,1);
a(1:m)=RefValuesGaitParams_TD(9,1)+RefValuesGaitParams_TD(9,2);
b(1:m)=RefValuesGaitParams_TD(9,1)-RefValuesGaitParams_TD(9,2);
plot(x,'r','LineWidth',4)
jbfill_ani(xt,a,b)
ax=gca;
set(ax,'SortMethod','childorder' );
xlim(gca,[0,m]);
hold on
h=barwitherr_ani(sd_Nsl_L,m_Nsl_L)
set(h(1),'FaceColor',[0.5 0 0.5]);
xlabel('walking periods')
%ylabel('degrees')
xlim(gca,[0,m]); 
ylim(gca,[0,4]); 
set(gca,'Fontsize',12)
hold off
group = [repmat({'TD group'}, mc, nc); repmat({'CP patient'}, mp, np); ];
subplot(223),boxplot([NslR_TD; m_Nsl_R],group); set(gca,'Fontsize',12),ylim(gca,[min([m_Nsl_R' m_Nsl_L' NslR_TD' NslL_TD']),max([m_Nsl_R' m_Nsl_L' NslR_TD' NslL_TD'])]); ylabel('m')
%xticklabel_rotate([],10,[],'Fontsize',12)
subplot(224),boxplot([NslL_TD; m_Nsl_L],group); ylim(gca,[min([m_Nsl_R' m_Nsl_L' NslR_TD' NslL_TD']),max([m_Nsl_R' m_Nsl_L' NslR_TD' NslL_TD'])]);set(gca,'Fontsize',12)
%xticklabel_rotate([],10,[],'Fontsize',12)
supertitle('Normalized Stride Length:Right,Left','FontSize',14,'Color','k')
savefig(fig5y,'NormalizedStideLength.fig');
% saveas(fig5y,'NormalizedStideLength','png')
% saveas(fig5y,'NormalizedStideLength','tif')
saveas(fig5y,'NormalizedStideLength','jpg')
% %%%%%%%%%%%%%%
% 
% 
fig6=figure  %swing 
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
savefig(fig6,'Swing.fig');
% saveas(fig6,'Swing','png')
% saveas(fig6,'Swing','tif')
saveas(fig6,'Swing','jpg')
% %%%%%%%%%%%%%%
% 
fig7=figure  %stance
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
savefig(fig7,'Stance.fig');
% saveas(fig7,'Stance','png')
% saveas(fig7,'Stance','tif')
saveas(fig7,'Stance','jpg')
%%%%%%%%%%%%%%

% 
fig20=figure %symmetry
subplot(221);
title('SrideLength')
mas=[RefValuesGaitParams_TD(21,1); m_SI_sl];
sas=[RefValuesGaitParams_TD(21,2); sd_SI_sl];
barwitherr_ani(mas,sas);
set(gca,'XTickLabel',{'TD group','CP patient'})
title('StrideLength')
ylabel('Symmetry Index')
%xticklabel_rotate([],45,[],'Fontsize',12)

subplot(224);
title('Stance')
mas=[RefValuesGaitParams_TD(27,1); m_SI_sw];
sas=[RefValuesGaitParams_TD(27,2); sd_SI_sw];
barwitherr_ani(mas,sas);
set(gca,'XTickLabel',{'TD group','CP patient'})
title('Stance')
%xticklabel_rotate([],45,[],'Fontsize',12)

subplot(223);
title('Swing')
mas=[RefValuesGaitParams_TD(24,1); m_SI_sw];
sas=[RefValuesGaitParams_TD(24,2); sd_SI_sw];
barwitherr_ani(mas,sas);
set(gca,'XTickLabel',{'TD group','CP patient'})
ylabel('Symmetry Index')
title('Swing')
%xticklabel_rotate([],45,[],'Fontsize',12)

subplot(222);
title('KneeAngle')
mas=[RefValuesGaitParams_TD(36,1); m_SI_knan];
sas=[RefValuesGaitParams_TD(36,2); sd_SI_knan];
barwitherr_ani(mas,sas);
set(gca,'XTickLabel',{'TD group','CP patient'})
title('KneeAngle')
%xticklabel_rotate([],45,[],'Fontsize',12)

%supertitle('Symmetry Index','FontSize',14,'Color','k')
savefig(fig20,'SymmetryIndex.fig');
% saveas(fig20,'SymmetryIndex','png')
% saveas(fig20,'SymmetryIndex','tif')
saveas(fig20,'SymmetryIndex','jpg')

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

load ShankAngleR_maxWalk 
load ThighAngleR_maxWalk 
load KneeAngleR_maxWalk        
load ShankAngleL_maxWalk 
load ThighAngleL_maxWalk 
load KneeAngleL_maxWalk 

[n,m]=size(ShankAngleR_maxWalk);
%%%%%%%%%%%%%%%%%%
Time=[0:0.5:99.5];  
%
fig25=figure
subplot(231)
hold on
for j=1:m
    plot(Time,ShankAngleR_maxWalk(:,j)','g','linewidth',1)
end
plot(Time,Mean_ShankAngleR_maxWalk_TD ,'r','LineWidth',4)
plot(Time,nanmean(ShankAngleR_maxWalk,2),'k','linewidth',4)
ylabel('Right (degrees)')
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
savefig(fig25,'KinematicalCurves_MaxWalk.fig');
%saveas(fig25,'KinematicalCurves_MaxWalk','png')
%saveas(fig25,'KinematicalCurves_MaxWalk','tif')
saveas(fig25,'KinematicalCurves_MaxWalk','jpg')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcul statistical distances
[h,p,ks2stat_cad] = kstest2(cad_TD,m_cad);
[h,p,ks2stat_Nspeed] = kstest2(Nspeed_TD,m_Nspeed);
[h,p,ks2stat_NslR] = kstest2(NslR_TD,m_Nsl_R);
[h,p,ks2stat_NslL] = kstest2(NslL_TD,m_Nsl_L);
[h,p,ks2stat_swingR] = kstest2(swingR_TD,m_swing_R);
[h,p,ks2stat_swingL] = kstest2(swingL_TD,m_swing_L);
[h,p,ks2stat_stanceR] = kstest2(stanceR_TD,m_stance_R);
[h,p,ks2stat_stanceL] = kstest2(stanceL_TD,m_stance_L);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Write PA parameters to Word Table

WordFileName='TableGaitMetrics.doc';
CurDir=pwd;
FileSpec = fullfile(CurDir,WordFileName);
[ActXWord,WordHandle]=StartWord(FileSpec);
fprintf('Gait metrics will be save in %s\n',FileSpec);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

    %Section 3
    style='Heading 1';
    text='Gait Metrics';
    WordText(ActXWord,text,style,[1,1]);%enter before and after text 
   
    %the obvious data
     DataCell={' ','TD group','CP Baseline','CP FollowUp 1','CP FollowUp 2','CP FollowUp 3';
              'Mean Cadence (steps/min)', num2str(mean(cad_TD)) ,num2str(mean(m_cad)),'','','';
              'Median Cadence (steps/min)', num2str(median(cad_TD)),num2str(median(m_cad)),'','','';
              'Maximum Cadence (steps/min)', num2str(max(cad_TD)) ,num2str(max(m_cad)),'','','';
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
    %CloseWord(ActXWord,WordHandle,FileSpec);    
    %close all;

    %Section 3
%     style='Heading 1';
%     text='Performance metrics';
%     WordText(ActXWord,text,style,[1,1]);%enter before and after text 
%    
%     %the obvious data
%     DataCell={' ','TD group','CP Baseline','CP FollowUp 1','CP FollowUp 2','CP FollowUp 3';
%               'Total nb. steps', num2str(mean_ref(1)) ,num2str(params_CP(1)),'','','';
%               'Maximal walking period (steps)', num2str(mean_ref(2)),num2str(params_CP(2)),'','','';
%               'Maximal speed (m/s)', num2str(mean_ref(3)) ,num2str(params_CP(3)),'','','';
%               'Time spent on feet /active (%)', num2str(mean_ref(4)) ,num2str(params_CP(4)),'','','';}
%     [NoRows,NoCols]=size(DataCell)          
%     %create table with data from DataCell
%     WordCreateTable(ActXWord,NoRows,NoCols,DataCell,1);%enter before table
    CloseWord(ActXWord,WordHandle,FileSpec);    
    %close all;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % SUB-FUNCTIONS write to word
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % function [actx_word,word_handle]=StartWord(word_file_p)
% % % % % % % %     % Start an ActiveX session with Word:
% % % % % % % %     actx_word = actxserver('Word.Application');
% % % % % % % %     actx_word.Visible = true;
% % % % % % % %     trace(actx_word.Visible);  
% % % % % % % %     if ~exist(word_file_p,'file');
% % % % % % % %         % Create new document:
% % % % % % % %         word_handle = invoke(actx_word.Documents,'Add');
% % % % % % % %     else
% % % % % % % %         % Open existing document:
% % % % % % % %         word_handle = invoke(actx_word.Documents,'Open',word_file_p);
% % % % % % % %     end           
% % % % % % % % end
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % function WordGoTo(actx_word_p,what_p,which_p,count_p,name_p,delete_p)
% % % % % % % %     %Selection.GoTo(What,Which,Count,Name)
% % % % % % % %     actx_word_p.Selection.GoTo(what_p,which_p,count_p,name_p);
% % % % % % % %     if(delete_p)
% % % % % % % %         actx_word_p.Selection.Delete;
% % % % % % % %     end
% % % % % % % % 
% % % % % % % % end
% % % % % % % % 
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % function WordCreateTOC(actx_word_p,upper_heading_p,lower_heading_p)
% % % % % % % % %      With ActiveDocument
% % % % % % % % %         .TablesOfContents.Add Range:=Selection.Range, RightAlignPageNumbers:= _
% % % % % % % % %             True, UseHeadingStyles:=True, UpperHeadingLevel:=1, _
% % % % % % % % %             LowerHeadingLevel:=3, IncludePageNumbers:=True, AddedStyles:="", _
% % % % % % % % %             UseHyperlinks:=True, HidePageNumbersInWeb:=True, UseOutlineLevels:= _
% % % % % % % % %             True
% % % % % % % % %         .TablesOfContents(1).TabLeader = wdTabLeaderDots
% % % % % % % % %         .TablesOfContents.Format = wdIndexIndent
% % % % % % % % %     End With
% % % % % % % %     actx_word_p.ActiveDocument.TablesOfContents.Add(actx_word_p.Selection.Range,1,...
% % % % % % % %         upper_heading_p,lower_heading_p);
% % % % % % % %     
% % % % % % % %     actx_word_p.Selection.TypeParagraph; %enter  
% % % % % % % % end
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % function WordText(actx_word_p,text_p,style_p,enters_p,color_p)
% % % % % % % % 	%VB Macro
% % % % % % % % 	%Selection.TypeText Text:="Test!"
% % % % % % % % 	%in Matlab
% % % % % % % % 	%set(word.Selection,'Text','test');
% % % % % % % % 	%this also works
% % % % % % % % 	%word.Selection.TypeText('This is a test');    
% % % % % % % %     if(enters_p(1))
% % % % % % % %         actx_word_p.Selection.TypeParagraph; %enter
% % % % % % % %     end
% % % % % % % % 	actx_word_p.Selection.Style = style_p;
% % % % % % % %     if(nargin == 5)%check to see if color_p is defined
% % % % % % % %         actx_word_p.Selection.Font.ColorIndex=color_p;     
% % % % % % % %     end
% % % % % % % %     
% % % % % % % % 	actx_word_p.Selection.TypeText(text_p);
% % % % % % % %     actx_word_p.Selection.Font.ColorIndex='wdAuto';%set back to default color
% % % % % % % %     for k=1:enters_p(2)    
% % % % % % % %         actx_word_p.Selection.TypeParagraph; %enter
% % % % % % % %     end
% % % % % % % % end
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % function WordSymbol(actx_word_p,symbol_int_p)
% % % % % % % %     % symbol_int_p holds an integer representing a symbol, 
% % % % % % % %     % the integer can be found in MSWord's insert->symbol window    
% % % % % % % %     % 176 = degree symbol
% % % % % % % %     actx_word_p.Selection.InsertSymbol(symbol_int_p);
% % % % % % % % end
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % function WordCreateTable(actx_word_p,nr_rows_p,nr_cols_p,data_cell_p,enter_p) 
% % % % % % % %     %Add a table which auto fits cell's size to contents
% % % % % % % %     if(enter_p(1))
% % % % % % % %         actx_word_p.Selection.TypeParagraph; %enter
% % % % % % % %     end
% % % % % % % %     %create the table
% % % % % % % %     %Add = handle Add(handle, handle, int32, int32, Variant(Optional))
% % % % % % % %     actx_word_p.ActiveDocument.Tables.Add(actx_word_p.Selection.Range,nr_rows_p,nr_cols_p,1,1);
% % % % % % % %     %Hard-coded optionals                     
% % % % % % % %     %first 1 same as DefaultTableBehavior:=wdWord9TableBehavior
% % % % % % % %     %last  1 same as AutoFitBehavior:= wdAutoFitContent
% % % % % % % %      
% % % % % % % %     %write the data into the table
% % % % % % % %     for r=1:nr_rows_p
% % % % % % % %         for c=1:nr_cols_p
% % % % % % % %             %write data into current cell
% % % % % % % %             WordText(actx_word_p,data_cell_p{r,c},'Normal',[0,0]);
% % % % % % % %             
% % % % % % % %             if(r*c==nr_rows_p*nr_cols_p)
% % % % % % % %                 %we are done, leave the table
% % % % % % % %                 actx_word_p.Selection.MoveDown;
% % % % % % % %             else%move on to next cell 
% % % % % % % %                 actx_word_p.Selection.MoveRight;
% % % % % % % %             end            
% % % % % % % %         end
% % % % % % % %     end
% % % % % % % % end
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % function WordPageNumbers(actx_word_p,align_p)
% % % % % % % %     %make sure the window isn't split
% % % % % % % %     if (~strcmp(actx_word_p.ActiveWindow.View.SplitSpecial,'wdPaneNone')) 
% % % % % % % %         actx_word_p.Panes(2).Close;
% % % % % % % %     end
% % % % % % % %     %make sure we are in printview
% % % % % % % %     if (strcmp(actx_word_p.ActiveWindow.ActivePane.View.Type,'wdNormalView') | ...
% % % % % % % %         strcmp(actx_word_p.ActiveWindow.ActivePane.View.Type,'wdOutlineView'))
% % % % % % % %         actx_word_p.ActiveWindow.ActivePane.View.Type ='wdPrintView';
% % % % % % % %     end
% % % % % % % %     %view the headers-footers
% % % % % % % %     actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekCurrentPageHeader';
% % % % % % % %     if actx_word_p.Selection.HeaderFooter.IsHeader
% % % % % % % %         actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekCurrentPageFooter';
% % % % % % % %     else
% % % % % % % %         actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekCurrentPageHeader';
% % % % % % % %     end
% % % % % % % %     %now add the pagenumbers 0->don't display any pagenumber on first page
% % % % % % % %      actx_word_p.Selection.HeaderFooter.PageNumbers.Add(align_p,0);
% % % % % % % %      actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekMainDocument';
% % % % % % % % end
% % % % % % % % 
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % function PrintMethods(actx_word_p,category_p)
% % % % % % % %     style='Heading 3';
% % % % % % % %     text=strcat(category_p,'-methods');
% % % % % % % %     WordText(actx_word_p,text,style,[1,1]);           
% % % % % % % %     
% % % % % % % %     style='Normal';    
% % % % % % % %     text=strcat('Methods called from Matlab as: ActXWord.',category_p,'.MethodName(xxx)');
% % % % % % % %     WordText(actx_word_p,text,style,[0,0]);           
% % % % % % % %     text='Ignore the first parameter "handle". ';
% % % % % % % %     WordText(actx_word_p,text,style,[1,3]);           
% % % % % % % %     
% % % % % % % %     MethodsStruct=eval(['invoke(actx_word_p.' category_p ')']);
% % % % % % % %     MethodsCell=struct2cell(MethodsStruct);
% % % % % % % %     NrOfFcns=length(MethodsCell);
% % % % % % % %     for i=1:NrOfFcns
% % % % % % % %         MethodString=MethodsCell{i};
% % % % % % % %         WordText(actx_word_p,MethodString,style,[0,1]);           
% % % % % % % %     end
% % % % % % % % end
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % function FigureIntoWord(actx_word_p)
% % % % % % % % 	% Capture current figure/model into clipboard:
% % % % % % % % 	print -dmeta
% % % % % % % % 	% Find end of document and make it the insertion point:
% % % % % % % % 	end_of_doc = get(actx_word_p.activedocument.content,'end');
% % % % % % % % 	set(actx_word_p.application.selection,'Start',end_of_doc);
% % % % % % % % 	set(actx_word_p.application.selection,'End',end_of_doc);
% % % % % % % % 	% Paste the contents of the Clipboard:
% % % % % % % %     %also works Paste(ActXWord.Selection)
% % % % % % % % 	invoke(actx_word_p.Selection,'Paste');
% % % % % % % %     actx_word_p.Selection.TypeParagraph; %enter    
% % % % % % % % end
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % function CloseWord(actx_word_p,word_handle_p,word_file_p)
% % % % % % % %     if ~exist(word_file_p,'file')
% % % % % % % %         % Save file as new:
% % % % % % % %         invoke(word_handle_p,'SaveAs',word_file_p,1);
% % % % % % % %     else
% % % % % % % %         % Save existing file:
% % % % % % % %         invoke(word_handle_p,'Save');
% % % % % % % %     end
% % % % % % % %     % Close the word window:
% % % % % % % %     invoke(word_handle_p,'Close');            
% % % % % % % %     % Quit MS Word
% % % % % % % %     invoke(actx_word_p,'Quit');            
% % % % % % % %     % Close Word and terminate ActiveX:
% % % % % % % %     delete(actx_word_p);            
% % % % % % % % end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



