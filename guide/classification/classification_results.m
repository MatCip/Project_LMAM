function varargout = classification_results(varargin)
% CLASSIFICATION_RESULTS MATLAB code for classification_results.fig
%      CLASSIFICATION_RESULTS, by itself, creates a new CLASSIFICATION_RESULTS or raises the existing
%      singleton*.
%
%      H = CLASSIFICATION_RESULTS returns the handle to a new CLASSIFICATION_RESULTS or the handle to
%      the existing singleton*.
%
%      CLASSIFICATION_RESULTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLASSIFICATION_RESULTS.M with the given input arguments.
%
%      CLASSIFICATION_RESULTS('Property','Value',...) creates a new CLASSIFICATION_RESULTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before classification_results_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to classification_results_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help classification_results

% Last Modified by GUIDE v2.5 06-Dec-2017 20:16:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @classification_results_OpeningFcn, ...
                   'gui_OutputFcn',  @classification_results_OutputFcn, ...
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


% --- Executes just before classification_results is made visible.
function classification_results_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to classification_results (see VARARGIN)

% Choose default command line output for classification_resultss



handles.path=varargin{1};
addpath(genpath('../guide/error_functions'))

I1=imread('../guide/pic/white.png');
imshow(I1,'Parent',handles.axes2)



handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes classification_results wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = classification_results_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton9,'Value',0);
try
    
I1=imread([handles.path,'/Barcode.jpg']);
imshow(I1,'Parent',handles.axes2)
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
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton9,'Value',0);
disp([handles.path,'/posture_allocation_per_hour.jpg']); 
try
 
I1=imread([handles.path,'/posture_allocation_per_hour.jpg']);

imshow(I1,'Parent',handles.axes2)
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
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton9,'Value',0);
try
    
I1=imread([handles.path,'/BarplotPostures.png']);
imshow(I1,'Parent',handles.axes2)
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
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton9,'Value',0);
try
    
I1=imread([handles.path,'/BoxPlotDurationPosturePeriods.tif']);
imshow(I1,'Parent',handles.axes2)
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
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton9,'Value',0);
try
    
I1=imread([handles.path,'/PiePostures.tif']);
imshow(I1,'Parent',handles.axes2)
catch
    file_not_found
end

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton9,'Value',0);
try
    
I1=imread([handles.path,'/PAPattern.jpg']);
imshow(I1,'Parent',handles.axes2)
catch
    file_not_found
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(get(handles.togglebutton2,'Value')==1)
    fig2=figure;
    I2=imread([handles.path,'/Barcode.jpg']);
    imshow(I2)
end

if(get(handles.togglebutton3,'Value')==1)
    fig3=figure;
    I3=imread([handles.path,'/posture_allocation_per_hour.jpg']);
    imshow(I3)
end

if(get(handles.togglebutton5,'Value')==1)
    fig4=figure;
    I4=imread([handles.path,'/BoxPlotDurationPosturePeriods.tif']);
    imshow(I4)
end

if(get(handles.togglebutton4,'Value')==1)
    fig4=figure;
    I4=imread([handles.path,'/BarplotPostures.png']);
    imshow(I4)
end

if(get(handles.togglebutton6,'Value')==1)
    fig6=figure;
    I6=imread([handles.path,'/PiePostures.tif']);
    imshow(I6)
end
if(get(handles.togglebutton7,'Value')==1)
    fig7=figure;
    I7=imread([handles.path,'/PAPattern.jpg']);
    imshow(I7)
end




% --- Executes on button press in togglebutton8.
function togglebutton8_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton8

createPAReport
cd('classification');


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
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
try
    
I1=imread([handles.path,'/spider_perf_DL.jpg']);
imshow(I1,'Parent',handles.axes2)
catch
    file_not_found
end
