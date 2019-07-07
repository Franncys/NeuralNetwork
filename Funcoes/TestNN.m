function [accuracyTotal, nCertas, nErradas, data, Esperado, Obtido] = TestNN(NN, caminhoImagens)
    net = NN;
    imagens = carregarImagens(caminhoImagens);
    
    %Ir buscar os inputs e outputs
    [input, tipoEsperado] = obterTipo(imagens);
    Esperado = string(tipoEsperado(:));
    data(:,1) = Esperado;    
    target = obterTargets(imagens);
       
    result = net(input);
    disp(result);
    %simular/testar rede neuronal
    %out = sim(net, input);
    
    %VISUALIZAR DESEMPENHO
    %------------------------- DEBUG
    %plotconfusion(target, result) % Matriz de confusao
   
    %Calcular e mostrar a percentagem de classificacoes corretas no total dos exemplos
    r=0;
    
    for i=1:size(result,2)               % Para cada classificacao  
      [a b] = max(result(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
      [c d] = max(target(:,i));       %d guarda a linha onde encontrou valor mais alto da saida desejada
      if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
          r = r+1;
      end
      switch b
        case 1 
            data(i,2) = "star";
            Obtido{i} = 'star';
        case 2 
            data(i,2) = "triangle";
            Obtido{i} = 'triangle';
        case 3 
            data(i,2) = "square";
            Obtido{i} = 'square';
        case 4
            data(i,2) = "circle";    
            Obtido{i} = 'circle';   
       end 
    end
    Obtido = Obtido(:);
    nCertas = r;
    nErradas = size(result,2) - r;
    accuracyTotal = r/size(result,2)*100;
    %------------------------- DEBUG
    fprintf('Precisao total %f\n', accuracyTotal)
end