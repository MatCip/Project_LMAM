function varargout = visualiye_list(varargin)
% VISUALIYE_LIST MATLAB code for visualiye_list.fig
%      VISUALIYE_LIST, by itself, creates a new VISUALIYE_LIST or raises the existing
%      singleton*.
%
%      H = VISUALIYE_LIST returns the handle to a new VISUALIYE_LIST or the handle to
%      the existing singleton*.
%
%      VISUALIYE_LIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VISUALIYE_LIST.M with the given input arguments.
%
%      VISUALIYE_LIST('Property','Value',...) creates a new VISUALIYE_LIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before visualiye_list_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to visualiye_list_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help visualiye_list

% Last Modified by GUIDE v2.5 29-Nov-2017 12:06:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @visualiye_list_OpeningFcn, ...
                   'gui_OutputFcn',  @visualiye_list_OutputFcn, ...
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


% --- Executes just before visualiye_list is made visible.
function visualiye_list_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to visualiye_list (see VARARGIN)

% Choose default command line output for visualiye_list
handles.output = hObject;
addpath(genpath('../User_database'))
% patient=load('Patient_3.mat');
% 
% % Update handles structure
% struct2table(patient)
guidata(hObject, handles);

% UIWAIT makes visualiye_list wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = visualiye_list_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
addpath(genpath('../User_database'))
cd('User_database') 
list_file = ls('*.mat');
try     
IDs=cell(size(list_file(:,1)));
catch
IDs={}; 
end
for i=1:size(list_file)
    struct=load(list_file(i,:));
    IDs{i}=struct.ID;
end

set(handles.text10,'String',str)
set(hObject,'String',IDs)
set(hObject,'String',IDs)
set(hObject,'String',IDs)
set(hObject,'String',IDs)
