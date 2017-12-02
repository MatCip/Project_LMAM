function varargout = gait_results(varargin)
% GAIT_RESULTS MATLAB code for gait_results.fig
%      GAIT_RESULTS, by itself, creates a new GAIT_RESULTS or raises the existing
%      singleton*.
%
%      H = GAIT_RESULTS returns the handle to a new GAIT_RESULTS or the handle to
%      the existing singleton*.
%
%      GAIT_RESULTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAIT_RESULTS.M with the given input arguments.
%
%      GAIT_RESULTS('Property','Value',...) creates a new GAIT_RESULTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gait_results_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gait_results_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gait_results

% Last Modified by GUIDE v2.5 28-Nov-2017 11:00:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gait_results_OpeningFcn, ...
                   'gui_OutputFcn',  @gait_results_OutputFcn, ...
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


% --- Executes just before gait_results is made visible.
function gait_results_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gait_results (see VARARGIN)

% Choose default command line output for gait_results
handles.path1=varargin{1};
addpath(genpath('guide/pic'))

I2=imread('white.png');
imshow(I2,'Parent',handles.axes1)

handles.path=[handles.path1,'/gait_results'];

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gait_results wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gait_results_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton9.
function togglebutton9_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton9
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/KneeAngle.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end

% --- Executes on button press in togglebutton10.
function togglebutton10_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton10
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/Symmetry_index.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end

% --- Executes on button press in togglebutton11.
function togglebutton11_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton11
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/Normal_Stride_length.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end

% --- Executes on button press in togglebutton12.
function togglebutton12_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton12
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/Swing.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end

% --- Executes on button press in togglebutton13.
function togglebutton13_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton13
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/Stance.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end

% --- Executes on button press in togglebutton14.
function togglebutton14_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton14
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/Limp.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end

% --- Executes on button press in togglebutton15.
function togglebutton15_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton15
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/StepsPerWalkingPeriods.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end

% --- Executes on button press in togglebutton16.
function togglebutton16_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton16
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton15,'Value',0);

try
I1=imread([handles.path,'/KinematicalCurves_MaxWalk.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/Cadence.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/Gait_cycle_time.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end


% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton3
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/Normalized_Speed.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end


% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton4
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/Double_Support.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end


% --- Executes on button press in togglebutton5.
function togglebutton5_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton5
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/StrideLength.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end


% --- Executes on button press in togglebutton6.
function togglebutton6_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton6
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/Speed.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end


% --- Executes on button press in togglebutton7.
function togglebutton7_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton7

set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/ShankAngle.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end


% --- Executes on button press in togglebutton8.
function togglebutton8_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton8
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);

try
I1=imread([handles.path,'/ThighAngle.bmp']);
imshow(I1,'Parent',handles.axes1)
catch
    file_not_found
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.togglebutton1,'Value')==1)
%     fig1=figure;
%     openfig([handles.path,'/Cadence.fig']);
 
    openfig([handles.path,'/Cadence.fig'],'visible')
 
    
end

if(get(handles.togglebutton6,'Value')==1)
    openfig([handles.path,'/Speed.fig'],'visible')
end

if(get(handles.togglebutton3,'Value')==1)
   openfig([handles.path,'/Normalized_Speed.fig'],'visible')
end

if(get(handles.togglebutton4,'Value')==1)
    openfig([handles.path,'/Double_Support.fig'],'visible')
end

if(get(handles.togglebutton5,'Value')==1)
    openfig([handles.path,'/StrideLength.fig'],'visible')
end
if(get(handles.togglebutton2,'Value')==1)
    openfig([handles.path,'/Gait_cycle_time.fig'],'visible')
end

if(get(handles.togglebutton7,'Value')==1)
    openfig([handles.path,'/ShankAngle.fig'],'visible')
end

if(get(handles.togglebutton8,'Value')==1)
    openfig([handles.path,'/ThighAngle.fig'],'visible')
end
if(get(handles.togglebutton9,'Value')==1)
    openfig([handles.path,'/KneeAngle.fig'],'visible')
end
if(get(handles.togglebutton14,'Value')==1)
    openfig([handles.path,'/Limp.fig'],'visible')
end
if(get(handles.togglebutton11,'Value')==1)
    openfig([handles.path,'/Normal_Stride_length.fig'],'visible')
end
if(get(handles.togglebutton12,'Value')==1)
    openfig([handles.path,'/Normal_Stride_length.fig'],'visible')
end
if(get(handles.togglebutton13,'Value')==1)
    openfig([handles.path,'/Stance.fig'],'visible')
end
if(get(handles.togglebutton10,'Value')==1)
    openfig([handles.path,'/Symmetry_index.fig'],'visible')
end
if(get(handles.togglebutton10,'Value')==1)
    openfig([handles.path,'/Symmetry_index.fig'],'visible')
end

if(get(handles.togglebutton15,'Value')==1)
    openfig([handles.path,'/StepsPerWalkingPeriods.fig'],'visible')
end
if(get(handles.togglebutton16,'Value')==1)
    openfig([handles.path,'/KinematicalCurves_MaxWalk.fig'],'visible')
end








% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    winopen([handles.path1,'/GaitAnalysisReport.xls']);
catch
    file_not_found
end



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    winopen([handles.path1,'TableGaitMetrics.docs']);
catch
    file_not_found
end
