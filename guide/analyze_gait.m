function varargout = analyze_gait(varargin)
% ANALYZE_GAIT MATLAB code for analyze_gait.fig
%      ANALYZE_GAIT, by itself, creates a new ANALYZE_GAIT or raises the existing
%      singleton*.
%
%      H = ANALYZE_GAIT returns the handle to a new ANALYZE_GAIT or the handle to
%      the existing singleton*.
%
%      ANALYZE_GAIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYZE_GAIT.M with the given input arguments.
%
%      ANALYZE_GAIT('Property','Value',...) creates a new ANALYZE_GAIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analyze_gait_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to analyze_gait_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help analyze_gait

% Last Modified by GUIDE v2.5 22-Nov-2017 20:04:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analyze_gait_OpeningFcn, ...
                   'gui_OutputFcn',  @analyze_gait_OutputFcn, ...
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


% --- Executes just before analyze_gait is made visible.
function analyze_gait_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to analyze_gait (see VARARGIN)

% Choose default command line output for analyze_gait
handles.output = hObject;
I1=imread('./pic/folder-icon.png');
imshow(I1,'Parent',handles.axes3);
I2=imread('./pic/img-thing.jpeg');
imshow(I2,'Parent',handles.axes1)
I2=imread('./pic/img-thing.jpeg');
imshow(I2,'Parent',handles.axes2)

handles.gyr1_LThigh_1=varargin{1};
handles.gyr2_LThigh_1=varargin{2};
handles.gyr3_LThigh_1=varargin{3};

handles.gyr1_RThigh_1=varargin{4};
handles.gyr2_RThigh_1=varargin{5};
handles.gyr3_RThigh_1=varargin{6};

handles.gyr1_LShank_1=varargin{7};
handles.gyr2_LShank_1=varargin{8};
handles.gyr3_LShank_1=varargin{9};


handles.gyr1_RShank_1=varargin{10};
handles.gyr2_RShank_1=varargin{11};
handles.gyr3_RShank_1=varargin{12};
handles.t_1=varargin{13};
handles.id_plotted=0;

addpath(genpath('../errors_functions/'));
clearvars varargin




% Update handles structure
guidata(hObject, handles);

% UIWAIT makes analyze_gait wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = analyze_gait_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
switch handles.id_plotted
    case 1
        fig_new=figure
        title('Angular Velocity Left-Thigh')
        ax1=subplot(311), plot(handles.t_1, handles.gyr1_LThigh_1,'r','LineWidth',1); title('Left-Thigh-gyr1');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        
        ax2=subplot(312), plot(handles.t_1, handles.gyr2_LThigh_1,'k','LineWidth',1);title('Left-Thigh-gyr2');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        
        
        ax3=subplot(313), plot(handles.t_1, handles.gyr3_LThigh_1,'b','LineWidth',1);title('Left-Thigh-gyr3');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        
        linkaxes([ax1 ax2 ax3],'x')
       
        case 2
        fig_new=figure
        title('Angular Velocity Left-Shank')
        ax1=subplot(311), plot(handles.t_1, handles.gyr1_LShank_1,'r','LineWidth',1); title('Left-Shank-gyr1');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        ax2=subplot(312), plot(handles.t_1, handles.gyr2_LShank_1,'k','LineWidth',1);title('Left-Shank-gyr2');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        ax3=subplot(313), plot(handles.t_1, handles.gyr3_LShank_1,'b','LineWidth',1);title('Left-Shank-gyr3');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        
        linkaxes([ax1 ax2 ax3],'x')
end

        
% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
switch handles.id_plotted
    case 1
        fig_new=figure
        title('Angular Velocity Right-Thigh')
        ax1=subplot(311), plot(handles.t_1, handles.gyr1_RThigh_1,'r','LineWidth',1); title('Right-Thigh-gyr1');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        
        ax2=subplot(312), plot(handles.t_1, handles.gyr2_RThigh_1,'k','LineWidth',1);title('Right-Thigh-gyr2');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        
        
        ax3=subplot(313), plot(handles.t_1, handles.gyr3_RThigh_1,'b','LineWidth',1);title('Right-Thigh-gyr3');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        
        linkaxes([ax1 ax2 ax3],'x')
       
        case 2
        fig_new=figure
        title('Angular Velocity Left-Shank')
        ax1=subplot(311), plot(handles.t_1, handles.gyr1_RShank_1,'r','LineWidth',1); title('Right-Shank-gyr1');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        ax2=subplot(312), plot(handles.t_1, handles.gyr2_RShank_1,'k','LineWidth',1);title('Right-Shank-gyr2');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        ax3=subplot(313), plot(handles.t_1, handles.gyr3_RShank_1,'b','LineWidth',1);title('Right-Shank-gyr3');
        xlabel('Time(min)')
        ylim([-700,700])
        ylabel('°/sec')
        
        linkaxes([ax1 ax2 ax3],'x')
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PathName = uigetdir;

handles.PathName=PathName;
set(handles.text2,'String',PathName);
guidata(hObject,handles)


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
femur_length_str=get(handles.edit1,'String');
  addpath(genpath('error_functions'))
    
   
   femur_length=str2double(femur_length_str);
   
     if(isnan(femur_length)==1)
   
       addpath(genpath('error_functions'))
            input_not_correct
       return 
     end
   
   
  
   tibia_length_str=get(handles.edit2,'String');
  
   tibia_length=str2double(tibia_length_str);
   
   if(isnan(tibia_length)==1)
       addpath(genpath('error_functions'))
      
            input_not_correct
       return 
   end
   
   
   left_leg_length_str=get(handles.edit3,'String');
  addpath(genpath('error_functions'))
    
   
  LeftLegLength=str2double(left_leg_length_str);
   
     if(isnan(femur_length)==1)
   
       addpath(genpath('error_functions'))
            input_not_correct
       return 
     end
     
     
       right_leg_length_str=get(handles.edit4,'String');
       addpath(genpath('error_functions'))
    
   
   RightLegLength=str2double(right_leg_length_str);
   
     if(isnan(femur_length)==1)
   
       addpath(genpath('error_functions'))
            input_not_correct
       return 
     end
     
    
   
LegDim=[femur_length,tibia_length];
   



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
this_analysis_ID=['Patient_',ID,'_Gait_Analysis_ID_'];
this_analysis_ID=[this_analysis_ID,num_analysis_str];

PathName_1=strcat(PathName, '/',this_analysis_ID);
mkdir (PathName_1)

    val_thigh=get(handles.popupmenu7,'Value');
    inverse_thigh=get(handles.checkbox4,'Value');
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

             Pitch_LThigh=handles.gyr1_LThigh_1*inverse_thigh;


         case 3

              Pitch_LThigh=handles.gyr2_LThigh_1*inverse_thigh;
        case 4

              Pitch_LThigh=handles.gyr3_LThigh_1*inverse_thigh;
    end
    
    
    val_thigh=get(handles.popupmenu8,'Value');
    inverse_thigh=get(handles.checkbox5,'Value');
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

             Pitch_RThigh=handles.gyr1_RThigh_1*inverse_thigh;


         case 3

              Pitch_RThigh=handles.gyr2_RThigh_1*inverse_thigh;
        case 4

              Pitch_RThigh=handles.gyr3_RThigh_1*inverse_thigh;
    end

    
val_Lshank=get(handles.popupmenu2,'Value');
inverse_Lshank=get(handles.checkbox2,'Value');
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
         
          Pitch_LShank=handles.gyr1_LShank_1*inverse_Lshank;
         
     case 3
          
          Pitch_LShank=handles.gyr2_LShank_1*inverse_Lshank;
    case 4
        
          Pitch_LShank=handles.gyr3_LShank_1*inverse_Lshank;
end



val_Rshank=get(handles.popupmenu3,'Value');
inverse_Rshank=get(handles.checkbox3,'Value');
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
         
          Pitch_RShank=handles.gyr1_RShank_1*inverse_Rshank;
         
     case 3
          
          Pitch_RShank=handles.gyr2_RShank_1*inverse_Rshank;
    case 4
        
          Pitch_RShank=handles.gyr3_RShank_1*inverse_Rshank;
end

Shanks=[Pitch_RShank';Pitch_LShank']';
Thighs=[Pitch_RThigh';Pitch_LThigh']';

addpath(genpath('gait_functions'))
disp(PathName_1);
% starting gait analysis 
res_gait = AutoGaitAnalyze_CPalsy(Shanks,Thighs,LegDim,PathName_1);
[m1,n1]=size(res_gait);
steps=[];
for j=1:n1
    steps(j)=res_gait(j).steps;
end
maxSteps=max(steps);
indx_maxsteps=find(steps==maxSteps);

ShankAngleR_maxWalk = [];
ThighAngleR_maxWalk = [];
KneeAngleR_maxWalk = [];
        
ShankAngleL_maxWalk = [];
ThighAngleL_maxWalk = [];
KneeAngleL_maxWalk = [];

for j=indx_maxsteps:indx_maxsteps
    [m2,n2]=size(res_gait(j).Cycle);
     StanceR=nanmean([res_gait(j).Cycle(:).StanceR]);
     StanceL=nanmean([res_gait(j).Cycle(:).StanceL]);
    for k=1:n2-1
        if isnan(res_gait(j).Cycle(k).HsR)==0 && isnan(res_gait(j).Cycle(k+1).HsR)==0 && isnan(res_gait(j).Cycle(k).HsL)==0 && isnan(res_gait(j).Cycle(k+1).HsL)==0
            l1R=res_gait(j).start+res_gait(j).Cycle(k).HsR;
            l2R=res_gait(j).start+res_gait(j).Cycle(k+1).HsR;
            l1L=res_gait(j).start+res_gait(j).Cycle(k).HsL;
            l2L=res_gait(j).start+res_gait(j).Cycle(k+1).HsL;
            Pitch_RShank_Temp=Pitch_RShank(l1R:l2R);
            Pitch_LShank_Temp=Pitch_LShank(l1L:l2L);
            Pitch_RThigh_Temp=Pitch_RThigh(l1R:l2R);
            Pitch_LThigh_Temp=Pitch_LThigh(l1L:l2L);
            
            ShankAngleR_Temp=cumtrapz(Pitch_RShank_Temp)/200;
            ShankAngleR_maxWalk=[ShankAngleR_maxWalk resample(ShankAngleR_Temp,200,length(ShankAngleR_Temp))];
            
            ShankAngleL_Temp=cumtrapz(Pitch_LShank_Temp)/200;
            ShankAngleL_maxWalk=[ShankAngleL_maxWalk resample(ShankAngleL_Temp,200,length(ShankAngleL_Temp))];
            
            ThighAngleR_Temp=cumtrapz(Pitch_RThigh_Temp)/200;
            ThighAngleR_maxWalk=[ThighAngleR_maxWalk resample(ThighAngleR_Temp,200,length(ThighAngleR_Temp))];
            
            ThighAngleL_Temp=cumtrapz(Pitch_LThigh_Temp)/200;
            ThighAngleL_maxWalk=[ThighAngleL_maxWalk resample(ThighAngleL_Temp,200,length(ThighAngleL_Temp))];
            
            KneeAngleR_Temp=ThighAngleR_Temp-ShankAngleR_Temp;
            KneeAngleR_maxWalk=[KneeAngleR_maxWalk resample(KneeAngleR_Temp,200,length(KneeAngleR_Temp))];
            
            KneeAngleL_Temp=ThighAngleL_Temp-ShankAngleL_Temp;
            KneeAngleL_maxWalk=[KneeAngleL_maxWalk resample(KneeAngleL_Temp,200,length(KneeAngleL_Temp))];
        end
   end
end

path_mat=[PathName_1,'/mat_folder'];

mkdir (path_mat)

save ([path_mat,'/ShankAngleR_maxWalk'], 'ShankAngleR_maxWalk');
save ([path_mat,'/ThighAngleR_maxWalk'],'ThighAngleR_maxWalk');
save ([path_mat, '/KneeAngleR_maxWalk'], 'KneeAngleR_maxWalk');
        
save ([path_mat,'/ShankAngleL_maxWalk'],'ShankAngleL_maxWalk');
save ([path_mat,'/ThighAngleL_maxWalk'], 'ThighAngleL_maxWalk');
save ([path_mat,'/KneeAngleL_maxWalk'], 'KneeAngleL_maxWalk');

filename = [PathName_1,'/','GaitAnalysisReport.xls'];
sheet = 1;
xlRange = 'B4:X400';
walking_params_new = xlsread(filename,sheet,xlRange);

% %walking_params_new = xlsread(filename,sheet,xlRange);
% walking_params_new=res_gait;
 save ([PathName_1,'/walking_params_new'], 'walking_params_new');

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



d = datetime('today')
date=datestr(d);
save(['User_database/','Patient_',ID],'ID','Name','Surname','Date','Pathologies','Analysis','local_path');
type_of_analysis='PA';
save(['Analysis_database/',this_analysis_ID],'this_analysis_ID','ID','Name','Surname','path_destination','date','Advance_of_analysis','type_of_analysis');

% save in local path name

mkdir(path_destination);
copyfile(PathName_1,path_destination)


pathword=PlotGaitResults3(RightLegLength,LeftLegLength,path_destination,this_analysis_ID);

gait_results(path_destination);






% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    
   val_thigh=get(handles.popupmenu7,'Value');
   
    inverse_thigh=get(handles.checkbox4,'Value');
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

             Pitch_LThigh=handles.gyr1_LThigh_1*inverse_thigh;


         case 3

              Pitch_LThigh=handles.gyr2_LThigh_1*inverse_thigh;
        case 4

              Pitch_LThigh=handles.gyr3_LThigh_1*inverse_thigh;
    end
    
    
    val_thigh=get(handles.popupmenu8,'Value');
    inverse_thigh=get(handles.checkbox5,'Value');
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

             Pitch_RThigh=handles.gyr1_RThigh_1*inverse_thigh;


         case 3

              Pitch_RThigh=handles.gyr2_RThigh_1*inverse_thigh;
        case 4

              Pitch_RThigh=handles.gyr3_RThigh_1*inverse_thigh;
    end

    
val_Lshank=get(handles.popupmenu2,'Value');
inverse_Lshank=get(handles.checkbox2,'Value');
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
         
          Pitch_LShank=handles.gyr1_LShank_1*inverse_Lshank;
         
     case 3
          
          Pitch_LShank=handles.gyr2_LShank_1*inverse_Lshank;
    case 4
        
          Pitch_LShank=handles.gyr3_LShank_1*inverse_Lshank;
end



val_Rshank=get(handles.popupmenu3,'Value');
inverse_Rshank=get(handles.checkbox3,'Value');
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
         
          Pitch_RShank=handles.gyr1_RShank_1*inverse_Rshank;
         
     case 3
          
          Pitch_RShank=handles.gyr2_RShank_1*inverse_Rshank;
    case 4
        
          Pitch_RShank=handles.gyr3_RShank_1*inverse_Rshank;
          
          
end

  disp('gyr pitch right shank');
 disp(max(Pitch_RShank));
 disp(min(Pitch_RShank));
 
figure
ax1=subplot(211), plot(handles.t_1,Pitch_RShank,'LineWidth',1)
hold on
ax1=subplot(211), plot(handles.t_1,Pitch_RThigh,'LineWidth',1)
legend('RShank','RThigh');
hold off
ax2=subplot(212), plot(handles.t_1,Pitch_LShank,'LineWidth',1)
hold on
ax2=subplot(212), plot(handles.t_1,Pitch_LThigh,'LineWidth',1)
legend('LShank','LThigh');
xlabel('Time(min)');
linkaxes([ax2,ax1],'x');





% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


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


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.id_plotted=2;
axes(handles.axes1)
 plot(handles.t_1, handles.gyr1_LShank_1,'r','LineWidth',1)
 title('gir Left-Shank')
 hold on
 plot(handles.t_1, handles.gyr2_LShank_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_LShank_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 xlabel('Time(min)')
  ylabel('°/sec')
 hold off 
 disp('gyr 1 R shank');
 disp(max(handles.gyr1_RShank_1));
 disp(min(handles.gyr1_RShank_1));
  disp('gyr 2 R shank');
 disp(max(handles.gyr2_RShank_1));
 disp(min(handles.gyr2_RShank_1));
  disp('gyr 3 R  shank');
 disp(max(handles.gyr3_RShank_1));
 disp(min(handles.gyr3_RShank_1));
 axes(handles.axes2)
 plot(handles.t_1, handles.gyr1_RShank_1,'r','LineWidth',1)
 title('gir Right Shank')
 hold on
 plot(handles.t_1, handles.gyr2_RShank_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_RShank_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 xlabel('Time(min)')
  ylabel('°/sec')
 hold off 
 guidata(hObject,handles)
 

% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


 handles.id_plotted=1;


 axes(handles.axes1)
 plot(handles.t_1, handles.gyr1_LThigh_1,'r','LineWidth',1)
 title('gir Left-Thigh')
 hold on
 plot(handles.t_1, handles.gyr2_LThigh_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_LThigh_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 xlabel('Time(min)')
  ylabel('°/sec')
 hold off 
 

 axes(handles.axes2)
 plot(handles.t_1, handles.gyr1_RThigh_1,'r','LineWidth',1)
 title('gir Right Thigh')
 hold on
 plot(handles.t_1, handles.gyr2_RThigh_1,'k','LineWidth',1)
 plot(handles.t_1, handles.gyr3_RThigh_1,'b','LineWidth',1)
 legend('gyr1','gyr2','gyr3');
 xlabel('Time(min)')
  ylabel('°/sec')
 hold off 
 
guidata(hObject,handles)


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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
