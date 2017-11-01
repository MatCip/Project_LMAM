function varargout = error_message(varargin)
% ERROR_MESSAGE MATLAB code for error_message.fig
%      ERROR_MESSAGE, by itself, creates a new ERROR_MESSAGE or raises the existing
%      singleton*.
%
%      H = ERROR_MESSAGE returns the handle to a new ERROR_MESSAGE or the handle to
%      the existing singleton*.
%
%      ERROR_MESSAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ERROR_MESSAGE.M with the given input arguments.
%
%      ERROR_MESSAGE('Property','Value',...) creates a new ERROR_MESSAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before error_message_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to error_message_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help error_message

% Last Modified by GUIDE v2.5 10-Oct-2017 11:19:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @error_message_OpeningFcn, ...
                   'gui_OutputFcn',  @error_message_OutputFcn, ...
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


% --- Executes just before error_message is made visible.
function error_message_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to error_message (see VARARGIN)

% Choose default command line output for error_message
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes1);
imshow('Error_Message_Icon.png');
    [e,fs]=audioread('./sounds/erro.mp3');
    soundsc(e,fs);
    


% UIWAIT makes error_message wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = error_message_OutputFcn(hObject, eventdata, handles) 
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
% handles    structure with handles and user data (see GUIDATA)+
Phy_analysis_hanlde=Phy_analysis;
delete(get(hObject, 'parent'));
