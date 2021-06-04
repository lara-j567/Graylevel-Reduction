function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 23-Oct-2020 18:40:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
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

[filename,pathname]=uigetfile({'*.jpg';'*.jpeg';'*.gif,';'*.png';'*.bmp'},'Select file');
global image
image=imread([pathname,filename]);

image=rgb2gray(image);
axes(handles.axes1);
imshow(image);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[m,n] = size (image);

reduced_image1=zeros(m,n);
reduced_image1=im2uint8(reduced_image1);

r1= m/512;
c1= n/512;

array=zeros(2*2,1);

c1=1
r1=1
b=1

r2=1
c2=1


 for i=1:(512*512)
    
    %main image loop
    for j=r1:1024
        
        %row controlling main image
        for k=c1:1024
            
            array(b)= image(j,k);
            b=b+1;
            if(mod(k ,2)==0 )
                
            
              break;
            end
            
        end
        
        if(mod(j,2)== 0)
            b=1;
            r1=j+1;
            
            break;
            
        end
    end    
    
    [avg]=mean(array);
    
    %resultant row image loop
    for l=r2:1024
    
          %resultant col image loop
        for m=c2:1024
            
           reduced_image1(l,m)=avg;
            if(mod(m,2)==0 )
                
            
              break;
            end 
            
        end
        
        if(mod(l,2)== 0)
            r2=l+1;
            
            break;
            
        end
    end  
    
    if(j==1024)
        
        r1=1;
        c1=c1+2;
        r2=1;
        c2=c2+2;
    end
    
 end

axes(handles.axes2)
imshow(reduced_image1)












% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[m,n] = size (image);

reduced_image2=zeros(m,n);
reduced_image2=im2uint8(reduced_image2);

r1= m/256;
c1= n/256;

array=zeros(4*4,1);

c1=1
r1=1
b=1

r2=1
c2=1


 for i=1:(256*256)
    
    %main image loop
    for j=r1:1024
        
        %row controlling main image
        for k=c1:1024
            
            array(b)= image(j,k);
            b=b+1;
            if(mod(k ,4)==0 )
                
            
              break;
            end
            
        end
        
        if(mod(j,4)== 0)
            b=1;
            r1=j+1;
            
            break;
            
        end
    end    
    
    [avg]=mean(array);
    
    %resultant row image loop
    for l=r2:1024
    
          %resultant col image loop
        for m=c2:1024
            
           reduced_image1(l,m)=avg;
            if(mod(m,4)==0 )
                
            
              break;
            end 
            
        end
        
        if(mod(l,4)== 0)
            r2=l+1;
            
            break;
            
        end
    end  
    
    if(j==1024)
        
        r1=1;
        c1=c1+4;
        r2=1;
        c2=c2+4;
    end
    
 end

axes(handles.axes3)
imshow(reduced_image2)





% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


[m,n] = size (image);

reduced_image3=zeros(m,n);
reduced_image3=im2uint8(reduced_image3);

r1= m/128;
c1= n/128;

array=zeros(8*8,1);

c1=1
r1=1
b=1

r2=1
c2=1


 for i=1:(128*128)
    
    %main image loop
    for j=r1:1024
        
        %row controlling main image
        for k=c1:1024
            
            array(b)= image(j,k);
            b=b+1;
            if(mod(k ,8)==0 )
                
            
              break;
            end
            
        end
        
        if(mod(j,8)== 0)
            b=1;
            r1=j+1;
            
            break;
            
        end
    end    
    
    [avg]=mean(array);
    
    %resultant row image loop
    for l=r2:1024
    
          %resultant col image loop
        for m=c2:1024
            
           reduced_image1(l,m)=avg;
            if(mod(m,8)==0 )
                
            
              break;
            end 
            
        end
        
        if(mod(l,8)== 0)
            r2=l+1;
            
            break;
            
        end
    end  
    
    if(j==1024)
        
        r1=1;
        c1=c1+8;
        r2=1;
        c2=c2+8;
    end
    
 end

axes(handles.axes4)
imshow(reduced_image3)




% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


r1=1
c1=1
r4=1
c4=1
b=1
array2=zeros(r4*c4,1)
reduced_image4=zeros(m,n);

reduced_image4=im2uint8(reduced_image4);
for i=1:(512*512)
    
    %main image loop
    for j=r1:1024
        
        %row controlling
        for k=c1:1024
            
            array2(b)= image(j,k)
            b=b+1
            if(mod(k ,2)==0 )
                
            
              break;
            end
            
        end
        
        if(mod(j,2)== 0)
            b=1
            r1=j+1
            
            break;
            
        end
    end    
    
    [med]=median(array2);
    
    %resultant row image loop
    for l=r4:1024
    
          %resultant col image loop
        for m=c4:1024
            
           reduced_image2(l,m)=med;
            if(mod(m,2)==0 )
                
            
              break;
            end 
            
        end
        
        if(mod(l,2)== 0)
            r4=l+1
            
            break;
            
        end
    end  
    
    if(j==1024)
        
        r1=1
        c1=c1+2
        r3=1
        c3=c3+2
    end
    
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


r1=1
c1=1
r5=1
c5=1
b=1
array2=zeros(r5*c5,1)
reduced_image4=zeros(m,n);

reduced_image5=im2uint8(reduced_image5);
for i=1:(256*256)
    
    %main image loop
    for j=r1:1024
        
        %row controlling
        for k=c1:1024
            
            array2(b)= image(j,k)
            b=b+1;
            if(mod(k ,4)==0 )
                
            
              break;
            end
            
        end
        
        if(mod(j,4)== 0)
            b=1
            r1=j+1
            
            break;
            
        end
    end    
    
    [med]=median(array2);
    
    %resultant row image loop
    for l=r5:1024
    
          %resultant col image loop
        for m=c5:1024
            
           reduced_image5(l,m)=med;
            if(mod(m,4)==0 )
                
            
              break;
            end 
            
        end
        
        if(mod(l,4)== 0)
            r5=l+1
            
            break;
            
        end
    end  
    
    if(j==1024)
        
        r1=1
        c1=c1+4
        r3=1
        c3=c3+4
    end
    
end



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


r1=1
c1=1
r6=1
c6=1
b=1
array2=zeros(r6*c6,1)
reduced_image6=zeros(m,n);

reduced_image6=im2uint8(reduced_image6);
for i=1:(128*128)
    
    %main image loop
    for j=r1:1024
        
        %row controlling
        for k=c1:1024
            
            array2(b)= image(j,k)
            b=b+1
            if(mod(k ,8)==0 )
                
            
              break;
            end
            
        end
        
        if(mod(j,8)== 0)
            b=1
            r1=j+1
            
            break;
            
        end
    end    
    
    [med]=median(array2);
    
    %resultant row image loop
    for l=r6:1024
    
          %resultant col image loop
        for m=c6:1024
            
           reduced_image6(l,m)=med;
            if(mod(m,8)==0 )
                
            
              break;
            end 
            
        end
        
        if(mod(l,8)== 0)
            r6=l+1
            
            break;
            
        end
    end  
    
    if(j==1024)
        
        r1=1
        c1=c1+8
        r3=1
        c3=c3+8
    end
    
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


a=1024/4
b=1024/4
reduced_image3=zeros(a,b);
reduced_image3=im2uint8(reduced_image3);
r1=1;
c1=1;
ri=1;
ci=1;

for i=1:256*256
    
    for j=r1:1024
        
        %row controlling
        for k=c1:1024
            
             if(mod(k ,2)==0 )
                
            
              break;
            
            a= img2(j,k)
           
           
            end
            
        end
        
        if(mod(j,2)== 0)
            
            r1=j+1
            
            break;
            
        end
    end  
    
    
    for l=ri:256
       
        for m=ci:256
           
            reduced_image3(l,m)=a;
            ci=ci+1;
            
            if(ci==1024)
               
                ri=ri+1;
                ci=1;
                
            end
            break;
            
        end
    end
    
end



