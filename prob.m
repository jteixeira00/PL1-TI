function probabilidade = prob(p,val)
    %n represente o numero de ocorrencias de dado valor
    n = sum (sum(p == val));
    
    %size(p,1)*size(p,2) calcula o numero total de elementos da fonte,
    %#linhas * #colunas
    probabilidade = n/(size(p,1)*size(p,2));
     
end 