data = load('original_data/alon_g100_processed2.txt');
data = data';
[num_rows, num_cols] = size(data);

distance_type = 'euclidean';
linkage_type = 'average';

dist = pdist(data, distance_type);
tree = linkage(dist, linkage_type);
clusters = cluster(tree, 'maxclust', 2);

labels = zeros(num_rows, 1);
labels(1:22, :) = 1;
labels(23:num_rows) = 2;

num_errors = nnz(labels - clusters);
error_rate = num_errors / length(clusters) * 100;

fprintf('HC error rates distance: %s, linkage: %s\n', distance_type, linkage_type);
fprintf('errors: %.2f\n', num_errors);
fprintf('error rate: %.2f%%\n', error_rate);