function MatlabFigs_to_pdf
% -----------------------------------------------------------

% Number of the run
N=1;
h(N) = openfig('cad_cap_per.fig','new');
% get handle to axes of figure
ax(N)=gca;
N=N+1;
h(N) = openfig('speed_cap_per.fig','new');
% get handle to axes of figure
ax(N)=gca;
N=N+1;
h(N) = openfig('DS_cap_per.fig','new');
% get handle to axes of figure
ax(N)=gca;
N=N+1;
h(N) = openfig('shank_angle_cap_per.fig','new');
% get handle to axes of figure
ax(N)=gca;
N=N+1;
h(N) = openfig('knee_angle_cap_per.fig','new');
% get handle to axes of figure
ax(N)=gca;
N=N+1;
h(N) = openfig('thigh_angle_cap_per.fig','new');
% get handle to axes of figure
ax(N)=gca;
N=N+1;  
h(N) = openfig('RMS_tot_cap_per.fig','new');
% get handle to axes of figure
ax(N)=gca;
N=N+1;
h(N) = openfig('RMS_ml_cap_per.fig','new');
% get handle to axes of figure
 ax(N)=gca;
N=N+1;
h(N) = openfig('HR_v_cap_per.fig','new');
% get handle to axes of figure
ax(N)=gca;


K=3;

plotheight1=25;
plotwidth1=20;
hfig1=figure('visible','on')
%clf(f1);
set(hfig1,'PaperType','a4');
set(hfig1, 'PaperOrientation','portrait')
set(hfig1, 'PaperUnits', 'centimeters');
set(hfig1, 'PaperSize', [plotwidth1 plotheight1]);
set(hfig1, 'PaperPositionMode', 'manual');
set(hfig1, 'PaperPosition', [0 0 plotwidth1 plotheight1]);
 
for i=1:N
    % create and get handle to the subplot axes
    s(i) = subplot(ceil(N/K),K,i); %beautifyFigureAndMaximize
    % get handle to all the children in the figure
    aux=get(ax(i),'children');
    for j=1:size(aux)
        fig(i) = aux(j);
        copyobj(fig(i),s(i)); 
        hold on
    end
    % copy children to new parent axes i.e. the subplot axes
    xlab=get(get(ax(i),'xlabel'),'string');
    ylab=get(get(ax(i),'ylabel'),'string');
    tit=get(get(ax(i),'title'),'string');
    xlabel(xlab);ylabel(ylab);title(tit);
end

%Saving eps with matlab and then producing pdf and png with system commands
filename1=['Gait_params'];
%filename2=['figure2'];
print(hfig1, '-dpdf','-r300',[filename1,'.pdf']);
%print(hfig2, '-dpdf','-r300',[filename2,'.pdf']);
%system(['convert -density 300 ',filename,'.pdf ',filename,'.png'])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h1 = openfig('barcode.fig'); % open figure
%ax1 = gca; % get handle to axes of figure

h2 = openfig('PApattern.fig');
%ax2 = gca;

h3 = openfig('pie_PA.fig');
%ax3 = gca;

h4 = openfig('spider_perf_DL.fig');
%ax4 = gca;
%Saving eps with matlab and then producing pdf and png with system commands
filename1=['barcode'];
filename2=['PAPattern'];
filename3=['piePA'];
filename4=['spider_perfDL'];

print(h1, '-dpdf','-r300',[filename1,'.pdf']);
print(h2, '-dpdf','-r300',[filename2,'.pdf']);
print(h3, '-dpdf','-r300',[filename3,'.pdf']);
print(h4, '-dpdf','-r300',[filename4,'.pdf']);

%system(['convert -density 300 ',filename,'.pdf ',filename,'.png'])

