function varargout = mod11(varargin)
%MOD1 MATLAB code file for mod1.fig
%      MOD1, by itself, creates a new MOD1 or raises the existing
%      singleton*.
%
%      H = MOD1 returns the handle to a new MOD1 or the handle to
%      the existing singleton*.
%
%      MOD1('Property','Value',...) creates a new MOD1 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to mod1_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MOD1('CALLBACK') and MOD1('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MOD1.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mod1

% Last Modified by GUIDE v2.5 09-Mar-2018 00:50:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mod1_OpeningFcn, ...
                   'gui_OutputFcn',  @mod1_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before mod1 is made visible.
function mod1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for mod1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mod1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mod1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse_btn.
function browse_btn_Callback(hObject, eventdata, handles)
% hObject    handle to browse_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
[name_file1,name_path1] = uigetfile( ...
{'*.bmp;*.jpg;','Files of type (*.bmp,*.jpg)';
'*.*','All Files (*.*)'},...
'Open Image');
    if ~isequal(name_file1,0)
        data = imread(fullfile(name_path1,name_file1));
        guidata(hObject,handles);
        axes(handles.ib1);
        imshow(data);
    else
        return;
    end

% --- Executes on button press in copy_btn.
function copy_btn_Callback(hObject, eventdata, handles)
% hObject    handle to copy_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;

tic; %Waktu dimulai
r = data(:,:,1);
g = data(:,:,2);
b = data(:,:,3);
copy = cat(3, r, g, b);

axes(handles.ib2);
imshow(copy);
toc; %Waktu berakhir
disp(toc)

% --- Executes on button press in exit_btn.
function exit_btn_Callback(hObject, eventdata, handles)
% hObject    handle to exit_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close()

% --- Executes during object creation, after setting all properties.
function buttongroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to buttongroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in buttongroup.
function buttongroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in buttongroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in red_rb.
function red_rb_Callback(hObject, eventdata, handles)
% hObject    handle to red_rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of red_rb
global data;

tic;
r = data(:,:,1);
g = data(:,:,2);
b = data(:,:,3);
red = cat(3, r, g*0, b*0);

axes(handles.ib3);
imshow(red);
toc;
disp(toc)

% --- Executes on button press in green_rb.
function green_rb_Callback(hObject, eventdata, handles)
% hObject    handle to green_rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of green_rb
global data;

tic;
r = data(:,:,1);
g = data(:,:,2);
b = data(:,:,3);
green = cat(3, r*0, g, b*0);

axes(handles.ib3);
imshow(green);
toc;
disp(toc)

% --- Executes on button press in blue_rb.
function blue_rb_Callback(hObject, eventdata, handles)
% hObject    handle to blue_rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of blue_rb
global data;

tic;
r = data(:,:,1);
g = data(:,:,2);
b = data(:,:,3);
blue = cat(3, r*0, g*0, b);

axes(handles.ib3);
imshow(blue);
toc;
disp(toc)

% --- Executes on button press in cyan_rb.
function cyan_rb_Callback(hObject, eventdata, handles)
% hObject    handle to cyan_rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cyan_rb
global data;

tic;
r = data(:,:,1);
g = data(:,:,2);
b = data(:,:,3);
cyan = cat(3, r*0, g, b);

axes(handles.ib3);
imshow(cyan);
toc;
disp(toc)

% --- Executes on button press in magenta_rb.
function magenta_rb_Callback(hObject, eventdata, handles)
% hObject    handle to magenta_rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of magenta_rb
global data;

tic;
r = data(:,:,1);
g = data(:,:,2);
b = data(:,:,3);
magenta = cat(3, r, g*0, b);

axes(handles.ib3);
imshow(magenta);
toc;
disp(toc)

% --- Executes on button press in yellow_rb.
function yellow_rb_Callback(hObject, eventdata, handles)
% hObject    handle to yellow_rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of yellow_rb
global data;

tic;
r = data(:,:,1);
g = data(:,:,2);
b = data(:,:,3);
yellow = cat(3, r, g, b*0);

axes(handles.ib3);
imshow(yellow);
toc;
disp(toc)
