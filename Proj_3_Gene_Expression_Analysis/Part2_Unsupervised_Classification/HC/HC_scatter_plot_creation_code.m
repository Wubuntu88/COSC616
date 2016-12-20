data = load('original_data/alon_g100_processed2.txt');
data = data';
[num_rows, num_cols] = size(data);

dist = pdist(data, 'euclidean');
tree = linkage(dist, 'average');
clusters = cluster(tree, 'maxclust', 2);

PC = princomp(data);
data_2D = data * PC;
data_2D = data_2D(:,1:2);

% make class labels

data_2D_class = [clusters data_2D];
plotClass2D(data_2D_class, 1, 16);