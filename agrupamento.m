function nova_fonte = agrupamento(fonte)
   
    %Se a fonte tiver um numero impar de elementos tira o �ltimo elemento �
    %fonte
    if mod(size(fonte,1),2) ~= 0
        fonte(numel(fonte))= [];
    end
    
    %A fonte passa para uma �nica linha, cr�tico para as imagens que s�o
    %bidimensionais
    fonte = reshape(fonte',1,[]);
    
    %shift left de 8 bits e soma o segundo numero, guarda num double que tem
    %mais espa�o
    nova_fonte= double(fonte(:,1:2:end-1))*2^8+double(fonte(:,2:2:end));
    
    
end
