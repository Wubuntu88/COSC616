function results = PDP(L)
width = max(L)
lastIndex = find(L == width, 1, 'last')
L(lastIndex) = []
X = [0, width]
PLACE(X, L)
end

function res = PLACE(L, X):
if length(L) == 0
  fprintf(X)
  return
end

%y is the max element in L
y = max(L)
differences1 = delta(y, X)
if all_in(differences1, L)
  new_X = sort([X y])
  new_L = removeElems(differences1, L)
  PLACE(new_X, new_L)
  end

width_minus_y = width - y
differences2 = delta(width_minus_y, X)
if all_in(differences2, L)
  new_X = sort([X y])
  new_L = removeElems(differences2, X)
  PLACE(new_X, new_L)
  end
return
end
