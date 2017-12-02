clear all
close all
clc
Folder='D:\Fonds\Leenaards\Programme\';
pageWidth = 21; % cm
pageHeight = 29.7; % cm
graphWidth = 5.0; % cm
graphHeight = 2.3; % cm
yinit = 29.0; % cm
yincr = 0.5; % cm
y=yinit;
igraph=1;


%%% PAGE 1 %%%
f(1) = figure('PaperOrientation','portrait','papertype','A4',...
    'Units','centimeters','Position',[0 0 pageWidth pageHeight],...
    'Color','white','PaperUnits','centimeters',...
    'PaperPosition',[0 0 pageWidth pageHeight],...
    'Name',['parameters',num2str(1)]);

% Header
% ---------------------------------------------------------------------
axesText = axes;
set(axesText,'Position',[0.4 0 1 1]);
set(axesText,'Visible','Off');
y = yinit;

y = y - yincr;
[I,map] = imread('F:\CP\reporting\CP08\Picture1.png','png');
imshow(I,map);

% Title
% ---------------------------------------------------------------------
y = y - yincr*2;
text(0.02,y/pageHeight,...
    '  Résultats enregistrement 1 journée capteurs inertiels',...
    'Color','k','FontWeight','Bold','FontSize',16,...
    'HorizontalAlignment','Center');
y = y - yincr*2;
text(0.02,y/pageHeight,...
    'Patient Name  -   Le 07/06/2017',...
    'Color','k','FontSize',16,...
    'HorizontalAlignment','Center');


x = [1.50 8.00 14.50]; % cm

hold on;
axis off;

% figure 1

y = y - yincr*6.5;
axesGraph = axes;
set(axesGraph,'Position',[0 0 1 1]);
set(axesGraph,'Visible','Off');
Graph(igraph) = axes('position',[x(1)/pageWidth y/pageHeight ...
    graphWidth/pageWidth graphHeight/pageHeight]);
hold on;
openfig('cad_report.fig');
box on;
igraph = igraph+1;

% figure 2

y = y - yincr*6.5;
axesGraph = axes;
set(axesGraph,'Position',[0 0 1 1]);
set(axesGraph,'Visible','Off');
Graph(igraph) = axes('position',[x(1)/pageWidth y/pageHeight ...
    graphWidth/pageWidth graphHeight/pageHeight]);
hold on;
openfig('speed_report.fig');
box on;
igraph = igraph+1;

% figure 3

y = y - yincr*6.5;
axesGraph = axes;
set(axesGraph,'Position',[0 0 1 1]);
set(axesGraph,'Visible','Off');
Graph(igraph) = axes('position',[x(1)/pageWidth y/pageHeight ...
    graphWidth/pageWidth graphHeight/pageHeight]);
hold on;
openfig('DS_report.fig');box on;
igraph = igraph+1;


print(f(1),'-dpdf','-r300','Page1.pdf');

