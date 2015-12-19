% The script for ill-conditioned system example.
% date: 2015-11-22
% author: Clython

n = 80;
b = randn(n,1);

A = tril(ones(n) - ones(n)*2 + 2*eye(n));
A(:,end) = 1;
x = A\b;
disp('The ill-condition error :');
disp(norm(A*x - b));

% add noise to the matrix A
A = A + rand(n,n,'double');
x = A\b;
disp('After add noise to matrix A error:');
disp(norm(A*x - b));
