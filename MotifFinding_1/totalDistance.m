function total_dist = totalDistance(word, DNA)
[t, n] = size(DNA);
total_dist = 0;
word_length = length(word);
limit = n - word_length + 1;
for i = 1:t
    DNA_at_i = DNA(i,1:n);
    min_dist = intmax;
    for j = 1:limit
        DNA_cutlet = DNA_at_i(j:j+word_length-1);
        dist = hammingDistance(word, DNA_cutlet);
        if dist < min_dist
            min_dist = dist;
        end
    end
    total_dist = total_dist + min_dist;
end
end