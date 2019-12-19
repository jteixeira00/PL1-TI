function [entropia, taxa_c] = entropia(fonte,alfabeto, alfa1)

    %unique remove as repeti�oes e da sort
    %o reshape transforma tudo numa linha
    % ' cria a transposta da matriz
    
    %entropia inicializada a 0
    entropia = 0;
    
    %N�mero de argumentos igual a 1, n�o calcula a taxa de compress�o
    if (nargin==1)
        taxa_c=0;
    end
    
  %Ao contr�rio do texto e do �udio utlizamos histcounts na imagem para uma
  %melhor optimiza��o
   freq_ocurr =  histcounts(fonte, [alfa1,alfa1(numel(alfa1))]);
   proba = freq_ocurr/sum(freq_ocurr);
   
   for k = 1:1:length(proba)
        entropia_aux = -proba(k)* log2(proba(k));
        entropia_aux(isnan(entropia_aux))=0;
        entropia = entropia + entropia_aux;
   end
   
    
    if (nargin == 3)
        taxa_c = ((log2(alfabeto) - entropia)/ log2(alfabeto)) * 100;
    end
    
end