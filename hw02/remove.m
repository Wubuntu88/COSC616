function remain = removeElems(arr1, arr2)
for i = 1:length(arr1)
    indexToRemove = find(arr1(i) == arr2, 1, 'last');
    if length(indexToRemove)
        arr2(indexToRemove) = [];
    end
end
end
