function PlotMultitestResults(PA_Baseline,Gait_Baseline,PA_FW1,Gait_FW1,PA_FW2,Gait_FW2,PA_FW3,Gait_FW3)

%style='Titre 1';  if Word configured in French

%%Reference data TD (control) group
%load reference data posture & performance
format short G
load duration_SiLy_controls 
load duration_St_controls 
load duration_Wk_controls 

load percent_SiLy_controls 
load percent_St_controls 
load percent_Wk_controls 

load MeanPercentPosturesControls 
load SDPercentPosturesControls 

load MPAS_controls 
load SDPAS_controls 
load MeanPrctWk 
load SDPrctWk 
load MeanPrctSt 
load SDPrctSt 
load MeanPrctSitLy 
load SDPrctSitLy 

load RefValuesPerf_TD 

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
steps_TD=steps_TD_gr1w'; 
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%load Baseline data CP patient

analysis_struct_PA_Baseline=load(['./Analysis_database/',PA_Baseline,'.mat']);
path_PA_Baseline=analysis_struct_PA_Baseline.path_destination;

load([path_PA_Baseline,'/PercentBarcodeStates']);
load([path_PA_Baseline,'/PercentPostures']);
load([path_PA_Baseline,'/DurationPeriodPostures']);

analysis_struct_Gait_Baseline=load(['./Analysis_database/',Gait_Baseline,'.mat']);
path_Gait_Baseline=analysis_struct_PA_Baseline.path_destination;
load([path_Gait_Baseline,'/GaitParamsSelectedBySpeed']);
load([path_Gait_Baseline,'/SymetryIndex']);
load([path_Gait_Baseline,'/walking_params_new']);
load([path_Gait_Baseline,'/metrics_perf']);

PerBarc_1=PercentBarcodeStates;
PerPost_1=PercentPostures;
DPost_1=DurationPeriodPostures;
GaitParams_1=GaitParamsSelectedBySpeed;
Walk_params_1=walking_params_new;
SI_1=SymetryIndex;
metrics_perf_1=metrics_perf;


clear PercentBarcodeStates
clear PercentPostures
clear DurationPeriodPostures
clear GaitParamsSelectedBySpeed
clear SymetryIndex
clear walking_params_new
clear metrics_perf

%load Pre data CP patient
cd C:\Users\ionescu\Projects\PA_Gait_CP_dec2017\TestData\CP05Tiers3\CP_Perform_05_Pre\processed
load PercentBarcodeStates
load PercentPostures
load DurationPeriodPostures
load GaitParamsSelectedBySpeed
load SymetryIndex
load walking_params_new
load metrics_perf
PerBarc_2=PercentBarcodeStates;
PerPost_2=PercentPostures;
DPost_2=DurationPeriodPostures;
GaitParams_2=GaitParamsSelectedBySpeed;
Walk_params_2=walking_params_new;
SI_2=SymetryIndex;
metrics_perf_2=metrics_perf;
clear PercentBarcodeStates
clear PercentPostures
clear DurationPeriodPostures
clear GaitParamsSelectedBySpeed
clear SymetryIndex
clear walking_params_new
clear metrics_perf

%load Post data CP patient
cd C:\Users\ionescu\Projects\PA_Gait_CP_dec2017\TestData\CP05Tiers3\CP_Perform_05_Post\processed
load PercentBarcodeStates
load PercentPostures
load DurationPeriodPostures
load GaitParamsSelectedBySpeed
load walking_params_new
load SymetryIndex
load metrics_perf
PerBarc_3=PercentBarcodeStates;
PerPost_3=PercentPostures;
DPost_3=DurationPeriodPostures;
GaitParams_3=GaitParamsSelectedBySpeed;
Walk_params_3=walking_params_new;
SI_3=SymetryIndex;
metrics_perf_3=metrics_perf;
clear PercentBarcodeStates
clear PercentPostures
clear DurationPeriodPostures
clear GaitParamsSelectedBySpeed
clear SymetryIndex
clear walking_params_new
clear metrics_perf

cd C:\Users\ionescu\Projects\PA_Gait_CP_dec2017\TestData\CP05Tiers3\CP_Perform_05_Followup\processed
load PercentBarcodeStates
load PercentPostures
load DurationPeriodPostures
load GaitParamsSelectedBySpeed
load walking_params_new
load SymetryIndex
load metrics_perf
PerBarc_4=PercentBarcodeStates;
PerPost_4=PercentPostures;
DPost_4=DurationPeriodPostures;
GaitParams_4=GaitParamsSelectedBySpeed;
Walk_params_4=walking_params_new;
SI_4=SymetryIndex;
metrics_perf_4=metrics_perf;
clear PercentBarcodeStates
clear PercentPostures
clear DurationPeriodPostures
clear GaitParamsSelectedBySpeed
clear SymetryIndex
clear walking_params_new
clear metrics_perf

%%%%%%%%%%%
%plot PA parameters in the main subject's folder
cd C:\Users\ionescu\Projects\PA_Gait_CP_dec2017\TestData\CP05Tiers3

%percent postures
MeanPostures=[MeanPercentPosturesControls; PerPost_1(1) PerPost_1(2) PerPost_1(3);PerPost_2(1)  PerPost_2(2) PerPost_2(3);PerPost_3(1) PerPost_3(2) PerPost_3(3);PerPost_4(1) PerPost_4(2) PerPost_4(3);];
SDPostures=[SDPercentPosturesControls; 0  0 0; 0 0 0;0 0 0; 0 0 0];
errorbar_groups_postures_ani2(MeanPostures,SDPostures,'bar_names',{'lying/sitting','standing','walking'});
legend('TDGroup', 'CP Baseline', 'CP Pre','CP Post', 'CP Followup')
ylabel('% of monitoring time','FontSize',14)
supertitle('daily posture allocation');
savefig(gcf,'BarplotPostures_allTests.fig')
saveas(gcf,'BarplotPostures_allTests','jpg')

%duration periods
duration_SiLy_controls=duration_SiLy_controls';
[m1,n1]=size(duration_SiLy_controls);
[m11,n11]=size(cell2mat(DPost_1(1)));
[m12,n12]=size(cell2mat(DPost_2(1)));
[m13,n13]=size(cell2mat(DPost_3(1)));
[m14,n14]=size(cell2mat(DPost_4(1)));

duration_St_controls=duration_St_controls';
[m2,n2]=size(duration_St_controls);
[m21,n21]=size(cell2mat(DPost_1(2)));
[m22,n22]=size(cell2mat(DPost_2(2)));
[m23,n23]=size(cell2mat(DPost_3(2)));
[m24,n24]=size(cell2mat(DPost_4(2)));

duration_Wk_controls=duration_Wk_controls';
[m3,n3]=size(duration_Wk_controls);
[m31,n31]=size(cell2mat(DPost_1(3)));
[m32,n32]=size(cell2mat(DPost_2(3)));
[m33,n33]=size(cell2mat(DPost_3(3)));
[m34,n34]=size(cell2mat(DPost_4(3)));

f2=figure
subplot(311)
group = [repmat({'TD group'}, m1, n1); repmat({'CP Baseline'}, m11, n11); repmat({'CP Pre'}, m12, n12);repmat({'CP Post'}, m13, n13);repmat({'CP Followup'}, m14, n14);];
boxplot([duration_SiLy_controls; cell2mat(DPost_1(1)); cell2mat(DPost_2(1)); cell2mat(DPost_3(1)); cell2mat(DPost_4(1))], group);
ylim(gca,[0,3600]);
ylabel('lying/sitting (sec) ')
xtickangle(45);
 
subplot(312)
group = [repmat({'TD group'}, m2, n2); repmat({'CP Baseline'}, m21, n21); repmat({'CP Pre'}, m22, n22);repmat({'CP Post'}, m23, n23);repmat({'CP Followup'}, m24, n24);];
boxplot([duration_St_controls; cell2mat(DPost_1(2));cell2mat(DPost_2(2));cell2mat(DPost_3(2));cell2mat(DPost_4(2))], group);
ylabel('standing (sec)')
xtickangle(45);
 
subplot(313)
group = [repmat({'TD group'}, m3, n3); repmat({'CP Baseline'}, m31, n31); repmat({'CP Pre'}, m32, n32);repmat({'CP Post'}, m33, n33);repmat({'CP Followup'}, m34, n34);];
boxplot([duration_Wk_controls; cell2mat(DPost_1(3)); cell2mat(DPost_2(3)); cell2mat(DPost_3(3)); cell2mat(DPost_4(3))], group);
ylabel('walking (sec)');
xtickangle(45);
supertitle('duration of periods')
savefig(f2,'BoxPlotDurationPosturePeriods_allTestsTD.fig')
saveas(f2,'BoxPlotDurationPosturePeriods_allTestsTD','jpg')


 %plot empirical cdf duration of episodes
 f2b=figure
 [f0,x0] = ecdf(duration_SiLy_controls);
 [f1,x1] = ecdf(cell2mat(DPost_1(1)));
 [f2,x2] = ecdf(cell2mat(DPost_2(1)));
 [f3,x3] = ecdf(cell2mat(DPost_3(1)));
 [f4,x4] = ecdf(cell2mat(DPost_4(1)));
 subplot(311), hold on
 plot(x0,f0,'r', 'LineWidth',2)
 plot(x1,f1,'b', 'LineWidth',2)
 plot(x2,f2,'c', 'LineWidth',2)
 plot(x3,f3,'g', 'LineWidth',2)
 plot(x4,f4,'k', 'LineWidth',2)
 legend('TDGroup', 'CP Baseline', 'CP Pre','CP Post', 'CP Followup')
 hold off
 
 [f0,x0] = ecdf(duration_St_controls);
 [f1,x1] = ecdf(cell2mat(DPost_1(2)));
 [f2,x2] = ecdf(cell2mat(DPost_2(2)));
 [f3,x3] = ecdf(cell2mat(DPost_3(2)));
 [f4,x4] = ecdf(cell2mat(DPost_4(2)));
 subplot(312), hold on
 plot(x0,f0,'r', 'LineWidth',2)
 plot(x1,f1,'b', 'LineWidth',2)
 plot(x2,f2,'c', 'LineWidth',2)
 plot(x3,f3,'g', 'LineWidth',2)
 plot(x3,f3,'k', 'LineWidth',2)
 legend('TDGroup', 'CP Baseline', 'CP Pre','CP Post', 'CP Followup')
 hold off
 
 [f0,x0] = ecdf(duration_Wk_controls);
 [f1,x1] = ecdf(cell2mat(DPost_1(3)));
 [f2,x2] = ecdf(cell2mat(DPost_2(3)));
 [f3,x3] = ecdf(cell2mat(DPost_3(3)));
 [f4,x4] = ecdf(cell2mat(DPost_3(3)));
 subplot(313), hold on
 plot(x0,f0,'r', 'LineWidth',2)
 plot(x1,f1,'b', 'LineWidth',2)
 plot(x2,f2,'c', 'LineWidth',2)
 plot(x3,f3,'g', 'LineWidth',2)
 plot(x4,f4,'g', 'LineWidth',2)
 legend('TDGroup', 'CP Baseline', 'CP Pre','CP Post', 'CP Followup')
 hold off
supertitle('duration of periods')
savefig(f2b,'CDFPlotDurationPosturePeriods_allTestsTD.fig')
saveas(f2b,'CDFPlotDurationPosturePeriods_allTestsTD','jpg')
 
f3=figure
subplot(311)
group = [repmat({'CP Baseline'}, m11, n11); repmat({'CP Pre'}, m12, n12);repmat({'CP Post'}, m13, n13);repmat({'CP Followup'}, m14, n14);];
boxplot([cell2mat(DPost_1(1)); cell2mat(DPost_2(1)); cell2mat(DPost_3(1)); cell2mat(DPost_4(1))], group);
ylim(gca,[0,3600]);
ylabel('lying/sitting (sec) ')
 xtickangle(45);
 
subplot(312)
group = [repmat({'CP Baseline'}, m21, n21); repmat({'CP Pre'}, m22, n22);repmat({'CP Post'}, m23, n23);repmat({'CP Followup'}, m24, n24);];
boxplot([cell2mat(DPost_1(2));cell2mat(DPost_2(2));cell2mat(DPost_3(2));cell2mat(DPost_4(2))], group);
ylabel('standing (sec)')
 xtickangle(45);
 
 subplot(313)
 group = [repmat({'CP Baseline'}, m31, n31); repmat({'CP Pre'}, m32, n32);repmat({'CP Post'}, m33, n33);repmat({'CP Followup'}, m34, n34);];
 boxplot([cell2mat(DPost_1(3)); cell2mat(DPost_2(3)); cell2mat(DPost_3(3)); cell2mat(DPost_3(3))], group);
 ylabel('walking (sec)');
 xtickangle(45);
 supertitle('duration of periods')
 savefig(f3,'BoxPlotDurationPosturePeriods_allTests.fig')
 saveas(f3,'BoxPlotDurationPosturePeriods_allTests','jpg')
 
 
 %%%%
[mc,nc]=size(cad_TD);
[m1,n1]=size(GaitParams_1(:,1));
[m2,n2]=size(GaitParams_2(:,1));
[m3,n3]=size(GaitParams_3(:,1));
[m4,n4]=size(GaitParams_4(:,1));

fig4=figure;
group = [repmat({'TD group'}, mc, nc); repmat({'CP Baseline'}, m1, n1); repmat({'CP Pre'}, m2, n2);repmat({'CP Post'}, m3, n3);repmat({'CP Followup'}, m4, n4);];
boxplot([cad_TD; GaitParams_1(:,1);GaitParams_2(:,1);GaitParams_3(:,1);GaitParams_4(:,1)],group); set(gca,'Fontsize',12);
xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('cadence','FontSize',14,'Color','k')
savefig(fig4,'cadence_allTests.fig');
saveas(fig4,'cadence_allTests','jpg')

fig5=figure;
group = [repmat({'TD group'}, mc, nc); repmat({'CP Baseline'}, m1, n1); repmat({'CP Pre'}, m2, n2);repmat({'CP Post'}, m3, n3);repmat({'CP Followup'}, m4, n4)];
boxplot([speed_TD; GaitParams_1(:,3);GaitParams_2(:,3);GaitParams_3(:,3);GaitParams_4(:,3)],group); set(gca,'Fontsize',12);
xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Speed','FontSize',14,'Color','k')
savefig(fig5,'Speed_allTests.fig');
saveas(fig5,'Speed_allTests','jpg')

fig6=figure
group = [repmat({'TD group'}, mc, nc); repmat({'CP Baseline'}, m1, n1); repmat({'CP Pre'}, m2, n2);repmat({'CP Post'}, m3, n3);;repmat({'CP Followup'}, m4, n4);];
boxplot([Nspeed_TD; GaitParams_1(:,4);GaitParams_2(:,4);GaitParams_3(:,4);GaitParams_4(:,4)],group); set(gca,'Fontsize',12);
xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('NormalizedSpeed','FontSize',14,'Color','k')
savefig(fig6,'NormalizedSpeed_allTests.fig');
saveas(fig6,'NormalizedSpeed_allTests','jpg')


fig7=figure
group = [repmat({'TD group'}, mc, nc); repmat({'CP Baseline'}, m1, n1); repmat({'CP Pre'}, m2, n2);repmat({'CP Post'}, m3, n3);;repmat({'CP Followup'}, m4, n4);];
boxplot([steps_TD; GaitParams_1(:,19);GaitParams_2(:,19);GaitParams_3(:,19);GaitParams_4(:,19)],group); set(gca,'Fontsize',12);
xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Steps','FontSize',14,'Color','k')
savefig(fig7,'Steps_allTests.fig');
saveas(fig7,'Steps_allTests','jpg')

fig8=figure
group = [repmat({'TD group'}, mc, nc); repmat({'CP Baseline'}, m1, n1); repmat({'CP Pre'}, m2, n2);repmat({'CP Post'}, m3, n3);;repmat({'CP Followup'}, m4, n4);];
boxplot([limp_TD; GaitParams_1(:,20);GaitParams_2(:,20);GaitParams_3(:,20);GaitParams_4(:,20)],group); set(gca,'Fontsize',12);
xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Limp','FontSize',14,'Color','k')
savefig(fig8,'Limp_allTests.fig');
saveas(fig8,'Limp_allTests','jpg')


fig9=figure
group = [repmat({'TD group'}, mc, nc); repmat({'CP Baseline'}, m1, n1); repmat({'CP Pre'}, m2, n2);repmat({'CP Post'}, m3, n3);;repmat({'CP Followup'}, m4, n4);];
subplot(211),boxplot([KnAngR_TD; GaitParams_1(:,17);GaitParams_2(:,17);GaitParams_3(:,17);GaitParams_4(:,17)],group); set(gca,'Fontsize',12);
ylabel('Right')
xticklabel_rotate([],45,[],'Fontsize',12)
subplot(212),boxplot([KnAngL_TD; GaitParams_1(:,18);GaitParams_2(:,18);GaitParams_3(:,18);GaitParams_4(:,18)],group); set(gca,'Fontsize',12);
ylabel('Left')
xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('KneeAngle','FontSize',14,'Color','k')
savefig(fig9,'KneeAngle_allTests.fig');
saveas(fig9,'KneeAngle_allTests','jpg')


fig10=figure
mas=[RefValuesGaitParams_TD(23,1); SI_1(4,1);SI_2(4,1);SI_3(4,1);SI_4(4,1)];
sas=[RefValuesGaitParams_TD(23,2); SI_1(4,2);SI_2(4,2);SI_3(4,2);SI_4(4,2)];
barwitherr_ani(abs(sas),abs(mas));
%barwitherr_ani(sas,mas);
set(gca,'XTickLabel',{'TDGroup', 'CP Baseline', 'CP Pre','CP Post','CP Followup'})
% maxy=abs(SI_1(4,1)+SI_1(4,2));
% ylim(gca,[0,maxy]);
xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Symmetry Index Knee Angle','FontSize',14,'Color','k')
savefig(fig10,'SymmetryIndex_KneeAngle_allTests.fig');
saveas(fig10,'SymmetryIndex_KneeAngle_allTests','jpg')

fig11=figure
mas=[RefValuesGaitParams_TD(20,1); SI_1(1,1);SI_2(1,1);SI_3(1,1);SI_4(1,1)];
sas=[RefValuesGaitParams_TD(20,2); SI_1(1,2);SI_2(1,2);SI_3(1,2);SI_4(1,2)];
barwitherr_ani(abs(sas),abs(mas));
set(gca,'XTickLabel',{'TDGroup', 'CP Baseline', 'CP Pre','CP Post','CP Followup'})
maxy=abs(SI_1(1,1)+SI_1(1,2));
ylim(gca,[0,maxy]);
xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Symmetry Index Stride Length','FontSize',14,'Color','k')
savefig(fig11,'SymmetryIndex_StrideLength_allTests.fig');
saveas(fig11,'SymmetryIndex_StrideLength_allTests','jpg')

fig12=figure
mas=[RefValuesGaitParams_TD(21,1); SI_1(3,1);SI_2(3,1);SI_3(3,1);SI_4(3,1)];
sas=[RefValuesGaitParams_TD(21,2); SI_1(3,2);SI_2(3,2);SI_3(2,2);SI_4(2,2)];
barwitherr_ani(abs(sas),abs(mas));
set(gca,'XTickLabel',{'TDGroup', 'CP Baseline', 'CP Pre','CP Post','CP Followup'})
maxy=abs(SI_1(3,1)+SI_1(3,2));
ylim(gca,[0,maxy]);
xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Symmetry Index Swing','FontSize',14,'Color','k')
savefig(fig12,'SymmetryIndex_Swing_allTests.fig');
saveas(fig12,'SymmetryIndex_Swing_allTests','jpg')

fig13=figure
mas=[RefValuesGaitParams_TD(22,1); SI_1(2,1);SI_2(2,1);SI_3(2,1);SI_4(2,1)];
sas=[RefValuesGaitParams_TD(22,2); SI_1(2,2);SI_2(2,2);SI_3(2,2);SI_4(2,2)];
barwitherr_ani(abs(sas),abs(mas));
set(gca,'XTickLabel',{'TDGroup', 'CP Baseline', 'CP Pre','CP Post','CP Followup'})
maxy=abs(SI_1(3,1)+SI_1(3,2));
ylim(gca,[0,maxy]);
xticklabel_rotate([],45,[],'Fontsize',12)
supertitle('Symmetry Index Stance','FontSize',14,'Color','k')
savefig(fig13,'SymmetryIndex_Stance_allTests.fig');
saveas(fig13,'SymmetryIndex_Stance_allTests','jpg')

%%%%
X=RefValuesGaitParams_TD;
mean_ref=[X(1,1) round(X(3,1)) X(4,1) round(X(5,1)) X(24,1) X(20,1) X(21,1) X(22,1) X(23,1) X(6,1) X(7,1) round(X(12,1)) round(X(13,1)) round(X(10,1)) round(X(11,1)) round(X(25,1))];
params_CP_baseline=[mean(GaitParams_1(:,3)) round(mean(GaitParams_1(:,1))) mean(GaitParams_1(:,2)) round(mean(GaitParams_1(:,21))) mean(GaitParams_1(:,20)) abs(SI_1(1,1)) abs(SI_1(3,1)) abs(SI_1(2,1)) abs(SI_1(4,1)) mean(GaitParams_1(:,5)) mean(GaitParams_1(:,6)) round(mean(GaitParams_1(:,9))) round(mean(GaitParams_1(:,10))) round(mean(GaitParams_1(:,11))) round(mean(GaitParams_1(:,12))) round(mean(GaitParams_1(:,20)))];
params_CP_pre=[mean(GaitParams_2(:,3)) round(mean(GaitParams_2(:,1))) mean(GaitParams_2(:,2)) round(mean(GaitParams_2(:,21))) mean(GaitParams_2(:,20)) abs(SI_2(1,1)) abs(SI_2(3,1)) abs(SI_2(2,1)) abs(SI_2(4,1)) mean(GaitParams_2(:,5)) mean(GaitParams_2(:,6)) round(mean(GaitParams_2(:,9))) round(mean(GaitParams_2(:,10))) round(mean(GaitParams_2(:,11))) round(mean(GaitParams_2(:,12))) round(mean(GaitParams_2(:,20)))];
params_CP_post=[mean(GaitParams_3(:,3)) round(mean(GaitParams_3(:,1))) mean(GaitParams_3(:,2)) round(mean(GaitParams_3(:,21))) mean(GaitParams_3(:,20)) abs(SI_3(1,1)) abs(SI_3(3,1)) abs(SI_3(2,1)) abs(SI_3(4,1)) mean(GaitParams_3(:,5)) mean(GaitParams_3(:,6)) round(mean(GaitParams_3(:,9))) round(mean(GaitParams_3(:,10))) round(mean(GaitParams_3(:,11))) round(mean(GaitParams_3(:,12))) round(mean(GaitParams_3(:,20)))];
params_CP_followup=[mean(GaitParams_4(:,3)) round(mean(GaitParams_4(:,1))) mean(GaitParams_4(:,2)) round(mean(GaitParams_4(:,21))) mean(GaitParams_4(:,20)) abs(SI_4(1,1)) abs(SI_4(3,1)) abs(SI_4(2,1)) abs(SI_4(4,1)) mean(GaitParams_4(:,5)) mean(GaitParams_4(:,6)) round(mean(GaitParams_4(:,9))) round(mean(GaitParams_4(:,10))) round(mean(GaitParams_4(:,11))) round(mean(GaitParams_4(:,12))) round(mean(GaitParams_4(:,20)))];
params_tot2=[mean_ref;  params_CP_baseline;params_CP_pre;params_CP_post;params_CP_followup]';
fig14=spider(params_tot2,'CP vs.TDs',[],{'spd'; 'cad'; 'gct'; 'DS';'Limp';'SR-sl'; 'SR-sw'; 'SR-st'; 'SR-knan'; 'slR';'slL';'swR';'swL';'stR';'stL';'steps' },{'TD(Mean)' 'CP Baseline' 'CP Pre' 'CP Post' 'CP Followup'});
savefig(fig14,'spider_GaitParams_allTests.fig');
saveas(fig14,'spider_GaitParams_allTests','jpg');

%%%%%%%%%%%%
%performance metrics
mean_ref=[round(RefValuesPerf_TD(1,1)) round(RefValuesPerf_TD(2,1)) RefValuesPerf_TD(3,1) round(RefValuesPerf_TD(4,1))];
sd2_ref=[round(RefValuesPerf_TD(1,1)-RefValuesPerf_TD(1,2)) round(RefValuesPerf_TD(2,1)-RefValuesPerf_TD(2,2)) RefValuesPerf_TD(3,1)-RefValuesPerf_TD(3,2) round(RefValuesPerf_TD(4,1)-RefValuesPerf_TD(4,2))];
params_CP_baseline=[round(metrics_perf_1(1)) round(metrics_perf_1(2)) round(metrics_perf_1(3)) round(metrics_perf_1(4))];
params_CP_pre=[round(metrics_perf_2(1)) round(metrics_perf_2(2)) round(metrics_perf_2(3)) round(metrics_perf_2(4))];
params_CP_post=[round(metrics_perf_3(1)) round(metrics_perf_3(2)) round(metrics_perf_3(3)) round(metrics_perf_3(4))];
params_CP_followup=[round(metrics_perf_4(1)) round(metrics_perf_4(2)) round(metrics_perf_4(3)) round(metrics_perf_4(4))];

params_tot=[mean_ref; params_CP_baseline; params_CP_pre; params_CP_post; params_CP_followup;]';
fig15=spider(params_tot,'CP vs.TDs',[],{'total steps' ''; 'max walk' 'steps'; 'max speed' 'm/s'; 'activ' '%'},{'TD(Mean)' 'CP Baseline' 'CP Pre' 'CP Post' 'CP Followup'})
savefig(fig15,'spider_perf_DL_allTests.fig');
saveas(fig15,'spider_perf_DL_allTests','jpg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%statistical distances duration posture periods
[f1,x1] = ecdf(cell2mat(DPost_1(1)));
 [f2,x2] = ecdf(cell2mat(DPost_2(1)));
 [f3,x3] = ecdf(cell2mat(DPost_3(1)));
 [f4,x4] = ecdf(cell2mat(DPost_4(1)));

[h,p,ks2stat_wk1] = kstest2(duration_Wk_controls,cell2mat(DPost_1(3)));
[h,p,ks2stat_wk2] = kstest2(duration_Wk_controls,cell2mat(DPost_2(3)));
[h,p,ks2stat_wk3] = kstest2(duration_Wk_controls,cell2mat(DPost_3(3)));
[h,p,ks2stat_wk4] = kstest2(duration_Wk_controls,cell2mat(DPost_4(3)));

[h,p,ks2stat_st1] = kstest2(duration_St_controls,cell2mat(DPost_1(2)));
[h,p,ks2stat_st2] = kstest2(duration_St_controls,cell2mat(DPost_2(2)));
[h,p,ks2stat_st3] = kstest2(duration_St_controls,cell2mat(DPost_3(2)));
[h,p,ks2stat_st4] = kstest2(duration_St_controls,cell2mat(DPost_4(2)));

[h,p,ks2stat_sed1] = kstest2(duration_SiLy_controls,cell2mat(DPost_1(1)));
[h,p,ks2stat_sed2] = kstest2(duration_SiLy_controls,cell2mat(DPost_2(1)));
[h,p,ks2stat_sed3] = kstest2(duration_SiLy_controls,cell2mat(DPost_3(1)));
[h,p,ks2stat_sed4] = kstest2(duration_SiLy_controls,cell2mat(DPost_4(1)));

%Write PA parameters to Word Table
WordFileName='TablePAMetrics_allTests.doc';
CurDir=pwd;
FileSpec = fullfile(CurDir,WordFileName);
[ActXWord,WordHandle]=StartWord(FileSpec);
fprintf('Performance metrics will be save in %s\n',FileSpec);
  
%style='Heading 1';
%style='Titre 1';  if Word configured in French
text='Physical Activity Metrics';
WordText(ActXWord,text,style,[1,1]);%enter before and after text  

DataCell={'States ','TD group(%,mean)','TD group(%,SD)','CP Baseline','CP Pre','CP Post','CP Followup';
              'Walking (%) ',num2str(round(MeanPercentPosturesControls(3))),num2str(round(SDPercentPosturesControls(3))),num2str(round(PerPost_1(3))),num2str(round(PerPost_2(3))),num2str(round(PerPost_3(3))),num2str(round(PerPost_3(3)));
              'Standing (%)',num2str(round(MeanPercentPosturesControls(2))),num2str(round(SDPercentPosturesControls(2))),num2str(round(PerPost_1(2))),num2str(round(PerPost_2(2))),num2str(round(PerPost_3(2))),num2str(round(PerPost_3(2)));
              'Sedentary (%)',num2str(round(MeanPercentPosturesControls(1))),num2str(round(SDPercentPosturesControls(1))),num2str(round(PerPost_1(1))),num2str(round(PerPost_2(1))),num2str(round(PerPost_3(1))),num2str(round(PerPost_3(1)));
              'Statistics Walking Periods:','','','','','',''; 
              '10th Percentile(sec)', num2str(MeanPrctWk(1)) ,num2str(SDPrctWk(1)) ,num2str(prctile(cell2mat(DPost_1(3)),10)),num2str(prctile(cell2mat(DPost_2(3)),10)),num2str(prctile(cell2mat(DPost_3(3)),10)),num2str(prctile(cell2mat(DPost_4(3)),10));
              '20th Percentile(sec)', num2str(MeanPrctWk(2)) ,num2str(SDPrctWk(2)) ,num2str(prctile(cell2mat(DPost_1(3)),20)),num2str(prctile(cell2mat(DPost_2(3)),20)),num2str(prctile(cell2mat(DPost_3(3)),20)),num2str(prctile(cell2mat(DPost_4(3)),20));
              '30th Percentile(sec)', num2str(MeanPrctWk(3)) ,num2str(SDPrctWk(3)) ,num2str(prctile(cell2mat(DPost_1(3)),30)),num2str(prctile(cell2mat(DPost_2(3)),30)),num2str(prctile(cell2mat(DPost_3(3)),30)),num2str(prctile(cell2mat(DPost_4(3)),30));
              '40th Percentile(sec)', num2str(MeanPrctWk(4)) ,num2str(SDPrctWk(4)) ,num2str(prctile(cell2mat(DPost_1(3)),40)),num2str(prctile(cell2mat(DPost_2(3)),40)),num2str(prctile(cell2mat(DPost_3(3)),40)),num2str(prctile(cell2mat(DPost_4(3)),40));
              '50th Percentile(sec)', num2str(MeanPrctWk(5)) ,num2str(SDPrctWk(5)) ,num2str(prctile(cell2mat(DPost_1(3)),50)),num2str(prctile(cell2mat(DPost_2(3)),50)),num2str(prctile(cell2mat(DPost_3(3)),50)),num2str(prctile(cell2mat(DPost_4(3)),50));
              '60th Percentile(sec)', num2str(MeanPrctWk(6)) ,num2str(SDPrctWk(6)) ,num2str(prctile(cell2mat(DPost_1(3)),60)),num2str(prctile(cell2mat(DPost_2(3)),60)),num2str(prctile(cell2mat(DPost_3(3)),60)),num2str(prctile(cell2mat(DPost_4(3)),60));
              '70th Percentile(sec)', num2str(MeanPrctWk(7)) ,num2str(SDPrctWk(7)) ,num2str(prctile(cell2mat(DPost_1(3)),70)),num2str(prctile(cell2mat(DPost_2(3)),70)),num2str(prctile(cell2mat(DPost_3(3)),70)),num2str(prctile(cell2mat(DPost_4(3)),70));
              '80th Percentile(sec)', num2str(MeanPrctWk(8)) ,num2str(SDPrctWk(8)) ,num2str(prctile(cell2mat(DPost_1(3)),80)),num2str(prctile(cell2mat(DPost_2(3)),80)),num2str(prctile(cell2mat(DPost_3(3)),80)),num2str(prctile(cell2mat(DPost_4(3)),80));
              '90th Percentile(sec)', num2str(MeanPrctWk(9)) ,num2str(SDPrctWk(9)) ,num2str(prctile(cell2mat(DPost_1(3)),90)),num2str(prctile(cell2mat(DPost_2(3)),90)),num2str(prctile(cell2mat(DPost_3(3)),90)),num2str(prctile(cell2mat(DPost_4(3)),90));
              'Maximal Walking period (sec)', num2str(MeanPrctWk(10)) ,num2str(SDPrctWk(10)) ,num2str(max(cell2mat(DPost_1(3)))),num2str(max(cell2mat(DPost_2(3)))),num2str(max(cell2mat(DPost_4(3)))),num2str(max(cell2mat(DPost_4(3))));
              'Statistics Standing Periods:','','','','','',''; 
              '10th Percentile(sec)', num2str(MeanPrctSt(1)) ,num2str(SDPrctSt(1)) ,num2str(prctile(cell2mat(DPost_1(2)),10)),num2str(prctile(cell2mat(DPost_2(2)),10)),num2str(prctile(cell2mat(DPost_3(2)),10)),num2str(prctile(cell2mat(DPost_4(2)),10));
              '20th Percentile(sec)', num2str(MeanPrctSt(2)) ,num2str(SDPrctSt(2)) ,num2str(prctile(cell2mat(DPost_1(2)),20)),num2str(prctile(cell2mat(DPost_2(2)),20)),num2str(prctile(cell2mat(DPost_3(2)),20)),num2str(prctile(cell2mat(DPost_4(2)),20));
              '30th Percentile(sec)', num2str(MeanPrctSt(3)) ,num2str(SDPrctSt(3)) ,num2str(prctile(cell2mat(DPost_1(2)),30)),num2str(prctile(cell2mat(DPost_2(2)),30)),num2str(prctile(cell2mat(DPost_3(2)),30)),num2str(prctile(cell2mat(DPost_4(2)),30));
              '40th Percentile(sec)', num2str(MeanPrctSt(4)) ,num2str(SDPrctSt(4)) ,num2str(prctile(cell2mat(DPost_1(2)),40)),num2str(prctile(cell2mat(DPost_2(2)),40)),num2str(prctile(cell2mat(DPost_3(2)),40)),num2str(prctile(cell2mat(DPost_4(2)),40));
              '50th Percentile(sec)', num2str(MeanPrctSt(5)) ,num2str(SDPrctSt(5)) ,num2str(prctile(cell2mat(DPost_1(2)),50)),num2str(prctile(cell2mat(DPost_2(2)),50)),num2str(prctile(cell2mat(DPost_3(2)),50)),num2str(prctile(cell2mat(DPost_4(2)),50));
              '60th Percentile(sec)', num2str(MeanPrctSt(6)) ,num2str(SDPrctSt(6)) ,num2str(prctile(cell2mat(DPost_1(2)),60)),num2str(prctile(cell2mat(DPost_2(2)),60)),num2str(prctile(cell2mat(DPost_3(2)),60)),num2str(prctile(cell2mat(DPost_4(2)),60));
              '70th Percentile(sec)', num2str(MeanPrctSt(7)) ,num2str(SDPrctSt(7)) ,num2str(prctile(cell2mat(DPost_1(2)),70)),num2str(prctile(cell2mat(DPost_2(2)),70)),num2str(prctile(cell2mat(DPost_3(2)),70)),num2str(prctile(cell2mat(DPost_4(2)),70));
              '80th Percentile(sec)', num2str(MeanPrctSt(8)) ,num2str(SDPrctSt(8)) ,num2str(prctile(cell2mat(DPost_1(2)),80)),num2str(prctile(cell2mat(DPost_2(2)),80)),num2str(prctile(cell2mat(DPost_3(2)),80)),num2str(prctile(cell2mat(DPost_4(2)),80));
              '90th Percentile(sec)', num2str(MeanPrctSt(9)) ,num2str(SDPrctSt(9)) ,num2str(prctile(cell2mat(DPost_1(2)),90)),num2str(prctile(cell2mat(DPost_2(2)),90)),num2str(prctile(cell2mat(DPost_3(2)),90)),num2str(prctile(cell2mat(DPost_4(2)),90));
              'Maximal Standing period (sec)', num2str(MeanPrctSt(10)) ,num2str(SDPrctSt(10)) ,num2str(max(cell2mat(DPost_1(2)))),num2str(max(cell2mat(DPost_2(2)))),num2str(max(cell2mat(DPost_4(2)))),num2str(max(cell2mat(DPost_4(2))));
              'Statistics Sedentary Periods:','','','','','',''; 
              '10th Percentile(sec)', num2str(MeanPrctSitLy(1)) ,num2str(SDPrctSitLy(1)) ,num2str(prctile(cell2mat(DPost_1(1)),10)),num2str(prctile(cell2mat(DPost_2(1)),10)),num2str(prctile(cell2mat(DPost_3(1)),10)),num2str(prctile(cell2mat(DPost_4(1)),10));
              '20th Percentile(sec)', num2str(MeanPrctSitLy(2)) ,num2str(SDPrctSitLy(2)) ,num2str(prctile(cell2mat(DPost_1(1)),20)),num2str(prctile(cell2mat(DPost_2(1)),20)),num2str(prctile(cell2mat(DPost_3(1)),20)),num2str(prctile(cell2mat(DPost_4(1)),20));
              '30th Percentile(sec)', num2str(MeanPrctSitLy(3)) ,num2str(SDPrctSitLy(3)) ,num2str(prctile(cell2mat(DPost_1(1)),30)),num2str(prctile(cell2mat(DPost_2(1)),30)),num2str(prctile(cell2mat(DPost_3(1)),30)),num2str(prctile(cell2mat(DPost_4(1)),30));
              '40th Percentile(sec)', num2str(MeanPrctSitLy(4)) ,num2str(SDPrctSitLy(4)) ,num2str(prctile(cell2mat(DPost_1(1)),40)),num2str(prctile(cell2mat(DPost_2(1)),40)),num2str(prctile(cell2mat(DPost_3(1)),40)),num2str(prctile(cell2mat(DPost_4(1)),40));
              '50th Percentile(sec)', num2str(MeanPrctSitLy(5)) ,num2str(SDPrctSitLy(5)) ,num2str(prctile(cell2mat(DPost_1(1)),50)),num2str(prctile(cell2mat(DPost_2(1)),50)),num2str(prctile(cell2mat(DPost_3(1)),50)),num2str(prctile(cell2mat(DPost_4(1)),50));
              '60th Percentile(sec)', num2str(MeanPrctSitLy(6)) ,num2str(SDPrctSitLy(6)) ,num2str(prctile(cell2mat(DPost_1(1)),60)),num2str(prctile(cell2mat(DPost_2(1)),60)),num2str(prctile(cell2mat(DPost_3(1)),60)),num2str(prctile(cell2mat(DPost_4(1)),60));
              '70th Percentile(sec)', num2str(MeanPrctSitLy(7)) ,num2str(SDPrctSitLy(7)) ,num2str(prctile(cell2mat(DPost_1(1)),70)),num2str(prctile(cell2mat(DPost_2(1)),70)),num2str(prctile(cell2mat(DPost_3(1)),70)),num2str(prctile(cell2mat(DPost_4(1)),70));
              '80th Percentile(sec)', num2str(MeanPrctSitLy(8)) ,num2str(SDPrctSitLy(8)) ,num2str(prctile(cell2mat(DPost_1(1)),80)),num2str(prctile(cell2mat(DPost_2(1)),80)),num2str(prctile(cell2mat(DPost_3(1)),80)),num2str(prctile(cell2mat(DPost_4(1)),80));
              '90th Percentile(sec)', num2str(MeanPrctSitLy(9)) ,num2str(SDPrctSitLy(9)) ,num2str(prctile(cell2mat(DPost_1(1)),90)),num2str(prctile(cell2mat(DPost_2(1)),90)),num2str(prctile(cell2mat(DPost_3(1)),90)),num2str(prctile(cell2mat(DPost_4(1)),90));
              'Maximal Sedentary period (sec)', num2str(MeanPrctSitLy(10)) ,num2str(SDPrctSitLy(10)) ,num2str(max(cell2mat(DPost_1(1)))),num2str(max(cell2mat(DPost_2(1)))),num2str(max(cell2mat(DPost_4(1)))),num2str(max(cell2mat(DPost_4(1))));
               'Kolmogorov_Smirnov stat Dist:','','','','','',''; 
               'Stat Dist Walking periods','','',num2str(ks2stat_wk1),num2str(ks2stat_wk2),num2str(ks2stat_wk3),num2str(ks2stat_wk4);
               'Stat Dist Standing periods','','',num2str(ks2stat_st1),num2str(ks2stat_st2),num2str(ks2stat_st3),num2str(ks2stat_st3);
               'Stat Dist Sedentary periods','','',num2str(ks2stat_sed1),num2str(ks2stat_sed2),num2str(ks2stat_sed3),num2str(ks2stat_sed4);}                       
[NoRows,NoCols]=size(DataCell);          
%create table with data from DataCell
WordCreateTable(ActXWord,NoRows,NoCols,DataCell,1);%enter before table
CloseWord(ActXWord,WordHandle,FileSpec); 

WordFileName='TablePercentBarcodeStates_allTests.doc';
CurDir=pwd;
FileSpec = fullfile(CurDir,WordFileName);
[ActXWord,WordHandle]=StartWord(FileSpec);
fprintf('Performance metrics will be save in %s\n',FileSpec);
%style='Heading 1';
text='Percent Barcode states';
WordText(ActXWord,text,style,[1,1]);%enter before and after text 

DataCell={'States ','TD group(%,mean)','TD group(%,SD)','CP Baseline','CP Pre','CP Post','CP Followup';
'1', num2str(MPAS_controls(1)),num2str(SDPAS_controls(1)),num2str(PerBarc_1(1)),num2str(PerBarc_2(1)),num2str(PerBarc_3(1)),num2str(PerBarc_4(1));
'2', num2str(MPAS_controls(2)),num2str(SDPAS_controls(2)),num2str(PerBarc_1(2)),num2str(PerBarc_2(2)),num2str(PerBarc_3(2)),num2str(PerBarc_4(2));
'3', num2str(MPAS_controls(3)),num2str(SDPAS_controls(3)),num2str(PerBarc_1(3)),num2str(PerBarc_2(3)),num2str(PerBarc_3(3)),num2str(PerBarc_4(3));
'4', num2str(MPAS_controls(4)),num2str(SDPAS_controls(4)),num2str(PerBarc_1(4)),num2str(PerBarc_2(4)),num2str(PerBarc_3(4)),num2str(PerBarc_4(4));
'5', num2str(MPAS_controls(5)),num2str(SDPAS_controls(5)),num2str(PerBarc_1(5)),num2str(PerBarc_2(5)),num2str(PerBarc_3(5)),num2str(PerBarc_4(5));
'6', num2str(MPAS_controls(6)),num2str(SDPAS_controls(6)),num2str(PerBarc_1(6)),num2str(PerBarc_2(6)),num2str(PerBarc_3(6)),num2str(PerBarc_4(6));
'7', num2str(MPAS_controls(7)),num2str(SDPAS_controls(7)),num2str(PerBarc_1(7)),num2str(PerBarc_2(7)),num2str(PerBarc_3(7)),num2str(PerBarc_4(7));
'8', num2str(MPAS_controls(8)),num2str(SDPAS_controls(8)),num2str(PerBarc_1(8)),num2str(PerBarc_2(8)),num2str(PerBarc_3(8)),num2str(PerBarc_4(8));
'9', num2str(MPAS_controls(9)),num2str(SDPAS_controls(9)),num2str(PerBarc_1(9)),num2str(PerBarc_2(9)),num2str(PerBarc_3(9)),num2str(PerBarc_4(9));
'10', num2str(MPAS_controls(10)),num2str(SDPAS_controls(10)),num2str(PerBarc_1(10)),num2str(PerBarc_2(10)),num2str(PerBarc_3(10)),num2str(PerBarc_4(10));
'11', num2str(MPAS_controls(11)),num2str(SDPAS_controls(11)),num2str(PerBarc_1(11)),num2str(PerBarc_2(11)),num2str(PerBarc_3(11)),num2str(PerBarc_4(11));
'12', num2str(MPAS_controls(12)),num2str(SDPAS_controls(12)),num2str(PerBarc_1(12)),num2str(PerBarc_2(12)),num2str(PerBarc_3(12)),num2str(PerBarc_4(12));
'13', num2str(MPAS_controls(13)),num2str(SDPAS_controls(13)),num2str(PerBarc_1(13)),num2str(PerBarc_2(13)),num2str(PerBarc_3(13)),num2str(PerBarc_4(13));
'14', num2str(MPAS_controls(14)),num2str(SDPAS_controls(14)),num2str(PerBarc_1(14)),num2str(PerBarc_2(14)),num2str(PerBarc_3(14)),num2str(PerBarc_4(14));
'15', num2str(MPAS_controls(15)),num2str(SDPAS_controls(15)),num2str(PerBarc_1(15)),num2str(PerBarc_2(15)),num2str(PerBarc_3(15)),num2str(PerBarc_4(15));
'16', num2str(MPAS_controls(16)),num2str(SDPAS_controls(16)),num2str(PerBarc_1(16)),num2str(PerBarc_2(16)),num2str(PerBarc_3(16)),num2str(PerBarc_4(16));
'17', num2str(MPAS_controls(17)),num2str(SDPAS_controls(17)),num2str(PerBarc_1(17)),num2str(PerBarc_2(17)),num2str(PerBarc_3(17)),num2str(PerBarc_4(17));
'18', num2str(MPAS_controls(18)),num2str(SDPAS_controls(18)),num2str(PerBarc_1(18)),num2str(PerBarc_2(18)),num2str(PerBarc_3(18)),num2str(PerBarc_4(18));
'19', num2str(MPAS_controls(19)),num2str(SDPAS_controls(19)),num2str(PerBarc_1(19)),num2str(PerBarc_2(19)),num2str(PerBarc_3(19)),num2str(PerBarc_4(19));
'20', num2str(MPAS_controls(20)),num2str(SDPAS_controls(20)),num2str(PerBarc_1(20)),num2str(PerBarc_2(20)),num2str(PerBarc_3(20)),num2str(PerBarc_4(20))};
 
[NoRows,NoCols]=size(DataCell);          
%create table with data from DataCell
WordCreateTable(ActXWord,NoRows,NoCols,DataCell,1);%enter before table
CloseWord(ActXWord,WordHandle,FileSpec);   


%%%%%%%%%%%%%
%Write PA parameters to Word Table

WordFileName='TableGaitMetrics_allTests.doc';
CurDir=pwd;
FileSpec = fullfile(CurDir,WordFileName);
[ActXWord,WordHandle]=StartWord(FileSpec);
fprintf('Gait metrics will be save in %s\n',FileSpec);   
text='Gait Metrics';
WordText(ActXWord,text,style,[1,1]);%enter before and after text 
DataCell={' ','TD group','CP Baseline','CP Pre','CP Post','CP Followup';
              'Mean Cadence (steps/min)', num2str(mean(cad_TD)) ,num2str(mean(GaitParams_1(:,1))),num2str(mean(GaitParams_2(:,1))),num2str(mean(GaitParams_3(:,1))),num2str(mean(GaitParams_4(:,1)));
              'Median Cadence (steps/min)', num2str(median(cad_TD)),num2str(median(GaitParams_1(:,1))),num2str(median(GaitParams_2(:,1))),num2str(median(GaitParams_3(:,1))),num2str(median(GaitParams_4(:,1)));
              'Maximum Cadence (steps/min)', num2str(max(cad_TD)) ,num2str(max(GaitParams_1(:,1))),num2str(max(GaitParams_2(:,1))),num2str(max(GaitParams_3(:,1))),num2str(max(GaitParams_4(:,1)));
              'Mean Speed (m/s)', num2str(mean(speed_TD)) ,num2str(mean(GaitParams_1(:,3))),num2str(mean(GaitParams_2(:,3))),num2str(mean(GaitParams_3(:,3))),num2str(mean(GaitParams_4(:,3)));
              'Median Speed (m/s)', num2str(median(speed_TD)),num2str(median(GaitParams_1(:,3))),num2str(median(GaitParams_2(:,3))),num2str(median(GaitParams_3(:,3))),num2str(median(GaitParams_4(:,3)));
              'Maximum Speed (m/s)', num2str(max(speed_TD)) ,num2str(max(GaitParams_1(:,3))),num2str(max(GaitParams_2(:,3))),num2str(max(GaitParams_3(:,3))),num2str(max(GaitParams_4(:,3)));
              'Mean Normalized Speed (m/s)', num2str(mean(Nspeed_TD)) ,num2str(mean(GaitParams_1(:,4))),num2str(mean(GaitParams_2(:,4))),num2str(mean(GaitParams_3(:,4))),num2str(mean(GaitParams_4(:,4)));
              'Median Normalized Speed (m/s)', num2str(median(Nspeed_TD)),num2str(median(GaitParams_1(:,4))),num2str(median(GaitParams_2(:,4))),num2str(median(GaitParams_3(:,4))),num2str(median(GaitParams_4(:,4)));
              'Maximum Normalized Speed (m/s)', num2str(max(Nspeed_TD)) ,num2str(max(GaitParams_1(:,4))),num2str(max(GaitParams_2(:,4))),num2str(max(GaitParams_3(:,4))),num2str(max(GaitParams_4(:,4)));
              'Mean Normalized Stride Length RL (m)', num2str(mean(NslR_TD)) ,num2str(mean(GaitParams_1(:,7))),num2str(mean(GaitParams_2(:,7))),num2str(mean(GaitParams_3(:,7))),num2str(mean(GaitParams_4(:,7)));
              'Median Normalized Stride Length RL (m)', num2str(median(NslR_TD)),num2str(median(GaitParams_1(:,7))),num2str(median(GaitParams_2(:,7))),num2str(median(GaitParams_3(:,7))),num2str(median(GaitParams_4(:,7)));
              'Mean Normalized Stride Length LL (m)', num2str(mean(NslL_TD)) ,num2str(mean(GaitParams_1(:,8))),num2str(mean(GaitParams_2(:,8))),num2str(mean(GaitParams_3(:,8))),num2str(mean(GaitParams_4(:,8)));
              'Median Normalized Stride Length LL (m)', num2str(median(NslL_TD)),num2str(median(GaitParams_1(:,8))),num2str(median(GaitParams_2(:,8))),num2str(median(GaitParams_3(:,8))),num2str(median(GaitParams_4(:,8)));
              'Mean Swing RL(%gct)', num2str(mean(swingR_TD)) ,num2str(mean(GaitParams_1(:,9))),num2str(mean(GaitParams_2(:,9))),num2str(mean(GaitParams_3(:,9))),num2str(mean(GaitParams_4(:,9)));
              'Median Swing RL(%gct)', num2str(median(swingR_TD)),num2str(median(GaitParams_1(:,9))),num2str(median(GaitParams_2(:,9))),num2str(median(GaitParams_3(:,9))),num2str(median(GaitParams_4(:,9)));
              'Mean Swing LL(%gct)', num2str(mean(swingL_TD)) ,num2str(mean(GaitParams_1(:,10))),num2str(mean(GaitParams_2(:,10))),num2str(mean(GaitParams_3(:,10))),num2str(mean(GaitParams_4(:,10)));
              'Median Swing LL(%gct)', num2str(median(swingL_TD)),num2str(median(GaitParams_1(:,10))),num2str(median(GaitParams_2(:,10))),num2str(median(GaitParams_3(:,10))),num2str(median(GaitParams_4(:,10)));
              'Mean Stance RL(%gct)', num2str(mean(stanceR_TD)) ,num2str(mean(GaitParams_1(:,11))),num2str(mean(GaitParams_2(:,11))),num2str(mean(GaitParams_3(:,11))),num2str(mean(GaitParams_4(:,11)));
              'Median Stance RL(%gct)', num2str(median(stanceR_TD)),num2str(median(GaitParams_1(:,11))),num2str(median(GaitParams_2(:,11))),num2str(median(GaitParams_3(:,11))),num2str(median(GaitParams_4(:,11)));
              'Mean Stance LL(%gct)', num2str(mean(stanceL_TD)) ,num2str(mean(GaitParams_1(:,12))),num2str(mean(GaitParams_2(:,12))),num2str(mean(GaitParams_3(:,12))),num2str(mean(GaitParams_4(:,12)));
              'Median Stance LL(%gct)', num2str(median(stanceL_TD)),num2str(median(GaitParams_1(:,12))),num2str(median(GaitParams_2(:,12))),num2str(median(GaitParams_3(:,12))),num2str(median(GaitParams_4(:,12)))};
               
 [NoRows,NoCols]=size(DataCell);          
    %create table with data from DataCell
 WordCreateTable(ActXWord,NoRows,NoCols,DataCell,1);%enter before table
 CloseWord(ActXWord,WordHandle,FileSpec);    
end
