
%%%%%Plot posture Results%%%%%%%%%%
%cd E:\CP\RefValuesControlsDL\posture
load duration_SiLy_controls 
load duration_St_controls 
load duration_Wk_controls 

load percent_SiLy_controls 
load percent_St_controls 
load percent_Wk_controls 

load MeanPercentPosturesControls 
load SDPercentPosturesControls 

%%%%%%%%%%%%%%%%%%
%cd E:\CP\Daily-Life_Tier2\CP_GMFCS_I\CP_PERF05\D2\processed
load posture_ref
ns=40*3600;
nw=fix(length(posture_ref)/ns);
for k=0:nw-1
    l1=k*ns+1;
    l2=(k+1)*ns;
    ph=posture_ref(l1:l2);
    LySi(k+1)=length(find(ph==1 | ph==2))/(40*60);
    St(k+1)=length(find(ph==3))/(40*60);
    Wk(k+1)=length(find(ph==4))/(40*60);
end

act=[LySi; St; Wk];
act=act';
fig1=figure
bar(act,'stacked')
legend('lying/sitting','standing','walking')
xlabel('hours','FontSize',14)
ylabel('duration(min)','FontSize',14)
supertitle('posture allocation per hour')
savefig(fig1,'posture_allocation_per_hour.fig');
saveas(fig1,'posture_allocation_per_hour','png')
saveas(fig1,'posture_allocation_per_hour','tif')
saveas(fig1,'posture_allocation_per_hour','jpg')
%%%%%%%%%%%%%%%%%
l=round(length(posture_ref)/40);
indx1=groupfind(posture_ref==1 | posture_ref==2); 
indx2=groupfind(posture_ref==3); 
indx3=groupfind(posture_ref==4); 
DSitLy_CP=round((indx1(:,2)-indx1(:,1))/40);
DSt_CP=round((indx2(:,2)-indx2(:,1))/40);
DWk_CP=round((indx3(:,2)-indx3(:,1))/40);

PSitLy_CP=(sum(DSitLy_CP)/l)*100;
PSt_CP=(sum(DSt_CP)/l)*100;
PWk_CP=(sum(DWk_CP)/l)*100;
clear posture_ref; clear indx1; clear indx2;  clear indx3; 
MeanPostures=[MeanPercentPosturesControls; PSitLy_CP  PSt_CP PWk_CP];
SDPostures=[SDPercentPosturesControls; 0  0 0];
errorbar_groups_postures_ani(MeanPostures,SDPostures,'bar_names',{'lying/sitting','standing','walking'});
legend('TD Group', 'CP patient')
ylabel('% of monitoring time','FontSize',14)
supertitle('daily posture allocation');
savefig(gcf,'BarplotPostures.fig')
saveas(gcf,'BarplotPostures','png')
saveas(gcf,'BarplotPostures','tif')
saveas(gcf,'BarplotPostures','jpg')

duration_St_controls=duration_St_controls';
[m2,n2]=size(duration_St_controls)
[m22,n22]=size(DSt_CP)

duration_SiLy_controls=duration_SiLy_controls';
[m1,n1]=size(duration_SiLy_controls)
[m11,n11]=size(DSitLy_CP)

duration_Wk_controls=duration_Wk_controls';
[m3,n3]=size(duration_Wk_controls)
[m33,n33]=size(DWk_CP)

f2=figure
subplot(131)
 group = [repmat({'TD group'}, m1, n1); repmat({'CP patient'}, m11, n11); ];
 boxplot([duration_SiLy_controls; DSitLy_CP;], group);
 ylabel('lying/sitting (sec) ')
 xtickangle(45);
 
 subplot(132)
 group = [repmat({'TD group'}, m2, n2); repmat({'CP patient'}, m22, n22); ];
 boxplot([duration_St_controls; DSt_CP;], group);
 ylabel('standing (sec)')
 xtickangle(45);
 
 subplot(133)
 group = [repmat({'TD group'}, m3, n3); repmat({'CP patient'}, m33, n33); ];
 boxplot([duration_Wk_controls; DWk_CP;], group);
 ylabel('walking (sec)');
 xtickangle(45);
 supertitle('duration of periods')
 savefig(f2,'BoxPlotDurationPosturePeriods.fig')
 saveas(f2,'BoxPlotDurationPosturePeriods','png')
 saveas(f2,'BoxPlotDurationPosturePeriods','tif')
 saveas(f2,'BoxPlotDurationPosturePeriods','jpg')

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%Plot Performance Results%%%%%%%%%%
load posture_ref
load walk_ref
load walking_params_new;

[n2,m2]=size(walk_ref);
StWk_ref=[];EndWk_ref=[];steps_ref=[];
for i=1:m2
    StWk_ref(i)=walk_ref(i).start;
    EndWk_ref(i)=walk_ref(i).end;
    steps_ref(i)=walk_ref(i).steps; 
    MeanCad_ref(i)=round((40*60*steps_ref(i))/(EndWk_ref(i)-StWk_ref(i)));   
end

indwk=groupfind(posture_ref==4); 
indst=groupfind(posture_ref==3); 
indsi=groupfind(posture_ref==2 | posture_ref==1);

% wkperc=(length(posture_ref==4)/length(posture_ref))*100;
% stperc=(length(posture_ref==3)/length(posture_ref))*100;
% sedperc=(length(posture_ref==2 | posture_ref==1)/length(posture_ref))*100;
wkperc=(length(find(posture_ref==4)))/length(posture_ref);
stperc=(length(find(posture_ref==3)))/length(posture_ref);
sedperc=(length(find(posture_ref==2 | posture_ref==1)))/length(posture_ref);
actv=(length(find(posture_ref==3 | posture_ref==4)))/length(posture_ref)*100;

X=[sedperc stperc wkperc];
fig1=figure
h=pie(X);
set(h(2:2:6),'FontSize',20);
legend(h(1:2:end),'sitting/lying','standing','walking','Orientation','horizontal','location','bestoutside');
colormap jet
set(gca,'Fontsize',14)
savefig(fig1,'PiePostures.fig');
saveas(fig1,'PiePostures','png')
saveas(fig1,'PiePostures','tif')
saveas(fig1,'PiePostures','jpg')

totalSteps=sum(steps_ref);
maxSteps=max(steps_ref);
maxSpeed=prctile(walking_params_new(:,14),90);

metrics_perf=[totalSteps maxSteps maxSpeed actv];
save metrics_perf metrics_perf

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%cd E:\CP\Daily-Life_Tier2\CP_GMFCS_I\CP_PERF05\D2\processed
load metrics_perf
sp_tot= metrics_perf(1);
sp_max=metrics_perf(2);
spd_max=metrics_perf(3);
acv=metrics_perf(4);
clear metrics_perf

%cd E:\CP\RefValuesControlsDL\performance 
load RefValuesPerf_TD 

mean_ref=[round(RefValuesPerf_TD(1,1)) round(RefValuesPerf_TD(2,1)) RefValuesPerf_TD(3,1) round(RefValuesPerf_TD(4,1))];
sd1_ref=[round(RefValuesPerf_TD(1,1)+RefValuesPerf_TD(1,2)) round(RefValuesPerf_TD(2,1)+RefValuesPerf_TD(2,2)) RefValuesPerf_TD(3,1)+RefValuesPerf_TD(3,2) round(RefValuesPerf_TD(4,1)+RefValuesPerf_TD(4,2))];
sd2_ref=[round(RefValuesPerf_TD(1,1)-RefValuesPerf_TD(1,2)) round(RefValuesPerf_TD(2,1)-RefValuesPerf_TD(2,2)) RefValuesPerf_TD(3,1)-RefValuesPerf_TD(3,2) round(RefValuesPerf_TD(4,1)-RefValuesPerf_TD(4,2))];
%params_CP=[round(acv) round(sp_max) spd_max round(sp_tot)];
params_CP=[round(sp_tot) round(sp_max) spd_max round(acv)];
params_tot=[mean_ref; sd1_ref; sd2_ref; params_CP;]';

fig1=spider(params_tot,'CP vs.TDs',[],{'total steps' ''; 'max walk' 'steps'; 'max speed' 'm/s'; 'activ' '%'},{'TD(Mean)' 'TD(Mean+SD)' 'TD(Mean-SD)' 'CP'})
savefig(fig1,'spider_perf_DL.fig');
saveas(fig1,'spider_perf_DL','png')
saveas(fig1,'spider_perf_DL','tif')
saveas(fig1,'spider_perf_DL','jpg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



[h,p,ks2stat_wk] = kstest2(duration_Wk_controls,DWk_CP);
[h,p,ks2stat_st] = kstest2(duration_St_controls,DSt_CP);
[h,p,ks2stat_sed] = kstest2(duration_SiLy_controls,DSitLy_CP);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Write PA parameters to Word Table

WordFileName='TablePAMetrics.doc';
CurDir=pwd;
FileSpec = fullfile(CurDir,WordFileName);
[ActXWord,WordHandle]=StartWord(FileSpec);
fprintf('Performance metrics will be save in %s\n',FileSpec);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

    %Section 3
    style='Heading 1';
    text='Physical Activity Metrics';
    WordText(ActXWord,text,style,[1,1]);%enter before and after text 
   
    %the obvious data
    DataCell={' ','TD group','CP Baseline','CP FollowUp 1','CP FollowUp 2','CP FollowUp 3';
              'Median Walking periods (sec)', num2str(median(duration_Wk_controls)) ,num2str(median(DWk_CP)),'','','';
              'Median Standing periods (sec)', num2str(median(duration_St_controls)),num2str(median(DSt_CP)),'','','';
              'Median Sedentary periods (sec)', num2str(median(duration_SiLy_controls)) ,num2str(median(DSitLy_CP)),'','','';
              'Maximal Walking period (sec)', num2str(max(duration_Wk_controls)) ,num2str(max(DWk_CP)),'','','';
              'Maximal Standing period (sec)', num2str(max(duration_St_controls)),num2str(max(DSt_CP)),'','','';
              'Maximal Sedentary period (sec)', num2str(max(duration_SiLy_controls)) ,num2str(max(DSitLy_CP)),'','','';
              'Time spent Walking (%) ',num2str(MeanPercentPosturesControls(3)) ,num2str(PWk_CP),'','','';
              'Time spent Standing (%)',num2str(MeanPercentPosturesControls(2)) ,num2str(PSt_CP),'','','';
              'Time spent Sedentary (%)',num2str(MeanPercentPosturesControls(1)) ,num2str(PSitLy_CP),'','','';
              'Statistical Distance Cadence','',num2str(ks2stat_wk),'','','';
              'Statistical Distance Cadence','',num2str(ks2stat_st),'','','';
              'Statistical Distance Cadence','',num2str(ks2stat_sed),'','','';}             
    [NoRows,NoCols]=size(DataCell)          
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % % SUB-FUNCTIONS write to word
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % function [actx_word,word_handle]=StartWord(word_file_p)
% % % % % % % % %     % Start an ActiveX session with Word:
% % % % % % % % %     actx_word = actxserver('Word.Application');
% % % % % % % % %     actx_word.Visible = true;
% % % % % % % % %     trace(actx_word.Visible);  
% % % % % % % % %     if ~exist(word_file_p,'file');
% % % % % % % % %         % Create new document:
% % % % % % % % %         word_handle = invoke(actx_word.Documents,'Add');
% % % % % % % % %     else
% % % % % % % % %         % Open existing document:
% % % % % % % % %         word_handle = invoke(actx_word.Documents,'Open',word_file_p);
% % % % % % % % %     end           
% % % % % % % % % end
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % function WordGoTo(actx_word_p,what_p,which_p,count_p,name_p,delete_p)
% % % % % % % % %     %Selection.GoTo(What,Which,Count,Name)
% % % % % % % % %     actx_word_p.Selection.GoTo(what_p,which_p,count_p,name_p);
% % % % % % % % %     if(delete_p)
% % % % % % % % %         actx_word_p.Selection.Delete;
% % % % % % % % %     end
% % % % % % % % % 
% % % % % % % % % end
% % % % % % % % % 
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % function WordCreateTOC(actx_word_p,upper_heading_p,lower_heading_p)
% % % % % % % % % %      With ActiveDocument
% % % % % % % % % %         .TablesOfContents.Add Range:=Selection.Range, RightAlignPageNumbers:= _
% % % % % % % % % %             True, UseHeadingStyles:=True, UpperHeadingLevel:=1, _
% % % % % % % % % %             LowerHeadingLevel:=3, IncludePageNumbers:=True, AddedStyles:="", _
% % % % % % % % % %             UseHyperlinks:=True, HidePageNumbersInWeb:=True, UseOutlineLevels:= _
% % % % % % % % % %             True
% % % % % % % % % %         .TablesOfContents(1).TabLeader = wdTabLeaderDots
% % % % % % % % % %         .TablesOfContents.Format = wdIndexIndent
% % % % % % % % % %     End With
% % % % % % % % %     actx_word_p.ActiveDocument.TablesOfContents.Add(actx_word_p.Selection.Range,1,...
% % % % % % % % %         upper_heading_p,lower_heading_p);
% % % % % % % % %     
% % % % % % % % %     actx_word_p.Selection.TypeParagraph; %enter  
% % % % % % % % % end
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % function WordText(actx_word_p,text_p,style_p,enters_p,color_p)
% % % % % % % % % 	%VB Macro
% % % % % % % % % 	%Selection.TypeText Text:="Test!"
% % % % % % % % % 	%in Matlab
% % % % % % % % % 	%set(word.Selection,'Text','test');
% % % % % % % % % 	%this also works
% % % % % % % % % 	%word.Selection.TypeText('This is a test');    
% % % % % % % % %     if(enters_p(1))
% % % % % % % % %         actx_word_p.Selection.TypeParagraph; %enter
% % % % % % % % %     end
% % % % % % % % % 	actx_word_p.Selection.Style = style_p;
% % % % % % % % %     if(nargin == 5)%check to see if color_p is defined
% % % % % % % % %         actx_word_p.Selection.Font.ColorIndex=color_p;     
% % % % % % % % %     end
% % % % % % % % %     
% % % % % % % % % 	actx_word_p.Selection.TypeText(text_p);
% % % % % % % % %     actx_word_p.Selection.Font.ColorIndex='wdAuto';%set back to default color
% % % % % % % % %     for k=1:enters_p(2)    
% % % % % % % % %         actx_word_p.Selection.TypeParagraph; %enter
% % % % % % % % %     end
% % % % % % % % % end
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % function WordSymbol(actx_word_p,symbol_int_p)
% % % % % % % % %     % symbol_int_p holds an integer representing a symbol, 
% % % % % % % % %     % the integer can be found in MSWord's insert->symbol window    
% % % % % % % % %     % 176 = degree symbol
% % % % % % % % %     actx_word_p.Selection.InsertSymbol(symbol_int_p);
% % % % % % % % % end
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % function WordCreateTable(actx_word_p,nr_rows_p,nr_cols_p,data_cell_p,enter_p) 
% % % % % % % % %     %Add a table which auto fits cell's size to contents
% % % % % % % % %     if(enter_p(1))
% % % % % % % % %         actx_word_p.Selection.TypeParagraph; %enter
% % % % % % % % %     end
% % % % % % % % %     %create the table
% % % % % % % % %     %Add = handle Add(handle, handle, int32, int32, Variant(Optional))
% % % % % % % % %     actx_word_p.ActiveDocument.Tables.Add(actx_word_p.Selection.Range,nr_rows_p,nr_cols_p,1,1);
% % % % % % % % %     %Hard-coded optionals                     
% % % % % % % % %     %first 1 same as DefaultTableBehavior:=wdWord9TableBehavior
% % % % % % % % %     %last  1 same as AutoFitBehavior:= wdAutoFitContent
% % % % % % % % %      
% % % % % % % % %     %write the data into the table
% % % % % % % % %     for r=1:nr_rows_p
% % % % % % % % %         for c=1:nr_cols_p
% % % % % % % % %             %write data into current cell
% % % % % % % % %             WordText(actx_word_p,data_cell_p{r,c},'Normal',[0,0]);
% % % % % % % % %             
% % % % % % % % %             if(r*c==nr_rows_p*nr_cols_p)
% % % % % % % % %                 %we are done, leave the table
% % % % % % % % %                 actx_word_p.Selection.MoveDown;
% % % % % % % % %             else%move on to next cell 
% % % % % % % % %                 actx_word_p.Selection.MoveRight;
% % % % % % % % %             end            
% % % % % % % % %         end
% % % % % % % % %     end
% % % % % % % % % end
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % function WordPageNumbers(actx_word_p,align_p)
% % % % % % % % %     %make sure the window isn't split
% % % % % % % % %     if (~strcmp(actx_word_p.ActiveWindow.View.SplitSpecial,'wdPaneNone')) 
% % % % % % % % %         actx_word_p.Panes(2).Close;
% % % % % % % % %     end
% % % % % % % % %     %make sure we are in printview
% % % % % % % % %     if (strcmp(actx_word_p.ActiveWindow.ActivePane.View.Type,'wdNormalView') | ...
% % % % % % % % %         strcmp(actx_word_p.ActiveWindow.ActivePane.View.Type,'wdOutlineView'))
% % % % % % % % %         actx_word_p.ActiveWindow.ActivePane.View.Type ='wdPrintView';
% % % % % % % % %     end
% % % % % % % % %     %view the headers-footers
% % % % % % % % %     actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekCurrentPageHeader';
% % % % % % % % %     if actx_word_p.Selection.HeaderFooter.IsHeader
% % % % % % % % %         actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekCurrentPageFooter';
% % % % % % % % %     else
% % % % % % % % %         actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekCurrentPageHeader';
% % % % % % % % %     end
% % % % % % % % %     %now add the pagenumbers 0->don't display any pagenumber on first page
% % % % % % % % %      actx_word_p.Selection.HeaderFooter.PageNumbers.Add(align_p,0);
% % % % % % % % %      actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekMainDocument';
% % % % % % % % % end
% % % % % % % % % 
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % function PrintMethods(actx_word_p,category_p)
% % % % % % % % %     style='Heading 3';
% % % % % % % % %     text=strcat(category_p,'-methods');
% % % % % % % % %     WordText(actx_word_p,text,style,[1,1]);           
% % % % % % % % %     
% % % % % % % % %     style='Normal';    
% % % % % % % % %     text=strcat('Methods called from Matlab as: ActXWord.',category_p,'.MethodName(xxx)');
% % % % % % % % %     WordText(actx_word_p,text,style,[0,0]);           
% % % % % % % % %     text='Ignore the first parameter "handle". ';
% % % % % % % % %     WordText(actx_word_p,text,style,[1,3]);           
% % % % % % % % %     
% % % % % % % % %     MethodsStruct=eval(['invoke(actx_word_p.' category_p ')']);
% % % % % % % % %     MethodsCell=struct2cell(MethodsStruct);
% % % % % % % % %     NrOfFcns=length(MethodsCell);
% % % % % % % % %     for i=1:NrOfFcns
% % % % % % % % %         MethodString=MethodsCell{i};
% % % % % % % % %         WordText(actx_word_p,MethodString,style,[0,1]);           
% % % % % % % % %     end
% % % % % % % % % end
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % function FigureIntoWord(actx_word_p)
% % % % % % % % % 	% Capture current figure/model into clipboard:
% % % % % % % % % 	print -dmeta
% % % % % % % % % 	% Find end of document and make it the insertion point:
% % % % % % % % % 	end_of_doc = get(actx_word_p.activedocument.content,'end');
% % % % % % % % % 	set(actx_word_p.application.selection,'Start',end_of_doc);
% % % % % % % % % 	set(actx_word_p.application.selection,'End',end_of_doc);
% % % % % % % % % 	% Paste the contents of the Clipboard:
% % % % % % % % %     %also works Paste(ActXWord.Selection)
% % % % % % % % % 	invoke(actx_word_p.Selection,'Paste');
% % % % % % % % %     actx_word_p.Selection.TypeParagraph; %enter    
% % % % % % % % % end
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % function CloseWord(actx_word_p,word_handle_p,word_file_p)
% % % % % % % % %     if ~exist(word_file_p,'file')
% % % % % % % % %         % Save file as new:
% % % % % % % % %         invoke(word_handle_p,'SaveAs',word_file_p,1);
% % % % % % % % %     else
% % % % % % % % %         % Save existing file:
% % % % % % % % %         invoke(word_handle_p,'Save');
% % % % % % % % %     end
% % % % % % % % %     % Close the word window:
% % % % % % % % %     invoke(word_handle_p,'Close');            
% % % % % % % % %     % Quit MS Word
% % % % % % % % %     invoke(actx_word_p,'Quit');            
% % % % % % % % %     % Close Word and terminate ActiveX:
% % % % % % % % %     delete(actx_word_p);            
% % % % % % % % % end
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

