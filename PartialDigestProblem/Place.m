function Place(L, X, width, level, trace)

% creating indentation dashes for showing hierarchy of the trace
indent = '----';
for i = 1:level
    indent = strcat(indent, '----');
end

% base case
if isempty(L)
  str = sprintf('%d ', X);
  output = strcat(indent, 'solution found: ', str, '\n'); 
  fprintf(output);
  return
end

y = max(L);
deltas_1 = abs(X - y);
if all_in(deltas_1, L)
  if trace == 1
      fprintf('%s try y = %d\n', indent, y);
  end
  new_X = sort([X y]);
  new_L = remove(deltas_1, L);
  Place(new_L, new_X, width, level + 1, trace)
else
    if trace == 1
        fprintf('%s try y = %d FAILS\n', indent, y);
    end
end

width_minus_y = width - y;
deltas_2 = abs(X - width_minus_y);
if all_in(deltas_2, L)
  if trace == 1
      fprintf('%s try w - y = %d\n', indent, width_minus_y);
  end
  new_X = sort([X width_minus_y]);
  new_L = remove(deltas_2, L);
  Place(new_L, new_X, width, level + 1, trace);
else
    if trace == 1
        fprintf('%s try w - y = %d FAILS\n', indent, width_minus_y);
    end
end
return
end
