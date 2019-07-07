function [precisao] = TestNN(caminhoNet, input, target)
    %Eliminar no Fim
    caminhoNet = fullfile(pwd, 'TrainedNN\NN4.mat');
    net = load(caminhoNet);
    net = net.NN;
    caminho = 'Imagens/Formas_2';
    imagens = carregarImagens(caminho);
    
    %Ir buscar os inputs e outputs
    input = obterMatriz(imagens);
    target = obterTargets(imagens);
    
    result = net(input);
    disp(result);
    %simular/testar rede neuronal
    %out = sim(net, input);
    
    %VISUALIZAR DESEMPENHO
    %------------------------- DEBUG
    plotconfusion(target, result) % Matriz de confusao
   
    %Calcular e mostrar a percentagem de classificacoes corretas no total dos exemplos
    r=0;
    
    for i=1:size(result,2)               % Para cada classificacao  
      [a b] = max(result(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
      [c d] = max(target(:,i));       %d guarda a linha onde encontrou valor mais alto da saida desejada
      if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
          r = r+1;
      end
    end

    accuracyTotal = r/size(result,2)*100;
    %------------------------- DEBUG
    fprintf('Precisao total %f\n', accuracyTotal)
end