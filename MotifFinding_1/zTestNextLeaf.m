function zTestNextLeaf()
a = [1,1,1,1];
L = length(a);
k = 4;
numOfAllPermutationsPlusOne = 4*4*4*4 + 1;
for i = 1:numOfAllPermutationsPlusOne
    actg_str = num2actg(a);
    fprintf('[');
    fprintf('%s', actg_str);
    fprintf(']');
    fprintf('\n');
    a = nextLeaf(a, L, k);
end