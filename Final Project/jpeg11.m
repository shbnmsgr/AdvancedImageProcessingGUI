function varargout = jpeg11(varargin)
% JPEG11 MATLAB code for jpeg11.fig
%      JPEG11, by itself, creates a new JPEG11 or raises the existing
%      singleton*.
%
%      H = JPEG11 returns the handle to a new JPEG11 or the handle to
%      the existing singleton*.
%
%      JPEG11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JPEG11.M with the given input arguments.
%
%      JPEG11('Property','Value',...) creates a new JPEG11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before jpeg11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to jpeg11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help jpeg11

% Last Modified by GUIDE v2.5 17-Feb-2021 03:11:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @jpeg11_OpeningFcn, ...
                   'gui_OutputFcn',  @jpeg11_OutputFcn, ...
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


% --- Executes just before jpeg11 is made visible.
function jpeg11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to jpeg11 (see VARARGIN)

% Choose default command line output for jpeg11
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global image
image = imread('peppers.png');

axes(handles.axes1)
imshow (image)
title('Original Image')

% UIWAIT makes jpeg11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = jpeg11_OutputFcn(hObject, eventdata, handles) 
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
global image
% I = imread('peppers.png');
I = image;
% imshow(I);

ImageSize = 8*prod(size(I));

Y = I;
A = [.229 .587 .114 ; -.168736 -.331264 .5 ; .5 -.418688 -.081312];
Y(:,:,1) = A(1,1)*I(:,:,1) + A(1,2)*I(:,:,2) + A(1,3)*I(:,:,3);
Y(:,:,2) = A(2,1)*I(:,:,1) + A(2,2)*I(:,:,2) + A(2,3)*I(:,:,3) + 128;
Y(:,:,3) = A(3,1)*I(:,:,1) + A(3,2)*I(:,:,2) + A(3,3)*I(:,:,3) + 128;

% Let's use MATLAB's inbuilt convert (because of the normalizations):
Y = rgb2ycbcr(I);

lb = {'Y', 'Cb', 'Cr'};

for channel = 1:3
%     subplot(1,3,channel)
    Y_C = Y;
    Y_C(:,:,setdiff(1:3,channel)) = intmax(class(Y_C))/2;
%     imshow(ycbcr2rgb(Y_C))
%     title([lb{channel} ' component'],'fontsize',16)
end

% subplot(1,2,1)
% imshow( I )
% title('Original')
% subplot(1,2,2)
Y_d = Y;
Y_d(:,:,2) = 10*round(Y_d(:,:,2)/10);
Y_d(:,:,3) = 10*round(Y_d(:,:,3)/10);
% imshow(ycbcr2rgb(Y_d))
% title('Downsampled image')
% 
% subplot(1,2,1)
% imshow( I )
% title('original')
% subplot(1,2,2)
Y_d = Y;
Y_d(:,:,1) = 10*round(Y_d(:,:,1)/10);
% imshow(ycbcr2rgb(Y_d))
% title('Downsample illuminance')

Y_d = Y;
Y_d(:,:,2) = 2*round(Y_d(:,:,2)/2);
Y_d(:,:,3) = 2*round(Y_d(:,:,3)/2);

% clf
box = Y_d;
II = box(200:207,200:207,1);
Y = chebfun.dct(chebfun.dct(II).').';
% surf(log10(abs(Y))), title('DCT coefficients')
% set(gca,'fontsize',16)


Q = [16 11 10 16 24 40 51 61 ;
     12 12 14 19 26 28 60 55 ;
     14 13 16 24 40 57 69 56 ;
     14 17 22 29 51 87 80 62 ;
     18 22 37 56 68 109 103 77 ;
     24 35 55 64 81 104 113 92 ;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
before = nnz(Y);
Y = Q.*round(Y./Q);
after = nnz(Y);

% before, after



% I = imread('peppers.png');
I = image
Y_d = rgb2ycbcr( I );
% Downsample:
Y_d(:,:,2) = 2*round(Y_d(:,:,2)/2);
Y_d(:,:,3) = 2*round(Y_d(:,:,3)/2);
% DCT compress:
A = zeros(size(Y_d));
B = A;
for channel = 1:3
    for j = 1:8:size(Y_d,1)-7
        for k = 1:8:size(Y_d,2)
            II = Y_d(j:j+7,k:k+7,channel);
            freq = chebfun.dct(chebfun.dct(II).').';
            freq = Q.*round(freq./Q);
            A(j:j+7,k:k+7,channel) = freq;
            B(j:j+7,k:k+7,channel) = chebfun.idct(chebfun.idct(freq).').';
        end
    end
end

% subplot(1,2,1)
% imshow(ycbcr2rgb(Y_d))
% title('Original')
% subplot(1,2,2)
% axes(handles.axes2) 
% imshow(ycbcr2rgb(uint8(B)));
% title('Compressed')
% shg

CompressedImageSize = 8*nnz(A(:,:,1)) + 7*nnz(A(:,:,2)) + 7*nnz(A(:,:,3))
CompressedImageSize/ImageSize


b = A(:);
b = b(:);
b(b==0)=[];  %remove zeros.
b = floor(255*(b-min(b))/(max(b)-min(b)));
symbols = unique(b);
prob = histcounts(b,length(symbols))/length(b);
dict = huffmandict(symbols, prob);
enco = huffmanenco(b, dict);
FinalCompressedImage = length(enco);


length(enco)/ImageSize ;  % x7 compression. 
axes(handles.axes2) 
imshow(ycbcr2rgb(uint8(B)));
title('Compressed Image')
% shg
