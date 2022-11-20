function varargout = DIP(varargin)
% DIP MATLAB code for DIP.fig
%      DIP, by itself, creates a new DIP or raises the existing
%      singleton*.
%
%      H = DIP returns the handle to a new DIP or the handle to
%      the existing singleton*.
%
%      DIP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIP.M with the given input arguments.
%
%      DIP('Property','Value',...) creates a new DIP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIP

% Last Modified by GUIDE v2.5 17-Feb-2021 03:05:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIP_OpeningFcn, ...
                   'gui_OutputFcn',  @DIP_OutputFcn, ...
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


% --- Executes just before DIP is made visible.
function DIP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIP (see VARARGIN)

% Choose default command line output for DIP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
handles.output = hObject;
warning ('off')
logo=imread('1.jpg');
tarh=imread('2.jpg');
axes(handles.axes2)
imshow(logo)
axes(handles.axes1)
imshow(tarh)
% UIWAIT makes DIP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIP_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Open_Image_Callback(hObject, eventdata, handles)
% hObject    handle to Open_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Gallery_Callback(hObject, eventdata, handles)
% hObject    handle to Gallery (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName PathName] = uigetfile('*.*');
global image
image = imread([PathName,FileName]);
figure
imshow(image)

% --------------------------------------------------------------------
function MATLAB_Image_Callback(hObject, eventdata, handles)
% hObject    handle to MATLAB_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
MATLAB_Image(image);


% --------------------------------------------------------------------
function Linear_Transformation_Callback(hObject, eventdata, handles)
% hObject    handle to Linear_Transformation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function DFT_Callback(hObject, eventdata, handles)
% hObject    handle to DFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
DFT(image)

% --------------------------------------------------------------------
function DCT_Callback(hObject, eventdata, handles)
% hObject    handle to DCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
DCTT(image)

% --------------------------------------------------------------------
function DST_Callback(hObject, eventdata, handles)
% hObject    handle to DST (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
DSTT(image)

% --------------------------------------------------------------------
function WHT_Callback(hObject, eventdata, handles)
% hObject    handle to WHT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
WHT(image)

% --------------------------------------------------------------------
function HT_Callback(hObject, eventdata, handles)
% hObject    handle to HT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
HT(image)

% --------------------------------------------------------------------
function Hart_Callback(hObject, eventdata, handles)
% hObject    handle to Hart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
Hart(image)


% --------------------------------------------------------------------
function About_us_Callback(hObject, eventdata, handles)
% hObject    handle to About_us (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
About

% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all
clc
close all;


% --------------------------------------------------------------------
function Filtering_Callback(hObject, eventdata, handles)
% hObject    handle to Filtering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Spatial_Domain_Callback(hObject, eventdata, handles)
% hObject    handle to Spatial_Domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
spatial_domain(image)

% --------------------------------------------------------------------
function Frequency_Domain_Callback(hObject, eventdata, handles)
% hObject    handle to Frequency_Domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
frequency_domain(image)


% --------------------------------------------------------------------
function Morphology_Callback(hObject, eventdata, handles)
% hObject    handle to Morphology (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
Morphological_operations(image)


% --------------------------------------------------------------------
function Edge_Detection_Callback(hObject, eventdata, handles)
% hObject    handle to Edge_Detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
edge_detection(image)


% --------------------------------------------------------------------
function Clustering_Callback(hObject, eventdata, handles)
% hObject    handle to Clustering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function K_means_Callback(hObject, eventdata, handles)
% hObject    handle to K_means (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
kmean(image)
% --------------------------------------------------------------------
function SLIC_Callback(hObject, eventdata, handles)
% hObject    handle to SLIC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
superpixel(image)


% --------------------------------------------------------------------
function Feature_Extraction_Callback(hObject, eventdata, handles)
% hObject    handle to Feature_Extraction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SIFT_Callback(hObject, eventdata, handles)
% hObject    handle to SIFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
sift(image)


% --------------------------------------------------------------------
function Image_Compression_Callback(hObject, eventdata, handles)
% hObject    handle to Image_Compression (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function BMP_Callback(hObject, eventdata, handles)
% hObject    handle to BMP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
bmp(image)

% --------------------------------------------------------------------
function JPEG_Callback(hObject, eventdata, handles)
% hObject    handle to JPEG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
jpeg(image)


% --------------------------------------------------------------------
function JPEG_RGB_Callback(hObject, eventdata, handles)
% hObject    handle to JPEG_RGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
jpeg11(image)
