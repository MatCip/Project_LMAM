function varargout = all_analysis_list(varargin)
% ALL_ANALYSIS_LIST MATLAB code for all_analysis_list.fig
%      ALL_ANALYSIS_LIST, by itself, creates a new ALL_ANALYSIS_LIST or raises the existing
%      singleton*.
%
%      H = ALL_ANALYSIS_LIST returns the handle to a new ALL_ANALYSIS_LIST or the handle to
%      the existing singleton*.
%
%      ALL_ANALYSIS_LIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ALL_ANALYSIS_LIST.M with the given input arguments.
%
%      ALL_ANALYSIS_LIST('Property','Value',...) creates a new ALL_ANALYSIS_LIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before all_analysis_list_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to all_analysis_list_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help all_analysis_list

% Last Modified by GUIDE v2.5 09-Dec-2017 18:02:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @all_analysis_list_OpeningFcn, ...
                   'gui_OutputFcn',  @all_analysis_list_OutputFcn, ...
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


% --- Executes just before all_analysis_list is made visible.
function all_analysis_list_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to all_analysis_list (see VARARGIN)
cd('Analysis_database');
list=dir('*.mat')
disp(list)
handles.Analysis_cell={};
for i=1:length(list)
   handles.Analysis_cell{i}=list(i).name;
end
set(handles.listbox2,'String',handles.Analysis_cell)
cd('..');
% Choose default command line output for all_analysis_list
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes all_analysis_list wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = all_analysis_list_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
