function [a, k, passnum] = single_relaxation_with_margin(train_features, train_targets, eta, b)
% Classify using the using the Ho-Kashyap algorithm
% Inputs:
% 	train_features: Train features
%	train_targets: Train targets
%	eta	: learning rate
% Outputs
%   a : Classifier weights
%   passnum : pass simple number
%   k : iteration time
[c, n]		   = size(train_features);
train_features  = [train_features ; ones(1,n)];
train_zero      = find(train_targets == 0);
passnum = zeros(n,1);
%Preprocessing (Needed so that b>0 for all features)
processed_features = train_features;
processed_features(:,train_zero) = -processed_features(:,train_zero);

a = zeros(c+1,1);
Y = processed_features;
k = 0;
Yk = 1;
while  (sum(Yk)>0) 
    k = k+1;
    B = a'*Y - b;
    Yk = find(B <= 0);
    
    npass = size(Yk);
    passnum(k,1) = n - npass(2);
    y = Y(:,randi(npass(2))); % random get a simple
    a = a - eta*(a'*y - b)/norm(y)^2*y;
end
end




