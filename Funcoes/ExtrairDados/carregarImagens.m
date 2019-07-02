function imagens = carregarImagens(caminho, escala)

%Caminho gen�rico usado para testes
%caminho = 'D:\Armazenamento\ISEC\2_Ano\Conhecimento e Raciocinio\Trabalho Pr�tico\Enunciado e Ficheiros-20190604\TemaRN_Imagens_\Formas_1';
%Escala gen�rica para as Fotos
%escala = 0.5

%Verificar se o diret�rio existe
if ~isdir(caminho)
    errorMessage = sprintf('ERROR: The Following folder does not exist:\n%s', caminho);
    uiwait(warndlg(errorMessage));
    return;
end 

%Listar o que est� no caminho
S = dir(caminho)

%Limpar primeiros nomes que n�o interessam
S(1:2) = []

%Numero de Pastas
subPastas = sum([S(~ismember({S.name},{'.','..'})).isdir]);

if subPastas == 0
    fotos = dir([caminho '/*.png']); %listar os png que est�o na pasta
    if length(fotos) == 0 
        errorMessage = sprintf('ERRO: N�o Existem fotos nesse caminho:\n%s', caminho);
        uiwait(warndlg(errorMessage));
        return;
    else
        tipo = -1;
        for j = 1 : length(fotos)
            nomeBase = fotos(j).name;
            split = strsplit(nomeBase,'.');
            split = strsplit(split{1,1},'_');
            id = str2num(split{1,1});
            caminhoFoto = fullfile(caminho, nomeBase);
            
            imagens(j).id = id;
            imagens(j).tipo = split{1,2};
            imagens(j).caminho = caminhoFoto;
            imagens(j).matriz = getMatrizBinaria(caminhoFoto, escala)
            
            if strcmp(imagens(j).tipo,'circle')
                tipo = 0;
            elseif strcmp(imagens(j).tipo, 'square')
                tipo = 1;
            elseif strcmp(imagens(j).tipo, 'triangle')   
                tipo = 2;
            else
                tipo = 3;
            end
            
            imagens(j).codTipo = tipo;
        end
    end
else
    im = 1;
    for i = 1 : subPastas   %Percorrer as Pastas
        name = S(i).name;   %obter o nome da pasta
        caminhoPasta = fullfile(caminho, name); %construir caminho at� pasta
        fotos = dir([caminhoPasta '/*.png']);  %listar os png que est�o na pasta
        %Percorrer as fotos que est�o na pasta
        for j = 1 : length(fotos)
            nomeBase = fotos(j).name;
            split = strsplit(nomeBase,'.');
            id = str2num(split{1,1});
            caminhoFoto = fullfile(caminhoPasta, nomeBase);
            
            imagens(im).id = id;
            imagens(im).tipo = name;
            imagens(im).caminho = caminhoFoto;
            imagens(im).matriz = getMatrizBinaria(caminhoFoto, escala)
            
            if strcmp(imagens(j).tipo,'circle')
                tipo = 0;
            elseif strcmp(imagens(j).tipo, 'square')
                tipo = 1;
            elseif strcmp(imagens(j).tipo, 'triangle')   
                tipo = 2;
            else
                tipo = 3;
            end
            
            imagens(im).codTipo = tipo;
            
            im = im + 1;
        end
        
    end
end

end