function probA = freqOcurr(alfabeto, fonte) %Calculo da frequ�ncia da ocurr�ncia
%de cada simbolo empregando o uso da fun��o histcounts, para uma melhor optimiza��o. 

    probA = histcounts(fonte, [alfabeto,alfabeto(numel(alfabeto))]);
    
    probtotal=sum(probA);
   
    probA = probA/probtotal;
end
