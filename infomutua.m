function matrizInfo = infomutua(target, query, alfa, step)
    %número de linhas da query 
    a =size(query, 1);
    
    %número de colunas da query
    b = size(query, 2);
    
    %tamanho do target
    tam = size(target);
    
    %calcula a altura e a largura que a matrizInfo vai ter
    alt= ceil((tam(2)-(a-step))/step); 
    larg = ceil((tam(1)-(b-step))/step);
    
    %criação do alfabeto
    alfa = unique(alfa);
    
    %Calcula a entropia do query que vai ser comparada ao target
    [entQuery, ~] = entropia(query, length(alfa), alfa);
    
    
    matrizInfo = zeros(alt, larg);
    x = 1;
    for i=a:step:size(target,1)
        y=1;
        for j= b:step:size(target,2)
            %janela a ser comparad com o query
            janela = target(i-a+1:i,j-b+1:j);
            
            %entropia da janela
            entJanela = entropia(janela, length(alfa), alfa);
            conjunto = (double(query))+bitshift(double(janela),8);
            
            %entropia do conjunto
            entAgrup = entropia(conjunto,length(alfa), unique(conjunto)');
            
            %I(X,Y) = H(X) + H(Y) - H(X,Y)
            matrizInfo(x,y)=entQuery + entJanela - entAgrup;
            y=y+1;
        end
        x=x+1;
    end
end