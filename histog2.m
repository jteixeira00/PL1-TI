function histog2(source,alfa, nome) %Unicamente ultizado no texto
%O áudio e a imagem utilizam o histog2 que emprega a função histcounts para o cálculo
%da frequência de cada símbolo

   %cria array com zeros
   freq = zeros(1,length(alfa));
      
    for k=1:1:length(alfa)        
    %somatórios iteram a source e comparam com os símbolos do alfabeto
       freq(k) = sum(sum(sum((source==alfa(k)))));
   end
       
    %criação do histograma
    figure
    %grafico barras
    bar(alfa,freq)
    title(nome)
    xlabel("Alfabeto")
    ylabel("Número de ocorrências")
end