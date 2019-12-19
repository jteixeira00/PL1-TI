function histog(source,alfa, nome) %Utilizado no �udio e na imagem, 
%o histog, que emprega a fun��o histcounts para o c�lculo
%da frequ�ncia de cada s�mbolo
    
    freq = histcounts(source, [alfa,alfa(numel(alfa))]);
    
    %cria��o do histograma
    figure
    %grafico barras
    bar(alfa,freq)
    title(nome)
    xlabel("Alfabeto")
    ylabel("N�mero de ocorr�ncias")
end

