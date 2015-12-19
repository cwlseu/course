clear;
% load data from matlab.mat
homework3 = load('matlab.mat');
train_data = homework3.homework3;
% train data is w1 w3
train_features = [train_data(1:10,1:end-1);train_data(21:30,1:end-1)];
train_target = [train_data(1:10,end);train_data(21:30,end)];
train_zero = find(train_target > 0);
train_target(train_zero,:) = 1;
eta = 1; % learning rate
b_min = 1; 
kmax = 100;
train_features = train_features';
train_target = train_target';
[a, b, k] = HoKashyap(train_features, train_target, eta, b_min, kmax);
fprintf('interation number is %d\n',k);
a
b
plot_train_features=true;
if (plot_train_features)
  plot(sort(train_features(1:10)), 'rx');
  hold on;
  plot(sort(train_features(11:20)),'bx');
  legend('w1', 'w3');
end
% train data is w2 w4
train_features = [train_data(11:20,1:end-1);train_data(11:20,1:end-1)];
train_target = [train_data(11:20,end);train_data(31:40,end)];
train_one = find(train_target == 1);
train_target(train_one,:) = 0;
train_two = find(train_target == 3);
train_target(train_two,:) = 1;
eta = 1; % learning rate
b_min = 0.5; 
train_features = train_features';
train_target = train_target';
[a, b, k] = HoKashyap(train_features, train_target, eta, b_min, kmax);
a
b
fprintf('interation number is %d\n',k);

plot_train_features=true;
if (plot_train_features)
  figure;
  plot(sort(train_features(1:10)), 'rx');
  hold on;
  plot(sort(train_features(11:20)),'bx');
  legend('w2', 'w4');
end