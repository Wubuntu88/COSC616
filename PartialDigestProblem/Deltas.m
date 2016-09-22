function deltas = Deltas(arr)
dist_mtx = bsxfun(@minus, arr, arr');
deltas = dist_mtx(dist_mtx > 0);
deltas = reshape(deltas, 1, length(deltas));
end