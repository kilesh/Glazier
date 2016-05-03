function varargout = reconstruction_final(varargin)
% RECONSTRUCTION_FINAL MATLAB code for reconstruction_final.fig
%      RECONSTRUCTION_FINAL, by itself, creates a new RECONSTRUCTION_FINAL or raises the existing
%      singleton*.
%
%      H = RECONSTRUCTION_FINAL returns the handle to a new RECONSTRUCTION_FINAL or the handle to
%      the existing singleton*.
%
%      RECONSTRUCTION_FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONSTRUCTION_FINAL.M with the given input arguments.
%
%      RECONSTRUCTION_FINAL('Property','Value',...) creates a new RECONSTRUCTION_FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before reconstruction_final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to reconstruction_final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help reconstruction_final

% Last Modified by GUIDE v2.5 06-Apr-2016 00:54:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @reconstruction_final_OpeningFcn, ...
                   'gui_OutputFcn',  @reconstruction_final_OutputFcn, ...
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


% --- Executes just before reconstruction_final is made visible.
function reconstruction_final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to reconstruction_final (see VARARGIN)

% Choose default command line output for reconstruction_final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes reconstruction_final wait for user response (see UIRESUME)
% uiwait(handles.fgWhole);


% --- Outputs from this function are returned to the command line.
function varargout = reconstruction_final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% function edit1_Callback(hObject, eventdata, handles)
% % hObject    handle to edit1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit1 as text
% %        str2double(get(hObject,'String')) returns contents of edit1 as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end






% --- Executes on button press in bnPhotoImport.
function bnPhotoImport_Callback(hObject, eventdata, handles)
% hObject    handle to bnPhotoImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% txt='the image you going to reconstruct is:  ';
% val=get(handles.etPhotoName,'String');
% msg=[txt val];
% h=msgbox(msg);
% set(h, 'position', [500 500 500 100]);
% ah = get( h, 'CurrentAxes' );
% ch = get( ah, 'Children' );
% set(ch, 'FontSize', 20);

Pfpathname='';

[Pfilename Ppathname] = uigetfile({'*.png';'*.jpg'},'File Selector');
if isnumeric(Pfilename)&&isnumeric(Ppathname)
    Pfilename='';
    Ppathname='';
else
try
Pfpathname = strcat(Ppathname,Pfilename);
    
axes(handles.axes1);
dsimg=imread(Pfpathname);
imshow(dsimg);
handles.dsimg=dsimg;
guidata(hObject, handles);
set(handles.axes1,'visible','on');
axis off;
set(handles.textPhotoName,'String',Pfilename);
set(handles.textPhotoPath,'String',Pfpathname);

catch
end    
end




% --- Executes on button press in bnImport.
function bnImport_Callback(hObject, eventdata, handles)
% hObject    handle to bnImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% txt='the lookup table you going to improt is:  ';
% val=get(handles.etLookupName,'String');
% msg=[txt val];
% h=msgbox(msg);
% set(h, 'position', [500 500 500 100]);
% ah = get( h, 'CurrentAxes' );
% ch = get( ah, 'Children' );
% set(ch, 'FontSize', 20);


lookup='';
fpathname='';

[filename pathname] = uigetfile({'*.mat'},'File Selector');
if isnumeric(filename)&&isnumeric(pathname)
    filename='';
    pathname='';
    
end
try
fpathname = strcat(pathname,filename);
load(fpathname);
catch
end

fpathname = strcat(pathname,filename);
set(handles.stextTablePath,'String',fpathname);
set(handles.tableLookUp,'Data',lookup);
handles.lookup=lookup;
guidata(hObject, handles);

function bnReconstruct_CreateFcn(hObject, eventdata, handles)


% --- Executes on button press in bnReconstruct.
function bnReconstruct_Callback(hObject, eventdata, handles)
% hObject    handle to bnReconstruct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lookup='';
log='';
dsimg='';
nheight='';
name=get(handles.etOutName,'String');
try    
lookup=handles.lookup;
dsimg=handles.dsimg;
catch
end
if isequal(lookup,'')
    log=strcat(log ,'lookup table not found or not imported');
    set(handles.stLog,'String',log);
elseif isequal(dsimg,'')
    log=strcat(log ,'img not found or not imported');
    set(handles.stLog,'String',log);
else
    
    
    contents = get(handles.popRecoverMethod,'String'); 
    popupmenu4value = contents{get(handles.popRecoverMethod,'Value')};
    popupmenu4value
    switch(popupmenu4value)
        case 'LiH'
         new_recover;
         log=strcat(log ,'LiH use and done');
         set(handles.stLog,'String',log);
        case 'Rotation LiH'
         rotation_recover;
         log=strcat(log ,'Rotation LiH use and done');
         set(handles.stLog,'String',log);
        case 'VLiH'
         VLiH_recover;
         log=strcat(log ,'VLiH use and done');
         set(handles.stLog,'String',log);
        case 'Rotation VLiH'
         Rot_VLiH_recover;
         log=strcat(log ,'Rotation VLiH use and done');
         set(handles.stLog,'String',log);
        otherwise
         new_recover;
         log=strcat(log ,'default Rotation LiH use and done');
         set(handles.stLog,'String',log);
    end
end


function etSpecificPattern_Callback(hObject, eventdata, handles)
% hObject    handle to etSpecificPattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etSpecificPattern as text
%        str2double(get(hObject,'String')) returns contents of etSpecificPattern as a double


% --- Executes during object creation, after setting all properties.
function etSpecificPattern_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etSpecificPattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bnCheck.
function bnCheck_Callback(hObject, eventdata, handles)
% hObject    handle to bnCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ptnno=str2double(get(handles.etSpecificPattern,'String'));
log='';
lookup='';
try
lookup=handles.lookup;
catch
end

    
if (ptnno<0)||(ptnno>65535)
    log=strcat(log, 'Input number is not in range');
    set(handles.stLog,'String',log);
elseif isequal(lookup,'')
    log=strcat(log ,'lookup table not found or not imported');
    set(handles.stLog,'String',log);
else
    pixelno=lookup(ptnno+1,2);
    set(handles.stPixelNo,'String',pixelno);
    timesno=lookup(ptnno+1,3);
    set(handles.stTimesNo,'String',timesno);
end



function etOutName_Callback(hObject, eventdata, handles)
% hObject    handle to etOutName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etOutName as text
%        str2double(get(hObject,'String')) returns contents of etOutName as a double


% --- Executes during object creation, after setting all properties.
function etOutName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etOutName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bnPSNR.
function bnPSNR_Callback(hObject, eventdata, handles)
% hObject    handle to bnPSNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

log='';
rdsimg='';
reimg8='';
peaksnr='';
try
rdsimg=handles.rdsimg;
reimg8=handles.reimg8;
catch
end
if isequal(rdsimg,'')
    log=strcat(log ,'reference image not found or not imported');
    set(handles.stLog,'String',log);
elseif isequal(reimg8,'')
    log=strcat(log ,'photo is not reonstructed');
    set(handles.stLog,'String',log);
else
    %[rheight, rwidth]=size(rdsimg);
    [reheight,rewidth]=size(reimg8);
    crdsimg=imcrop(rdsimg,[4,4,rewidth-1,reheight-1]);
    [crheight,crwidth]=size(crdsimg);
    if crheight==reheight&&crwidth==rewidth
        reimg8=uint8(reimg8);
        crdsimg=uint8(crdsimg);
        peaksnr = psnr(reimg8,crdsimg);
        set(handles.stPSNR,'String',num2str(peaksnr));
        
    else
        log=strcat(log ,'two photo dimension are not match');
        set(handles.stLog,'String',log);
    end
    
end



function etRefName_Callback(hObject, eventdata, handles)
% hObject    handle to etRefName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etRefName as text
%        str2double(get(hObject,'String')) returns contents of etRefName as a double


% --- Executes during object creation, after setting all properties.
function etRefName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etRefName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bnRefPhoto.
function bnRefPhoto_Callback(hObject, eventdata, handles)
% hObject    handle to bnRefPhoto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RPfpathname='';
log='';
[RPfilename RPpathname] = uigetfile({'*.png';'*.jpg'},'File Selector');
if isnumeric(RPfilename)&&isnumeric(RPpathname)
    RPfilename='';
    RPpathname='';
else
try
RPfpathname = strcat(RPpathname,RPfilename);
    

rdsimg=imread(RPfpathname);
handles.rdsimg=rdsimg;
guidata(hObject, handles);
log=strcat(log ,'Reference image imported');
    set(handles.stLog,'String',log);
catch
end  

end




% --- Executes on selection change in popRecoverMethod.
function popRecoverMethod_Callback(hObject, eventdata, handles)
% hObject    handle to popRecoverMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popRecoverMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popRecoverMethod


% --- Executes during object creation, after setting all properties.
function popRecoverMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popRecoverMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
