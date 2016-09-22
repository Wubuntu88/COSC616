function res = all_in(a, b)
for i = 1:length(a)
    matchingIndex = find(a(i) == b, 1, 'last');
    if length(matchingIndex) ~= 1
        res = 0;
        return
    end
    b(matchingIndex) = [];
end
res = 1;
end
