data = load('original_data/iyer_processed.txt');
% data = data'; % transposing is wrong in this case
[num_rows, num_cols] = size(data);


Q = data;
Q = Q';
net = newsom([min(Q,[],2) max(Q,[],2)], [10 1], 'hextop');
iterations = 100;
net.trainParam.epochs = iterations;
net = train(net, Q);
clusters = vec2ind(net(Q));

clusters = clusters';

PC = princomp(data);
data_2D = data * PC;
data_2D = data_2D(:,1:2);

data_2D_class = [clusters data_2D];
plotClass2D(data_2D_class, 1, 16);