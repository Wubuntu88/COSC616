function [isEven, isOdd] = even_odd(num)
isOdd = mod(num,2);
isEven = ~isOdd;
end