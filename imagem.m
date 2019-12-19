function [image] = imagem(nome)

    %Analisa a imagem
    image = imread(nome);
    
    %Indica o Bit Depth(nº de bits da imagem), para calcular o alfabeto
    bits = imfinfo(nome).BitDepth;
    
    %O alfabeto vai de 0 a (2^nº de bits - 1) porque começa em 0
    alfa = (0:(2^bits)-1);
   
    %Cria o histograma da imagem
    histog(image,alfa,nome);
     
    
    disp("Ex 3")
    
    %Cálculo da entropia. Ao contrário do texto e do áudio utlizamos 
    %histcounts no cálculo da entropiana para uma melhor optimização
    [entropia_i, taxa_c] = entropia(image, length(alfa), alfa);
    
    disp("Entropia:")
    disp(entropia_i)
    
    disp("Taxa de Compressão:");
    %taxa de compressao para verificar se é possivel comprimir sem
    %destruiçao
    disp(taxa_c)
    
    disp("Ex 4:")
    disp("Entropia com códigos de Huffman");
    %Calculo da frequência de ocorrência para cada símbolo. Tal como a
    %entropia, criamos duas funções, freqOcurr2 para o áudio e o texto e
    %freqOcurr para a imagem, utilizando histcounts para uma melhor optimização 
    prob = freqOcurr(alfa, image);
    
    %Utilização da função Hufflen que  determina o número de bits do código 
    %Huffman necessários à codificação de um conjunto de símbolos com uma dada 
    %frequência de ocorrência 
    Huffman_len = hufflen(prob);
    
    %Cálculo da entropia utilizando os códigos de Huffman
    entropiaH = Huffman_entropia(Huffman_len, prob);
    
    disp(entropiaH)
    disp("Variância: ");
    disp(var(Huffman_len, prob));
    
    
    disp("Exercicio 5: ")
    nome_agru = nome+" com agrupamento";
    
    %Agrupamento, onde cada simbolo é uma sequência de dois símbolos contíguos
    agru = agrupamento(image);
    
    %Alfabeto dos simbolos agrupados
    alfa_agru = unique(agru);
    
    %Cálculo da entropia dos agrupados
    [entropia_agrupado, ~ ] = entropia(agru, length(agru), unique(agru));
    
    %Dividimos a entropia por 2 por serem um agrupamento de 2 simbolos
    entropia_agrupado = entropia_agrupado/2;
    
    %Criação do histograma
    histog(agru, alfa_agru,nome_agru); 
    
    disp("Entropia (com agrupamento de simbolos): ");
    disp(entropia_agrupado);    
    
    
    
    
end

