clear;
load('knndata.mat');
% One-dim
test = Data(21:30,1:3);
test = sort(test);

train_features = Data(:,1);
train_targets = Data(:,4);
k = [1 3 5];
x = test(:,1); 
m = size(test);
m = m(1);
for i=k
    % call function kNNE to get KDist and prob
    [KDist, knn, prob]=KNN(train_features, train_targets, test, i);
    % set y as prob
    y = prob
    figure;plot(x,y);
    %set(gca,'YTick',0:0.1:1.5);
    %ylim([0 1.5]);
    % set title of figure
    title(['KNN experiment k='  num2str(i)   ',n='  num2str(m)]);
end
