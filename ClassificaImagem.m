function ClassificaImagem(caminhoNN, caminhoImagem)
    %Eliminar no Fim
    caminhoNet = fullfile(pwd, 'TrainedNN\NN4.mat');
    net = load(caminhoNet);
    net = net.NN;
    maxSize = net.inputs{1}.size;
    %carregarImagem e trata-la
    caminhoImagem = 'D:\Armazenamento\GitHub\NeuralNetwork\Imagens\triangle.jpg';
    j = imread(caminhoImagem);
    if size(j,3) == 3
        j = rgb2gray(j);
    end
    matriz = imresize(j,[200 200]);
    matriz = imbinarize(matriz);
    figure
    imshowpair(j,matriz,'montage');
    input = matriz(:); 
    result = net(input);
    disp(result);
    [a b] = max(result(:,1));
    disp(b);
    switch b
        case 1 
            fprintf('Estrela');  
        case 2 
            fprintf('Triangulo'); 
        case 3 
            fprintf('Quadrado'); 
        case 4
            fprintf('Circulo');      
    end 
end