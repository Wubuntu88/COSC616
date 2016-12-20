data = load('original_data/iyer_processed.txt');
data = data';
[num_rows, num_cols] = size(data);

distance_type = 'sqeuclidean';
%distance_type = 'correlation';

clusters = kmeans(data, 3, 'dist', distance_type);
PC = princomp(data);
data_2D = data * PC;
data_2D = data_2D(:,1:2);

% make class labels

data_2D_class = [clusters data_2D];
plotClass2D(data_2D_class, 1, 16);