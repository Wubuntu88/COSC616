function remain = remove(arr1, arr2)
for i = 1:length(arr1)
    indexToRemove = find(arr1(i) == arr2, 1, 'last');
    if isempty(indexToRemove) == false
        arr2(indexToRemove) = [];
    end
    remain = arr2;
end
end
