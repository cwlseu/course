% generate Gauss Random data
clc;
n = 10000;
data = random('Normal',0,1,n,3);

pnum = 100;
X = double(zeros(pnum,1));
Y = double(zeros(pnum,1));
for h = 1:1:pnum
    counter = 0;
    hn = double(h)/100;
    for i = 1:10000
        if data(i,:) <= hn & data(i,:) >= -hn
            counter = counter + 1;
        end   
    end
    X(h) =hn;
    Y(h) = counter/(n *(hn)^3);
end
figure;plot(X,Y);

%parzen windows size unknown ,including x_i sample
counter = 100;
X = (1:1000/counter:10000);
Y = double(zeros(counter,1));
% calculate all the distance
KDist =diag(data*data')';
i = 1;
for t = X
    % get the k nearest point
    t_element = sort(KDist);
    index = find(KDist == t_element(t));
    % get hn
    hn = max(abs(data(index)));
    Y(i) = t/(n*hn^3);
    i = i+1;
end
figure;plot(X,Y);