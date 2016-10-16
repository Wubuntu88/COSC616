function zTestNextVertex()
s = [1,1,1,1];
i = 0;
L = 4;
k = 2;
for j=1:30
    [s, i] = nextVertex(s, i, L, k);
    sol = 's: (';
    for counter=1:length(s)
        if counter <= i
            sol = strcat(sol, sprintf('%d,', s(counter)));
        else
            sol = strcat(sol, '-,');
        end
    end
    sol(length(sol)) = ')';
    disp(sol);
    disp(sprintf('i: %d', i));
end

end
