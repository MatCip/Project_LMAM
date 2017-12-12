function varargout = select_analysis_for_report(varargin)
% SELECT_ANALYSIS_FOR_REPORT MATLAB code for select_analysis_for_report.fig
%      SELECT_ANALYSIS_FOR_REPORT, by itself, creates a new SELECT_ANALYSIS_FOR_REPORT or raises the existing
%      singleton*.
%
%      H = SELECT_ANALYSIS_FOR_REPORT returns the handle to a new SELECT_ANALYSIS_FOR_REPORT or the handle to
%      the existing singleton*.
%
%      SELECT_ANALYSIS_FOR_REPORT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_ANALYSIS_FOR_REPORT.M with the given input arguments.
%
%      SELECT_ANALYSIS_FOR_REPORT('Property','Value',...) creates a new SELECT_ANALYSIS_FOR_REPORT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_analysis_for_report_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_analysis_for_report_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_analysis_for_report

% Last Modified by GUIDE v2.5 12-Dec-2017 11:13:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @select_analysis_for_report_OpeningFcn, ...
                   'gui_OutputFcn',  @select_analysis_for_report_OutputFcn, ...
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


% --- Executes just before select_analysis_for_report is made visible.
function select_analysis_for_report_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_analysis_for_report (see VARARGIN)
handles.Analysis_IDs=varargin{1};
set(handles.listbox2,'String',handles.Analysis_IDs);
handles.index_selection=1;
handles.is_all_selected=zeros(8,1);
set(handles.text42,'String',handles.index_selection);
% Choose default command line output for select_analysis_for_report
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_analysis_for_report wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = select_analysis_for_report_OutputFcn(hObject, eventdata, handles) 
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
index=get(hObject,'Value');

handles.ID_Anal_select=handles.Analysis_IDs{index};
ID_Anal=handles.ID_Anal_select;

analysis_struct=load(['./Analysis_database/',ID_Anal,'.mat']);

Date=analysis_struct.date;
Name=analysis_struct.Name;
Surname=analysis_struct.Surname;
handles.Type=analysis_struct.type_of_analysis;
other_details=analysis_struct.other_details;
Advance=other_details.Advance_of_analysis;
handles.Path=analysis_struct.path_destination;
set(handles.text12,'String',Name);
set(handles.text13,'String',Surname);
set(handles.text15,'String',Date);
set(handles.text17,'String',handles.Type);
set(handles.text19,'String',Advance);

guidata(hObject, handles);


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

index=get(handles.listbox2,'Value');
handles.ID_Anal_select=handles.Analysis_IDs{index};
ID_Anal=handles.ID_Anal_select;
disp(handles.index_selection)
disp(get(handles.text17,'String'))

switch handles.index_selection
    case 1
        if(strcmp(get(handles.text17,'String'),'PA')==1)
        set(handles.text2,'String',ID_Anal); 
        handles.is_all_selected(handles.index_selection)=1;
        handles.index_selection=handles.index_selection+1;
 
        end
     case 2
         if(strcmp(get(handles.text17,'String'),'Gait')==1)
        set(handles.text20,'String',ID_Anal);
        handles.is_all_selected(handles.index_selection)=1;
        handles.index_selection=handles.index_selection+1; 
         end
     case 3
         if(strcmp(get(handles.text17,'String'),'PA')==1)
        set(handles.text3,'String',ID_Anal);
        handles.is_all_selected(handles.index_selection)=1;
        handles.index_selection=handles.index_selection+1;
         end
        
     case 4
         if(strcmp(get(handles.text17,'String'),'Gait')==1)
        set(handles.text21,'String',ID_Anal);
        handles.is_all_selected(handles.index_selection)=1;
        handles.index_selection=handles.index_selection+1;
         end
         
        
     case 5
         if(strcmp(get(handles.text17,'String'),'PA')==1)
        set(handles.text4,'String',ID_Anal);
        handles.is_all_selected(handles.index_selection)=1;
        handles.index_selection=handles.index_selection+1;
         end
        
      case 6
          if(strcmp(get(handles.text17,'String'),'Gait')==1)
        set(handles.text22,'String',ID_Anal);
        handles.is_all_selected(handles.index_selection)=1;
        handles.index_selection=handles.index_selection+1;
          end
       case 7
        if(strcmp(get(handles.text17,'String'),'PA')==1)
        set(handles.text5,'String',ID_Anal);
        handles.is_all_selected(handles.index_selection)=1;
        handles.index_selection=handles.index_selection+1;
        end
        
       case 8
        if(strcmp(get(handles.text17,'String'),'Gait')==1)
        set(handles.text23,'String',ID_Anal);
        handles.is_all_selected(handles.index_selection)=1;
        handles.index_selection=handles.index_selection+1;
        end
          
        
        
end
set(handles.text42,'String',handles.index_selection);
guidata(hObject, handles);
