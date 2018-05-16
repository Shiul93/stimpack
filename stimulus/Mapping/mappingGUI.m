function varargout = mappingGUI(varargin)
% MAPPINGGUI MATLAB code for mappingGUI.fig
%      MAPPINGGUI, by itself, creates a new MAPPINGGUI or raises the existing
%      singleton*.
%
%      H = MAPPINGGUI returns the handle to a new MAPPINGGUI or the handle to
%      the existing singleton*.
%
%      MAPPINGGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAPPINGGUI.M with the given input arguments.
%
%      MAPPINGGUI('Property','Value',...) creates a new MAPPINGGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mappingGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mappingGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mappingGUI

% Last Modified by GUIDE v2.5 16-May-2018 17:59:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mappingGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @mappingGUI_OutputFcn, ...
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


% --- Executes just before mappingGUI is made visible.
function mappingGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mappingGUI (see VARARGIN)

% Choose default command line output for mappingGUI
handles.output = hObject;
if nargin > 3
    handles.stimpack = varargin{1};
    handles.stimulus = MappingStimulus(handles.stimpack);
end



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mappingGUI wait for user response (see UIRESUME)
% uiwait(handles.TaskName);


% --- Outputs from this function are returned to the command line.
function varargout = mappingGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
disp('Run Fixation');

handles.stimulus.runStimulus();

% --- Executes on button press in cancelButton.
function cancelButton_Callback(hObject, eventdata, handles)
disp('Cancel Mapping')
close(mappingGUI);
handles.stimpack.initialiseGUI();



function fixationTimeField_Callback(hObject, eventdata, handles)
disp('fixationTime Callback');
disp(hObject.String)
handles.stimulus.timeFix = str2double(hObject.String)/1000;


% --- Executes during object creation, after setting all properties.
function fixationTimeField_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function abortTimeField_Callback(hObject, eventdata, handles)
disp('abortTime Callback');
disp(hObject.String)

handles.stimulus.waitingFixationTime = str2double(hObject.String)/1000;

% --- Executes during object creation, after setting all properties.
function abortTimeField_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rewardTimeField_Callback(hObject, eventdata, handles)
handles.stimpack.props.rewardTime = str2double(hObject.String);


% --- Executes during object creation, after setting all properties.
function rewardTimeField_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dotSizeField_Callback(hObject, eventdata, handles)
disp('fixationTime Callback');
disp(hObject.String)
handles.stimulus.dotSize = str2double(hObject.String)


% --- Executes during object creation, after setting all properties.
function dotSizeField_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function windowSizeField_Callback(hObject, eventdata, handles)
disp('fixationTime Callback');
disp(hObject.String)
handles.stimulus.fixWinSize = str2double(hObject.String)

% --- Executes during object creation, after setting all properties.
function windowSizeField_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stimulusColorField_Callback(hObject, eventdata, handles)
handles.stimulus.dotColour = str2double(strsplit(hObject.String));



% --- Executes during object creation, after setting all properties.
function stimulusColorField_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bgColorField_Callback(hObject, eventdata, handles)
handles.stimulus.backgroundColour = str2double(strsplit(hObject.String));



% --- Executes during object creation, after setting all properties.
function bgColorField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bgColorField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function interTrialTimeField_Callback(hObject, eventdata, handles)
% hObject    handle to interTrialTimeField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interTrialTimeField as text
%        str2double(get(hObject,'String')) returns contents of interTrialTimeField as a double


% --- Executes during object creation, after setting all properties.
function interTrialTimeField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interTrialTimeField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edfField_Callback(hObject, eventdata, handles)
% hObject    handle to edfField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edfField as text
%        str2double(get(hObject,'String')) returns contents of edfField as a double
handles.stimulus.edfFile = hObject.String


% --- Executes during object creation, after setting all properties.
function edfField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edfField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function trialNumberField_Callback(hObject, eventdata, handles)
handles.stimulus.numTrials = str2double(hObject.String);


% --- Executes during object creation, after setting all properties.
function trialNumberField_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function displayThis()
disp('Displaying this shit')