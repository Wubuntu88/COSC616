data = load('original_data/alon_g100_processed2.txt');
data = data';
[num_rows, num_cols] = size(data);


Q = data;
Q = Q';
net = newsom([min(Q,[],2) max(Q,[],2)], [2 1], 'hextop');
iterations = 100;
net.trainParam.epochs = iterations;
net = train(net, Q);
clusters = vec2ind(net(Q));

clusters = clusters';

labels = zeros(num_rows, 1);
labels(1:22, :) = 2;
labels(23:num_rows) = 1;

num_errors = nnz(labels - clusters);
error_rate = num_errors / length(clusters) * 100;

fprintf('SOM error rates; iterations: %d\n', iterations);
fprintf('errors: %.2f\n', num_errors);
fprintf('error rate: %.2f%%\n', error_rate);

PC = princomp(data);
data_2D = data * PC;
data_2D = data_2D(:,1:2);

data_2D_class = [clusters data_2D];
plotClass2D(data_2D_class, 1, 16);
