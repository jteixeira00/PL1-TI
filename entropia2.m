function [entr, taxa_c] = entropia2(fonte,alfabeto)

    %unique remove as repeti�oes e da sort
    %o reshape transforma tudo numa linha
    % ' cria a transposta da matriz
    new_fonte = unique(reshape(fonte',1,[]));
    
    %entropia inicializada a 0
    entr = 0;
    
    %N�mero de argumentos igual a 1, n�o calcula a taxa de compress�o
    if (nargin==1)
        taxa_c=0;
    end
    
    
    %ciclo acumulador para calcular a entropia
    for k = 1:length(new_fonte)
        prob_k = prob(fonte, new_fonte(k));
        entr_aux = -prob_k * log2(prob_k);
        entr = entr + entr_aux;
    end
    
    %N�mero de argumentos igual a 2, calcula a taxa de compress�o
    if (nargin==2)
        taxa_c = ((log2(alfabeto)- entr)/log2(alfabeto))*100;
    
    end

end