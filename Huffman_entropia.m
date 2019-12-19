function media = Huffman_entropia(len, prob)
    media = 0;
    for i=1 :size(len)
        media = media + (len(i)*prob(i));
    end
    
end
        

