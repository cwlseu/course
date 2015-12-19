clear;
load('knndata.mat');
% One-dim

n = size(Data);
n = n(1)
test = [-0.41 0.82 0.88;0.14 0.72 4.1; -0.81 0.61 -0.38]
train_features = Data(:,1:3);
train_targets = Data(:,4);
k = [1 3 5];
for i = k
% call function kNNE to get KDist and prob
    [KDist, knn, prob]=KNN(train_features, train_targets, test, i);
   
    knn
    prob
end
