function PartialDigestProblem(L,trace)
width = max(L);
lastIndex = find(L == width, 1, 'last');
L(lastIndex) = [];
X = [0, width];

level = 0;
Place(L, X, width, level, trace)
end

