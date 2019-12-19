function audio(nome)
    %Analisa o ficheiro de áudio, dando return apenas do y - Audio data,
    %ignorando o Fs
    [y, ~]= audioread(nome);
    
    %nº de bits por sample, para calcular o alfabeto 
    bits = audioinfo(nome).BitsPerSample;
    
    %O step calcula-se dividindo o intervalo pelo o nº de simbolos do
    %alfabeto obtido a partir do nº de bits (2/256).
    alfa = -1:2/(2^bits):1;
    
    %cria histograma
    histog(y, alfa, nome);    
    
    
    disp("Ex 3:");
    
    %Cálculo da entropia. entropia2 para o texto e áudio, entropia para imagens
    %Na imagem, ao contrário do texto e do áudio utlizamos histcounts no cálculo da entropia
    %para uma melhor optimização
    [entropia_s, taxa_c] = entropia2(y,  length(alfa));
    
    disp("Entropia:");
    disp(entropia_s)
    
    disp("Taxa de Compressão:");
    %Cálculo da taxa de compressão para verificar se é possivel comprimir
    %de forma não destrutiva
    disp(taxa_c)
    
    
    disp("Ex 4:");
    disp("Entropia (com códigos de Huffman):");
    
    %Calculo da frequência de ocorrência para cada símbolo. Tal como a
    %entropia, criamos duas funções, freqOcurr2 para o áudio e o texto e
    %freqOcurr para a imagem, utilizando histcounts para uma melhor optimização 
    prob=freqOcurr2(alfa, y);
    
    %Utilização da função Hufflen que  determina o número de bits do código 
    %Huffman necessários à codificação de um conjunto de símbolos com uma dada 
    %frequência de ocorrência 
    Huffman_len = hufflen(prob);
    
    %Cálculo da entropia utilizando os códigos de Huffman
    entropia_H = Huffman_entropia(Huffman_len, prob);   
    
    disp(entropia_H)
    
    disp("Variância: ");
    disp(var(Huffman_len, prob));
    

    
    disp("Exercicio 5: ")
    
    %Agrupamento, onde cada simbolo é uma sequência de dois símbolos contíguos
    agru = agrupamento(y);    
    
    %Criação do histograma
    histog(agru, unique(agru), nome + " com agrupamento");
    
    %Cálculo da entropia dos agrupados
    [entropia_agrupado, taxa_c_agrupado] = entropia2(agru, length(unique(agru)));
    
    
    disp("Entropia (com agrupamento de simbolos): ");
    disp(entropia_agrupado/2);   
    
    disp("Taxa de Compressão (com agrupamento de simbolos): ");
    disp(taxa_c_agrupado);  
    
    
    
    
end
