function varargout = fieldan(varargin)
% FIELDAN MATLAB code for fieldan.fig
%      FIELDAN, by itself, creates a new FIELDAN or raises the existing
%      singleton*.
%
%      H = FIELDAN returns the handle to a new FIELDAN or the handle to
%      the existing singleton*.
%
%      FIELDAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIELDAN.M with the given input arguments.
%
%      FIELDAN('Property','Value',...) creates a new FIELDAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fieldan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fieldan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fieldan

% Last Modified by GUIDE v2.5 05-Jul-2016 10:55:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fieldan_OpeningFcn, ...
                   'gui_OutputFcn',  @fieldan_OutputFcn, ...
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


% --- Executes just before fieldan is made visible.
function fieldan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fieldan (see VARARGIN)

% Choose default command line output for fieldan
handles.output = hObject;


% Create the data to plot.
handles.peaks=peaks(35);

handles.membrane=membrane;
[x,y] = meshgrid(-8:.5:8);
r = sqrt(x.^2+y.^2) + eps;
sinc = sin(r)./r;
handles.sinc = sinc;
% Set the current data value.
% handles.current_data = handles.peaks;
% surf(handles.current_data)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fieldan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fieldan_OutputFcn(hObject, eventdata, handles) 
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
% Display surf plot of the currently selected data.
surf(handles.current_data);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Display mesh plot of the currently selected data.
mesh(handles.current_data);

% --- Executes on button press in PB3.
function PB3_Callback(hObject, eventdata, handles)
% hObject    handle to PB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Display contour plot of the currently selected data.
contour(handles.current_data);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Determine the selected data set.
str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val};
case 'R/(R+G)' % User selects peaks.
handles.current_data = handles.peaks;
case 'G/(R+G)' % User selects membrane.
handles.current_data = handles.membrane;
case 'R/G' % User selects sinc.
handles.current_data = handles.sinc;
end
% Save the handles structure.
guidata(hObject,handles)



% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on button press in OFl.
function OFl_Callback(hObject, eventdata, handles)
% hObject    handle to OFl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex] = uigetfile( {'*.jpg;*.jpeg';'*.bmp';'*.*'}); 
S1 = [PathName FileName];
handles.edit6.String = S1;







function NXe_Callback(hObject, eventdata, handles)
% hObject    handle to NXe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NXe as text
%        str2double(get(hObject,'String')) returns contents of NXe as a double


% --- Executes during object creation, after setting all properties.
function NXe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NXe (see GCBO)
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


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NYe_Callback(hObject, eventdata, handles)
% hObject    handle to NYe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NYe as text
%        str2double(get(hObject,'String')) returns contents of NYe as a double


% --- Executes during object creation, after setting all properties.
function NYe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NYe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NXe1_Callback(hObject, eventdata, handles)
% hObject    handle to NXe1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NXe1 as text
%        str2double(get(hObject,'String')) returns contents of NXe1 as a double


% --- Executes during object creation, after setting all properties.
function NXe1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NXe1 (see GCBO)
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NYe1_Callback(hObject, eventdata, handles)
% hObject    handle to NYe1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NYe1 as text
%        str2double(get(hObject,'String')) returns contents of NYe1 as a double


% --- Executes during object creation, after setting all properties.
function NYe1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NYe1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ar0 = imread(handles.edit6.String);
% handles.ar1 = Ar0;
NX= str2num(handles.NXe.String);
NY= str2num(handles.NYe.String);
nx= str2num(handles.NXe1.String);
ny= str2num(handles.NYe1.String);
StatType = get(handles.popupmenu4,'Value');
%% StatStr = handles.popupmenu4.value;
figure;
% imshow(Ar0);
SplitDisp(Ar0, NX, NY, 2, [15 200 16], [1 1 1], 0);

d1 = size(Ar0, 1);
d2 = size(Ar0, 2);
w1 = zeros(NX+1, NY+1);
StatSer = zeros(1, nx*ny);
Rl = handles.edit2.String;     
% R -> RGB0(1)
% G -> RGB0(2)
% B -> RGB0(3)
Rl = strrep(Rl, 'R', 'COL(1)'); %  replaces all occurrences of oldSubstr within origStr with newSubstr.
Rl = strrep(Rl, 'G', 'COL(2)');
Rl = strrep(Rl, 'B', 'COL(3)');

for i1 = 1:NX
    for i2 = 1:NY
%         X1 = round(d1/NX*(i1-1)+1);
%         X2 = min(round(d1/NX*i1), d1);
%         Y1 = round(d2/NY*(i2-1)+1);
%         Y2 = min(round(d2/NY*i2), d2);
%         RGB00 = RGBProp(Ar2, X1, Y1, X2, Y2);
%         RatioM = RGB00(1)/(RGB00(1)+RGB00(2));
        k=1;
        for j1 = 1:nx
          for j2 = 1:ny
           X01 = round(d1/NX*(i1-1)+1+d1/NX/nx*(j1-1));
           X02 = min(round(d1/NX*(i1-1)+d1/NX/nx*j1), d1);
           Y01 = round(d2/NY*(i2-1)+1+d2/NY/ny*(j2-1));
           Y02 = min(round(d2/NY*(i2-1)+d2/NY/ny*j2), d2);
           COL = RGBProp(Ar0, X01, Y01, X02, Y02);
           StatSer(k) =eval(Rl);
%           StatSer(k) = RGB0(1)/(RGB0(1)+RGB0(2));
           k=k+1;
          end;            
        end;
        if StatType == 1
            w1(i1,i2) = std(StatSer);
        elseif StatType == 2
            w1(i1,i2) = std(StatSer)/mean(StatSer);
        end;
        
    end;
end;

figure; pcolor(w1);


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
