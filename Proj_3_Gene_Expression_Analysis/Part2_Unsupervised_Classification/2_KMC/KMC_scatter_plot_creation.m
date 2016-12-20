data = load('original_data/alon_g100_processed2.txt');
data = data';
[num_rows, num_cols] = size(data);

%distance_type = 'sqeuclidean';
distance_type = 'correlation';

clusters = kmeans(data, 2, 'dist', distance_type);

PC = princomp(data);
data_2D = data * PC;
data_2D = data_2D(:,1:2);

data_2D_class = [clusters data_2D];
plotClass2D(data_2D_class, 1, 16);