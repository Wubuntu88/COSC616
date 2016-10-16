function arr = actg2num(string)
len = length(string);
arr = zeros(len, 1);
for i=1:len
  c = string(i);
  if strcmp(c, 'A')
    arr(i) = 1;
  elseif strcmp(c, 'T')
    arr(i) = 2;
  elseif strcmp(c, 'G')
    arr(i) = 3;
  else
    arr(i) = 4;
  end
end

end
