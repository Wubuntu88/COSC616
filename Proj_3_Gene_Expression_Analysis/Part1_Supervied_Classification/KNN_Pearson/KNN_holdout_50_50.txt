% Note: the normals are indices 1:22 and the cancerous ones are 23:62

% load data
data = load('original_data/alon_processed.txt');
data = data';
[num_rows, num_cols] = size(data);
normal = data(1:22, :);
tumor = data(23:num_rows, :);

[normal_rows, normal_cols] = size(normal);
[tumor_rows, tumor_cols] = size(tumor);

% apply holdout 50/50
train_data = [normal(1:11, :); tumor(1:20, :)];
test_data = [normal(12:normal_rows, :); tumor(21:tumor_rows, :)];

% Label initiazation
normal_labels = zeros(normal_rows, 1);
normal_labels(:, :) = 1;

tumor_labels = zeros(tumor_rows, 1);
tumor_labels(:, :) = 2;

% label creating for train / test
train_labels = [normal_labels(1:11, :); tumor_labels(1:20, :)];
test_labels = [normal_labels(12:normal_rows, :); tumor_labels(21:tumor_rows, :)];

% KNN classification

model = ClassificationKNN.fit(train_data, train_labels, 'NumNeighbors', 5, 'Distance', 'correlation');

prediction_labels = predict(model, test_data);
error_percent = nnz(test_labels - prediction_labels) / length(test_labels) * 100;
fprintf('percent error: %.2f\n', error_percent);

% Display tree view and scatter plot
PC = princomp(train_data);
test2D = test_data * PC;

test_labels_and_data = [prediction_labels test2D];
plotClass2D(test_labels_and_data, 1, 16);



