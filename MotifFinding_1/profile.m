function p = profile(s, DNA, l_mer)

for i = 1:length(s)
    position = s(i);
    temp = DNA(i,position:position+l_mer-1);
    p(i,:) = actg2num(temp);
end

end
    