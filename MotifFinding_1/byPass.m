function [a, j] = byPass(s, i, L, k)
for j = i:-1:1
    if s(j) < k
        s(j) = s(j) + 1;
        a = s;
        return
    end
end
a = s;
j = 0;
end