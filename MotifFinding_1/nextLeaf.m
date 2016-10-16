function theNextLeaf = nextLeaf(a, L, k)
% a: the array representing the current leaf (e.g. [1,1,1,1,1,1,2])
% L: the max index of the array a, or the length of the array
% k: the number of elements in the 'alphabet'
for i=L:-1:1 %looping from from 8 to 1 (-1 is the 'step')
    if a(i) < k
        a(i) = a(i) + 1;
        theNextLeaf = a;
        return
    end
    a(i) = 1;
end % end of for
theNextLeaf = a;
end % end of function