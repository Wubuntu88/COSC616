function distance = hammingDistance(word, DNA_cutlet)
len = length(word);
distance = 0;
for i = 1:len
    if word(i) ~= DNA_cutlet(i)
        distance = distance + 1;
    end
end
end