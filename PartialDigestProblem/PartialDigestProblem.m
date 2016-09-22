function PartialDigestProblem(L, iftrace)
width = max(L);
lastIndex = find(L == width, 1, 'last');
L(lastIndex) = [];
X = [0, width];
PLACE(X, L)
end

