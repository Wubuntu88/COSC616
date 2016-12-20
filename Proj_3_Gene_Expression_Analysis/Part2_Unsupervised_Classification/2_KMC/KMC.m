data = load('original_data/alon_g100_processed2.txt');
data = data';
[num_rows, num_cols] = size(data);

%distance_type = 'sqeuclidean';
distance_type = 'correlation';

clusters = kmeans(data, 2, 'dist', distance_type);

labels = zeros(num_rows, 1);
labels(1:22, :) = 2;
labels(23:num_rows) = 1;

num_errors = nnz(labels - clusters);
error_rate = num_errors / length(clusters) * 100;

fprintf('KMC error rates distance: %s\n', distance_type);
fprintf('errors: %.2f\n', num_errors);
fprintf('error rate: %.2f%%\n', error_rate);