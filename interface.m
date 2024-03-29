function varargout = interface(varargin)
% INTERFACE MATLAB code for interface.fig
%      INTERFACE, by itself, creates a new INTERFACE or raises the existing
%      singleton*.
%
%      H = INTERFACE returns the handle to a new INTERFACE or the handle to
%      the existing singleton*.
%
%      INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE.M with the given input arguments.
%
%      INTERFACE('Property','Value',...) creates a new INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface

% Last Modified by GUIDE v2.5 07-Jul-2019 01:55:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_OutputFcn, ...
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


% --- Executes just before interface is made visible.
function interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface (see VARARGIN)

% Choose default command line output for interface
handles.output = hObject;
%Variables
handles.path_to_files = './Imagens/'; 

%Train Variables
handles.currentTrainNN = 'EMPTY';

%Simulation Variables
handles.caminhoImagem = 'Empty'
handles.currentSimulationNN = 'EMPTY';
handles.loadedNN = 'NN';
handles.hasData = 0;
handles.dataSetUsed = 'EMPTY';
handles.SimulationUsed = 'EMPTY';
handles.time = 0;

%NN Training
handles.topology = 'Empty';
handles.actFunc = 'Empty';
handles.trainFunc = 'Empty';
handles.dataSet = 'Empty';
handles.hiddenLayers = 1;
handles.neurons = 10;

%Classificaion Variable
handles.currentImage = 'EMPTY';

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in topology_pop.
function topology_pop_Callback(hObject, eventdata, handles)
% hObject    handle to topology_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns topology_pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from topology_pop
contents = cellstr(get(hObject,'String'));
selected = contents{get(hObject,'Value')};
handles.topology = selected;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function topology_pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to topology_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in activation_pop.
function activation_pop_Callback(hObject, eventdata, handles)
% hObject    handle to activation_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns activation_pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from activation_pop
contents = cellstr(get(hObject,'String'));
selected = contents{get(hObject,'Value')}
handles.actFunc = selected;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function activation_pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to activation_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in training_pop.
function training_pop_Callback(hObject, eventdata, handles)
% hObject    handle to training_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns training_pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from training_pop
contents = cellstr(get(hObject,'String'));
selected = contents{get(hObject,'Value')}
handles.trainFunc = selected;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function training_pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to training_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in dataset_pop.
function dataset_pop_Callback(hObject, eventdata, handles)
% hObject    handle to dataset_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dataset_pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dataset_pop
contents = cellstr(get(hObject,'String'));
selected = contents{get(hObject,'Value')}
handles.dataSet = selected;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function dataset_pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataset_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.mat');
try
   NN = load([path file]);
   NN = NN.NN;
catch exception
   NN = 'EMPTY';
   errordlg('Por favor carregue uma rede neuronal','NN not found');
end

if strcmp(NN, 'EMPTY') ~= 1
    handles.currentClassificationNN = NN;
    guidata(hObject, handles);
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.png');
try
   caminhoImagem = fullfile(path, file);
   disp(caminhoImagem);
catch exception
   caminhoImagem = 'EMPTY';
   errordlg('Por favor carregue uma iamgem','Image not found');
end

if strcmp(caminhoImagem, 'EMPTY') ~= 1
    handles.caminhoImagem = caminhoImagem;
    guidata(hObject, handles);
    imshow(caminhoImagem);
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
result = ClassificaImagem(handles.currentClassificationNN, handles.caminhoImagem);
switch result
    case 1 
        res = 'Estrela';
    case 2 
        res = 'Triangulo';
    case 3 
        res = 'Quadrado';
    case 4
        res = 'Circulo';      
end 
set(findobj('Tag','text18'),'String',res);


% --- Executes on button press in trainingnet_push.
function trainingnet_push_Callback(hObject, eventdata, handles)
% hObject    handle to trainingnet_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%set(handles.figure1, 'pointer', 'watch')
%drawnow;

NNparam.topology = handles.topology;
NNparam.actFunc = handles.actFunc;
NNparam.trainFunc = handles.trainFunc;
NNparam.dataSet = handles.dataSet;
NNparam.hiddenLayers = handles.hiddenLayers;
NNparam.neurons = handles.neurons;
% 
% all_fAtivacao = get(handles.activaition_pop,'String');
% NNparam.fAtivacao = all_fAtivacao(get(handles.activaition_pop,'Value'),:);
% NNparam.fAtivacao = NNparam.fAtivacao{1,1};
%     
% all_fTreino = get(handles.training_pop,'String');
% NNparam.fTreino = all_fTreino(get(handles.training_pop,'Value'),:);
% NNparam.fTreino = NNparam.fTreino{1,1};   
% 
% selectedDataset = get(handles.dataset_pop,'String');
% selectedDataset = selectedDataset(get(handles.dataset_pop,'Value'),:);
% 
% selectedDataset = strcat(handles.path_to_files, selectedDataset);

hiddenLayers = NNparam.hiddenLayers;

neurons = NNparam.neurons;

A(1:1,1:hiddenLayers) = NNparam.neurons;

%Default param
NNparam.neurons = A;
NNparam.trainRatio = 0.7;
NNparam.valRatio = 0.15;
NNparam.testRatio = 0.15;
%NNparam.max_fail = 10;

%- Input and Output Generation
imagens = carregarImagens(NNparam.dataSet)
input = obterMatriz(imagens);
target = obterTargets(imagens);

NeuralNetwork(NNparam, input, target);
%--END Function

% --- Executes on button press in savingnet_push.
function savingnet_push_Callback(hObject, eventdata, handles)
% hObject    handle to savingnet_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function hiddenlayers_slider_Callback(hObject, eventdata, handles)
% hObject    handle to hiddenlayers_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.hiddenLayers = floor(get(hObject,'Value'));
set(findobj('Tag','text14'),'String',handles.hiddenLayers);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function hiddenlayers_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hiddenlayers_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end


% --- Executes on slider movement.
function neuronios_slider_Callback(hObject, eventdata, handles)
% hObject    handle to neuronios_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.neurons = floor(get(hObject,'Value'));
set(findobj('Tag','text16'),'String',handles.neurons);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function neuronios_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to neuronios_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function text18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
