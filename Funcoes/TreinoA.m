function TreinoA()
addpath(genpath('./Funcoes'));
addpath(genpath('./Imagens'));

caminho = '\Imagens\Formas_1';
%Extrair Dados
imagens = carregarImagens(caminho);
%Gerar input e target
%input = retirarExtremos(imagens);
%testar outros inputs por exemplo sacar os pontos externos e comparar os
%resultados
input = obterMatriz(imagens);
target = obterTargets(imagens);
%target = targetNomeImagens(imagens);
%disp(imagens.matriz);
%Topologia pode ser 'feedfowardnet', 'patternnet', 'cascadeforwardnet', 'fitnet'
topologia = 'feedfowardnet'
NeuralNetwork(topologia,input, target);
end