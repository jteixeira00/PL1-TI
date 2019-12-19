function nova_fonte = agrupamento(fonte)
   
    %Se a fonte tiver um numero impar de elementos tira o último elemento à
    %fonte
    if mod(size(fonte,1),2) ~= 0
        fonte(numel(fonte))= [];
    end
    
    %A fonte passa para uma única linha, crítico para as imagens que são
    %bidimensionais
    fonte = reshape(fonte',1,[]);
    
    %shift left de 8 bits e soma o segundo numero, guarda num double que tem
    %mais espaço
    nova_fonte= double(fonte(:,1:2:end-1))*2^8+double(fonte(:,2:2:end));
    
    
end
