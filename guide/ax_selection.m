 function varargout = ax_selection(varargin)
% AX_SELECTION MATLAB code for ax_selection.fig
%      AX_SELECTION, by itself, creates a new AX_SELECTION or raises the existing
%      singleton*.
%
%      H = AX_SELECTION returns the handle to a new AX_SELECTION or the handle to
%      the existing singleton*.
%
%      AX_SELECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AX_SELECTION.M with the given input arguments.
%
%      AX_SELECTION('Property','Value',...) creates a new AX_SELECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ax_selection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ax_selection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ax_selection

% Last Modified by GUIDE v2.5 05-Nov-2017 18:24:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ax_selection_OpeningFcn, ...
                   'gui_OutputFcn',  @ax_selection_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ax_selection is made visible.
function ax_selection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ax_selection (see VARARGIN)

% Choose default command line output for ax_selection
handles.output = hObject;


handles.gyr1_LShank40_1=varargin{1};
handles.gyr2_LShank40_1=varargin{2};
handles.gyr3_LShank40_1=varargin{3};


handles.acc1_LShank40_1=varargin{4};
handles.acc2_LShank40_1=varargin{5};
handles.acc3_LShank40_1=varargin{6};


handles.gyr1_RShank40_1=varargin{7};
handles.gyr2_RShank40_1=varargin{8};
handles.gyr3_RShank40_1=varargin{9};


handles.acc1_RShank40_1=varargin{10};
handles.acc2_RShank40_1=varargin{11};
handles.acc3_RShank40_1=varargin{12};

handles.gyr1_LThigh40_1=varargin{13};
handles.gyr2_LThigh40_1=varargin{14};
handles.gyr3_LThigh40_1=varargin{15};


handles.acc1_LThigh40_1=varargin{16};
handles.acc2_LThigh40_1=varargin{17};
handles.acc3_LThigh40_1=varargin{18};

handles.gyr1_RThigh_lpf_1=varargin{19};
handles.gyr2_RThigh_lpf_1=varargin{20};
handles.gyr3_RThigh_lpf_1=varargin{21};

handles.acc1_RThigh_lpf_1=varargin{22};
handles.acc2_RThigh_lpf_1=varargin{23};
handles.acc3_RThigh_lpf_1=varargin{24};


handles.gyr1_trunk_lpf_1=varargin{25};
handles.gyr2_trunk_lpf_1=varargin{26};
handles.gyr3_trunk_lpf_1=varargin{27};

handles.acc1_trunk_lpf_1=varargin{28};
handles.acc2_trunk_lpf_1=varargin{29};
handles.acc3_trunk_lpf_1=varargin{30};



handles.t_1=varargin{31};

% creation of the container cell

handles.trunk_cell=varargin{32};
handles.thigh_cell=varargin{33};
handles.shank_cell=varargin{34};


handles.acc1_trunk40=varargin{35};
handles.acc2_trunk40=varargin{36};
handles.acc3_trunk40=varargin{37};
disp(varargin);
clearvars varargin
% indexes for selection control
handles.acc_t_ind=1;
handles.gyr_t_ind=1;
handles.acc_th_ind=1;
handles.gyr_th_ind=1;
handles.acc_sh_ind=1;
handles.gyr_sh_ind=1;


% booleans

hanldes.is_trunk_modiefied=false(1);
hanldes.is_thigh_modiefied=false(1);
hanldes.is_shank_modiefied=false(1);
%status state 
handles.status_Thigh=ones(2,6,2);
handles.status_Thigh(:,:,2)=zeros(2,6);
handles.status_Shank=ones(2,6,2);
handles.status_Shank(:,:,2)=zeros(2,6);
handles.status_trunk=ones(6,2);
handles.status_trunk(:,2)=zeros(6,1);
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes ax_selection wait for user response (see UIRESUME)
uiwait(handles.figure1);





% --- Outputs from this function are returned to the command line.
function varargout = ax_selection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

varargout{1} = 1;



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 disp('trunk');
 disp(handles.status_trunk);
  disp('shank');
 disp(handles.status_Shank);
  disp('Thigh');
  disp(handles.status_Thigh);
  
  
 handles.status_trunk(handles.status_trunk(:,2)==1,2)=-1;
 handles.status_trunk(handles.status_trunk(:,2)==0,2)=1;
  

 
 handles.status_Shank(1,handles.status_Shank(1,:,2)==1,2)=-1;
 handles.status_Shank(2,handles.status_Shank(2,:,2)==1,2)=-1;
 handles.status_Shank(1,handles.status_Shank(1,:,2)==0,2)=1;
 handles.status_Shank(2,handles.status_Shank(2,:,2)==0,2)=1;
  
 handles.status_Thigh(1,handles.status_Thigh(1,:,2)==1,2)=-1;
 handles.status_Thigh(2,handles.status_Thigh(2,:,2)==1,2)=-1;
 handles.status_Thigh(1,handles.status_Thigh(1,:,2)==0,2)=1;
 handles.status_Thigh(2,handles.status_Thigh(2,:,2)==0,2)=1;
 
 disp('trunk');
 disp(handles.status_trunk);
  disp('shank');
 disp(handles.status_Shank);
  disp('Thigh');
  disp(handles.status_Thigh);
%trunk 
for i=1:3
    switch handles.status_trunk(i,1)
        case 1
            frontalAccTr=handles.trunk_cell{1}*handles.status_trunk(1,2);
            verticalAccTr=handles.trunk_cell{2}*handles.status_trunk(2,2);
            lateralAccTr=handles.trunk_cell{3}*handles.status_trunk(3,2);
           
            i=3; % forcing the exit
        case 2
            frontalAccTr=handles.trunk_cell{i}*handles.status_trunk(i,2);
        case 3
            verticalAccTr=handles.trunk_cell{i}*handles.status_trunk(i,2);
        case 4
            lateralAccTr=handles.trunk_cell{i}*handles.status_trunk(i,2);
    end

end

for i=4:6
    switch handles.status_trunk(i,1)
        case 1
            PitchGyroTr=handles.trunk_cell{4}*handles.status_trunk(4,2);
            RollGyroTr=handles.trunk_cell{5}*handles.status_trunk(5,2);
            YawGyroTr=handles.trunk_cell{6}*handles.status_trunk(6,2);
            i=6;
        case 2
            PitchGyroTr=handles.trunk_cell{i}*handles.status_trunk(i,2);
        case 3
            RollGyroTr=handles.trunk_cell{i}*handles.status_trunk(i,2);
        case 4
            YawGyroTr=handles.trunk_cell{i}*handles.status_trunk(i,2);
    end

end

%left thigh


    
for i=1:3
    switch handles.status_Thigh(1,i,1)
        case 1
            frontalAccLThigh=handles.thigh_cell{1,1}*handles.status_Thigh(1,1,2);
            verticalAccLThigh=handles.thigh_cell{1,2}*handles.status_Thigh(1,2,2);
            lateralAccLThigh=handles.thigh_cell{1,3}*handles.status_Thigh(1,3,2);
            i=3;
        case 2
            frontalAccLThigh=handles.thigh_cell{1,i}*handles.status_Thigh(1,i,2);
        case 3
            
            verticalAccLThigh=handles.thigh_cell{1,i}*handles.status_Thigh(1,i,2);
        case 4
            lateralAccLThigh=handles.thigh_cell{1,i}*handles.status_Thigh(1,i,2);
    end

end

for i=4:6
    switch  handles.status_Thigh(1,i,1)
        case 1
        PitchGyroLThigh=handles.thigh_cell{1,4}*handles.status_Thigh(1,4,2);
        RollGyroLThigh=handles.thigh_cell{1,5}*handles.status_Thigh(1,5,2);
        YawGyroLThigh=handles.thigh_cell{1,6}*handles.status_Thigh(1,6,2);
        i=6;
        
        case 2
            PitchGyroLThigh=handles.thigh_cell{1,i}*handles.status_Thigh(1,i,2);
        case 3
            RollGyroLThigh=handles.thigh_cell{1,i}*handles.status_Thigh(1,i,2);
        case 4
            YawGyroLThigh=handles.thigh_cell{1,i}*handles.status_Thigh(1,i,2);
    end

end


%right thigh

for i=1:3

    switch handles.status_Thigh(2,i,1)
        case 1
            frontalAccRThigh=handles.thigh_cell{2,1}*handles.status_Thigh(2,1,2);
            verticalAccRThigh=handles.thigh_cell{2,2}*handles.status_Thigh(2,2,2);
            lateralAccRThigh=handles.thigh_cell{2,3}*handles.status_Thigh(2,3,2);
            i=3;
        case 2
            frontalAccRThigh=handles.thigh_cell{2,i}*handles.status_Thigh(2,i,2);
        case 3
            verticalAccRThigh=handles.thigh_cell{2,i}*handles.status_Thigh(2,i,2);
        case 4
            lateralAccRThigh=handles.thigh_cell{2,i}*handles.status_Thigh(2,i,2);
    end

end

for i=4:6
    switch handles.status_Thigh(2,i,1)
        case 1
            PitchGyroRThigh=handles.thigh_cell{2,4}*handles.status_Thigh(2,4,2);
            RollGyroRThigh=handles.thigh_cell{2,5}*handles.status_Thigh(2,5,2);
            YawGyroRThigh=handles.thigh_cell{2,6}*handles.status_Thigh(2,6,2);
            i=6;
        case 2
            PitchGyroRThigh=handles.thigh_cell{2,i}*handles.status_Thigh(2,i,2);
        case 3
            RollGyroRThigh=handles.thigh_cell{2,i}*handles.status_Thigh(2,i,2);
        case 4
            YawGyroRThigh=handles.thigh_cell{2,i}*handles.status_Thigh(2,i,2);
    end

end

%Shank

%left shank
for i=1:3
    switch handles.status_Shank(1,i,1)
        
        case 1 
            frontalAccLShank=handles.shank_cell{1,1}*handles.status_Shank(1,1,2);
            verticalAccLShank=handles.shank_cell{1,2}*handles.status_Shank(1,2,2);
            lateralAccLShank=handles.shank_cell{1,3}*handles.status_Shank(1,3,2); 
            i=3;
            
        case 2
            frontalAccLShank=handles.shank_cell{1,i}*handles.status_Shank(1,i,2);
        case 3
            verticalAccLShank=handles.shank_cell{1,i}*handles.status_Shank(1,i,2);
            
        case 4
            lateralAccLShank=handles.shank_cell{1,i}*handles.status_Shank(1,i,2); 
    end

end

for i=4:6
    switch  handles.status_Shank(1,i,1)
        
        case 1
             PitchGyroLShank=handles.shank_cell{1,4}*handles.status_Shank(1,4,2);
             RollGyroLShank=handles.shank_cell{1,5}*handles.status_Shank(1,5,2);
             YawGyroLShank=handles.shank_cell{1,6}*handles.status_Shank(1,6,2);
             i=6;
        case 2
            PitchGyroLShank=handles.shank_cell{1,i}*handles.status_Shank(1,i,2);
        case 3
            RollGyroLShank=handles.shank_cell{1,i}*handles.status_Shank(1,i,2);
        case 4
            YawGyroLShank=handles.shank_cell{1,i}*handles.status_Shank(1,i,2);
    end

end


%right shank


for i=1:3
  
    switch handles.status_Shank(2,i,1)
        case 1
             frontalAccRShank=handles.shank_cell{2,1}*handles.status_Shank(2,1,2);
             verticalAccRShank=handles.shank_cell{2,2}*handles.status_Shank(2,2,2);
             lateralAccRShank=handles.shank_cell{2,3}*handles.status_Shank(2,3,2);
             i=3;
        case 2
            frontalAccRShank=handles.shank_cell{2,i}*handles.status_Shank(2,i,2);
        case 3
            verticalAccRShank=handles.shank_cell{2,i}*handles.status_Shank(2,i,2);
        case 4
            lateralAccRShank=handles.shank_cell{2,i}*handles.status_Shank(2,i,2);
    end

end




for i=4:6
    switch handles.status_Thigh(2,i,1)
        case 1
            PitchGyroRShank=handles.shank_cell{2,4}*handles.status_Shank(2,4,2);
            RollGyroRShank=handles.shank_cell{2,5}*handles.status_Shank(2,5,2);
            YawGyroRShank=handles.shank_cell{2,6}*handles.status_Shank(2,6,2);
            i=6;
        case 2
            PitchGyroRShank=handles.shank_cell{2,i}*handles.status_Shank(2,i,2);
        case 3
            RollGyroRShank=handles.shank_cell{2,i}*handles.status_Shank(2,i,2);
        case 4
            YawGyroRShank=handles.shank_cell{2,i}*handles.status_Shank(2,i,2);
    end

end




verticalAccTr_lpf = sgolayfilt(verticalAccTr,1,1001);
frontalAcc_RThigh_lpf = sgolayfilt(frontalAccRThigh,1,1001);
t=(1:length(verticalAccTr_lpf))/(200*60);
figure
ax1=subplot(411), plot(t,verticalAccTr_lpf,'LineWidth',1); title('Trunk Vertical Acc');
ax2=subplot(412), plot(t,frontalAcc_RThigh_lpf,'LineWidth',1);title('RThigh Frontal Acc');
ax3=subplot(413), plot(t,PitchGyroRShank,'LineWidth',1);title('RShank Pitch Gyro');
ax4=subplot(414), plot(t,PitchGyroLShank,'LineWidth',1);title('LShank Pitch Gyro');
xlabel('Time(min)')
linkaxes([ax1 ax2 ax3 ax4],'x')

frontalAccThigh=frontalAccRThigh;
[posture_ref,walk_ref]=classifyPA_2ShanksThighTrunk(verticalAccTr,frontalAccThigh,PitchGyroRShank,PitchGyroLShank,200);




ta0=0.1; ta1=0.2; ta2=0.4; ta3=0.6;      %g
tc1=70; tc2=100; tc3=130;        %steps/min
td1=60; td2=120; td3=360;         %sec

[n2,m2]=size(walk_ref);
StWk_ref=[];EndWk_ref=[];steps_ref=[];
for i=1:m2
    StWk_ref(i)=walk_ref(i).start;
    EndWk_ref(i)=walk_ref(i).end;
    steps_ref(i)=walk_ref(i).steps; 
    MeanCad_ref(i)=round((40*60*steps_ref(i))/(EndWk_ref(i)-StWk_ref(i)));   
end
ac=sqrt((handles.acc1_trunk40).^2+(handles.acc2_trunk40).^2+(handles.acc3_trunk40).^2); an=abs(ac-0.981);
ns=40; nw=fix(length(ac)/ns);
for k=0:nw-1
    ll1=k*ns+1; ll2=(k+1)*ns;
    ma1(k+1)=max(an(ll1:ll2)); ma2(k+1)=mean(an(ll1:ll2));
end

indwk=groupfind(posture_ref==4); stwk=ceil(indwk(:,1)/40); endwk=floor(indwk(:,2)/40);
indst=groupfind(posture_ref==3); stst=ceil(indst(:,1)/40); endst=floor(indst(:,2)/40);
indsi=groupfind(posture_ref==2 | posture_ref==1); stsi=ceil(indsi(:,1)/40); endsi=floor(indsi(:,2)/40);
%%%%%%%%%%%%
bactv3=zeros(1,nw);
bactv4=zeros(1,nw);
cad=MeanCad_ref;
for j=1:length(stsi)
    bactv3(stsi(j):endsi(j))=1;
    bactv4(stsi(j):endsi(j))=1;
end
for j=1:length(stst)
    bactv3(stst(j):endst(j))=3;
    bactv4(stst(j):endst(j))=3;
end

for j=1:length(stwk)
    if endwk(j)-stwk(j) <=td1 
        bactv3(stwk(j):endwk(j))=7;
        bactv4(stwk(j):endwk(j))=7;
        
        if cad(j) >tc1 && cad(j)<=tc2
          bactv3(stwk(j):endwk(j))=8;
          bactv4(stwk(j):endwk(j))=8; 
        end
        
        if cad(j) >tc2  && cad(j)<=tc3
          bactv3(stwk(j):endwk(j))=9;
          bactv4(stwk(j):endwk(j))=9; 
        end
        
        if cad(j) >tc3  
          bactv3(stwk(j):endwk(j))=10;
          bactv4(stwk(j):endwk(j))=10; 
        end
        
    end
    if endwk(j)-stwk(j) >td1  && endwk(j)-stwk(j)<=td2
        bactv3(stwk(j):endwk(j))=11;
        bactv4(stwk(j):endwk(j))=11;
       
        if cad(j) >tc1 && cad(j)<=tc2
          bactv3(stwk(j):endwk(j))=12;
          bactv4(stwk(j):endwk(j))=12; 
        end
       
        if cad(j) >tc2 && cad(j)<=tc3
          bactv3(stwk(j):endwk(j))=13;
          bactv4(stwk(j):endwk(j))=13; 
        end
        
        if cad(j) >tc3  
          bactv3(stwk(j):endwk(j))=14;
          bactv4(stwk(j):endwk(j))=14; 
        end
       
    end
    if endwk(j)-stwk(j) >td2  && endwk(j)-stwk(j)<=td3
        bactv3(stwk(j):endwk(j))=15;
        bactv4(stwk(j):endwk(j))=15;
        
        
        if cad(j) >tc1 && cad(j)<=tc2
          bactv3(stwk(j):endwk(j))=16;
          bactv4(stwk(j):endwk(j))=16; 
        end
       
        if cad(j) >tc2 && cad(j)<=tc3
          bactv3(stwk(j):endwk(j))=17;
          bactv4(stwk(j):endwk(j))=17; 
        end
        
        if cad(j) >tc3  
          bactv3(stwk(j):endwk(j))=18;
          bactv4(stwk(j):endwk(j))=18; 
        end 
    end
    if endwk(j)-stwk(j) >=td3  
        bactv3(stwk(j):endwk(j))=19;
        bactv4(stwk(j):endwk(j))=19;
        
        
        if cad(j) >tc1 && cad(j)<=tc2
          bactv3(stwk(j):endwk(j))=20;
          bactv4(stwk(j):endwk(j))=20; 
        end
       
        if cad(j) >tc2 && cad(j)<=tc3
          bactv3(stwk(j):endwk(j))=21;
          bactv4(stwk(j):endwk(j))=21; 
        end
        
        if cad(j) >tc3  
          bactv3(stwk(j):endwk(j))=22;
          bactv4(stwk(j):endwk(j))=22; 
        end 
    end
end
       
for j=1:length(stsi)
    for k=0:length(endsi(j)-stsi(j))-1
        if ma1(stsi(j)+k)>ta1  
            bactv3(stsi(j)+k)=2;
        end
        if ma2(stsi(j)+k)>ta1 
            bactv4(stsi(j)+k)=2;
        end
    end 
end

for j=1:length(stst)
    for k=0:length(endst(j)-stst(j))-1
        if ma1(stst(j)+k)>ta1 && ma1(stst(j)+k) <=ta2
               bactv3(stst(j)+k)=4;
        end
        if ma2(stst(j)+k)>ta1 && ma2(stst(j)+k) <=ta2
            bactv4(stst(j)+k)=4;
        end
    
        if ma1(stst(j)+k)>ta2 && ma1(stst(j)+k) <=ta3
            bactv3(stst(j)+k)=5;
        end
        if ma2(stst(j)+k)>ta2 && ma2(stst(j)+k) <=ta3
            bactv4(stst(j)+k)=5;
        end
    
        if ma1(stst(j)+k)>ta3 
            bactv3(stst(j)+k)=6;
        end
        if ma2(stst(j)+k)>ta3 
            bactv4(stst(j)+k)=6;
        end  
   end
end


bx=[1:1:22]; barcode1=[bactv3 bx]; bar2=[bactv4 bx];
save 
tb=(1:length(barcode1))/60;
fig1=figure
ax1=subplot(211),imagesc(barcode1);colormap jet; 
set(ax1,'visible','off');
ax2=subplot(212),plot(tb,barcode1);
set(ax2,'ylim',[0,max(barcode1)]);
xlabel('Time (min)');
ylabel('Intensity States')
set(gca,'Fontsize',13)
supertitle('Pattern of PA intensity','FontSize',13,'Color','k')
savefig(fig1,'Barcode.fig');
% saveas(fig1,'BarChartFile','png')
% saveas(fig1,'BarChartFile','tif')
saveas(fig1,'BarChartFile','jpg')

delete(get(hObject, 'parent'));

            
         


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
if (get(handles.radiobutton1,'Value') == 0)
    set(handles.checkbox1,'Value',0);

else
    
end

 


   

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
 
  

 if (handles.acc_t_ind==1)
     handles.acc_t_ind=2;
   
     
 else
    
   set(handles.popupmenu2,'Value',1);
   set(handles.popupmenu3,'Value',1);
   handles.acc_t_ind=2;
        
 end
  val=get(hObject,'Value');
  set(handles.popupmenu4,'Value',val);
guidata(hObject,handles)
        
 
       


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Frontal';'Vertical';'Lateral'})


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
if (get(handles.radiobutton2,'Value') == 0)
    set(handles.checkbox2,'Value',0);
end

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
 
if(handles.acc_t_ind==2)
    if(get(hObject,'Value')==get(handles.popupmenu1,'Value'))
    set(hObject,'Value',1)
    set(handles.popupmenu3,'Value',1)
    handles.acc_t_ind=2;
    else
    handles.acc_t_ind=3;
    end
    
else
    set(hObject,'Value',1)
    set(handles.popupmenu3,'Value',1)
    handles.acc_t_ind=2;
end
val=get(hObject,'Value');
 set(handles.popupmenu5,'Value',val);
guidata(hObject,handles)
 


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Frontal';'Vertical';'Lateral'})


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
if (get(handles.radiobutton3,'Value') == 0)
    set(handles.checkbox3,'Value',0);
end

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


if(handles.acc_t_ind~=3 || get(hObject,'Value')==get(handles.popupmenu1,'Value') || get(hObject,'Value')==get(handles.popupmenu2,'Value'))
    set(hObject,'Value',1)
   
end
val=get(hObject,'Value');
set(handles.popupmenu6,'Value',val);
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Frontal';'Vertical';'Lateral'})


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
if (handles.gyr_t_ind==1)
     handles.gyr_t_ind=2;
   
     
 else
    
   set(handles.popupmenu5,'Value',1);
   set(handles.popupmenu6,'Value',1);
   handles.gyr_t_ind=2;
        
end
 val=get(hObject,'Value');
 set(handles.popupmenu1,'Value',val);
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Roll';'Yaw';'Pitch'});



% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
if(handles.gyr_t_ind==2)
    if(get(hObject,'Value')==get(handles.popupmenu4,'Value'))
    set(hObject,'Value',1)
    set(handles.popupmenu6,'Value',1)
    handles.gyr_t_ind=2;
    else
    handles.gyr_t_ind=3;
    end
    
else
    set(hObject,'Value',1)
    set(handles.popupmenu6,'Value',1)
    handles.gyr_t_ind=2;
end

val=get(hObject,'Value');
 set(handles.popupmenu2,'Value',val);
guidata(hObject,handles)
 

% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Roll';'Yaw';'Pitch'});

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6
if(handles.gyr_t_ind~=3 || get(hObject,'Value')==get(handles.popupmenu4,'Value') || get(hObject,'Value')==get(handles.popupmenu5,'Value'))
    set(hObject,'Value',1)
   
end
val=get(hObject,'Value');
 set(handles.popupmenu3,'Value',val);
 guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Roll';'Yaw';'Pitch'});


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7

    
if (handles.acc_th_ind==1)
     handles.acc_th_ind=2;
   
     
 else
    
   set(handles.popupmenu8,'Value',1);
   set(handles.popupmenu9,'Value',1);
   handles.acc_th_ind=2;
        
end
val=get(hObject,'Value');
set(handles.popupmenu10,'Value',val);
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Frontal';'Vertical';'Lateral'})



% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8
if(handles.acc_th_ind==2)
    if(get(hObject,'Value')==get(handles.popupmenu7,'Value'))
    set(hObject,'Value',1)
    set(handles.popupmenu9,'Value',1)
    handles.acc_th_ind=2;
    else
    handles.acc_th_ind=3;
    end
    
else
    set(hObject,'Value',1)
    set(handles.popupmenu9,'Value',1)
    handles.acc_th_ind=2;
end
val=get(hObject,'Value');
set(handles.popupmenu11,'Value',val);
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Frontal';'Vertical';'Lateral'})


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9
if(handles.acc_th_ind~=3 || get(hObject,'Value')==get(handles.popupmenu7,'Value') || get(hObject,'Value')==get(handles.popupmenu8,'Value'))
    set(hObject,'Value',1)
   
end
val=get(hObject,'Value');
set(handles.popupmenu12,'Value',val);
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Frontal';'Vertical';'Lateral'})

% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10
if (get(handles.radiobutton10,'Value') == 0)
    set(handles.checkbox10,'Value',0);
end


% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu10
if (handles.gyr_th_ind==1)
     handles.gyr_th_ind=2;
   
     
 else
    
   set(handles.popupmenu11,'Value',1);
   set(handles.popupmenu12,'Value',1);
   handles.gyr_th_ind=2;
        
end
val=get(hObject,'Value');
set(handles.popupmenu7,'Value',val);
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Roll';'Yaw';'Pitch'})


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11
if (get(handles.radiobutton11,'Value') == 0)
    set(handles.checkbox11,'Value',0);
end


% --- Executes on selection change in popupmenu11.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu11
if(handles.gyr_th_ind==2)
    if(get(hObject,'Value')==get(handles.popupmenu10,'Value'))
    set(hObject,'Value',1)
    set(handles.popupmenu12,'Value',1)
    handles.gyr_th_ind=2;
    else
    handles.gyr_th_ind=3;
    end
    
else
    set(hObject,'Value',1)
    set(handles.popupmenu12,'Value',1)
    handles.gyr_th_ind=2;
end
val=get(hObject,'Value');
set(handles.popupmenu8,'Value',val);
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Roll';'Yaw';'Pitch'})


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12
if (get(handles.radiobutton12,'Value') == 0)
    set(handles.checkbox12,'Value',0);
end


% --- Executes on selection change in popupmenu12.
function popupmenu12_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu12
if(handles.gyr_th_ind~=3 || get(hObject,'Value')==get(handles.popupmenu10,'Value') || get(hObject,'Value')==get(handles.popupmenu11,'Value'))
    set(hObject,'Value',1)
   
end
val=get(hObject,'Value');
set(handles.popupmenu9,'Value',val);
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function popupmenu12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Roll';'Yaw';'Pitch'})

% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13
if (get(handles.radiobutton13,'Value') == 0)
    set(handles.checkbox13,'Value',0);
end


% --- Executes on selection change in popupmenu13.
function popupmenu13_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu13 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu13
if (handles.acc_sh_ind==1)
     handles.acc_sh_ind=2;
   
     
 else
    
   set(handles.popupmenu14,'Value',1);
   set(handles.popupmenu15,'Value',1);
   handles.acc_sh_ind=2;
        
end
val=get(hObject,'Value');
set(handles.popupmenu16,'Value',val); 
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function popupmenu13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Frontal';'Vertical';'Lateral'})


% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton14
if (get(handles.radiobutton14,'Value') == 0)
    set(handles.checkbox14,'Value',0);
end


% --- Executes on selection change in popupmenu14.
function popupmenu14_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu14 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu14
if(handles.acc_sh_ind==2)
    if(get(hObject,'Value')==get(handles.popupmenu13,'Value'))
    set(hObject,'Value',1)
    set(handles.popupmenu15,'Value',1)
    handles.acc_sh_ind=2;
    else
    handles.acc_sh_ind=3;
    end
    
else
    set(hObject,'Value',1)
    set(handles.popupmenu15,'Value',1)
    handles.acc_sh_ind=2;
end
val=get(hObject,'Value');
set(handles.popupmenu17,'Value',val);
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function popupmenu14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Frontal';'Vertical';'Lateral'})

% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15
if (get(handles.radiobutton15,'Value') == 0)
    set(handles.checkbox15,'Value',0);
end


% --- Executes on selection change in popupmenu15.
function popupmenu15_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu15 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu15
if(handles.acc_sh_ind~=3 || get(hObject,'Value')==get(handles.popupmenu13,'Value') || get(hObject,'Value')==get(handles.popupmenu14,'Value'))
    set(hObject,'Value',1)
   
end
val=get(hObject,'Value');
set(handles.popupmenu18,'Value',val);
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function popupmenu15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Frontal';'Vertical';'Lateral'});

% --- Executes on button press in radiobutton16.
function radiobutton16_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton16
if (get(handles.radiobutton16,'Value') == 0)
    set(handles.checkbox16,'Value',0);
end


% --- Executes on selection change in popupmenu16.
function popupmenu16_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu16 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu16
if (handles.gyr_sh_ind==1)
     handles.gyr_sh_ind=2;
   
     
 else
    
   set(handles.popupmenu17,'Value',1);
   set(handles.popupmenu18,'Value',1);
   handles.gyr_sh_ind=2;
        
end
 val=get(hObject,'Value');
set(handles.popupmenu13,'Value',val);
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function popupmenu16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Roll';'Yaw';'Pitch'})

% --- Executes on button press in radiobutton17.
function radiobutton17_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton17
if (get(handles.radiobutton17,'Value') == 0)
    set(handles.checkbox17,'Value',0);
end


% --- Executes on selection change in popupmenu17.
function popupmenu17_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu17 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu17
if(handles.gyr_sh_ind==2)
    if(get(hObject,'Value')==get(handles.popupmenu16,'Value'))
    set(hObject,'Value',1)
    set(handles.popupmenu18,'Value',1)
    handles.gyr_sh_ind=2;
    else
    handles.gyr_sh_ind=3;
    end
    
else
    set(hObject,'Value',1)
    set(handles.popupmenu18,'Value',1)
    handles.gyr_sh_ind=2;
end
val=get(hObject,'Value');
set(handles.popupmenu14,'Value',val);
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function popupmenu17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Roll';'Yaw';'Pitch'})

% --- Executes on button press in radiobutton18.
function radiobutton18_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton18
if (get(handles.radiobutton18,'Value') == 0)
    set(handles.checkbox18,'Value',0);
end


% --- Executes on selection change in popupmenu18.
function popupmenu18_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu18 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu18
if(handles.gyr_sh_ind~=3 || get(hObject,'Value')==get(handles.popupmenu16,'Value') || get(hObject,'Value')==get(handles.popupmenu17,'Value'))
    set(hObject,'Value',1)
   
end
val=get(hObject,'Value');
set(handles.popupmenu14,'Value',val);
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function popupmenu18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Select';'Roll';'Yaw';'Pitch'})


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


if (get(handles.radiobutton1,'Value') == 1)
    if(get(handles.checkbox1,'Value') == 0)
       set(handles.checkbox1,'Value',0);
    else
        
        set(handles.checkbox1,'Value',1);
    end

else
    set(handles.checkbox1,'Value',0);
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
if (get(handles.radiobutton2,'Value') == 1)
    if(get(handles.checkbox2,'Value') == 0)
       set(handles.checkbox2,'Value',0);
    else
        
        set(handles.checkbox2,'Value',1);
    end

else
    set(handles.checkbox2,'Value',0);
end

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
if (get(handles.radiobutton3,'Value') == 1)
    if(get(handles.checkbox3,'Value') == 0)
       set(handles.checkbox3,'Value',0);
    else
        
        set(handles.checkbox3,'Value',1);
    end

else
    set(handles.checkbox3,'Value',0);
end

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
if (get(handles.radiobutton4,'Value') == 1)
    if(get(handles.checkbox4,'Value') == 0)
       set(handles.checkbox4,'Value',0);
    else
        
        set(handles.checkbox4,'Value',1);
    end

else
    set(handles.checkbox4,'Value',0);
end

% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
if (get(handles.radiobutton5,'Value') == 1)
    if(get(handles.checkbox5,'Value') == 0)
       set(handles.checkbox5,'Value',0);
    else
        
        set(handles.checkbox5,'Value',1);
    end

else
    set(handles.checkbox5,'Value',0);
end

% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6
if (get(handles.radiobutton6,'Value') == 1)
    if(get(handles.checkbox6,'Value') == 0)
       set(handles.checkbox6,'Value',0);
    else
        
        set(handles.checkbox6,'Value',1);
    end

else
    set(handles.checkbox6,'Value',0);
end

% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
if (get(handles.radiobutton7,'Value') == 1)
    if(get(handles.checkbox7,'Value') == 0)
       set(handles.checkbox7,'Value',0);
    else
        
        set(handles.checkbox7,'Value',1);
    end

else
    set(handles.checkbox7,'Value',0);
end

% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
if (get(handles.radiobutton8,'Value') == 1)
    if(get(handles.checkbox8,'Value') == 0)
       set(handles.checkbox8,'Value',0);
    else
        
        set(handles.checkbox8,'Value',1);
    end

else
    set(handles.checkbox8,'Value',0);
end

% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9
if (get(handles.radiobutton9,'Value') == 1)
    if(get(handles.checkbox9,'Value') == 0)
       set(handles.checkbox9,'Value',0);
    else
        
        set(handles.checkbox9,'Value',1);
    end

else
    set(handles.checkbox9,'Value',0);
end

% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10
if (get(handles.radiobutton10,'Value') == 1)
    if(get(handles.checkbox10,'Value') == 0)
       set(handles.checkbox10,'Value',0);
    else
        
        set(handles.checkbox10,'Value',1);
    end

else
    set(handles.checkbox10,'Value',0);
end

% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11
if (get(handles.radiobutton11,'Value') == 1)
    if(get(handles.checkbox11,'Value') == 0)
       set(handles.checkbox11,'Value',0);
    else
        
        set(handles.checkbox11,'Value',1);
    end

else
    set(handles.checkbox11,'Value',0);
end

% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12
if (get(handles.radiobutton12,'Value') == 1)
    if(get(handles.checkbox12,'Value') == 0)
       set(handles.checkbox12,'Value',0);
    else
        
        set(handles.checkbox12,'Value',1);
    end

else
    set(handles.checkbox12,'Value',0);
end

% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13
if (get(handles.radiobutton13,'Value') == 1)
    if(get(handles.checkbox13,'Value') == 0)
       set(handles.checkbox13,'Value',0);
    else
        
        set(handles.checkbox13,'Value',1);
    end

else
    set(handles.checkbox13,'Value',0);
end

% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14
if (get(handles.radiobutton14,'Value') == 1)
    if(get(handles.checkbox14,'Value') == 0)
       set(handles.checkbox14,'Value',0);
    else
        
        set(handles.checkbox14,'Value',1);
    end

else
    set(handles.checkbox14,'Value',0);
end

% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15
if (get(handles.radiobutton15,'Value') == 1)
    if(get(handles.checkbox15,'Value') == 0)
       set(handles.checkbox15,'Value',0);
    else
        
        set(handles.checkbox15,'Value',1);
    end

else
    set(handles.checkbox15,'Value',0);
end

% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16
if (get(handles.radiobutton16,'Value') == 1)
    if(get(handles.checkbox16,'Value') == 0)
       set(handles.checkbox16,'Value',0);
    else
        
        set(handles.checkbox16,'Value',1);
    end

else
    set(handles.checkbox16,'Value',0);
end

% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox17
if (get(handles.radiobutton17,'Value') == 1)
    if(get(handles.checkbox17,'Value') == 0)
       set(handles.checkbox17,'Value',0);
    else
        
        set(handles.checkbox17,'Value',1);
    end

else
    set(handles.checkbox17,'Value',0);
end

% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox18
if (get(handles.radiobutton18,'Value') == 1)
    if(get(handles.checkbox18,'Value') == 0)
       set(handles.checkbox18,'Value',0);
    else
        
        set(handles.checkbox18,'Value',1);
    end

else
    set(handles.checkbox18,'Value',0);
end


  
 


% --- Executes on button press in checkbox20.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox20


% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox21


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22


% --- Executes on button press in checkbox23.
function checkbox23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox23


% --- Executes on button press in checkbox24.
function checkbox24_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox24


% --- Executes on button press in checkbox25.
function checkbox25_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox25


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 

% --- Executes on selection change in popupmenu19.
function popupmenu19_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu19 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu19
set(handles.popupmenu7,'Value',1);
set(handles.popupmenu8,'Value',1);
set(handles.popupmenu9,'Value',1);
set(handles.popupmenu10,'Value',1);
set(handles.popupmenu11,'Value',1);
set(handles.popupmenu12,'Value',1);



% --- Executes during object creation, after setting all properties.
function popupmenu19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Left-Thigh';'Right-Thigh'})


% --- Executes on selection change in popupmenu20.
function popupmenu20_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu20 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu20
set(handles.popupmenu13,'Value',1);
set(handles.popupmenu14,'Value',1);
set(handles.popupmenu15,'Value',1);
set(handles.popupmenu16,'Value',1);
set(handles.popupmenu17,'Value',1);
set(handles.popupmenu18,'Value',1);



% --- Executes during object creation, after setting all properties.
function popupmenu20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'Left-Shank';'Right-Shank'})


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)% thigh
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.popupmenu19,'Value')==1)
 figure1=figure;
 set(figure1, 'Visible', 'off');
 

 subplot(2,1,1)
    
  
 plot(handles.t_1, handles.acc1_LThigh40_1,'r','LineWidth',1)
 title('acc Left-Thigh')
 hold on
 plot(handles.t_1, handles.acc2_LThigh40_1,'k','LineWidth',1)
 plot(handles.t_1, handles.acc3_LThigh40_1,'b','LineWidth',1)
 legend('acc1','acc2','acc2');     
 subplot(2,1,2)
 
 plot(handles.t_1, handles.gyr1_LThigh40_1,'r','LineWidth',1)
 title('gir Left-Thigh')
 hold on
 plot(handles.t_1, handles.gyr2_LThigh40_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_LThigh40_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 saveas(figure1,'figure.png');

 axes(handles.axes1)
 imshow('figure.png') 
 end 
 
 
 if(get(handles.popupmenu19,'Value')==2)
 figure1=figure;
 set(figure1, 'Visible', 'off');
 

 subplot(2,1,1)
 plot(handles.t_1, handles.acc1_RThigh_lpf_1,'r','LineWidth',1)
 title('acc Right-Thigh')
 hold on
 plot(handles.t_1, handles.acc2_RThigh_lpf_1,'k','LineWidth',1)
 plot(handles.t_1, handles.acc3_RThigh_lpf_1,'b','LineWidth',1)
 legend('acc1','acc2','acc2');  


 subplot(2,1,2)
 plot(handles.t_1, handles.gyr1_RThigh_lpf_1,'r','LineWidth',1)
 title('gir Right Thigh')
 hold on
 plot(handles.t_1, handles.gyr2_RThigh_lpf_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_RThigh_lpf_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
  saveas(figure1,'figure.png');

 axes(handles.axes1)
 imshow('figure.png') 
 end 

 
 


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles) %trunk
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

figure1=figure;
 set(figure1, 'Visible', 'off');
 

 subplot(2,1,1)

 acc1_trunk_lpf_1=handles.acc1_trunk_lpf_1;
 acc2_trunk_lpf_1=handles.acc2_trunk_lpf_1;
 acc3_trunk_lpf_1=handles.acc3_trunk_lpf_1;
 t_1=handles.t_1;

 plot(t_1,acc1_trunk_lpf_1,'r','LineWidth',1)
 title('acc trunk')
 hold on
 plot(t_1,acc2_trunk_lpf_1,'k','LineWidth',1)
 plot(t_1,acc3_trunk_lpf_1,'b','LineWidth',1)
 legend('acc1','acc2','acc3');
 
 
 
 subplot(2,1,2)
 plot(handles.axes2,t_1,handles.gyr1_trunk_lpf_1,'r','LineWidth',1)
 title('gir trunk')
 hold on
 plot(handles.t_1,handles.gyr2_trunk_lpf_1,'k','LineWidth',1)
 plot(handles.t_1,handles.gyr3_trunk_lpf_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 xlabel('Time(min)')
  ylabel('°/sec')
 legend('gyr1','gyr2','gyr3');
  
     
 saveas(figure1,'figure.png');

 axes(handles.axes1)
 imshow('figure.png')    
   


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)% SHANK
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.popupmenu20,'Value')==1)
 figure1=figure;
 set(figure1, 'Visible', 'off');
 

 subplot(2,1,1)
    
  
 plot(handles.t_1, handles.acc1_LShank40_1,'r','LineWidth',1)
 title('acc Left-Shank')
 hold on
 plot(handles.t_1,handles.acc2_LShank40_1,'k','LineWidth',1)
 plot(handles.t_1, handles.acc3_LShank40_1,'b','LineWidth',1)
 legend('acc1','acc2','acc2'); 
 
 subplot(2,1,2)
 plot(handles.t_1, handles.gyr1_LShank40_1,'r','LineWidth',1)
 title('gyr Left-Shank')
 hold on
 plot(handles.t_1, handles.gyr2_LShank40_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_LShank40_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 
 
 
 
 saveas(figure1,'figure.png');
 axes(handles.axes1)
 imshow('figure.png') 
 end 
 
 
 if(get(handles.popupmenu20,'Value')==2)
 figure1=figure;
 set(figure1, 'Visible', 'off');
 

 subplot(2,1,1)
 plot(handles.t_1, handles.acc1_RShank40_1,'r','LineWidth',1)
 title('acc Right-Shank')
 hold on
 plot(handles.t_1, handles.acc2_RShank40_1,'k','LineWidth',1)
 plot(handles.t_1, handles.acc3_RShank40_1,'b','LineWidth',1)
 legend('acc1','acc2','acc2');  


 subplot(2,1,2)
 plot(handles.t_1,handles.gyr1_RShank40_1,'r','LineWidth',1)
 title('acc Right-Shank')
 hold on
 plot(handles.t_1, handles.gyr2_RShank40_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_RShank40_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 saveas(figure1,'figure.png');

 axes(handles.axes1)
 imshow('figure.png') 
 end
  
 


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

id_thigh=get(handles.popupmenu19,'Value');

r=is_valid(get(handles.popupmenu7,'Value'),get(handles.popupmenu8,'Value'),get(handles.popupmenu9,'Value'));
if(r==1)
   
   set(handles.popupmenu7,'Value',1);
   set(handles.popupmenu8,'Value',1);
   set(handles.popupmenu9,'Value',1);
   %error_message_handle=error_message; 
end

if(r==2)
handles.status_Thigh(id_thigh,1,1)=get(handles.popupmenu7,'Value');
handles.status_Thigh(id_thigh,2,1)=get(handles.popupmenu8,'Value');
handles.status_Thigh(id_thigh,3,1)=get(handles.popupmenu9,'Value');
end


handles.status_Thigh(id_thigh,1,2)=get(handles.checkbox7,'Value');
handles.status_Thigh(id_thigh,2,2)=get(handles.checkbox8,'Value');
handles.status_Thigh(id_thigh,3,2)=get(handles.checkbox9,'Value');

r=is_valid(get(handles.popupmenu10,'Value'),get(handles.popupmenu11,'Value'),get(handles.popupmenu12,'Value'));

if(r==1)
   
   set(handles.popupmenu10,'Value',1);
   set(handles.popupmenu11,'Value',1);
   set(handles.popupmenu12,'Value',1);
   
end

if(r==2)
handles.status_Thigh(id_thigh,4,1)=get(handles.popupmenu10,'Value');
handles.status_Thigh(id_thigh,5,1)=get(handles.popupmenu11,'Value');
handles.status_Thigh(id_thigh,6,1)=get(handles.popupmenu12,'Value');
handles.is_shank_modified=true;
end


handles.status_Thigh(id_thigh,4,2)=get(handles.checkbox10,'Value');
handles.status_Thigh(id_thigh,5,2)=get(handles.checkbox11,'Value');
handles.status_Thigh(id_thigh,6,2)=get(handles.checkbox12,'Value');


guidata(hObject,handles)



% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
id_shank=get(handles.popupmenu20,'Value');


r=is_valid(get(handles.popupmenu13,'Value'),get(handles.popupmenu14,'Value'),get(handles.popupmenu15,'Value'));

if(r==1)
   
   set(handles.popupmenu13,'Value',1);
   set(handles.popupmenu14,'Value',1);
   set(handles.popupmenu15,'Value',1);
   
  
end

if(r==2)
handles.status_Shank(id_shank,1,1)=get(handles.popupmenu13,'Value');
handles.status_Shank(id_shank,2,1)=get(handles.popupmenu14,'Value');
handles.status_Shank(id_shank,3,1)=get(handles.popupmenu15,'Value');
end

handles.status_Shank(id_shank,1,2)=get(handles.checkbox13,'Value');
handles.status_Shank(id_shank,2,2)=get(handles.checkbox14,'Value');
handles.status_Shank(id_shank,3,2)=get(handles.checkbox15,'Value');

r=is_valid(get(handles.popupmenu16,'Value'),get(handles.popupmenu17,'Value'),get(handles.popupmenu18,'Value'));

if(r==1)
   set(handles.popupmenu16,'Value',1);
   set(handles.popupmenu17,'Value',1);
   set(handles.popupmenu18,'Value',1);

end

if(r==2)
handles.status_Shank(id_shank,4,1)=get(handles.popupmenu16,'Value');
handles.status_Shank(id_shank,5,1)=get(handles.popupmenu17,'Value');
handles.status_Shank(id_shank,6,1)=get(handles.popupmenu18,'Value');
handles.is_thigh_modified=true;
end
handles.status_Shank(id_shank,4,2)=get(handles.checkbox16,'Value');
handles.status_Shank(id_shank,5,2)=get(handles.checkbox17,'Value');
handles.status_Shank(id_shank,6,2)=get(handles.checkbox18,'Value');


guidata(hObject,handles)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

r=is_valid(get(handles.popupmenu1,'Value'),get(handles.popupmenu2,'Value'),get(handles.popupmenu3,'Value'));

if (r==1)
   set(handles.popupmenu1,'Value',1);
   set(handles.popupmenu2,'Value',1);
   set(handles.popupmenu3,'Value',1);
    
end

if(r==2)
    
handles.status_trunk(1,1)=get(handles.popupmenu1,'Value');
handles.status_trunk(2,1)=get(handles.popupmenu2,'Value');
handles.status_trunk(3,1)=get(handles.popupmenu3,'Value');
end
handles.status_trunk(1,2)=get(handles.checkbox1,'Value');
handles.status_trunk(2,2)=get(handles.checkbox2,'Value');
handles.status_trunk(3,2)=get(handles.checkbox3,'Value');

r=is_valid(get(handles.popupmenu4,'Value'),get(handles.popupmenu5,'Value'),get(handles.popupmenu6,'Value'));

if (r==1)
   set(handles.popupmenu4,'Value',1);
   set(handles.popupmenu5,'Value',1);
   set(handles.popupmenu6,'Value',1);
end

if(r==2)
handles.status_trunk(4,1)=get(handles.popupmenu4,'Value');
handles.status_trunk(5,1)=get(handles.popupmenu5,'Value');
handles.status_trunk(6,1)=get(handles.popupmenu6,'Value');
end

handles.status_trunk(4,2)=get(handles.checkbox4,'Value');
handles.status_trunk(5,2)=get(handles.checkbox5,'Value');
handles.status_trunk(6,2)=get(handles.checkbox6,'Value');

handles.is_trunk_modified=true;
guidata(hObject,handles)
