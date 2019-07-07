function [net] = TrainNN(caminhoNN) 
    %Eliminar no Fim
    caminhoNet = fullfile(pwd, 'TrainedNN\NN3.mat');
    net = load(caminhoNet);
    net = net.NN;
    caminho = 'Imagens/Formas_3';
    imagens = carregarImagens(caminho);
    
    %Ir buscar os inputs e outputs
    input = obterMatriz(imagens);
    target = obterTargets(imagens);
    
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
    
    old_dir = pwd;
    saveLocationNN = fullfile(old_dir, 'TrainedNN\');
    cd (saveLocationNN);
    nr_files=dir(['*.mat']);
    nr_files=size(nr_files,1);
    nr_files=num2str(nr_files);
    name = {['NN', nr_files]};
    name = name{1,1};
    NN = net;
    save(name,'NN');
    disp(name);
    cd (old_dir);
end