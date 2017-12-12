function varargout = create_advanced_report(varargin)
% CREATE_ADVANCED_REPORT MATLAB code for create_advanced_report.fig
%      CREATE_ADVANCED_REPORT, by itself, creates a new CREATE_ADVANCED_REPORT or raises the existing
%      singleton*.
%
%      H = CREATE_ADVANCED_REPORT returns the handle to a new CREATE_ADVANCED_REPORT or the handle to
%      the existing singleton*.
%
%      CREATE_ADVANCED_REPORT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATE_ADVANCED_REPORT.M with the given input arguments.
%
%      CREATE_ADVANCED_REPORT('Property','Value',...) creates a new CREATE_ADVANCED_REPORT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before create_advanced_report_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to create_advanced_report_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help create_advanced_report

% Last Modified by GUIDE v2.5 12-Dec-2017 09:42:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @create_advanced_report_OpeningFcn, ...
                   'gui_OutputFcn',  @create_advanced_report_OutputFcn, ...
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


% --- Executes just before create_advanced_report is made visible.
function create_advanced_report_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to create_advanced_report (see VARARGIN)

% Choose default command line output for create_advanced_report
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes create_advanced_report wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = create_advanced_report_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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
plot_Multi
