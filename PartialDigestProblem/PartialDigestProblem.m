function PartialDigestProblem(L, iftrace)
width = max(L);
lastIndex = find(L == width, 1, 'last');
L(lastIndex) = [];
X = [0, width];

level = 0;
iftrace = true;
Place(L, X, level, iftrace)
end

