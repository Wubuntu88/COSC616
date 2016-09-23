function Place(L, X, level, iftrace)
% base case
if isempty(L)
  str = sprintf('%d ', X);
  output = strcat('solution found: ', str, '\n'); 
  fprintf(output);
  return
end

y = max(L);
deltas_1 = abs(X - y);
if all_in(deltas_1, L)
  new_X = sort([X y]);
  new_L = remove(deltas_1, L);
  Place(new_L, new_X, 0, true)
end

width_minus_y = max(X) - y;
deltas_2 = abs(X - width_minus_y);
if all_in(deltas_2, L)
  new_X = sort([X width_minus_y]);
  new_L = remove(deltas_2, L);
  Place(new_L, new_X, 0, true);
end
return
end
