clc;
homework3 = load('matlab.mat');
train_data = homework3.homework3;
train_features = train_data(1:20,1:end-1);
train_target = train_data(1:20,end);
eta = 1; % learning rate
theta = 5;  
[a,k] = batch_perception(train_features', train_target', eta, theta);
fprintf('w1 w2 the learning step number is %d\n',k);

train_features = train_data(10:30,1:end-1);
train_target = train_data(10:30,end)-2;
eta = 1; % learning rate
theta = 5;  
[a,k] = batch_perception(train_features', train_target', eta, theta);
fprintf('w2 w3 the learning step number is %d\n',k);