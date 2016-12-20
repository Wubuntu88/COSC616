data = load('original_data/iyer_processed.txt');
data = data';
[num_rows, num_cols] = size(data);

clustergram(data, 'linkage', 'complete', 'RowPDist', 'correlation', 'standardize', 'col');
%clustergram(data, 'linkage', 'complete', 'RowPDist', 'euclidean', 'standardize', 'col');