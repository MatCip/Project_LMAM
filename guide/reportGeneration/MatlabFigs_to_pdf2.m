function MatlabFigs_to_pdf
% -----------------------------------------------------------

% Number of the run
N=1;
h(N) = openfig('barcode.fig','new');
% get handle to axes of figure
ax(N)=gca;
N=N+1;
h(N) = openfig('PApattern.fig','new');
% get handle to axes of figure
ax(N)=gca;

K=1;

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

%Saving eps with matlab and then producing pdf and png with system commands
%filename1=['Gait_params'];
%filename2=['figure2'];
%print(hfig1, '-dpdf','-r300',[filename1,'.pdf']);
%print(hfig2, '-dpdf','-r300',[filename2,'.pdf']);
%system(['convert -density 300 ',filename,'.pdf ',filename,'.png'])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

