function histog(source,alfa, nome) %Utilizado no áudio e na imagem, 
%o histog, que emprega a função histcounts para o cálculo
%da frequência de cada símbolo
    
    freq = histcounts(source, [alfa,alfa(numel(alfa))]);
    
    %criação do histograma
    figure
    %grafico barras
    bar(alfa,freq)
    title(nome)
    xlabel("Alfabeto")
    ylabel("Número de ocorrências")
end

