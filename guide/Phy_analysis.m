function varargout = Phy_analysis(varargin)
% PHY_ANALYSIS MATLAB code for Phy_analysis.fig
%      PHY_ANALYSIS, by itself, creates a new PHY_ANALYSIS or raises the existing
%      singleton*.
%
%      H = PHY_ANALYSIS returns the handle to a new PHY_ANALYSIS or the handle to
%      the existing singleton*.
%
%      PHY_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHY_ANALYSIS.M with the given input arguments.
%
%      PHY_ANALYSIS('Property','Value',...) creates a new PHY_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Phy_analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Phy_analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Phy_analysis

% Last Modified by GUIDE v2.5 18-Oct-2017 18:07:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Phy_analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Phy_analysis_OutputFcn, ...
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


% --- Executes just before Phy_analysis is made visible.
function Phy_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Phy_analysis (see VARARGIN)

% Choose default command line output for Phy_analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes1)
imshow('./pic/body.png');

% for the "back" button 
% [a,map]=imread('./pic/wm-back.png');
% [r,c,d]=size(a); 
% x=ceil(r/30); 
% y=ceil(c/30); 
% g=a(1:x:end,1:y:end,:);
% g(g==255)=5.5*255;
% set(handles.pushbutton1,'CData',g);


% UIWAIT makes Phy_analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Phy_analysis_OutputFcn(hObject, eventdata, handles) 
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
if (get(handles.checkbox8,'Value') == 1)
     % run AnalysePA_FullConfigs
     disp('ciiiiaaaoo');
     delete(get(hObject, 'parent'));
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox1





% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox4.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox4.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 if (get(handles.checkbox1,'Value') == 1)
 [FileName_trunk,PathName_trunk] = uigetfile('*.mat','Select the file .mat corresponding to trunk');
 if(PathName_trunk~=0)
    set(handles.text4,'String','Loaded') ;
 end
 
 
 end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox2,'Value') == 1)
 [FileName_LH,PathName_LH] = uigetfile('*.mat','Select the file .mat corresponding to "Left Harm" ');
 if(PathName_LH~=0)
    set(handles.text5,'String','Loaded') ;
 end
 end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox3,'Value') == 1)
 [FileName_RH,PathName_RH] = uigetfile('*.mat','Select the file .mat corresponding to "Right Harm"');
if(PathName_RH~=0)
    set(handles.text6,'String','Loaded') ;
 end
 end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox4,'Value') == 1)
 [FileName_LT,PathName_LT] = uigetfile('*.mat','Select the file .mat corresponding to "Left Thigh"');
 if(PathName_LT~=0)
    set(handles.text7,'String','Loaded') ;
 end
 end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox5,'Value') == 1)
 [FileName_RT,PathName_RT] = uigetfile('*.mat','Select the file .mat corresponding to "Right Thigh"');
if(PathName_RT~=0)
    set(handles.text7,'String','Loaded') ;
end
end

 



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (get(handles.checkbox6,'Value') == 1)
 [FileName_LS,PathName_LS] = uigetfile('*.mat','Select the file .mat corresponding to "Left Shank"');
if(PathName_LS~=0)
    set(handles.text7,'String','Loaded') ;
end
end
 


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox7,'Value') == 1)
 [FileName_RS,PathName_RS] = uigetfile('*.mat','Select the file .mat corresponding to "Right Shank"');
if(PathName_RS~=0)
    set(handles.text7,'String','Loaded') ;
end 

end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.checkbox8,'Value') == 1)
    full_config_hanlde=full_config;
end



