function varargout = gait_analysis_1(varargin)
% GAIT_ANALYSIS_1 MATLAB code for gait_analysis_1.fig
%      GAIT_ANALYSIS_1, by itself, creates a new GAIT_ANALYSIS_1 or raises the existing
%      singleton*.
%
%      H = GAIT_ANALYSIS_1 returns the handle to a new GAIT_ANALYSIS_1 or the handle to
%      the existing singleton*.
%
%      GAIT_ANALYSIS_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAIT_ANALYSIS_1.M with the given input arguments.
%
%      GAIT_ANALYSIS_1('Property','Value',...) creates a new GAIT_ANALYSIS_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gait_analysis_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gait_analysis_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gait_analysis_1

% Last Modified by GUIDE v2.5 19-Nov-2017 14:12:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gait_analysis_1_OpeningFcn, ...
                   'gui_OutputFcn',  @gait_analysis_1_OutputFcn, ...
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


% --- Executes just before gait_analysis_1 is made visible.
function gait_analysis_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gait_analysis_1 (see VARARGIN)

% Choose default command line output for gait_analysis_1
handles.output = hObject;
handles.output = hObject;
handles.FileName_trunk='0';
   handles.PathName_trunk='0';
  handles.FileName_LT='0';
     handles.PathName_LT='0';
   handles.FileName_RT='0';
   handles.PathName_RT='0';
    handles.FileName_LS='0';
    handles.PathName_LS='0';
    handles.FileName_RS='0';
   handles.PathName_RS='0';
   handles.list_of_part=cell(7,1);
    handles.config_all=0;
% Update handles structure
guidata(hObject, handles);
I=imread('./pic/body.png');
imshow(I,'Parent',handles.axes2)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gait_analysis_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gait_analysis_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  FileName_trunk= handles.FileName_trunk;
    PathName_trunk= handles.PathName_trunk;
    FileName_LT= handles.FileName_LT;
    PathName_LT= handles.PathName_LT;
    FileName_RT= handles.FileName_RT;
    PathName_RT= handles.PathName_RT;
    FileName_LS= handles.FileName_LS;
    PathName_LS= handles.PathName_LS;
    FileName_RS= handles.FileName_RS;
    PathName_RS= handles.PathName_RS;
    
    save('function_interaction/parts_struct_gait','FileName_trunk','PathName_trunk','FileName_LT','PathName_LT','FileName_RT','PathName_RT','FileName_LS','PathName_LS','FileName_RS','PathName_RS');
    try 
    input={handles.cell,handles.config_all};
    func_visualizer_gait_1(input);
    catch
    end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox2,'Value') == 1)
 [handles.FileName_trunk,handles.PathName_trunk] = uigetfile('*.mat','Select the file .mat corresponding to trunk');
 if(handles.PathName_trunk~=0)
    set(handles.text4,'String','Loaded');
    handles.cell{1}='Trunk';
 end
 
 
 end
 guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox3,'Value') == 1)
 [handles.FileName_LH,handles.PathName_LH] = uigetfile('*.mat','Select the file .mat corresponding to "Left Harm" ');
 if(handles.PathName_LH~=0)
    set(handles.text5,'String','Loaded') ;
     handles.cell{2}='Left-Harm';
 end
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox4,'Value') == 1)
 [handles.FileName_RH,handles.PathName_RH] = uigetfile('*.mat','Select the file .mat corresponding to "Right Harm"');
if(handles.PathName_RH~=0)
    set(handles.text6,'String','Loaded') ;
    handles.cell{3}='Right-Harm';
 end
end
 guidata(hObject, handles);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox7,'Value') == 1)
 [handles.FileName_LT,handles.PathName_LT] = uigetfile('*.mat','Select the file .mat corresponding to "Left Thigh"');
 if(handles.PathName_LT~=0)
    set(handles.text7,'String','Loaded') ;
    handles.cell{4}='Left-Thigh';
 end
end
 guidata(hObject, handles);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox5,'Value') == 1)
 [handles.FileName_RT,handles.PathName_RT] = uigetfile('*.mat','Select the file .mat corresponding to "Right Thigh"');
if(handles.PathName_RT~=0)
    set(handles.text8,'String','Loaded') ;
    handles.cell{5}='Right-Thigh';
end
end
guidata(hObject, handles);




% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox6,'Value') == 1)
 [handles.FileName_LS,handles.PathName_LS] = uigetfile('*.mat','Select the file .mat corresponding to "Left Shank"');
if(handles.PathName_LS~=0)
    set(handles.text9,'String','Loaded') ;
    handles.cell{6}='Left-Shank';
    
end
end
guidata(hObject, handles);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox8,'Value') == 1)
 [handles.FileName_RS,handles.PathName_RS] = uigetfile('*.mat','Select the file .mat corresponding to "Right Shank"');
if(handles.PathName_RS~=0)
    set(handles.text10,'String','Loaded') ;
    handles.cell{7}='Right-Shank';
end 

end
guidata(hObject, handles);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox9,'Value') == 1)
    full_config_hanlde=full_config_gait;
    set(handles.text11,'String','Loaded');
    handles.config_all=1;
    handles.cell{1}='Trunk';
    handles.cell{4}='Left-Thigh';
    handles.cell{5}='Right-Thigh';
    handles.cell{6}='Left-Shank';
    handles.cell{7}='Right-Shank';
end
guidata(hObject, handles);


function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB

if(exist('function_interaction/parts_struct_gait.mat')==2)
    delete('function_interaction/parts_struct_gait.mat');
    
end
if(exist('function_interaction/full_config_struct_gait.mat')==2)
    delete('function_interaction/full_config_struct_gait.mat');
end
% Hint: delete(hObject) closes the figure
delete(hObject);
