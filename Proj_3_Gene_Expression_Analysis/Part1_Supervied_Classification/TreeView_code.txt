data = load('original_data/alon_processed.txt');
data = data';

dist = pdist(data, 'correlation');
tree = linkage(dist, 'average');
dendrogram(tree);

clusters = cluster(tree, 'maxclust', 3);

clustergram(data, 'linkage', 'average', 'standardize','col')