function varargout = func_visualizer_gait_1(varargin)
% FUNC_VISUALIZER_GAIT_1 MATLAB code for func_visualizer_gait_1.fig
%      FUNC_VISUALIZER_GAIT_1 by itself, creates a new FUNC_VISUALIZER_GAIT_1 or raises the
%      existing singleton*.
%
%      H = FUNC_VISUALIZER_GAIT_1 returns the handle to a new FUNC_VISUALIZER_GAIT_1 or the handle to
%      the existing singleton*.
%
%      FUNC_VISUALIZER_GAIT_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FUNC_VISUALIZER_GAIT_1.M with the given input arguments.
%
%      FUNC_VISUALIZER_GAIT_1('Property','Value',...) creates a new FUNC_VISUALIZER_GAIT_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before func_visualizer_gait_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to func_visualizer_gait_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help func_visualizer_gait_1

% Last Modified by GUIDE v2.5 19-Nov-2017 11:56:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @func_visualizer_gait_1_OpeningFcn, ...
                   'gui_OutputFcn',  @func_visualizer_gait_1_OutputFcn, ...
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

% --- Executes just before func_visualizer_gait_1 is made visible.
function func_visualizer_gait_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to func_visualizer_gait_1 (see VARARGIN)

% Choose default command line output for func_visualizer_gait_1
handles.output = 'Yes';
input=varargin{1};

handles.list_of_parts=input{1};


handles.config_all=input{2};
my_struct=load('function_interaction/func_list_gait');
string_struct={};
nfield = fieldnames(my_struct);
i=1;


for j1 = 1:numel(nfield)  % for each function in function list
  cont=0;
  sub_struct=my_struct.(nfield{j1});

  parts_cell=sub_struct{2};
  
  size_1=size(handles.list_of_parts);
 
 
  size_2=size(parts_cell);
 
  memory_part=cell(7,1);
  index_memory_part=1;

  for i_1=1:size_1(2)
       found=0;
      if(is_necessary(handles.list_of_parts{i_1},memory_part)==true)
       
      
       for i_2=1:size_2(2)
          
           if(iscell(parts_cell{i_2})==0)
           if(strcmp(handles.list_of_parts{i_1},parts_cell{i_2})==1)
               
               cont=cont+1;
                     
           end
       
           else
            
               sub_parts=parts_cell{i_2};
               
               size_3=size(parts_cell{i_2});
          
                  for i_3=1:size_3(2)
                      
                     if(strcmp(handles.list_of_parts{i_1},sub_parts{i_3})==1)
                         
                         cont=cont+1;
                         found=1;
                     end 
                     if(found==1)
                         memory_part{index_memory_part}=sub_parts{i_3};
                         index_memory_part=index_memory_part+1;
                     end
                      
                  end
           end
       end
     end
  end
  
  if(cont>=size_2(2))
         
         string_struct{i}=sub_struct{1};
         i=i+1;
 
  end
  
end
if (i==1)
    set(handles.popupmenu1,'String',{'No function available'});
else
    
set(handles.popupmenu1,'String',string_struct)
end
% Update handles structure
guidata(hObject, handles);

% Insert custom Title and Text if specified by the user
% Hint: when choosing keywords, be sure they are not easily confused 
% with existing figure properties.  See the output of set(figure) for
% a list of figure properties.
if(nargin > 3)
    for index = 1:2:(nargin-3),
        if nargin-3==index, break, end
        switch lower(varargin{index})
         case 'title'
          set(hObject, 'Name', varargin{index+1});
         case 'string'
          set(handles.text1, 'String', varargin{index+1});
        end
    end
end

% Determine the position of the dialog - centered on the callback figure
% if available, else, centered on the screen
FigPos=get(0,'DefaultFigurePosition');
OldUnits = get(hObject, 'Units');
set(hObject, 'Units', 'pixels');
OldPos = get(hObject,'Position');
FigWidth = OldPos(3);
FigHeight = OldPos(4);
if isempty(gcbf)
    ScreenUnits=get(0,'Units');
    set(0,'Units','pixels');
    ScreenSize=get(0,'ScreenSize');
    set(0,'Units',ScreenUnits);

    FigPos(1)=1/2*(ScreenSize(3)-FigWidth);
    FigPos(2)=2/3*(ScreenSize(4)-FigHeight);
else
    GCBFOldUnits = get(gcbf,'Units');
    set(gcbf,'Units','pixels');
    GCBFPos = get(gcbf,'Position');
    set(gcbf,'Units',GCBFOldUnits);
    FigPos(1:2) = [(GCBFPos(1) + GCBFPos(3) / 2) - FigWidth / 2, ...
                   (GCBFPos(2) + GCBFPos(4) / 2) - FigHeight / 2];
end
FigPos(3:4)=[FigWidth FigHeight];
set(hObject, 'Position', FigPos);
set(hObject, 'Units', OldUnits);

% Show a question icon from dialogicons.mat - variables questIconData
% and questIconMap
load dialogicons.mat

IconData=questIconData;
questIconMap(256,:) = get(handles.figure1, 'Color');
IconCMap=questIconMap;


% Make the GUI modal
set(handles.figure1,'WindowStyle','modal')

% UIWAIT makes func_visualizer_gait_1 wait for user response (see UIRESUME)
uiwait(handles.figure1);



function boole=is_necessary(part,memory_part)
   size_=size(memory_part);
   boole=true;
   for i=1:size_
       if(strcmp(part,memory_part{i})==1)
           boole=false;
       end
   end
   
   
   
% --- Outputs from this function are returned to the command line.
function varargout = func_visualizer_gait_1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% The figure can be deleted now
delete(handles.figure1);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


handles.output = get(hObject,'String');

 func=get(handles.popupmenu1,'String');
 index=get(handles.popupmenu1,'Value');
 
 
 
        
      if( strcmp('Axis Configuration',func{index})==1)
          close
            load_all(handles.config_all);
      end
       if( strcmp( 'Extracting Gate Parameter',func{index})==1)
           disp(handles.config_all);
          close
           add_analysis_details(handles.config_all,'gait');
       end
% Update handles structure


% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.output = get(hObject,'String');

% Update handles structure
guidata(hObject, handles);

% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.
uiresume(handles.figure1);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


    % The GUI is still in UIWAIT, us UIRESUME
 
    % The GUI is no longer waiting, just close it
    delete(hObject);



% --- Executes on key press over figure1 with no controls selected.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Check for "enter" or "escape"
if isequal(get(hObject,'CurrentKey'),'escape')
    % User said no by hitting escape
    handles.output = 'No';
    
    % Update handles structure
    guidata(hObject, handles);
    
    uiresume(handles.figure1);
end    
    
if isequal(get(hObject,'CurrentKey'),'return')
    uiresume(handles.figure1);
end    


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
