function varargout = erro_message_1(varargin)
% ERRO_MESSAGE_1 MATLAB code for erro_message_1.fig
%      ERRO_MESSAGE_1, by itself, creates a new ERRO_MESSAGE_1 or raises the existing
%      singleton*.
%
%      H = ERRO_MESSAGE_1 returns the handle to a new ERRO_MESSAGE_1 or the handle to
%      the existing singleton*.
%
%      ERRO_MESSAGE_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ERRO_MESSAGE_1.M with the given input arguments.
%
%      ERRO_MESSAGE_1('Property','Value',...) creates a new ERRO_MESSAGE_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before erro_message_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to erro_message_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help erro_message_1

% Last Modified by GUIDE v2.5 10-Oct-2017 10:03:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @erro_message_1_OpeningFcn, ...
                   'gui_OutputFcn',  @erro_message_1_OutputFcn, ...
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


% --- Executes just before erro_message_1 is made visible.
function erro_message_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to erro_message_1 (see VARARGIN)

% Choose default command line output for erro_message_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes1);
imshow('Error_Message_Icon.png');
    [e,fs]=audioread('./sounds/erro.mp3');
    soundsc(e,fs);

% UIWAIT makes erro_message_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = erro_message_1_OutputFcn(hObject, eventdata, handles) 
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
gait_analysi_hanlde=gait_analysi;
delete(get(hObject, 'parent'));
