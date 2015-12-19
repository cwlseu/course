function [a, k] = batch_perception(train_features, train_targets, eta, theta)
%BATCH_PERCEPTION Summary of this function goes here
%   train_feature: all the train data should be in normalization 
%   learn_rate: the coefficient for a change, which is the coefficient to
%   calculate
%   theta: the max error which for stop running
% return:
%   a : the coefficient 
%   k : the totle learning step

[c, n]		   = size(train_features);
train_features = [train_features ; ones(1,n)];
c = c + 1;
train_zero     = find(train_targets == 0);

%Preprocessing
y              = train_features;
y(:,train_zero)= -y(:,train_zero); % All the ya > 0
%Initial weights
a              = zeros(c,1);
k = 0;
update		   = 10*theta;
while (sum(abs(update)) > theta)
   k = k + 1;
   %Find all incorrectly classified samples, Yk
   B = a'*y;
   Yk			= find(B <= 0);
   update	= eta * sum(y(:,Yk)')';
   
   % a <- a + eta*sum(Yk)
   a = a + update;
end
end

