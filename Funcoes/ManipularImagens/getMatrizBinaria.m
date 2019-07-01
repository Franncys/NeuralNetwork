function matriz = getMatrizBinaria(caminhoFoto, escala)
    j = imread(caminhoFoto); % le a foto
    matriz = imresize(j, escala) % resize para metade do tamanho
    matriz = imbinarize(matriz); % converte para binário
end