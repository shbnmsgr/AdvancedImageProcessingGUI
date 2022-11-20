function varargout = edge_detection(varargin)
% EDGE_DETECTION MATLAB code for edge_detection.fig
%      EDGE_DETECTION, by itself, creates a new EDGE_DETECTION or raises the existing
%      singleton*.
%
%      H = EDGE_DETECTION returns the handle to a new EDGE_DETECTION or the handle to
%      the existing singleton*.
%
%      EDGE_DETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDGE_DETECTION.M with the given input arguments.
%
%      EDGE_DETECTION('Property','Value',...) creates a new EDGE_DETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before edge_detection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to edge_detection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help edge_detection

% Last Modified by GUIDE v2.5 14-Jan-2021 01:14:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @edge_detection_OpeningFcn, ...
    'gui_OutputFcn',  @edge_detection_OutputFcn, ...
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


% --- Executes just before edge_detection is made visible.
function edge_detection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to edge_detection (see VARARGIN)

% Choose default command line output for edge_detection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes edge_detection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = edge_detection_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
p = get(handles.popupmenu1,'value');
if p==1
    set(handles.edit1,'visible','off')
    set(handles.edit2,'visible','off')
    set(handles.edit3,'visible','off')
    set(handles.text2,'visible','off')
    set(handles.text3,'visible','off')
    set(handles.text4,'visible','off')
    set(handles.text5,'visible','off')
    set(handles.text6,'visible','off')
    set(handles.edit5,'visible','off')
    set(handles.pushbutton2,'visible','off')
    
elseif p==2
    set(handles.edit1,'visible','on')
    set(handles.edit2,'visible','on')
    set(handles.edit3,'visible','off')
    set(handles.text2,'visible','on')
    set(handles.text3,'visible','on')
    set(handles.text4,'visible','off')
    set(handles.text5,'visible','off')
    set(handles.text6,'visible','on')
    set(handles.edit5,'visible','on')
    set(handles.pushbutton2,'visible','on')
    set(handles.text6,'enable','off')
    set(handles.edit5,'enable','off')
    set(handles.pushbutton2,'enable','off')
elseif p==3
    set(handles.edit1,'visible','on')
    set(handles.edit2,'visible','on')
    set(handles.edit3,'visible','on')
    set(handles.text2,'visible','on')
    set(handles.text3,'visible','on')
    set(handles.text4,'visible','on')
    set(handles.text5,'visible','on')
    set(handles.text6,'visible','off')
    set(handles.edit5,'visible','off')
    set(handles.pushbutton2,'visible','off')
elseif p==4
    set(handles.edit1,'visible','off')
    set(handles.edit2,'visible','off')
    set(handles.edit3,'visible','off')
    set(handles.text2,'visible','off')
    set(handles.text3,'visible','off')
    set(handles.text4,'visible','off')
    set(handles.text5,'visible','off')
    set(handles.text6,'visible','off')
    set(handles.edit5,'visible','off')
    set(handles.pushbutton2,'visible','off')
end

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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image out
p = get(handles.popupmenu1,'value');
sz = str2num(get(handles.edit1,'string'));
s = str2num(get(handles.edit2,'string'));
s2 = str2num(get(handles.edit3,'string'));
if p==1
    
elseif p==2
    
    kernel = fspecial('log',sz,s);
    out = imfilter(mat2gray(image),kernel);
    set(handles.pushbutton2,'enable','on')
elseif p==3
    g1 = fspecial('gaussian',sz,s);
    g2 = fspecial('gaussian',sz,s2);
    kernel = g2 - g1;
    out = imfilter(image,kernel);
elseif p==4
    out = Canny(image);
end
axes(handles.axes1)
imshow(image)
axes(handles.axes3)
imshow(abs(out),[])


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global out

set(handles.text6,'enable','on')
set(handles.edit5,'enable','on')
trsh = str2num(get(handles.edit5,'string'));
if trsh == 0
    trsh = [];
end
[out2,tr] = edge(out,'zerocross',trsh);
if ~isempty(trsh)
    set(handles.edit5,'string',num2str(trsh));
else
    set(handles.edit5,'string',num2str(tr));
end
axes(handles.axes1)
imshow(out)
axes(handles.axes3)
imshow(out2)


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
