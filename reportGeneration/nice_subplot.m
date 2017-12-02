%parameters for figure and panel size
plotheight=10;
plotwidth=20;
subplotsx=3;
subplotsy=2;   
leftedge=1.2;
rightedge=0.4;   
topedge=1.5;
bottomedge=1.5;
spacex=0.5;
spacey=0.5;
fontsize=10;    
sub_pos=subplot_pos_ani(plotwidth,plotheight,leftedge,rightedge,bottomedge,topedge,subplotsx,subplotsy,spacex,spacey);
 
%setting the Matlab figure
f=figure('visible','on')
clf(f);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [plotwidth plotheight]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 plotwidth plotheight]);
 
%loop to create axes
for i=1:subplotsx
for ii=1:subplotsy
 
ax=axes('position',sub_pos{i,ii},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
 
z=peaks;
contour(z);
 
% if ii==subplotsy
% title(['Title (',num2str(i),')'])
% end
%  
% if ii>1
% set(ax,'xticklabel',[])
% end
%  
% if i>1
% set(ax,'yticklabel',[])
% end
%  
% if i==1
% ylabel(['Ylabel (',num2str(ii),')'])
% end
%  
% if ii==1
% xlabel(['Ylabel (',num2str(i),')'])
% end
%  
end
end
 
%Saving eps with matlab and then producing pdf and png with system commands
filename=['test_nice_subplot'];
%print(gcf, '-dPDF','-loose',[filename,'.pdf']);
print(gcf, '-dpdf','-r300',[filename,'.pdf']);
%system(['epstopdf ',filename,'.eps'])
system(['convert -density 300 ',filename,'.pdf ',filename,'.png'])

function [ positions ] = subplot_pos_ani(plotwidth,plotheight,leftmargin,rightmargin,bottommargin,topmargin,nbx,nby,spacex,spacey)
 
    subxsize=(plotwidth-leftmargin-rightmargin-spacex*(nbx-1.0))/nbx;
    subysize=(plotheight-topmargin-bottommargin-spacey*(nby-1.0))/nby;
 
    for i=1:nbx
       for j=1:nby
 
           xfirst=leftmargin+(i-1.0)*(subxsize+spacex);
           yfirst=bottommargin+(j-1.0)*(subysize+spacey);
 
           positions{i,j}=[xfirst/plotwidth yfirst/plotheight subxsize/plotwidth subysize/plotheight];
 
       end
    end
end




