function [net, tr, accuracyTotal, accuracyTeste] = NeuralNetwork(topologia, input, target)
    switch topologia
        case 'feedfowardnet' 
            net = feedforwardnet([10]);    
        case 'patternnet' 
            net = patternnet([10]);
        case 'cascadeforwardnet' 
            net = cascadeforwardnet([10]);
        case 'fitnet' 
            net = fitnet([10]);       
    end 
    
    %Funcao de treino
    %Podem Ser:
    %'traingd'  -> (Gradient Descent backpropagation)
    %'traingdx' -> (Gradient descent with momentum and adaptive learning rate backpropagation)
    %'trainlm'  -> (Levenberg-Marquardt backpropagation)
    %'trainrp'  -> ?(Resilient backpropagation)
    %'trainoss' -> ?(One-step secant backpropagation)
    
    net.trainFcn = 'traingd';
    
    %Funcao de ativacao
    %Podem ser:
    %'hardlim'  -> (Degrau) 
    %'hardlims' -> (Sinal) 
    %'logsig'   -> (Sigmoide)
    %'purelin'  -> (Linear) 
    %'tansig'   -> (Tangente Hiperbolica)
    
    net.layers{1}.transferFcn = 'tansig'; %Interna
    net.layers{2}.transferFcn = 'purelin'; %Saida
     
    
    net.trainParam.epochs = 500;        %Numero maximo de ciclos de treino
    net.divideFcn = '';        %Percentagem de exemplos de treino e teste 'divideblock'
%     net.divideParam.trainRatio = 0.7;
%     net.divideParam.valRatio = 0.15;
%     net.divideParam.testRatio = 0.15;

    %treinar rede
    [net, tr] = train(net, input, target);
    
    %------------------------- DEBUG
    view(net); 
    %------------------------- DEBUG
    disp(tr);  
    
    %simular/testar rede neuronal
    out = sim(net, input);
    
    %VISUALIZAR DESEMPENHO
    %------------------------- DEBUG
    plotconfusion(target, out) % Matriz de confusao
    %------------------------- DEBUG
    plotperf(tr)         % Grafico com o desempenho da rede nos 3 conjuntos    
   
    %Calcular e mostrar a percentagem de classificacoes corretas no total dos exemplos
    r=0;
    
    for i=1:size(out,2)               % Para cada classificacao  
      [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
      [c d] = max(target(:,i));       %d guarda a linha onde encontrou valor mais alto da saida desejada
      if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
          r = r+1;
      end
    end

    accuracyTotal = r/size(out,2)*100;
    %------------------------- DEBUG
    fprintf('Precisao total %f\n', accuracyTotal)


    % SIMULAR A REDE APENAS NO CONJUNTO DE TESTE
    TInput = input(:, tr.testInd);
    TTargets = target(:, tr.testInd);

    out = sim(net, TInput);

    %Calcula e mostra a percentagem de classificacoes corretas no conjunto de teste
    r=0;
    for i=1:size(tr.testInd,2)        % Para cada classificacao  
      [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
      [c d] = max(TTargets(:,i));     %d guarda a linha onde encontrou valor mais alto da saida desejada
      if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
          r = r+1;
      end
    end
    accuracyTeste = r/size(tr.testInd,2)*100;
    %------------------------- DEBUG
    fprintf('Precisao teste %f\n', accuracyTeste)
 
end