function arr = rm_dup(input_arr)
arr = input_arr;
duplicate_indices = [];
s = size(input_arr);
s = s(2);
for i = 1:s
    if any(i == duplicate_indices) == 0
        dup_indices = find(input_arr == input_arr(i));
        dimensions = size(dup_indices);
        if dimensions(2) > 1
            dup_indices(1) = [];
            duplicate_indices = [duplicate_indices, dup_indices];
        end
    end
end
arr(duplicate_indices) = [];
end
