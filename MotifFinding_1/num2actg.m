function str = num2actg(arr)
len = length(arr);
str = blanks(len);
for i=1:len
    num = arr(i);
    if num == 1
        str(i) = 'A';
    elseif num == 2
        str(i) = 'T';
    elseif num == 3
        str(i) = 'G';
    else
        str(i) = 'C';
    end
end

end