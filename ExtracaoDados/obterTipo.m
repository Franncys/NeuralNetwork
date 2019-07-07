function [matriz, tipo] = obterTipo(imagens)
    T = numel(imagens);
    for i = 1 : T
        teste = imagens(i).matriz(:);
        matriz(:,i) = teste;
        tipo{:,i} = imagens(i).tipo;
    end
end