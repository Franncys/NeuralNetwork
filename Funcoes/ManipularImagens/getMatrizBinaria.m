function matriz = getMatrizBinaria(caminhoFoto)
    j = imread(caminhoFoto); % le a foto
    %matriz = imresize(j, escala) % resize para metade do tamanho
    matriz = imsharpen(j);
    matriz = imbinarize(matriz); % converte para binário
end