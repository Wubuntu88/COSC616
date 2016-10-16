function [a, i] = nextVertex(s, i, L, k)
%{
Inputs:
a - array of starting positions
i - depth of the tree
L - length of a (i.e. number of positions)
k - highest number that an item in array a can be
%}
if i<L
    s(i+1) = 1;
    a = s;
    i = i + 1;
    return
else
    for j = L:-1:1
        if s(j) < k
            s(j) = s(j) + 1;
            a = s;
            i = j;
            return
        end
    end
end
a = s;
i = 0;
end