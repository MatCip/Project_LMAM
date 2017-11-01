function varargout = full_config(varargin)
% FULL_CONFIG MATLAB code for full_config.fig
%      FULL_CONFIG, by itself, creates a new FULL_CONFIG or raises the existing
%      singleton*.
%
%      H = FULL_CONFIG returns the handle to a new FULL_CONFIG or the handle to
%      the existing singleton*.
%
%      FULL_CONFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FULL_CONFIG.M with the given input arguments.
%
%      FULL_CONFIG('Property','Value',...) creates a new FULL_CONFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before full_config_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to full_config_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help full_config

% Last Modified by GUIDE v2.5 18-Oct-2017 18:50:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @full_config_OpeningFcn, ...
                   'gui_OutputFcn',  @full_config_OutputFcn, ...
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


% --- Executes just before full_config is made visible.
function full_config_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to full_config (see VARARGIN)

% Choose default command line output for full_config
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes full_config wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = full_config_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName_1,PathName_1] = uigetfile('*.mat','Select the file .mat corresponding to trunk');
data = struct('name', FileName_1,'path',PathName_1);
hObject.UserData = data;
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [FileName_2,PathName_2] = uigetfile('*.mat','Select the file .mat corresponding to "Left Shank"');
 data = struct('name', FileName_2,'path',PathName_2);
 hObject.UserData = data;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [FileName_3,PathName_3] = uigetfile('*.mat','Select the file .mat corresponding to "Right Shank"');
data = struct('name', FileName_3,'path',PathName_3);
hObject.UserData = data;


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName_4,PathName_4] = uigetfile('*.mat','Select the file .mat corresponding to "Right Thigh"');
data = struct('name', FileName_4,'path',PathName_4);
hObject.UserData = data;

% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName_5,PathName_5] = uigetfile('*.mat','Select the file .mat corresponding to "Right Thigh"');
data = struct('name', FileName_5,'path',PathName_5);
hObject.UserData = data;

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h1 = findobj('Tag','pushbutton1');
data1 = h1.UserData;
FileName_1=data1.name;
Path_1=data1.path;


h2 = findobj('Tag','pushbutton2');
data2 = h2.UserData;
FileName_2=data2.name;
Path_2=data2.path;


h3 = findobj('Tag','pushbutton3');
data3 = h3.UserData;
FileName_3=data3.name;
Path_3=data3.path;


h4 = findobj('Tag','pushbutton5');
data4 = h4.UserData;
FileName_4=data4.name;
Path_4=data4.path;


h5 = findobj('Tag','pushbutton6');
data5 = h5.UserData;
FileName_5=data5.name;
Path_5=data5.path;
load_all(FileName_1,Path_1,FileName_2,Path_2,FileName_3,Path_3,FileName_4,Path_4,FileName_5,Path_5);





