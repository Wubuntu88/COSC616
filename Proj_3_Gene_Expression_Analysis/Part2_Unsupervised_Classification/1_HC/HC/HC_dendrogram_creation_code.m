% load data
data = load('original_data/alon_g100_processed2.txt');
data = data';
[num_rows, num_cols] = size(data);

dist = pdist(data, 'correlation');
tree = linkage(dist, 'average');
dendrogram(tree);