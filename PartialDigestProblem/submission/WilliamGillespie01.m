% @author: William Gillespie

function PartialDigestProblem(L,trace)
width = max(L);
lastIndex = find(L == width, 1, 'last');
L(lastIndex) = [];
X = [0, width];

level = 0;
Place(L, X, width, level, trace)
end
% -----------------------------------------------------
% -------------end of PartialDigestProblem()
% -----------------------------------------------------

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
% -----------------------------------------------------
% -------------end of PLACE()
% -----------------------------------------------------
%{
the remove method removes all elements in arr1 from arr1.
there can be duplicates in arr1 and and all duplicates
from arr1 must be removed from arr2.
%}
function remain = remove(arr1, arr2)
for i = 1:length(arr1)
    indexToRemove = find(arr1(i) == arr2, 1, 'last');
    if isempty(indexToRemove) == false
        arr2(indexToRemove) = [];
    end
    remain = arr2;
end
end
% -----------------------------------------------------
% -------------end of remove()
% -----------------------------------------------------

%{
all_in returns 1 if all of the elements in a are in b.
a can have duplicates, and all of the duplicate elements
in a must be in b.
%}
function res = all_in(a, b)
for i = 1:length(a)
    matchingIndex = find(a(i) == b, 1, 'last');
    if length(matchingIndex) ~= 1
        res = 0;
        return
    end
    b(matchingIndex) = [];
end
res = 1;
end
% -----------------------------------------------------
% -------------end of allin()
% -----------------------------------------------------