function varargout = analysis_per_user(varargin)
% ANALYSIS_PER_USER MATLAB code for analysis_per_user.fig
%      ANALYSIS_PER_USER, by itself, creates a new ANALYSIS_PER_USER or raises the existing
%      singleton*.
%
%      H = ANALYSIS_PER_USER returns the handle to a new ANALYSIS_PER_USER or the handle to
%      the existing singleton*.
%
%      ANALYSIS_PER_USER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYSIS_PER_USER.M with the given input arguments.
%
%      ANALYSIS_PER_USER('Property','Value',...) creates a new ANALYSIS_PER_USER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analysis_per_user_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to analysis_per_user_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help analysis_per_user

% Last Modified by GUIDE v2.5 02-Dec-2017 20:24:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analysis_per_user_OpeningFcn, ...
                   'gui_OutputFcn',  @analysis_per_user_OutputFcn, ...
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


% --- Executes just before analysis_per_user is made visible.
function analysis_per_user_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to analysis_per_user (see VARARGIN)

% Choose default command line output for analysis_per_user
handles.output = hObject;
handles.user_struct=varargin{1};
handles.Analysis_cell=handles.user_struct.Analysis;
dim_cell=size(handles.Analysis_cell);
set(handles.text17,'String',handles.user_struct.ID);
if(dim_cell(1)>=1)
    disp(dim_cell(1));
for i=1:dim_cell(1)
    handles.Analysis_paths{i}=handles.Analysis_cell{i,2};
    handles.Analysis_IDs{i}=handles.Analysis_cell{i,1};

end
disp(handles.Analysis_IDs)
set(handles.listbox1,'String',handles.Analysis_IDs)
else
    set(handles.listbox1,'String','No analysis for this user')
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes analysis_per_user wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = analysis_per_user_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

string=get(hObject,'String');
if(strcmp(string,'No analysis for this user'))
    return
end

index=get(hObject,'Value');

handles.ID_Anal_select=handles.Analysis_cell{index,1};
ID_Anal=handles.ID_Anal_select;
analysis_struct=load(['./Analysis_database/',ID_Anal,'.mat']);

ID_patient=analysis_struct.ID;
Date=analysis_struct.date;
Name=analysis_struct.Name;
Surname=analysis_struct.Surname;
Type=analysis_struct.type_of_analysis;
Advance=analysis_struct.Advance_of_analysis;
Path=analysis_struct.path_destination;
set(handles.text8,'String',Name);
set(handles.text9,'String',Surname);
set(handles.text11,'String',Date);
set(handles.text7,'String',Path);
set(handles.text6,'String',ID_patient);
set(handles.text13,'String',Type);
set(handles.text15,'String',Advance);

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
