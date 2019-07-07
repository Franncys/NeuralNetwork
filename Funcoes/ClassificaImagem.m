function b = ClassificaImagem(NN, caminhoImagem)    
    %Carregar Imagem a partir do caminho dado
    j = imread(caminhoImagem);
    if size(j,3) == 3
        j = rgb2gray(j);
    end
    
    %Tratamento da Imagem
    matriz = imresize(j,[200 200]);
    matriz = imbinarize(matriz);

    input = matriz(:); 
    result = NN(input);
    [a b] = max(result(:,1));
end