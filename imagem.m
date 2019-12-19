function [image] = imagem(nome)

    %Analisa a imagem
    image = imread(nome);
    
    %Indica o Bit Depth(n� de bits da imagem), para calcular o alfabeto
    bits = imfinfo(nome).BitDepth;
    
    %O alfabeto vai de 0 a (2^n� de bits - 1) porque come�a em 0
    alfa = (0:(2^bits)-1);
   
    %Cria o histograma da imagem
    histog(image,alfa,nome);
     
    
    disp("Ex 3")
    
    %C�lculo da entropia. Ao contr�rio do texto e do �udio utlizamos 
    %histcounts no c�lculo da entropiana para uma melhor optimiza��o
    [entropia_i, taxa_c] = entropia(image, length(alfa), alfa);
    
    disp("Entropia:")
    disp(entropia_i)
    
    disp("Taxa de Compress�o:");
    %taxa de compressao para verificar se � possivel comprimir sem
    %destrui�ao
    disp(taxa_c)
    
    disp("Ex 4:")
    disp("Entropia com c�digos de Huffman");
    %Calculo da frequ�ncia de ocorr�ncia para cada s�mbolo. Tal como a
    %entropia, criamos duas fun��es, freqOcurr2 para o �udio e o texto e
    %freqOcurr para a imagem, utilizando histcounts para uma melhor optimiza��o 
    prob = freqOcurr(alfa, image);
    
    %Utiliza��o da fun��o Hufflen que  determina o n�mero de bits do c�digo 
    %Huffman necess�rios � codifica��o de um conjunto de s�mbolos com uma dada 
    %frequ�ncia de ocorr�ncia 
    Huffman_len = hufflen(prob);
    
    %C�lculo da entropia utilizando os c�digos de Huffman
    entropiaH = Huffman_entropia(Huffman_len, prob);
    
    disp(entropiaH)
    disp("Vari�ncia: ");
    disp(var(Huffman_len, prob));
    
    
    disp("Exercicio 5: ")
    nome_agru = nome+" com agrupamento";
    
    %Agrupamento, onde cada simbolo � uma sequ�ncia de dois s�mbolos cont�guos
    agru = agrupamento(image);
    
    %Alfabeto dos simbolos agrupados
    alfa_agru = unique(agru);
    
    %C�lculo da entropia dos agrupados
    [entropia_agrupado, ~ ] = entropia(agru, length(agru), unique(agru));
    
    %Dividimos a entropia por 2 por serem um agrupamento de 2 simbolos
    entropia_agrupado = entropia_agrupado/2;
    
    %Cria��o do histograma
    histog(agru, alfa_agru,nome_agru); 
    
    disp("Entropia (com agrupamento de simbolos): ");
    disp(entropia_agrupado);    
    
    
    
    
end

