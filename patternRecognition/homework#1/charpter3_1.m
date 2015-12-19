% charpter 3 exercise 1
% Raw data input as matrix
W1 = [0.42 -0.087  0.58;
	-0.2 -3.3 -3.4;
	1.3 -0.32 1.7;
	0.39 0.71 0.23;
	-1.6 -5.3 -0.15;
	-0.029 0.89 -4.7;
	-0.23 1.9 2.2;
	0.27 -0.3 -0.87;
	-1.9 0.76 -2.1;
	0.87 -1.0 -2.6];
W2 = [  -0.4 0.58 0.089;
		-0.31 0.27 -0.04;
		0.38 0.055 -0.035;
		-0.15 0.53 0.011;
		-0.35 0.47 0.034;
		0.17 0.69 0.1;
		-0.011 0.55 -0.18;
		-0.27 0.61 0.12;
		-0.065 0.49 0.0012;
		-0.12 0.054 -0.063];
W3 = [  0.83 1.6 -0.014;
		1.1 1.6 0.48;
		-0.44 -0.41 0.32;
		0.047 -0.45 1.4;
		0.28 0.35 3.1;
		-0.39 -0.48 0.11;
		0.34 -0.079 0.14;
		-0.3 -0.22 2.2;
		1.1 1.2 -0.46;
		0.18 -0.11 -0.49];
 

% (a) solution as follow:
% calculate W1 three feature means an sigma
M1 = mean(W1) ;
V1 = var(W1,1); % normalize by N 
disp('W1 one feature');
M1
V1

%There are (b) solution
mean_12 = mean(W1(:,1:2));
cov_12 = calcov(W1(:,1:2));
mean_13 = mean([W1(:,1) W1(:,3)]);
cov_13 = calcov([W1(:,1) W1(:,3)]);
mean_23 = mean(W1(:,2:3));
cov_23 = calcov(W1(:,2:3));
disp('W1 column 1 and 2:')
mean_12
cov_12
disp('W1 column 1 and 3:')
mean_13
cov_13
disp('W1 column 2 and 3:')
mean_23 
cov_23

%There are (c) solution
mean_123 = mean(W1);
cov_123 = calcov(W1);
disp('W1 all 3 features');
mean_123
cov_123

% Question (d) solution
M2 = mean(W2) ;
V2 = calcov(W2); % normalize by N 

disp('W2 evaluation parameter')
M2
V2


















