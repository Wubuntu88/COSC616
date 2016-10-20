function [the_score, cs] = scoreOfSubset(s, DNA, l_mer, numberOfStrands)
[t, n] = size(DNA);
for i = 1:numberOfStrands
    temp = DNA(i, :);
    DNA_subset(i,:) = temp;
end

subsetOfStartingPositions = s(1:numberOfStrands);
prof = profile(subsetOfStartingPositions, DNA_subset, l_mer);

[the_score, cs] = score_p(prof);
end