function texto(nome)
    %id do ficheiro
    file = fopen(nome, 'r');
    %ler o ficheiro carater a carater
    txt = fscanf(file, '%c');
    
    %alfabeto
    lower = 'a':'z';
    upper = 'A':'Z';    
    alfa = [lower,upper];
   
    %ASCII code para ser lido no histograma -> double
    alfa = double(alfa);
    txt = double(txt);
    
    %Cria��o do histograma (texto n�o funciona com o histcounts, por isso
    %tivemos de criar uma nova fun��o)
    histog2(txt, alfa, nome);
    
    
    disp("Exercicio 3: ")
    
    %C�lculo da entropia. entropia2 para o texto e �udio, entropia para imagens
    %Na imagem, ao contr�rio do texto e do �udio utlizamos histcounts no c�lculo da entropia
    %para uma melhor optimiza��o
    [entropia_s, taxa_c] = entropia2(txt, length(alfa));
    
    disp("Entropia");
    disp(entropia_s);
    
    %C�lculo da taxa de compress�o para verificar se � possivel comprimir
    %de forma n�o destrutiva
    disp("Taxa de Compress�o");
    disp(taxa_c);
    
    
    disp("Ex 4:");
    disp("Entropia (com c�digos de Huffman):");
    
    %Calculo da frequ�ncia de ocorr�ncia para cada s�mbolo. Tal como a
    %entropia, criamos duas fun��es, freqOcurr2 para o �udio e o texto e
    %freqOcurr para a imagem, utilizando histcounts para uma melhor optimiza��o 
    prob = freqOcurr2(alfa, txt);
    
    %Utiliza��o da fun��o Hufflen que  determina o n�mero de bits do c�digo 
    %Huffman necess�rios � codifica��o de um conjunto de s�mbolos com uma dada 
    %frequ�ncia de ocorr�ncia  
    Huffman_len = hufflen(prob);
    
    %C�lculo da entropia utilizando os c�digos de Huffman
    entropia_H = Huffman_entropia(Huffman_len, prob);
    
    disp(entropia_H);  
    
    
    disp("Vari�ncia: ");
    disp(var(Huffman_len, prob));
    
    
    disp("Exercicio 5: ")
    
    nome_agru = nome + " com agrupamento";
    
    %Agrupamento, onde cada simbolo � uma sequ�ncia de dois s�mbolos cont�guos
    agru = agrupamento(txt);
    
    %Alfabeto dos simbolos agrupados
    alfa_agru = unique(agru);
    
    %C�lculo da entropia dos agrupados
    [entropia_agrupado, taxa_c_agrupado] = entropia2(agru, length(agru));
    
    %Dividimos a entropia por 2 por serem um agrupamento de 2 simbolos
    entropia_agrupado = entropia_agrupado/2;
    
    %Cria��o do histograma
    histog2(agru, alfa_agru,nome_agru); 
    
    disp("Entropia (com agrupamento de simbolos): ");
    disp(entropia_agrupado);
    
    disp("Taxa de Compress�o (com agrupamento de simbolos): ");
    disp(taxa_c_agrupado);
    
    
end