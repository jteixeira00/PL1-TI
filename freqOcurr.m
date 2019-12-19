function probA = freqOcurr(alfabeto, fonte) %Calculo da frequência da ocurrência
%de cada simbolo empregando o uso da função histcounts, para uma melhor optimização. 

    probA = histcounts(fonte, [alfabeto,alfabeto(numel(alfabeto))]);
    
    probtotal=sum(probA);
   
    probA = probA/probtotal;
end
