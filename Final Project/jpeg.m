function varargout = jpeg(varargin)
% JPEG MATLAB code for jpeg.fig
%      JPEG, by itself, creates a new JPEG or raises the existing
%      singleton*.
%
%      H = JPEG returns the handle to a new JPEG or the handle to
%      the existing singleton*.
%
%      JPEG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JPEG.M with the given input arguments.
%
%      JPEG('Property','Value',...) creates a new JPEG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before jpeg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to jpeg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help jpeg

% Last Modified by GUIDE v2.5 17-Feb-2021 00:20:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @jpeg_OpeningFcn, ...
                   'gui_OutputFcn',  @jpeg_OutputFcn, ...
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


% --- Executes just before jpeg is made visible.
function jpeg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to jpeg (see VARARGIN)

% Choose default command line output for jpeg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global image
image = imread('cameraman.tif');
axes(handles.axes1)
imshow(image)
title('Original Image')

% UIWAIT makes jpeg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = jpeg_OutputFcn(hObject, eventdata, handles) 
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



I = imread('cameraman.tif');
I1=I;
[row coln]= size(I);
I= double(I);
%---------------------------------------------------------
% Subtracting each image pixel value by 128 
%--------------------------------------------------------
I = I - (128*ones(256));
% quality = input('What quality of compression you require - ');
a = get(handles.edit1,'value');
quality = a;
%----------------------------------------------------------
% Quality Matrix Formulation
%----------------------------------------------------------
Q50 = [ 16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62; 
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
 
 if quality > 50
     QX = round(Q50.*(ones(8)*((100-quality)/50)));
     QX = uint8(QX);
 elseif quality < 50
     QX = round(Q50.*(ones(8)*(50/quality)));
     QX = uint8(QX);
 elseif quality == 50
     QX = Q50;
 end
 
 
 
 
%----------------------------------------------------------
% Formulation of forward DCT Matrix and inverse DCT matrix
%----------------------------------------------
DCT_matrix8 = dct(eye(8));
iDCT_matrix8 = DCT_matrix8';   %inv(DCT_matrix8);
%----------------------------------------------------------
% Jpeg Compression
%----------------------------------------------------------
dct_restored = zeros(row,coln);
QX = double(QX);
%----------------------------------------------------------
% Jpeg Encoding
%----------------------------------------------------------
%----------------------------------------------------------
% Forward Discret Cosine Transform
%----------------------------------------------------------
for i1=[1:8:row]
    for i2=[1:8:coln]
        zBLOCK=I(i1:i1+7,i2:i2+7);
        win1=DCT_matrix8*zBLOCK*iDCT_matrix8;
        dct_domain(i1:i1+7,i2:i2+7)=win1;
    end
end
%-----------------------------------------------------------
% Quantization of the DCT coefficients
%-----------------------------------------------------------
for i1=[1:8:row]
    for i2=[1:8:coln]
        win1 = dct_domain(i1:i1+7,i2:i2+7);
        win2=round(win1./QX);
        dct_quantized(i1:i1+7,i2:i2+7)=win2;
    end
end
%-----------------------------------------------------------
% Jpeg Decoding 
%-----------------------------------------------------------
% Dequantization of DCT Coefficients
%-----------------------------------------------------------
for i1=[1:8:row]
    for i2=[1:8:coln]
        win2 = dct_quantized(i1:i1+7,i2:i2+7);
        win3 = win2.*QX;
        dct_dequantized(i1:i1+7,i2:i2+7) = win3;
    end
end
%-----------------------------------------------------------
% Inverse DISCRETE COSINE TRANSFORM
%-----------------------------------------------------------
for i1=[1:8:row]
    for i2=[1:8:coln]
        win3 = dct_dequantized(i1:i1+7,i2:i2+7);
        win4=iDCT_matrix8*win3*DCT_matrix8;
        dct_restored(i1:i1+7,i2:i2+7)=win4;
    end
end
I2=dct_restored;
% ---------------------------------------------------------
% Conversion of Image Matrix to Intensity image
%----------------------------------------------------------
K=mat2gray(I2);
%----------------------------------------------------------
%Display of Results
%----------------------------------------------------------
% figure(1);imshow(I1);title('original image');
axes(handles.axes2)
imshow(K);title('Compressed Image');



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
