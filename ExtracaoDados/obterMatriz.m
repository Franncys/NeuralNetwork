function matriz = obterMatriz(imagens)
    T = numel(imagens);
    for i = 1 : T
        teste = imagens(i).matriz(:);
        matriz(:,i) = teste;
    end
end