function varargout = classification(varargin)
% CLASSIFICATION MATLAB code for classification.fig
%      CLASSIFICATION, by itself, creates a new CLASSIFICATION or raises the existing
%      singleton*.
%
%      H = CLASSIFICATION returns the handle to a new CLASSIFICATION or the handle to
%      the existing singleton*.
%
%      CLASSIFICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLASSIFICATION.M with the given input arguments.
%
%      CLASSIFICATION('Property','Value',...) creates a new CLASSIFICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before classification_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to classification_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help classification

% Last Modified by GUIDE v2.5 01-Dec-2017 09:38:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @classification_OpeningFcn, ...
                   'gui_OutputFcn',  @classification_OutputFcn, ...
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


% --- Executes just before classification is made visible.
function classification_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to classification (see VARARGIN)

% Choose default command line output for classification
% 


I1=imread('./pic/folder-icon.png');
imshow(I1,'Parent',handles.axes4);
I2=imread('./pic/img-thing.jpeg');
imshow(I2,'Parent',handles.axes1)
I2=imread('./pic/img-thing.jpeg');
imshow(I2,'Parent',handles.axes2)


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

handles.gyr1_LThigh_lpf_1=varargin{13};
handles.gyr2_LThigh_lpf_1=varargin{14};
handles.gyr3_LThigh_lpf_1=varargin{15};


handles.acc1_LThigh_lpf_1=varargin{16};
handles.acc2_LThigh_lpf_1=varargin{17};
handles.acc3_LThigh_lpf_1=varargin{18};

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

handles.trunk_cell=varargin{32};
handles.thigh_cell=varargin{33};
handles.shank_cell=varargin{34};



handles.t_1=varargin{31};

handles.acc1_trunk40=varargin{35};
handles.acc2_trunk40=varargin{36};
handles.acc3_trunk40=varargin{37};
handles.average_alt=varargin{38};
handles.thigh_configuration=varargin{39};

handles.id_plotted=0;

addpath(genpath('../errors_functions/'));
clearvars varargin
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes classification wait for user response (see UIRESUME)
% uiwait(handles.figure1);


function clear_values()
handles.gyr1_LShank40_1=[];
handles.gyr2_LShank40_1=[];
handles.gyr3_LShank40_1=[];


handles.acc1_LShank40_1=[];
handles.acc2_LShank40_1=[];
handles.acc3_LShank40_1=[];


handles.gyr1_RShank40_1=[];
handles.gyr2_RShank40_1=[];
handles.gyr3_RShank40_1=[];


handles.acc1_RShank40_1=[];
handles.acc2_RShank40_1=[];
handles.acc3_RShank40_1=[];

handles.gyr1_LThigh40_1=[];
handles.gyr2_LThigh40_1=[];
handles.gyr3_LThigh40_1=[];


handles.acc1_LThigh40_1=[];
handles.acc2_LThigh40_1=[];
handles.acc3_LThigh40_1=[];

handles.gyr1_RThigh_lpf_1=[];
handles.gyr2_RThigh_lpf_1= [];
handles.gyr3_RThigh_lpf_1=[];

handles.acc1_RThigh_lpf_1=[];
handles.acc2_RThigh_lpf_1=[];
handles.acc3_RThigh_lpf_1=[];


handles.gyr1_trunk_lpf_1=[];
handles.gyr2_trunk_lpf_1=[];
handles.gyr3_trunk_lpf_1=[];


handles.acc1_trunk_lpf_1=[];
handles.acc2_trunk_lpf_1=[];
handles.acc3_trunk_lpf_1=[];



% --- Outputs from this function are returned to the command line.
function varargout = classification_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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
set(hObject,'String',{'Select';'acc1';'acc2';'acc3'})


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


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
set(hObject,'String',{'Select';'acc1';'acc2';'acc3'})

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


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
set(hObject,'String',{'Select';'gyr1';'gyr2';'gyr3'})

% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


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
set(hObject,'String',{'Select';'gyr1';'gyr2';'gyr3'})


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
 handles.id_plotted=1;
 acc1_trunk_lpf_1=handles.acc1_trunk_lpf_1;
 acc2_trunk_lpf_1=handles.acc2_trunk_lpf_1;
 acc3_trunk_lpf_1=handles.acc3_trunk_lpf_1;
 t_1=handles.t_1;
 axes(handles.axes1)
 plot(handles.axes1,t_1,acc1_trunk_lpf_1,'r','LineWidth',1)
 title('acc trunk')
 hold on
 plot(t_1,acc2_trunk_lpf_1,'k','LineWidth',1)
 plot(t_1,acc3_trunk_lpf_1,'b','LineWidth',1)
 legend('acc1','acc2','acc3');
 xlabel('Time(min)')

  ylabel('acc/g')
 hold off
 
 axes(handles.axes2)
 plot(handles.axes2,t_1,handles.gyr1_trunk_lpf_1,'r','LineWidth',1)
 title('gir trunk')
 hold on
 plot(handles.t_1,handles.gyr2_trunk_lpf_1,'k','LineWidth',1)
 plot(handles.t_1,handles.gyr3_trunk_lpf_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 xlabel('Time(min)')
 ylabel('°/sec')
 hold off 
 

 guidata(hObject,handles)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(get(handles.popupmenu10,'Value')==1)
if(handles.acc1_LThigh_lpf_1==false)
    not_loaded_c    
    return
else
 handles.id_plotted=2;
 axes(handles.axes1)
 plot(handles.t_1, handles.acc1_LThigh_lpf_1,'r','LineWidth',1)
 title('acc Left-Thigh')
 hold on
 plot(handles.t_1, handles.acc2_LThigh_lpf_1,'k','LineWidth',1)
 plot(handles.t_1, handles.acc3_LThigh_lpf_1,'b','LineWidth',1)
 legend('acc1','acc2','acc2');     
 xlabel('Time(min)')

        ylabel('acc/g')
 hold off 

 axes(handles.axes2)
 plot(handles.t_1, handles.gyr1_LThigh_lpf_1,'r','LineWidth',1)
 title('gir Left-Thigh')
 hold on
 plot(handles.t_1, handles.gyr2_LThigh_lpf_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_LThigh_lpf_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 xlabel('Time(min)')
  ylabel('°/sec')
 hold off 
 end
    
else
 if(handles.acc1_RThigh_lpf_1==false)
    addpath(genpath('error_functions'))
    not_loaded_c  
    return
    
else   
 handles.id_plotted=3;
 axes(handles.axes1)
 plot(handles.t_1, handles.acc1_RThigh_lpf_1,'r','LineWidth',1)
 title('acc Right-Thigh')
 hold on
 plot(handles.t_1, handles.acc2_RThigh_lpf_1,'k','LineWidth',1)
 plot(handles.t_1, handles.acc3_RThigh_lpf_1,'b','LineWidth',1)
 legend('acc1','acc2','acc2');     
 xlabel('Time(min)')
  
        ylabel('acc/g')
 hold off 

 axes(handles.axes2)
 plot(handles.t_1, handles.gyr1_RThigh_lpf_1,'r','LineWidth',1)
 title('gir Right Thigh')
 hold on
 plot(handles.t_1, handles.gyr2_RThigh_lpf_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_RThigh_lpf_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 xlabel('Time(min)')
  ylabel('°/sec')
 hold off 
 end
end
guidata(hObject,handles)






% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.popupmenu5,'Value')==1)
 handles.id_plotted=4;   
 axes(handles.axes1)     
 plot(handles.t_1, handles.acc1_LShank40_1,'r','LineWidth',1)
 title('acc Left-Shank')
 hold on
 plot(handles.t_1,handles.acc2_LShank40_1,'k','LineWidth',1)
 plot(handles.t_1, handles.acc3_LShank40_1,'b','LineWidth',1)
 legend('acc1','acc2','acc2'); 
  xlabel('Time(min)')
        ylabel('acc/g')
       
 hold off 

 axes(handles.axes2)
 plot(handles.t_1, handles.gyr1_LShank40_1,'r','LineWidth',1)
 title('gyr Left-Shank')
 hold on
 plot(handles.t_1, handles.gyr2_LShank40_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_LShank40_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 xlabel('Time(min)')
 ylabel('°/sec')
 hold off 
else
 handles.id_plotted=5;
 axes(handles.axes1) 
 plot(handles.t_1, handles.acc1_RShank40_1,'r','LineWidth',1)
 title('acc Right-Shank')
 hold on
 plot(handles.t_1, handles.acc2_RShank40_1,'k','LineWidth',1)
 plot(handles.t_1, handles.acc3_RShank40_1,'b','LineWidth',1)
 legend('acc1','acc2','acc2');  
 xlabel('Time(min)')
  
 ylabel('acc/g')
 hold off 

 axes(handles.axes2)
 plot(handles.t_1,handles.gyr1_RShank40_1,'r','LineWidth',1)
 title('gyr Right-Shank')
 hold on
 plot(handles.t_1, handles.gyr2_RShank40_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_RShank40_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
  xlabel('Time(min)')
 
  ylabel('°/sec')
 hold off 
end
guidata(hObject,handles)

 
 


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    
PathName=handles.PathName;

catch
    not_output_folder
    return
end
struct_path=load('function_interaction/Current_path');
ID=struct_path.ID;
patient_struct=load(['User_database/','Patient_',ID]);
analysis_cell=patient_struct.Analysis;
dim=size(analysis_cell);
num_analysis=dim(1)+1;
num_analysis_str=num2str(num_analysis);
this_analysis_ID=['Patient_',ID,'_PA_Analysis_ID_'];
this_analysis_ID=[this_analysis_ID,num_analysis_str];

PathName_1=strcat(PathName, '/',this_analysis_ID);
mkdir (PathName_1)


addpath(genpath('physical_activity_functions'))

if(handles.thigh_configuration==1 && get(handles.popupmenu9,'Value')==2)
    not_loaded_c
    return
end

if(handles.thigh_configuration==2 && get(handles.popupmenu9,'Value')==1)
    not_loaded_c
    return
end


%TRUNK 

val_trunk=get(handles.popupmenu1,'Value');
inverse_trunk=get(handles.checkbox1,'Value');
if(inverse_trunk==0)
    inverse_trunk=1;
else
    inverse_trunk=-1;
end

switch val_trunk
    case 1 
        addpath(genpath('error_functions'))
                error_selection
                return
    case 2
         
         verticalAccTr=handles.trunk_cell{1}*inverse_trunk;
         verticalAccTr40=handles.acc1_trunk40*inverse_trunk;
         
     case 3
          
          verticalAccTr=handles.trunk_cell{2}*inverse_trunk;
          verticalAccTr40=handles.acc2_trunk40*inverse_trunk;
    case 4
        
          verticalAccTr=handles.trunk_cell{3}*inverse_trunk;
          verticalAccTr40=handles.acc3_trunk40*inverse_trunk;
end

if (get(handles.popupmenu9,'Value')==1)
    
    
        val_thigh=get(handles.popupmenu2,'Value');
        inverse_thigh=get(handles.checkbox2,'Value');
        if(inverse_thigh==0)
            inverse_thigh=1;
        else
            inverse_thigh=-1;
        end

        switch val_thigh
            case 1 
              addpath(genpath('error_functions'))
                error_selection
                return
            case 2

                 frontalAccThigh=handles.thigh_cell{1,1}*inverse_thigh;


             case 3

                  frontalAccThigh=handles.thigh_cell{1,2}*inverse_thigh;
            case 4

                  frontalAccThigh=handles.thigh_cell{1,3}*inverse_thigh;
        end

else
    
        val_thigh=get(handles.popupmenu2,'Value');
        inverse_thigh=get(handles.checkbox2,'Value');
        if(inverse_thigh==0)
            inverse_thigh=1;
        else
            inverse_thigh=-1;
        end

        switch val_thigh
            case 1 
               addpath(genpath('error_functions'))
                error_selection
                 return
            case 2

                 frontalAccThigh=handles.thigh_cell{2,1}*inverse_thigh;


             case 3

                  frontalAccThigh=handles.thigh_cell{2,2}*inverse_thigh;
            case 4

                  frontalAccThigh=handles.thigh_cell{2,3}*inverse_thigh;
        end
end


val_Lshank=get(handles.popupmenu3,'Value');
inverse_Lshank=get(handles.checkbox3,'Value');
if(inverse_Lshank==0)
    inverse_Lshank=1;
else
    inverse_Lshank=-1;
end

switch val_Lshank
    case 1 
        addpath(genpath('error_functions'))
        error_selection
        return
    case 2
         
          PitchGyroLShank=handles.shank_cell{1,1}*inverse_Lshank;
         
     case 3
          
          PitchGyroLShank=handles.shank_cell{1,2}*inverse_Lshank;
    case 4
        
          PitchGyroLShank=handles.shank_cell{1,3}*inverse_Lshank;
end

val_Rshank=get(handles.popupmenu4,'Value');
inverse_Rshank=get(handles.checkbox5,'Value');
if(inverse_Rshank==0)
    inverse_Rshank=1;
else
    inverse_Rshank=-1;
end

switch val_Rshank
    case 1 
        addpath(genpath('error_functions'))
        error_selection
        return
        
    case 2
         
          PitchGyroRShank=handles.shank_cell{2,1}*inverse_Rshank;
         
     case 3
          
          PitchGyroRShank=handles.shank_cell{2,2}*inverse_Rshank;
    case 4
        
          PitchGyroRShank=handles.shank_cell{2,3}*inverse_Rshank;
end


verticalAccTr_lpf = sgolayfilt(verticalAccTr,1,1001);
frontalAcc_Thigh_lpf = sgolayfilt(frontalAccThigh,1,1001);
t=(1:length(verticalAccTr_lpf))/(200*60);
fig1=figure
set(fig1, 'Visible', 'off')
ax1=subplot(411), plot(t,verticalAccTr_lpf,'LineWidth',1); title('Trunk Vertical Acc');
ax2=subplot(412), plot(t,frontalAcc_Thigh_lpf,'LineWidth',1);title('Thigh Frontal Acc');
ax3=subplot(413), plot(t,PitchGyroRShank,'LineWidth',1);title('RShank Pitch Gyro');
ax4=subplot(414), plot(t,PitchGyroLShank,'LineWidth',1);title('LShank Pitch Gyro');
xlabel('Time(min)')
linkaxes([ax1 ax2 ax3 ax4],'x')

disp('minimi')
disp(min(verticalAccTr));
disp(min(frontalAccThigh));
disp(min(PitchGyroRShank));
disp(min(PitchGyroLShank));
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
disp('Barcode');
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
tb=(1:length(barcode1))/60;
fig1=figure
set(fig1, 'Visible', 'off')
ax1=subplot(211),imagesc(barcode1);colormap jet; 
set(fig1,'visible','off');
ax2=subplot(212),plot(tb,barcode1);
set(ax2,'ylim',[0,max(barcode1)]);
xlabel('Time (min)');
ylabel('Intensity States')
set(gca,'Fontsize',13)

supertitle('Pattern of PA intensity','FontSize',13,'Color','k')

% saveas(fig1,'BarChartFile','png')
% saveas(fig1,'BarChartFile','tif')

path=strcat(PathName_1,'/Barcode');
savefig(fig1,[path,'.fig']);
saveas(fig1,path,'jpg')

% Find Activity Level (up/down sairs, hill)

disp('Activity Level');
ip=findchangepts(handles.average_alt,'Statistic','linear','MaxNumChanges',25);

actv_level=zeros(1,length(posture_ref));
kl1=5;kl2=6; kl3=7; kl4=8;
th1=2; th2=20;
posture_DL=posture_ref;
for j=1:length(ip)-1
    if j==1
        dur=ip(j)-1;
        level=handles.average_alt(ip(j))-handles.average_alt(1);
        %determine if Up/Down stairs, Elevator
        if abs(level)>=th1 & abs(level)<=th2 & sign(level)==-1 %down, alt decreases
           if  posture_DL(1:ip(j))==3 & (ip(j)-1)<=2*60*40   % possibly down elevator
               actv_level(ip(j))=-kl1; 
           end 
        end 
        if abs(level)>=th1 & abs(level)<=th2 &sign(level)==+1 %up
           if  posture_DL(1:ip(j))==3 & (ip(j)-1)<=2*60*40   % possibly up elevator
               actv_level(ip(j))=kl1; 
           end 
        end
        
        %determine if Up/Down stairs
        if abs(level)>=th1 & abs(level)<=th2 & sign(level)==-1 %down, alt decreases
           if  mode(posture_DL(1:ip(j)))==4    %  possibly down stairs
               actv_level(ip(j))=-kl2; 
           end 
        end 
        if abs(level)>=th1 & abs(level)<=th2 & sign(level)==+1 
           if  mode(posture_DL(1:ip(j)))==4    % possibly up stairs
               actv_level(ip(j))=kl2; 
           end 
        end 
   
        %determine if Up/Down Hill car/Bus
        if abs(level)>=th2 & sign(level)==-1
           if  mode(posture_DL(1:ip(j)))==2    % possibly uphill car/bus
               actv_level(ip(j))=-kl3; 
           end 
        end
        if abs(level)>=th2 & sign(level)==1
           if  mode(posture_DL(1:ip(j)))==2    % possibly downhill car/bus
               actv_level(ip(j))=kl3; 
           end 
        end
        
        %determine if Up/Down Hill sports
        if abs(level)>=th2 & sign(level)==-1
           if  mode(posture_DL(1:ip(j)))==3 | mode(posture_DL(1:ip(j)))==4  % possibly uphill car/bus
               actv_level(ip(j))=-kl4; 
           end 
        end
        if abs(level)>=th2 & sign(level)==1
           if mode(posture_DL(1:ip(j)))==3 | mode(posture_DL(1:ip(j)))==4    % possibly downhill car/bus
               actv_level(ip(j))=kl4; 
           end 
        end
              
    else
        dur=ip(j+1)-ip(j);
        level=handles.average_alt(ip(j+1))-handles.average_alt(ip(j));
           %determine if Up/Down stairs, Elevator
        if abs(level)>=th1 & abs(level)<=th2 & sign(level)==-1 %down, alt decreases
           if  posture_DL(ip(j):ip(j+1))==3 & (ip(j+1)-ip(j))<=2*60*40   % possibly down elevator
               actv_level(ip(j))=-kl1; 
           end 
        end 
        if abs(level)>=th1 & abs(level)<=th2 &sign(level)==+1 %up
           if  posture_DL(ip(j):ip(j+1))==3 & (ip(j+1)-ip(j))<=2*60*40   % possibly up elevator
               actv_level(ip(j))=kl1; 
           end 
        end
        
        %determine if Up/Down stairs
        if abs(level)>=th1 & abs(level)<=th2 & sign(level)==-1 %down, alt decreases
           if  mode(posture_DL(ip(j):ip(j+1)))==4 | mode(posture_DL(ip(j):ip(j+1)))==3    %  possibly down stairs
               actv_level(ip(j))=-kl2; 
           end 
        end 
        if abs(level)>=th1 & abs(level)<=th2 & sign(level)==+1 
           if  mode(posture_DL(ip(j):ip(j+1)))==4 | mode(posture_DL(ip(j):ip(j+1)))==3   % possibly up stairs
               actv_level(ip(j))=kl2; 
           end 
        end 
   
        %determine if Up/Down Hill car/Bus
        if abs(level)>=th2 & sign(level)==-1
           if  mode(posture_DL(ip(j):ip(j+1)))==2    % possibly uphill car/bus
               actv_level(ip(j))=-kl3; 
           end 
        end
        if abs(level)>=th2 & sign(level)==1
           if  mode(posture_DL(ip(j):ip(j+1)))==2    % possibly downhill car/bus
               actv_level(ip(j))=kl3; 
           end 
        end
        
        %determine if Up/Down Hill sports
        if abs(level)>=th2 & sign(level)==-1
           if  mode(posture_DL(ip(j):ip(j+1)))==3 | mode(posture_DL(ip(j):ip(j+1)))==4  % possibly uphill car/bus
               actv_level(ip(j))=-kl4; 
           end 
        end
        if abs(level)>=th2 & sign(level)==1
           if mode(posture_DL(ip(j):ip(j+1)))==3 | mode(posture_DL(ip(j):ip(j+1)))==4    % possibly downhill car/bus
               actv_level(ip(j))=kl4; 
           end 
        end
            
    end

end


t=(1:length(posture_DL))/(40*60);
fig2=figure
set(fig2, 'Visible', 'off')
ax1=gca;
plot(t,posture_DL,'r','LineWidth',1);ylim([-8.2 8.2])
hold on
plot(t,actv_level,'b','LineWidth',2);xlabel({'Time (min)'})
title('Pattern of PA behavior')
set(ax1,'YTick',[-8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8]);
set(ax1,'YTicklabels',{'DownHillActiv','DownHillPasiv','DownStairsWalk','DownStairsElevator', ' ',' ',' ',' ',' ','lying','sitting','standing','walking', 'UpStairsElevator','UpStairsWalk','UpHillPasiv','UpHillActiv'});
ax1.YGrid = 'on'
set(gca,'Fontsize',13)
path=strcat(PathName_1,'/PAPattern');
savefig(fig2,[path,'.fig']);
% saveas(fig2,'PAPattern','png')
% saveas(fig2,'PAPattern','tif')
saveas(fig2,path,'jpg')



%%%%%Plot posture Results%%%%%%%%%%
%cd E:\CP\RefValuesControlsDL\posture

addpath(genpath('classification/posture'))
load duration_SiLy_controls 
load duration_St_controls 
load duration_Wk_controls 

load percent_SiLy_controls 
load percent_St_controls 
load percent_Wk_controls 

load MeanPercentPosturesControls 
load SDPercentPosturesControls 

%%%%%%%%%%%%%%%%%%
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
fig1=figure;
bar(act,'stacked')
set(fig1, 'Visible', 'off')
legend('lying/sitting','standing','walking')
xlabel('hours','FontSize',14)
ylabel('duration(min)','FontSize',14)
supertitle('posture allocation per hour')
path=strcat(PathName_1,'/posture_allocation_per_hour');
savefig(fig1,[path,'.fig']);

saveas(fig1,path,'jpg')

%%%%%%%%%%%%%%%%%
l=round(length(posture_ref)/40);
indx1=groupfind(posture_ref==1 | posture_ref==2); 
indx2=groupfind(posture_ref==3); 
indx3=groupfind(posture_ref==4); 
DSitLy_CP=round((indx1(:,2)-indx1(:,1))/40);
DSt_CP=round((indx2(:,2)-indx2(:,1))/40);
DWk_CP=round((indx3(:,2)-indx3(:,1))/40);
addpath(genpath('classification'))
PSitLy_CP=(sum(DSitLy_CP)/l)*100;
PSt_CP=(sum(DSt_CP)/l)*100;
PWk_CP=(sum(DWk_CP)/l)*100;

MeanPostures=[MeanPercentPosturesControls; PSitLy_CP  PSt_CP PWk_CP];
SDPostures=[SDPercentPosturesControls; 0  0 0];
errorbar_groups_postures_ani(MeanPostures,SDPostures,'bar_names',{'lying/sitting','standing','walking'});
legend('TD Group', 'CP patient')
ylabel('% of monitoring time','FontSize',14)
path=strcat(PathName_1,'/BarplotPostures');
supertitle('daily posture allocation');
savefig(gcf,[path,'.fig'])
saveas(gcf,path,'png')
saveas(gcf,path,'tif')
saveas(gcf,path,'jpg')

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
set(f2, 'Visible', 'off')
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
 path=strcat(PathName_1,'/BoxPlotDurationPosturePeriods');
 
 
 supertitle('duration of periods')
 
 savefig(f2,[path,'.fig'])
 saveas(f2,path,'png')
 saveas(f2,path,'tif')
 saveas(f2,path,'jpg')
 
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
set(fig1, 'Visible', 'off')
h=pie(X);
set(h(2:2:6),'FontSize',20);
legend(h(1:2:end),'sitting/lying','standing','walking','Orientation','horizontal','location','bestoutside');
colormap jet
set(gca,'Fontsize',14)
path=strcat(PathName_1,'/PiePostures');

savefig(fig1,[path,'.fig']);
saveas(fig1,path,'png')
saveas(fig1,path,'tif')

%get analysis ID
path_destination=[struct_path.path,'/',this_analysis_ID];
analysis_cell{num_analysis,1}=this_analysis_ID;
Advance_of_analysis=get(handles.edit3,'String');
analysis_cell{num_analysis,2}=path_destination;
patient_struct.Analysis=analysis_cell;

Name=patient_struct.Name
Surname=patient_struct.Surname
Date=patient_struct.Date

Pathologies=patient_struct.Pathologies
Analysis=patient_struct.Analysis;
local_path=patient_struct.local_path;


other_details=load('function_interaction/other_analysis_details.mat');
d = datetime('today')
date=datestr(d);
save(['User_database/','Patient_',ID],'ID','Name','Surname','Date','Pathologies','Analysis','local_path');
type_of_analysis='PA';
save(['Analysis_database/',this_analysis_ID],'this_analysis_ID','ID','Name','Surname','path_destination','date','Advance_of_analysis','type_of_analysis','other_details');

% save in local path name

mkdir(path_destination);
copyfile(PathName_1,path_destination)
classification_results(path_destination);


 
 
 
 
 
 
% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


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
set(hObject,'String',{'Left-Shank';'Right-Shank'})


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9


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

set(hObject,'String',{'Left-Thigh';'Right-Thigh'})


% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu10


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
set(hObject,'String',{'Left-Thigh';'Right-Thigh'})


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1

switch handles.id_plotted
    case 1
        fig_new=figure
        title('Acceleration trunk')
        acc1_trunk_lpf_1=handles.acc1_trunk_lpf_1;
        acc2_trunk_lpf_1=handles.acc2_trunk_lpf_1;
        acc3_trunk_lpf_1=handles.acc3_trunk_lpf_1;
        t_1=handles.t_1;
        ax1=subplot(311), plot(t_1,acc1_trunk_lpf_1,'r','LineWidth',1); title('Trunk- acc1');
        xlabel('Time(min)')
        ylabel('acc/g')
        ylim([-1,1])
        ax2=subplot(312), plot(t_1,acc2_trunk_lpf_1,'k','LineWidth',1);title('Trunk- acc2');
        xlabel('Time(min)')
        ylabel('acc/g')
        ylim([-1,1])
        ax3=subplot(313), plot(t_1,acc3_trunk_lpf_1,'b','LineWidth',1);title('Trunk- acc3');
        xlabel('Time(min)')
        ylabel('acc/g')
        ylim([-1,1])
        linkaxes([ax1 ax2 ax3],'x')

        
        
    
    case 2
        fig_new=figure
        title('Acceleration Left-Thigh')
        ax1=subplot(311), plot(handles.t_1, handles.acc1_LThigh_lpf_1,'r','LineWidth',1); title('Left-Thigh-acc1');
        xlabel('Time(min)')
        ylabel('acc/g')
        ylim([-1.2,1.2])
        ax2=subplot(312), plot(handles.t_1, handles.acc2_LThigh_lpf_1,'k','LineWidth',1);title('Left-Thigh-acc2');
        xlabel('Time(min)')
        ylabel('acc/g')
        ylim([-1.2,1.2])
        ax3=subplot(313), plot(handles.t_1, handles.acc3_LThigh_lpf_1,'b','LineWidth',1);title('Left-Thigh-acc3');
        xlabel('Time(min)')
        ylabel('acc/g')
        ylim([-1.2,1.2])
        
        linkaxes([ax1 ax2 ax3],'x')
    case 3
        fig_new=figure
        title('Acceleration Right-Thigh')
        ax1=subplot(311), plot(handles.t_1, handles.acc1_RThigh_lpf_1,'r','LineWidth',1); title('Right-Thigh-acc1');
        xlabel('Time(min)')
        ylabel('acc/g')
        ylim([-1,1])
        ax2=subplot(312), plot(handles.t_1, handles.acc2_RThigh4_lpf_1,'k','LineWidth',1);title('Right-Thigh-acc2');
        xlabel('Time(min)')
        ylabel('acc/g')
        ylim([-1,1])
        ax3=subplot(313), plot(handles.t_1, handles.acc3_RThigh4_lpf_1,'b','LineWidth',1);title('Right-Thigh-acc3');
        
        xlabel('Time(min)')
        ylabel('acc/g')
        ylim([-1,1])
        linkaxes([ax1 ax2 ax3 ],'x')
        
    case 4
         fig_new=figure
        title('Acceleration Left-Shank')
        ax1=subplot(311), plot(handles.t_1, handles.acc1_LShank40_1,'r','LineWidth',1); title('Left-Shank-acc1');
        xlabel('Time(min)')
        ylabel('acc/g')
        ymax=max(handles.acc1_LShank40_1);
        ymin=min(handles.acc1_LShank40_1);
        ylim([ymin-0.2,ymax+0.2])
        ax2=subplot(312), plot(handles.t_1, handles.acc2_LShank40_1,'k','LineWidth',1);title('Left-Shank-acc2');
        xlabel('Time(min)')
        ylabel('acc/g')
        ymax=max(handles.acc1_LShank40_1);
        ymin=min(handles.acc1_LShank40_1);
        ylim([ymin-0.2,ymax+0.2])
        ax3=subplot(313), plot(handles.t_1, handles.acc3_LShank40_1,'b','LineWidth',1);title('Left-Shank-acc3');
        xlabel('Time(min)')
        ylabel('acc/g')
       ymax=max(handles.acc1_LShank40_1);
        ymin=min(handles.acc1_LShank40_1);
        ylim([ymin-0.2,ymax+0.2])
        
        
        linkaxes([ax1 ax2 ax3 ],'x')
        
    case 5
        fig_new=figure
        title('Acceleration Right-Shank')
        ax1=subplot(311), plot(handles.t_1, handles.acc1_RShank40_1,'r','LineWidth',1); title('Right-Shank-acc1');
         xlabel('Time(min)')
        ylabel('acc/g')
        ymax=max(handles.acc1_LShank40_1);
        ymin=min(handles.acc1_LShank40_1);
        ylim([ymin-0.2,ymax+0.2])
        ax2=subplot(312), plot(handles.t_1, handles.acc2_RShank40_1,'k','LineWidth',1);title('Right-Shank-acc2');
         xlabel('Time(min)')
        ylabel('acc/g')
        ymax=max(handles.acc1_LShank40_1);
        ymin=min(handles.acc1_LShank40_1);
        ylim([ymin-0.2,ymax+0.2])
        ax3=subplot(313), plot(handles.t_1, handles.acc3_RShank40_1,'b','LineWidth',1);title('Right-Shank-acc3');
         xlabel('Time(min)')
        ylabel('acc/g')
        ymax=max(handles.acc1_LShank40_1);
        ymin=min(handles.acc1_LShank40_1);
        ylim([ymin-0.2,ymax+0.2])
        linkaxes([ax1 ax2 ax3 ],'x')
end


% 
% fig=figure;
% plot(handles.t_1, handles.acc1_RThigh_lpf_1,'r','LineWidth',1);
% grid on;
% hold off;
% magnifyOnFigure;


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
disp(handles.id_plotted);
switch handles.id_plotted
    case 1
        fig_new=figure
        title('Angular velocity Gyroscope trunk')
        
         t_1=handles.t_1;
        ax1=subplot(311), plot(t_1,handles.gyr1_trunk_lpf_1,'r','LineWidth',1); title('Trunk- gyr1');
         ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        
         ax2=subplot(312), plot(t_1,handles.gyr2_trunk_lpf_1,'k','LineWidth',1);title('Trunk- gyr2');
        ylim([-700,700])
         xlabel('Time(min)')
        ylabel('°/sec')
        
        ax3=subplot(313), plot(t_1,handles.gyr3_trunk_lpf_1,'b','LineWidth',1);title('Trunk- gyr3');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        
        linkaxes([ax1 ax2 ax3],'x')
        
        
    
    case 2
        fig_new=figure
        title('Angular velocity Gyroscope Left-Thigh')
        ax1=subplot(311), plot(handles.t_1, handles.gyr1_LThigh_lpf_1,'r','LineWidth',1); title('Left-Thigh-gyr1');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        ax2=subplot(312), plot(handles.t_1, handles.gyr2_LThigh_lpf_1,'k','LineWidth',1);title('Left-Thigh-gyr2');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        ax3=subplot(313), plot(handles.t_1, handles.gyr3_LThigh_lpf_1,'b','LineWidth',1);title('Left-Thigh-gyr3');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        linkaxes([ax1 ax2 ax3],'x')
    case 3
        fig_new=figure
        title('Angular velocity Gyroscope Right-Thigh')
        ax1=subplot(311), plot(handles.t_1, handles.gyr1_RThigh_lpf_1,'r','LineWidth',1); title('Right-Thigh-gyr1');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        ax2=subplot(312), plot(handles.t_1, handles.gyr2_RThigh_lpf_1,'k','LineWidth',1);title('Right-Thigh-gyr2');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        ax3=subplot(313), plot(handles.t_1, handles.gyr3_RThigh_lpf_1,'b','LineWidth',1);title('Right-Thigh-gyr3');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        linkaxes([ax1 ax2 ax3 ],'x')
        
    case 4
         fig_new=figure
        title('Angular velocity Gyroscope Left-Shank')
        ax1=subplot(311), plot(handles.t_1, handles.gyr1_LShank40_1,'r','LineWidth',1); title('Left-Shank-gyr1');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        ax2=subplot(312), plot(handles.t_1, handles.gyr2_LShank40_1,'k','LineWidth',1);title('Left-Shank-gyr2');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        ax3=subplot(313), plot(handles.t_1, handles.gyr3_LShank40_1,'b','LineWidth',1);title('Left-Shank-gyr3');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        linkaxes([ax1 ax2 ax3 ],'x')
        
    case 5
        fig_new=figure
        title('Angular velocity Gyroscope Right-Shank')
        ax1=subplot(311), plot(handles.t_1, handles.gyr1_RShank40_1,'r','LineWidth',1); title('Right-Shank-gyr1');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        ax2=subplot(312), plot(handles.t_1, handles.gyr2_RShank40_1,'k','LineWidth',1);title('Right-Shank-gyr2');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        ax3=subplot(313), plot(handles.t_1, handles.gyr3_RShank40_1,'b','LineWidth',1);title('Right-Shank-gyr3');
        ylim([-700,700])
        xlabel('Time(min)')
        ylabel('°/sec')
        linkaxes([ax1 ax2 ax3 ],'x')
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val_trunk=get(handles.popupmenu1,'Value');
inverse_trunk=get(handles.checkbox1,'Value');
if(inverse_trunk==0)
    inverse_trunk=1;
else
    inverse_trunk=-1;
end

switch val_trunk
    case 1 
        addpath(genpath('error_functions'))
                error_selection
                return
    case 2
         
         verticalAccTr=handles.trunk_cell{1}*inverse_trunk;
         verticalAccTr40=handles.acc1_trunk40*inverse_trunk;
         
     case 3
          
          verticalAccTr=handles.trunk_cell{2}*inverse_trunk;
          verticalAccTr40=handles.acc2_trunk40*inverse_trunk;
    case 4
        
          verticalAccTr=handles.trunk_cell{3}*inverse_trunk;
          verticalAccTr40=handles.acc3_trunk40*inverse_trunk;
end

if (get(handles.popupmenu9,'Value')==1)
    
     if(handles.acc1_LThigh_lpf_1==false)
        addpath(genpath('error_functions'))
        not_loaded_c  
        return
     else
        val_thigh=get(handles.popupmenu2,'Value');
        inverse_thigh=get(handles.checkbox2,'Value');
        if(inverse_thigh==0)
            inverse_thigh=1;
        else
            inverse_thigh=-1;
        end

        switch val_thigh
            case 1 
              addpath(genpath('error_functions'))
                error_selection
                return
            case 2

                 frontalAccThigh=handles.thigh_cell{1,1}*inverse_thigh;


             case 3

                  frontalAccThigh=handles.thigh_cell{1,2}*inverse_thigh;
            case 4

                  frontalAccThigh=handles.thigh_cell{1,3}*inverse_thigh;
        end
     end

else  %chosen the right
     if(handles.acc1_RThigh_lpf_1==false)
        addpath(genpath('error_functions'))
        not_loaded_c  
        return
     else
        val_thigh=get(handles.popupmenu2,'Value');
        inverse_thigh=get(handles.checkbox2,'Value');
        if(inverse_thigh==0)
            inverse_thigh=1;
        else
            inverse_thigh=-1;
        end

        switch val_thigh
            case 1 
               addpath(genpath('error_functions'))
                error_selection
                 return
            case 2

                 frontalAccThigh=handles.thigh_cell{2,1}*inverse_thigh;


             case 3

                  frontalAccThigh=handles.thigh_cell{2,2}*inverse_thigh;
            case 4

                  frontalAccThigh=handles.thigh_cell{2,3}*inverse_thigh;
        end
     end
end 

val_Lshank=get(handles.popupmenu3,'Value');
inverse_Lshank=get(handles.checkbox3,'Value');
if(inverse_Lshank==0)
    inverse_Lshank=1;
else
    inverse_Lshank=-1;
end

switch val_Lshank
    case 1 
        addpath(genpath('error_functions'))
        error_selection
        return
    case 2
         
          PitchGyroLShank=handles.shank_cell{1,1}*inverse_Lshank;
         
     case 3
          
          PitchGyroLShank=handles.shank_cell{1,2}*inverse_Lshank;
    case 4
        
          PitchGyroLShank=handles.shank_cell{1,3}*inverse_Lshank;
end

val_Rshank=get(handles.popupmenu4,'Value');
inverse_Rshank=get(handles.checkbox5,'Value');
if(inverse_Rshank==0)
    inverse_Rshank=1;
else
    inverse_Rshank=-1;
end

switch val_Rshank
    case 1 
        addpath(genpath('error_functions'))
        error_selection
        return
        
    case 2
         
          PitchGyroRShank=handles.shank_cell{2,1}*inverse_Rshank;
         
     case 3
          
          PitchGyroRShank=handles.shank_cell{2,2}*inverse_Rshank;
    case 4
        
          PitchGyroRShank=handles.shank_cell{2,3}*inverse_Rshank;
end


verticalAccTr_lpf = sgolayfilt(verticalAccTr,1,1001);
frontalAcc_Thigh_lpf = sgolayfilt(frontalAccThigh,1,1001);
t=(1:length(verticalAccTr_lpf))/(200*60);

disp('R1');
disp(min(handles.thigh_cell{2,1}));
disp('R2');
disp(min(handles.thigh_cell{2,2}));
disp('R3');
disp(min(handles.thigh_cell{2,3}));
disp('L1');
disp(min(handles.thigh_cell{1,1}));
disp('L2');
disp(min(handles.thigh_cell{1,2}));
disp('L3');
disp(min(handles.thigh_cell{1,3}));

disp('trunk')
disp(max(verticalAccTr));
disp(min(verticalAccTr));
disp('frontal thigh')
disp(max(frontalAccThigh));
disp(min(frontalAccThigh));
disp('Pithc R Shank')
disp(max(PitchGyroRShank));
disp(min(PitchGyroRShank));
disp('Pithc L Shank')
disp(max(PitchGyroLShank));
disp(min(PitchGyroLShank));

figure
ax1=subplot(411), plot(t,verticalAccTr_lpf,'LineWidth',1); title('Trunk Vertical Acc');
ax2=subplot(412), plot(t,frontalAcc_Thigh_lpf,'LineWidth',1);title('Thigh Frontal Acc');
ax3=subplot(413), plot(t,PitchGyroRShank,'LineWidth',1);title('RShank Pitch Gyro');
ax4=subplot(414), plot(t,PitchGyroLShank,'LineWidth',1);title('LShank Pitch Gyro');
xlabel('Time(min)')
linkaxes([ax1 ax2 ax3 ax4],'x')


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PathName = uigetdir;

handles.PathName=PathName;
set(handles.text12,'String',PathName);
guidata(hObject,handles)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
