function varargout = bmp(varargin)
% BMP MATLAB code for bmp.fig
%      BMP, by itself, creates a new BMP or raises the existing
%      singleton*.
%
%      H = BMP returns the handle to a new BMP or the handle to
%      the existing singleton*.
%
%      BMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BMP.M with the given input arguments.
%
%      BMP('Property','Value',...) creates a new BMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bmp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bmp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bmp

% Last Modified by GUIDE v2.5 16-Feb-2021 21:50:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bmp_OpeningFcn, ...
                   'gui_OutputFcn',  @bmp_OutputFcn, ...
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


% --- Executes just before bmp is made visible.
function bmp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bmp (see VARARGIN)

% Choose default command line output for bmp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bmp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bmp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

global image
%----------------------%
%-------- Main --------%
%----------------------%
[filename, pathname] = uigetfile({'*.png;*.bmp;*.jpg'}, 'Pick an image', 'Multiselect', 'off');
if  isequal(filename, 0)
    warndlg('Ups');
else
    global fullPath
    fullPath = [pathname filename];
    header(fullPath);
    image = imread(fullPath);
    axes(handles.axes1)
    imshow(image)
    title('Original Image')
    
end
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fullPath
    compress(imread(fullPath));
    axes(handles.axes2)
    imshow('Pic.bmp');
    title('Compressed Image')
