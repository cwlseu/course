clear;
load('knndata.mat');


test = Data(11:20,:)
train_features = Data(:,1:2);
train_targets = Data(:,4);
k = [1 3 5];
x = test(:,1); 
m = size(test);
m = m(1);

for i =k
    % call function kNNE to get KDist and prob
    [KDist, knn, prob]=KNN(train_features, train_targets, test, i);
    x = test(:,1) ;
    y = test(:,2);%meshgrid( test(:,1:2))
    g = [x y prob];
    figure;surf(g);
    title(['KNN-2feature experiment k='  num2str(i)   ',n='  num2str(m)]);
    print -deps graph.eps
end