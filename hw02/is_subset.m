function is_subset = is_subset(set1, set2)
is_subset = sum(ismember(set1, set2)) == length(set1);
end