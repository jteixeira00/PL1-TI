function audio(nome)
    %Analisa o ficheiro de �udio, dando return apenas do y - Audio data,
    %ignorando o Fs
    [y, ~]= audioread(nome);
    
    %n� de bits por sample, para calcular o alfabeto 
    bits = audioinfo(nome).BitsPerSample;
    
    %O step calcula-se dividindo o intervalo pelo o n� de simbolos do
    %alfabeto obtido a partir do n� de bits (2/256).
    alfa = -1:2/(2^bits):1;
    
    %cria histograma
    histog(y, alfa, nome);    
    
    
    disp("Ex 3:");
    
    %C�lculo da entropia. entropia2 para o texto e �udio, entropia para imagens
    %Na imagem, ao contr�rio do texto e do �udio utlizamos histcounts no c�lculo da entropia
    %para uma melhor optimiza��o
    [entropia_s, taxa_c] = entropia2(y,  length(alfa));
    
    disp("Entropia:");
    disp(entropia_s)
    
    disp("Taxa de Compress�o:");
    %C�lculo da taxa de compress�o para verificar se � possivel comprimir
    %de forma n�o destrutiva
    disp(taxa_c)
    
    
    disp("Ex 4:");
    disp("Entropia (com c�digos de Huffman):");
    
    %Calculo da frequ�ncia de ocorr�ncia para cada s�mbolo. Tal como a
    %entropia, criamos duas fun��es, freqOcurr2 para o �udio e o texto e
    %freqOcurr para a imagem, utilizando histcounts para uma melhor optimiza��o 
    prob=freqOcurr2(alfa, y);
    
    %Utiliza��o da fun��o Hufflen que  determina o n�mero de bits do c�digo 
    %Huffman necess�rios � codifica��o de um conjunto de s�mbolos com uma dada 
    %frequ�ncia de ocorr�ncia 
    Huffman_len = hufflen(prob);
    
    %C�lculo da entropia utilizando os c�digos de Huffman
    entropia_H = Huffman_entropia(Huffman_len, prob);   
    
    disp(entropia_H)
    
    disp("Vari�ncia: ");
    disp(var(Huffman_len, prob));
    

    
    disp("Exercicio 5: ")
    
    %Agrupamento, onde cada simbolo � uma sequ�ncia de dois s�mbolos cont�guos
    agru = agrupamento(y);    
    
    %Cria��o do histograma
    histog(agru, unique(agru), nome + " com agrupamento");
    
    %C�lculo da entropia dos agrupados
    [entropia_agrupado, taxa_c_agrupado] = entropia2(agru, length(unique(agru)));
    
    
    disp("Entropia (com agrupamento de simbolos): ");
    disp(entropia_agrupado/2);   
    
    disp("Taxa de Compress�o (com agrupamento de simbolos): ");
    disp(taxa_c_agrupado);  
    
    
    
    
end
