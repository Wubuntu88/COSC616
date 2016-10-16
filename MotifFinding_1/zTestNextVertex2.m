function zTestNextVertex2()
s = ones(1, 8);
i = 1;
L = length(s);
k = 8;
for j = 1:20
    str = num2actg(s);
    fprintf('%s\n', str);
    [s, i] = nextVertex(s, i, L, k);
end