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
%      existing singleton*. Starting from the left, property value pairs are
%      applied to the GUI before interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface

% Last Modified by GUIDE v2.5 07-Jul-2019 22:55:10

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
handles.dataTable = 'Empty';

%NN Training
handles.topology = 'FeedForwardNet';
handles.actFunc = 'logsig';
handles.trainFunc = 'trainosss';
handles.dataSet = 'Formas_1';
handles.hiddenLayers = 1;
handles.neurons = 10;
handles.epochs = 500;
handles.divide = 'Nao';
handles.trainedNN = 'Empty';
handles.testNN = 'Empty';
handles.testDataSet = 'Empty';

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
handles.topology = contents{get(hObject,'Value')};
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
        res = 'Star';
    case 2 
        res = 'Triangle';
    case 3 
        res = 'Square';
    case 4
        res = 'Circle';      
end 
set(findobj('Tag','text18'),'String',res);


% --- Executes on button press in trainingnet_push.
function trainingnet_push_Callback(hObject, eventdata, handles)
% hObject    handle to trainingnet_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set NNparam Variables
NNparam.topology = handles.topology;
NNparam.actFunc = handles.actFunc;
NNparam.trainFunc = handles.trainFunc;
NNparam.dataSet = handles.dataSet;
NNparam.hiddenLayers = handles.hiddenLayers;
NNparam.neurons = handles.neurons;
NNparam.epochs = handles.epochs;
NNparam.divide = handles.divide;
 
hiddenLayers = NNparam.hiddenLayers;

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
%input = retirarExtremos(imagens);
target = obterTargets(imagens);

%Train
[net, tr, accuracyTotal, accuracyTeste, target, out] = NeuralNetwork(NNparam, input, target, handles);

plotconfusion(target, out);
%Save Trained NN
handles.trainedNN = net;

%Update GUI
set(findobj('Tag','text12'),'String',accuracyTotal);
set(findobj('Tag','text11'),'String',accuracyTeste);
guidata(hObject, handles); %Update Handles

%--END Function

% --- Executes on button press in savingnet_push.
function savingnet_push_Callback(hObject, eventdata, handles)
% hObject    handle to savingnet_push (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[file,path] = uiputfile('*.mat');
% old_dir = pwd;
% saveLocationNN = fullfile(path, file);
% cd (path);
% save(file,'handles.trainedNN');
old_dir = pwd;
saveLocationNN = fullfile(old_dir, 'TrainedNN\');
cd (saveLocationNN);
nr_files=dir(['*.mat']);
nr_files=size(nr_files,1);
nr_files=num2str(nr_files);
name = {['NN', nr_files]};
name = name{1,1};
NN = handles.trainedNN;
save(name,'NN');
cd (old_dir);



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


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
contents = cellstr(get(hObject,'String'));
handles.divide = contents{get(hObject,'Value')};
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.epochs = str2num(get(hObject,'String'));
guidata(hObject, handles);

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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
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
    handles.testNN = NN;
    guidata(hObject, handles);
end

% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6
contents = cellstr(get(hObject,'String'));
handles.testDataSet = contents{get(hObject,'Value')};
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[precisao nCertas nErradas data Esperado Obtido] = TestNN(handles.testNN, handles.testDataSet);
t = handles.uitable2;
CheckTable1 = get(t,'Data');
CheckTable1 = data;
set(findobj('Tag','text24'),'String',nCertas);
set(findobj('Tag','text26'),'String',nErradas);
set(findobj('Tag','text28'),'String',precisao);
count = length(Esperado);
for i = 1 : count 
    newData{i,1} = Esperado{i};
    newData{i,2} = Obtido{i};
%     if(strcmp(Esperado{i}, Obtido{i}) == 1)
%         set(handles.uitable2,'BackgroundColor',[0 1 0]);
%     else
%         set(handles.uitable2,'BackgroundColor',[1 0 0]);
%     end
    set(handles.uitable2,'Data',newData);
end
handles.dataTable = handles.uitable2;
guidata(hObject, handles);





% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uiputfile('*.xls');
data = get(handles.uitable2,'Data');
ColumnName=get(handles.uitable2,'ColumnName');
CombData=[ColumnName';data];
xlswrite([path file], CombData);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.testNN, precisao, target, out ]= TrainNN(handles.testNN, handles.testDataSet);
set(findobj('Tag','text28'),'String',precisao);
plotconfusion(target, out);
guidata(hObject, handles);


