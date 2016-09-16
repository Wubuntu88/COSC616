function is_palindrom = is_palindrome(arr)
reverse = fliplr(arr);
is_palindrom = strcmp(arr, reverse);
end