function Place(L, X, level, iftrace)
% base case
%l_str = sprintf('%d ', L);
%fprintf('L: %s\n', l_str);
if isempty(L)
  str = sprintf('%d ', X);
  output = strcat('solution found: ', str, '\n'); 
  fprintf(output);
  return
end

y = max(L);

%x_str = sprintf('%d ', X);
%fprintf('x: %s\n', x_str);


%fprintf('%d\n', y);

deltas_1 = abs(X - y);
%s = sprintf('%d ', deltas_1);
%fprintf('%s\n', s);

if all_in(deltas_1, L)
  new_X = sort([X y]);
  new_L = remove(deltas_1, L);
  Place(new_L, new_X, 0, true)
end

width_minus_y = max(X) - y;
deltas_2 = abs(X - width_minus_y);
if all_in(deltas_2, L)
  new_X = sort([X y]);
  new_L = remove(deltas_2, L);
  Place(new_L, new_X, 0, true);
end
return
end
