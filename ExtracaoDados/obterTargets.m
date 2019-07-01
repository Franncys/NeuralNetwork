function target = obterTarget(imagens)
    T = numel(imagens);
    for i = 1 : T
        if strcmp(imagens(i).tipo,'circle')
                tipo = [0,0,0,1];
            elseif strcmp(imagens(i).tipo, 'square')
                tipo = [0,0,1,0];
            elseif strcmp(imagens(i).tipo, 'triangle')   
                tipo = [0,0,1,1];
            else
                tipo = [0,1,0,0];
            end
        target(:,i) = tipo;
    end
end