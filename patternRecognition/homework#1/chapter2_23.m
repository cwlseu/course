clc;clear;
A = [1 0 0;
     0 5 2
     0 2 5];
[V,D] = eig(A)
Aw = V*(D^(-0.5))
x0 = [0.5 0 1]'
u = [1 2 2]'
xw = Aw'*(x0 - u)
magakabis = (x0 - u)'*(A^-1)*(x0 - u)