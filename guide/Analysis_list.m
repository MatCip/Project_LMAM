function varargout = Analysis_list(varargin)
% ANALYSIS_LIST MATLAB code for Analysis_list.fig
%      ANALYSIS_LIST, by itself, creates a new ANALYSIS_LIST or raises the existing
%      singleton*.
%
%      H = ANALYSIS_LIST returns the handle to a new ANALYSIS_LIST or the handle to
%      the existing singleton*.
%
%      ANALYSIS_LIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYSIS_LIST.M with the given input arguments.
%
%      ANALYSIS_LIST('Property','Value',...) creates a new ANALYSIS_LIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Analysis_list_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Analysis_list_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Analysis_list

% Last Modified by GUIDE v2.5 01-Dec-2017 12:27:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Analysis_list_OpeningFcn, ...
                   'gui_OutputFcn',  @Analysis_list_OutputFcn, ...
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


% --- Executes just before Analysis_list is made visible.
function Analysis_list_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Analysis_list (see VARARGIN)

% Choose default command line output for Analysis_list
handles.output = hObject;
handles.output = hObject;
addpath(genpath('../Analysis_database'))
addpath(genpath('../Analysis_database'))
cd('Analysis_database') 
list_file = dir('*.mat');

try
An_IDs=cell(length(list_file));    
handles.analysis_cell=cell(length(list_file));
catch


end

for i=1:length(list_file)
    
    struct=load(list_file(i).name);
    disp(struct)
    An_IDs{i}=struct.this_analysis_ID;
    handles.patient_cell{i}=struct;
end
cd('..');
disp(An_IDs)
if(length(An_IDs)>0)
    
        set(handles.listbox1,'String',An_IDs)
        Name=handles.patient_cell{1}.Name;
        Surname=handles.patient_cell{1}.Surname;
        Date=handles.patient_cell{1}.date;
        Path=handles.patient_cell{1}.path_destination;
        type_analysis=handles.patient_cell{1}.type_of_analysis;
        ID=handles.patient_cell{1}.ID;
        set(handles.text6,'String',ID);
        set(handles.text7,'String',Path);
        set(handles.text8,'String',Name);
        set(handles.text9,'String',Surname);
        set(handles.text12,'String',Date);
        set(handles.text14,'String',type_analysis);
else
    set(handles.listbox1,'String','No Analysis')
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Analysis_list wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Analysis_list_OutputFcn(hObject, eventdata, handles) 
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
index=get(hObject,'Value');
        Name=handles.patient_cell{index}.Name;
        Surname=handles.patient_cell{index}.Surname;
        Date=handles.patient_cell{index}.date;
        Path=handles.patient_cell{index}.path_destination;
        ID=handles.patient_cell{index}.ID;
        set(handles.text6,'String',ID);
        set(handles.text7,'String',Path);
        set(handles.text8,'String',Name);
        set(handles.text9,'String',Surname);
        set(handles.text12,'String',Date);
        type_analysis=handles.patient_cell{index}.type_of_analysis;
        set(handles.text14,'String',type_analysis);
        advancement_analysis=handles.patient_cell{index}.Advance_of_analysis;
        set(handles.text16,'String',advancement_analysis);
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
index=get(handles.listbox1,'Value');
Path=handles.patient_cell{index}.path_destination;
if(strcmp(handles.patient_cell{index}.type_of_analysis,'PA')==1)
classification_results(Path);
end
    

