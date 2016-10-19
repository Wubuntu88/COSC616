function sol = zzPrintNodes(s, i)
sol = 's: (';
for counter=1:length(s)
    if counter <= i
        sol = strcat(sol, sprintf('%d,', s(counter)));
    else
        sol = strcat(sol, '-,');
    end
end
sol(length(sol)) = ')';
end
