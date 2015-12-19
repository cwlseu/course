
clc;
n = 10000;
% generate random data in [-1/2 ,1/2]
data = rand(n,3) - 0.5;

pnum = 100;
X = double(zeros(pnum ,1));
Y = double(zeros(pnum ,1));
for h = 1:1:pnum 
    counter = 0;
    hn = double(h)/100;
    for i = 1:10000
        if data(i,:) <= hn & data(i,:) >= -hn
            counter = counter + 1;
        end   
    end
    X(h) =hn;
    Y(h) = counter/(n *(2*hn)^3);
end
figure;plot(X,Y);

%parzen windows size unknown ,including x_i sample
counter = 50;
X = (1:1000/counter:10000);
Y = double(zeros(counter,1));
% calculate all the distance
KDist =diag(data*data')'
%sort and get the K Nearest Neighbor
i = 1;
for t = X
    t_element = sort(KDist);
    index = find(KDist == t_element(t));
    % get the k nearest point
    v = prod(2*abs(data(index)));
    Y(i) = t/(n *v);
    i = i+1;
end
figure;plot(X,Y);