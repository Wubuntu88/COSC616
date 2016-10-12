function showNextLeaf()
a = [1,1,1,1];
L = 4;
k = 4;
for i=1:50
a = nextLeaf(a, L, k);
fprintf('[');
fprintf('%d,', a);
fprintf(']');
fprintf('\n');
end