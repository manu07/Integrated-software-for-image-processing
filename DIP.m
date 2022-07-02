function varargout = DIP(varargin)
% DIP MATLAB code for DIP.fig
%      DIP, by itself, creates a DIP DIP or raises the existing
%      singleton*.
%
%      H = DIP returns the handle to a DIP DIP or the handle to
%      the existing singleton*.
%
%      DIP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIP.M with the given input arguments.
%
%      DIP('Property','Value',...) creates a DIP DIP or raises the
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

% Last Modified by GUIDE v2.5 29-Jun-2022 11:46:48

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


% --- Executes on button press in Upload_image.
function Upload_image_Callback(hObject, eventdata, handles)
% hObject    handle to Upload_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile('.jpeg')
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)

% --- Executes on button press in Grayscale_Image.
function Grayscale_Image_Callback(hObject, eventdata, handles)
% hObject    handle to Grayscale_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=rgb2gray(a);
axes(handles.axes1);
imshow(b);


% --- Executes on button press in Red.
function Red_Callback(hObject, eventdata, handles)
% hObject    handle to Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
[r c d]=size(a);
z=zeros(r,c);
tempr=a;
tempr(:,:,2)=z;
tempr(:,:,3)=z;
imshow(tempr);





% --- Executes on button press in Green.
function Green_Callback(hObject, eventdata, handles)
% hObject    handle to Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
[r c d]=size(a);
z=zeros(r,c);
tempr=a;
tempr(:,:,1)=z;
tempr(:,:,3)=z;
imshow(tempr);


% --- Executes on button press in Blue.
function Blue_Callback(hObject, eventdata, handles)
% hObject    handle to Blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
[r c d]=size(a);
z=zeros(r,c);
tempr=a;
tempr(:,:,1)=z;
tempr(:,:,2)=z;
imshow(tempr);


% --- Executes on button press in Negetive.
function Negetive_Callback(hObject, eventdata, handles)
% hObject    handle to Negetive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=255-a;
imshow(b);


% --- Executes on button press in Binary.
function Binary_Callback(hObject, eventdata, handles)
% hObject    handle to Binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=im2bw(a);
imshow(b);


% --- Executes on button press in Power_Law.
function Power_Law_Callback(hObject, eventdata, handles)
% hObject    handle to Power_Law (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
gamma=1.1;
b=double(a).^gamma;
imshow(b);


% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=rgb2gray(a);
c=im2double(b);
imhist(c);


% --- Executes on button press in Histogram_Equalization.
function Histogram_Equalization_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram_Equalization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=rgb2gray(a);
c=im2double(b);
d=histeq(c);
imshow(d);

% --- Executes on button press in Sharpening.
function Sharpening_Callback(hObject, eventdata, handles)
% hObject    handle to Sharpening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=imsharpen(a);
imshow(b);

% --- Executes on button press in Smoothing.
function Smoothing_Callback(hObject, eventdata, handles)
% hObject    handle to Smoothing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
h=fspecial("gaussian");
c=imfilter(a,h);
imshow(c);


% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=im2bw(a);
c=bwmorph(b,"skel",inf);
imshow(c);

% --- Executes on button press in prewittttt.
function prewittttt_Callback(hObject, eventdata, handles)
% hObject    handle to prewittttt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=im2bw(a);
c=bmorph(b,"remove");
imshow(c);

% --- Executes on button press in Roberts.
function Roberts_Callback(hObject, eventdata, handles)
% hObject    handle to Roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=rgb2gray(a);
c=edge(b,'sobel');
imshow(c);



% --- Executes on button press in Outline.
function Outline_Callback(hObject, eventdata, handles)
% hObject    handle to Outline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=rgb2gray(a);
c=edge(b,'roberts');
imshow(c);


% --- Executes on button press in Prewitt.
function Prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=rgb2gray(a);
d=edge(b,'prewitt');
imshow(d);


% --- Executes on button press in Skeleton.
function Skeleton_Callback(hObject, eventdata, handles)
% hObject    handle to Skeleton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
b=im2bw(a);
c=bwmorph(b,"skel",Inf);
imshow(c);


% --- Executes on button press in Reset_button.
function Reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(a);
