function varargout = frequency_domain(varargin)
% FREQUENCY_DOMAIN MATLAB code for frequency_domain.fig
%      FREQUENCY_DOMAIN, by itself, creates a new FREQUENCY_DOMAIN or raises the existing
%      singleton*.
%
%      H = FREQUENCY_DOMAIN returns the handle to a new FREQUENCY_DOMAIN or the handle to
%      the existing singleton*.
%
%      FREQUENCY_DOMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FREQUENCY_DOMAIN.M with the given input arguments.
%
%      FREQUENCY_DOMAIN('Property','Value',...) creates a new FREQUENCY_DOMAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before frequency_domain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to frequency_domain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help frequency_domain

% Last Modified by GUIDE v2.5 13-Jan-2021 16:20:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @frequency_domain_OpeningFcn, ...
                   'gui_OutputFcn',  @frequency_domain_OutputFcn, ...
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


% --- Executes just before frequency_domain is made visible.
function frequency_domain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to frequency_domain (see VARARGIN)

% Choose default command line output for frequency_domain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes frequency_domain wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global image
axes(handles.axes1)
imshow(image)
title('\color{blue}Original image')
[m,n] = size(image);
m = m/2;
n = n/2;
set(handles.edit1,'string',num2str(0.1*min(m,n)))




% --- Outputs from this function are returned to the command line.
function varargout = frequency_domain_OutputFcn(hObject, eventdata, handles) 
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
if p == 1
    set(handles.edit1,'visible','off')
    set(handles.text2,'visible','off')
elseif p == 2
    set(handles.edit1,'visible','on')
    set(handles.text2,'visible','on')
elseif p == 3
    set(handles.edit1,'visible','on')
    set(handles.text2,'visible','on')
elseif p == 4
    set(handles.edit1,'visible','off')
    set(handles.text2,'visible','off')
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
D0 = str2num(get(handles.edit1,'string'));
p = get(handles.popupmenu1,'value');
if p == 3
    p=paddedsize(size(image));
    H=hpfilter('gaussian',p(1),p(2),D0);
    out = im2uint8(abs(dftfilt(image,H,'fltpoint')));
    axes(handles.axes2)
    imshow(out)
    title('\color{blue}Filtered Image')
elseif p == 2
    p=paddedsize(size(image));
    H=lpfilter('gaussian',p(1),p(2),D0);
    out=dftfilt(image,H,'fltpoint');
    axes(handles.axes2)
    imshow(abs(out),[])
    title('\color{blue}Filtered Image')
elseif p == 4
    p=paddedsize(size(image));
    H=mat2gray(hpfilter('laplacian',p(1),p(2),D0));
    out= im2uint8(abs(dftfilt(image,H,'fltpoint')));
    axes(handles.axes2)
    imshow(out,[])
    title('\color{blue}Filtered Image')
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
