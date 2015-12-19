function [a, b, k] = HoKashyap(train_features, train_targets, eta, b_min, kmax)
% Classify using the using the Ho-Kashyap algorithm
% Inputs:
% 	train_features: Train features
%	train_targets: Train targets
%	eta	: learning rate
%	b_min : break condition
%   kmax :  the max interation time
% Outputs
%   a : Classifier weights
%   b : Margin
%   k : iteration time
[c, n]		   = size(train_features);
train_features  = [train_features ; ones(1,n)];
train_zero      = find(train_targets == 1);

%Preprocessing (Needed so that b>0 for all features)
processed_features = train_features;
processed_features(:,train_zero) = -processed_features(:,train_zero);

b = ones(1,n);
Y = processed_features;
a = pinv(Y')*b';
k = 0;
e = 1e3;
while  (sum(abs(e) > b_min)>0) & (k < kmax) % threshold b_min, kmax
    %k <- (k+1) mod n
    k = k+1;
    %e <- Ya - b
    e = (Y' * a)' - b;
    %e_plus <- 1/2(e+abs(e))
    e_plus  = 0.5*(e + abs(e));
    %b <- b + 2*eta*e_plus
    b = b + 2*eta*e_plus;
    a = pinv(Y')*b' ;
    if sum(find(e_plus < 0)) > 0
        disp('The train data cannot seperate');
    end
end
end

