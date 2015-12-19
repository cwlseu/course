% generate 1000 points for k-means
% Sigma = [1, 0; 0, 1];
% mu1 = [1, -1];
% x1 = mvnrnd(mu1, Sigma, 200);
% mu2 = [5.5, -4.5];
% x2 = mvnrnd(mu2, Sigma, 200);
% mu3 = [1, 4];
% x3 = mvnrnd(mu3, Sigma, 200);
% mu4 = [6, 4.5];
% x4 = mvnrnd(mu4, Sigma, 200);
% mu5 = [9, 0.0];
% x5 = mvnrnd(mu5, Sigma, 200);
% X = [x1; x2; x3; x4; x5];
clc;
% load data from matlab.mat
homework5 = load('matlab.mat');
X = homework5.X;
mu1 = [1, -1];
mu2 = [5.5, -4.5];
mu3 = [1, 4];
mu4 = [6, 4.5];
mu5 = [9, 0.0];

%k-means聚类
N = 5;
[u re]=k_means(X,N)  
[m n]=size(re);
figure;hold on;
for i= 1: m
    if re(i,3) == 1
        plot(re(i,1), re(i,2), 'r.'); 
    elseif re(i,3)== 2
        plot(re(i,1), re(i,2), 'b.');
    elseif re(i,3)== 3
        plot(re(i,1), re(i,2), 'k.');
    elseif re(i,3)== 4
        plot(re(i,1), re(i,2), 'g.');
    else
        plot(re(i,1), re(i,2), 'm.');  
    end
end

%最后显示聚类后的数据
% 标记原始聚类中心
plot(mu1(:,1), mu1(:,2), 'b+');
plot(mu2(:,1), mu2(:,2), 'r+');
plot(mu3(:,1), mu3(:,2), 'm+');
plot(mu4(:,1), mu4(:,2), 'k+');
plot(mu5(:,1), mu5(:,2), 'g+');
% 显示最后的聚类中心
for i = 1: N
    plot(u(i,1), u(i,2), 'ro');
end

dist =ones(N,N);
mu = [mu1; mu2; mu3; mu4; mu5];
for i = 1:N
    for j = 1:N
        dist(i,j) = distance(u(i,:),mu(j,:));
    end
end
result = min(dist)'
counter = zeros(1,N);
for i = 1: N
    counter(1,i) = length(find(re(:,3) == i));
end 
counter
re(1,3)


