function Place(L, X, level, iftrace)
% base case
if isempty(L)
  output = strcat('solution found: ', 
  fprintf('solution found: ')
  fprintf(X)
  return
end

y = max(L);
deltas_1 = delta(y, X);
if all_in(deltas_1, L)
  new_X = sort([X y]);
  new_L = removeElems(deltas_1, L);
  Place(new_X, new_L)
end

width_minus_y = width - y;
deltas_2 = delta(width_minus_y, X);
if all_in(deltas_2, L)
  new_X = sort([X y]);
  new_L = removeElems(deltas_2, X);
  Place(new_X, new_L);
end
return
end
