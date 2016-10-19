function p = profile(s, DNA, l_mer)

for i = 1:length(s)
    position = s(i);
    
    fprintf('position1: %2d\n', position);
    fprintf('position2: %2d\n', position+l_mer-1);
    fprintf('lmer: %2d\n', l_mer);
    temp = DNA(i,position:position+l_mer-1);
    p(i,:) = actg2num(temp);
end

end
    