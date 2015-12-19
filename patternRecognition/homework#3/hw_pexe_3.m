clc;
% load data from matlab.mat
homework3 = load('matlab.mat');
train_data = homework3.homework3;

% train data is w1 w3
train_features = [train_data(1:10,1:end-1);train_data(21:30,1:end-1)];
train_targets = [train_data(1:10,end);train_data(21:30,end)];
train_zero = find(train_targets > 0);
train_targets(train_zero,:) = 1;
train_features = train_features';
train_targets = train_targets';

plot_train_features=false; % plot switch
eta = 1; % learning rate

disp('There are batch relaxation with margin');
b = 0.1; % margin number
[a, k, passnum1] = batch_relaxation_with_margin(train_features, train_targets, eta, b);
fprintf('interation number is %f, iter step :%d \n',b, k);
a
if (plot_train_features)
  plot(passnum1, 'rx');
  hold on;
end

b = 0.5;
[a, k, passnum2] = batch_relaxation_with_margin(train_features, train_targets, eta, b);
fprintf('b is %f, iter number :%d \n',b, k);
a
if (plot_train_features)
  plot(passnum2,'bx');
  legend('0.1', '0.5');
end
%
% Single simple single_relaxation_with_margin
%
disp('There are single relaxation with margin');
b = 0.9; % margin number
[a, k, passnum1] = single_relaxation_with_margin(train_features, train_targets, eta, b);
fprintf('b is %f, iter number is %d \n',b, k);

b = 0.5; % margin number
[a, k, passnum1] = single_relaxation_with_margin(train_features, train_targets, eta, b);
fprintf('interation number is %f, iter step :%d \n',b, k);
