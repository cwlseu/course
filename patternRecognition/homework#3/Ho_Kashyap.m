train_features = [0 0;1 1;0 1;1 0]';
train_targets = [0 0 1 1];
eta = 1;
[c, n]		   = size(train_features);
train_zero      = find(train_targets == 1);

%Preprocessing (Needed so that b>0 for all features)
processed_features = train_features;
processed_features(:,train_zero) = -processed_features(:,train_zero);

b                  = ones(1,n)+1;
Y                  = processed_features;
a                 = pinv(Y')*b';
k	               = 0;
e    	           = 1e3;
kmax             = 20;
while  k < kmax

    %k <- (k+1) mod n
    k = k+1;

    %e <- Ya - b
    e       = (Y' * a)' - b
   
    %e_plus <- 1/2(e+abs(e))
    e_plus  = 0.5*(e + abs(e))
   
    %b <- b + 2*eta*e_plus
    b       = b + 2*eta*e_plus

    
    %disp('The problem cannot classification');

    a = pinv(Y')*b'
    
end

