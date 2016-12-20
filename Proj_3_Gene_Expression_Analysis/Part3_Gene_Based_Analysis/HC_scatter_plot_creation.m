data = load('original_data/iyer_processed.txt');
%data = data'; % transposing in this case is not right
[num_rows, num_cols] = size(data);

dist = pdist(data, 'correlation');
tree = linkage(dist, 'complete');
clusters = cluster(tree, 'maxclust', 10);

PC = princomp(data);
data_2D = data * PC;
data_2D = data_2D(:,1:2);

% make class labels

data_2D_class = [clusters data_2D];
plotClass2D(data_2D_class, 1, 16);