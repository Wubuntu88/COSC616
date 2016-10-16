function showNextLeaf()
a = [1,1,1,1,1];
L = length(a);
k = 68-8+1;
for i=1:50
a = nextLeaf(a, L, k);
fprintf('[');
fprintf('%d,', a);
fprintf(']');
fprintf('\n');
end