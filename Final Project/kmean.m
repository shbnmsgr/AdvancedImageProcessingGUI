function varargout = kmean(varargin)
% KMEAN MATLAB code for kmean.fig
%      KMEAN, by itself, creates a new KMEAN or raises the existing
%      singleton*.
%
%      H = KMEAN returns the handle to a new KMEAN or the handle to
%      the existing singleton*.
%
%      KMEAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KMEAN.M with the given input arguments.
%
%      KMEAN('Property','Value',...) creates a new KMEAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kmean_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kmean_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kmean

% Last Modified by GUIDE v2.5 28-Jan-2021 20:57:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kmean_OpeningFcn, ...
                   'gui_OutputFcn',  @kmean_OutputFcn, ...
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


% --- Executes just before kmean is made visible.
function kmean_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kmean (see VARARGIN)

% Choose default command line output for kmean
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global image
image = imread('mainpic.tif');
axes(handles.axes1)
imshowpair(image(:,:,1),image(:,:,2));
title('Image')
% UIWAIT makes kmean wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kmean_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


img = imread('mainpic.tif');
image = zeros(size(img));
for i = 1:size(image,3)
    image(:,:,i) = mat2gray(img(:,:,i));
end
Features_1 = image(:,:,5:10);
K1 = str2num(get(handles.edit1,'string'));

M =zeros(size(Features_1,3),K1);
while true
    % Random Centers
    for z =1:size(Features_1,3)
        M(z,:) = randi([0,65535],1,K1)/65535;
        tM(z,:) = randi([0,65535],1,K1)/65535;
    end
    SSE1 = [];
    dSSE1 = [];
    for i = 1:100
        
        Dist1 = EuclideanDistCompute(Features_1,M);
        
        C1 = Classifier_Kmeans(Features_1,Dist1);
        
        M = MeanComputer(Features_1,C1);
        if sum(sum(isnan(M))) ~= 0
            M(isnan(M)) = tM(isnan(M));
        end
        SSE1(i) = sum(sum(Dist1.^2));
        if i>1
            dSSE1(i-1) = abs(SSE1(i)- SSE1(i-1));
            if dSSE1(i-1)<1e-20
                break
            end
        end
        
    end
    if i<100
        break
    end
end


final1 = ToRGB(C1);

axes(handles.axes3)
imshow(final1)
title(['Clustered Image by Kmeans with k =',num2str(K1) ] )
