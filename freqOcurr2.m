function probA = freqOcurr2(alfabeto, fonte)
  
    tam = length(alfabeto);
    %Cria um array com zeros com o tamanho do alfabeto
    probA = zeros(tam);
    
     for i = 1:1:tam
        %somatórios iteram a source e comparam com os símbolos do alfabeto
        probA(i)=sum(sum(fonte == alfabeto(i)));
     end
     
     
    probtotal=sum(probA);
    probA = probA/probtotal;
end
