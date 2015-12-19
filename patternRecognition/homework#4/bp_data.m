A = [1.58, 2.32, -5.8;
     0.67, 1.58, -4.78;
     1.04, 1.01, -3.63;
    -1.49, 2.18, -3.39;
    -0.41, 1.21, -4.73;
      1.39, 3.16, 2.87;
     1.20, 1.40, -1.89;
    -0.92, 1.44, -3.22;
     0.45, 1.33, -4.38;
    -0.76, 0.84, -1.96];

B = [ 0.21, 0.03, -2.21;
     0.37, 0.28, -1.8;
     0.18, 1.22, 0.16;
    -0.24, 0.93, -1.01;
    -1.18, 0.39, -0.39;
    0.74, 0.96, -1.16;
    -0.38, 1.94, -0.48;
    0.02, 0.72, -0.17;
     0.44, 1.31, -0.14;
     0.46, 1.49, 0.68];

C = [-1.54, 1.17, 0.64;
    5.41, 3.45, -1.33;
     1.55, 0.99, 2.69;
     1.86, 3.19, 1.51;
    1.68, 1.79, -0.87;
    3.51, -0.22, -1.39;
    1.40, -0.44, -0.92;
    0.44, 0.83, 1.97;
     0.25, 0.68, -0.99;
     0.66, -0.45, 0.08];
 train_features = [A' B' C'];
 traintarget = ones(1,30);
 traintarget(11:20) = 2;
 traintarget(21:30) = 3;
 Nh = 5;
 eta = 0.75;
 Theta = 1;
 itero = zeros(1,1);
 etai = 0.1:0.2:5;
 for i =  etai
    [rate, Wh, Wo] = Backpropagation_Batch(train_features, traintarget, Nh, Theta, i)
    itero = [itero;iter];
 end
 plot(etai,itero(2:end));
 xlabel('learning rating value eta');
 ylabel('iterator time');
 %[Wh, Wo] = RandomSingle(train_features, traintarget, Nh, Theta, eta)
 
% Nh = 1:1:30;
%  eta = 1;
%  Theta = 10;
%  itero = zeros(1,1);
%  for i =   Nh
%     [J, Wh, Wo] = Backpropagation_Batch(train_features, traintarget, i, Theta, eta);
%     itero = [itero;J];
%  end
%  plot(Nh,itero(2:end));
%  xlabel('Number of hidden layer node');
%  ylabel('Target function J value');