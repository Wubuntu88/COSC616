function zTestByPass()
s = [1,1,2,1];
i = 1;
L = 4;
k = 2;
[a, i] = byPass(s, i, L, k);
sol = 'a: (';
for counter=1:length(a)
    if counter <= i
        sol = strcat(sol, sprintf('%d,', a(counter)));
    else
        sol = strcat(sol, '-,');
    end
end
sol(length(sol)) = ')';
disp(sol);
disp(sprintf('i: %d', i));
end