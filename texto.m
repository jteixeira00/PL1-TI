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
    
    %Criação do histograma (texto não funciona com o histcounts, por isso
    %tivemos de criar uma nova função)
    histog2(txt, alfa, nome);
    
    
    disp("Exercicio 3: ")
    
    %Cálculo da entropia. entropia2 para o texto e áudio, entropia para imagens
    %Na imagem, ao contrário do texto e do áudio utlizamos histcounts no cálculo da entropia
    %para uma melhor optimização
    [entropia_s, taxa_c] = entropia2(txt, length(alfa));
    
    disp("Entropia");
    disp(entropia_s);
    
    %Cálculo da taxa de compressão para verificar se é possivel comprimir
    %de forma não destrutiva
    disp("Taxa de Compressão");
    disp(taxa_c);
    
    
    disp("Ex 4:");
    disp("Entropia (com códigos de Huffman):");
    
    %Calculo da frequência de ocorrência para cada símbolo. Tal como a
    %entropia, criamos duas funções, freqOcurr2 para o áudio e o texto e
    %freqOcurr para a imagem, utilizando histcounts para uma melhor optimização 
    prob = freqOcurr2(alfa, txt);
    
    %Utilização da função Hufflen que  determina o número de bits do código 
    %Huffman necessários à codificação de um conjunto de símbolos com uma dada 
    %frequência de ocorrência  
    Huffman_len = hufflen(prob);
    
    %Cálculo da entropia utilizando os códigos de Huffman
    entropia_H = Huffman_entropia(Huffman_len, prob);
    
    disp(entropia_H);  
    
    
    disp("Variância: ");
    disp(var(Huffman_len, prob));
    
    
    disp("Exercicio 5: ")
    
    nome_agru = nome + " com agrupamento";
    
    %Agrupamento, onde cada simbolo é uma sequência de dois símbolos contíguos
    agru = agrupamento(txt);
    
    %Alfabeto dos simbolos agrupados
    alfa_agru = unique(agru);
    
    %Cálculo da entropia dos agrupados
    [entropia_agrupado, taxa_c_agrupado] = entropia2(agru, length(agru));
    
    %Dividimos a entropia por 2 por serem um agrupamento de 2 simbolos
    entropia_agrupado = entropia_agrupado/2;
    
    %Criação do histograma
    histog2(agru, alfa_agru,nome_agru); 
    
    disp("Entropia (com agrupamento de simbolos): ");
    disp(entropia_agrupado);
    
    disp("Taxa de Compressão (com agrupamento de simbolos): ");
    disp(taxa_c_agrupado);
    
    
end