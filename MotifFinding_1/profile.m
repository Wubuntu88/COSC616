function p = profile(s, DNA, l_mer)
%fprintf('-------------------------\n');
for i = 1:length(s)
    position = s(i);
    [t, n] = size(DNA);
    temp = DNA(i,position:position+l_mer-1);
    p(i,:) = actg2num(temp);
end

end
    