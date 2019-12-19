function histog2(source,alfa, nome) %Unicamente ultizado no texto
%O �udio e a imagem utilizam o histog2 que emprega a fun��o histcounts para o c�lculo
%da frequ�ncia de cada s�mbolo

   %cria array com zeros
   freq = zeros(1,length(alfa));
      
    for k=1:1:length(alfa)        
    %somat�rios iteram a source e comparam com os s�mbolos do alfabeto
       freq(k) = sum(sum(sum((source==alfa(k)))));
   end
       
    %cria��o do histograma
    figure
    %grafico barras
    bar(alfa,freq)
    title(nome)
    xlabel("Alfabeto")
    ylabel("N�mero de ocorr�ncias")
end