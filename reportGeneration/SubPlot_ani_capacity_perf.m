function SubPlot_ani_capacity_perf
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
% N=N+1;
% h(N) = openfig('limp','new');
% % get handle to axes of figure
% ax(N)=gca;
N=N+1;
% h(N) = openfig('shank_angle_cap_pert.fig','new');
% % get handle to axes of figure
% ax(N)=gca;
% N=N+1;
% h(N) = openfig('knee_angle_cap_per.fig','new');
% % get handle to axes of figure
% ax(N)=gca;
% N=N+1;
% h(N) = openfig('thigh_angle_cap_per.fig','new');
% % get handle to axes of figure
% ax(N)=gca;
% N=N+1;  
 h(N) = openfig('limp_cap_per.fig');
% get handle to axes of figure
ax(N)=gca;
 N=N+1;
h(N) = openfig('RMS_tot_cap_per.fig','visible');
% get handle to axes of figure
ax(N)=gca;
N=N+1;
% % % % h(N) = openfig('HR_ml_cap_per.fig');
% get handle to axes of figure
% % % ax(N)=gca;
% % % N=N+1;
h(N) = openfig('HR_v_cap_per.fig');
% get handle to axes of figure
ax(N)=gca;




K=2;

plotheight1=18;
plotwidth1=18;
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
% [ax5,h5]=suplabel('Gait parameters','t');
% set(h5,'FontSize',20,'Color','r')

% filename=['fig2'];
% print(gcf, '-dpdf','-r300',[filename,'.pdf']);






% % % % % % Number of the run
% % % % % N=1;
% % % % % % % % h(N) = openfig('RMS_ml_cap_perf.fig');
% % % % % % % % % get handle to axes of figure
% % % % % % % % ax(N)=gca;
% % % % % %N=N+1;
% % % % % h(N) = openfig('RMS_tot_cap_perf.fig','visible');
% % % % % % get handle to axes of figure
% % % % % ax(N)=gca;
% % % % % N=N+1;
% % % % % % % % % h(N) = openfig('HR_ml_cap_perf.fig');
% % % % % % get handle to axes of figure
% % % % % % % % ax(N)=gca;
% % % % % % % % N=N+1;
% % % % % h(N) = openfig('HR_v_cap_perf.fig');
% % % % % % get handle to axes of figure
% % % % % ax(N)=gca;


% % % % K=2;
% % % % plotheight2=18;
% % % % plotwidth2=18;
% % % % hfig2=figure('visible','on')
% % % % %clf(f1);
% % % % set(hfig2,'PaperType','a4');
% % % % set(hfig2, 'PaperOrientation','portrait')
% % % % set(hfig2, 'PaperUnits', 'centimeters');
% % % % set(hfig2, 'PaperSize', [plotwidth2 plotheight2]);
% % % % set(hfig2, 'PaperPositionMode', 'manual');
% % % % set(hfig2, 'PaperPosition', [0 0 plotwidth2 plotheight2]);
% % % % for i=1:N
% % % %     % create and get handle to the subplot axes
% % % %     s(i) = subplot(ceil(N/K),K,i); %beautifyFigureAndMaximize
% % % %     % get handle to all the children in the figure
% % % %     aux=get(ax(i),'children');
% % % %     for j=1:size(aux)
% % % %         fig(i) = aux(j);
% % % %         copyobj(fig(i),s(i),'legacy'); 
% % % %         hold on
% % % %     end
% % % %     % copy children to new parent axes i.e. the subplot axes
% % % %     xlab=get(get(ax(i),'xlabel'),'string');
% % % %     ylab=get(get(ax(i),'ylabel'),'string');
% % % %     tit=get(get(ax(i),'title'),'string');
% % % %     xlabel(xlab);ylabel(ylab);title(tit);
% % % % end
% % % % [ax6,h6]=suplabel('Trunk-derived gait parameters','t');
% % % % set(h6,'FontSize',20,'Color','r')
% % % % 

%Saving eps with matlab and then producing pdf and png with system commands
filename1=['figure1'];
%filename2=['figure2'];
print(hfig1, '-dpdf','-r300',[filename1,'.pdf']);
%print(hfig2, '-dpdf','-r300',[filename2,'.pdf']);
%system(['convert -density 300 ',filename,'.pdf ',filename,'.png'])