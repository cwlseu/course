% function KNN 
% Get the probability density by k-nearest-neiborhood and V is hn^d
% train_features: train set X values
% train_targets: train set Y values
% test: test set features
% k: get k neiborhood

function [KDist, knn, destr]=KNN(train_features, train_targets, test, k)
    % get the train data size
    m = size(test);
    n = size(train_features);
    m = m(1);
    KDist=double(zeros(m, n(1)));
    % calculate all the distance
	for i=1:1:m
 	    for t=1:1:n(1)
 	        for j = 1:1:n(2)
	            KDist(i,t)=KDist(i,t)+[test(i,j) - train_features(t,j)]^2;
	        end
	        KDist(i,t)=sqrt(KDist(i,t));
	    end
	end
	%sort and get the K Nearest Neighbor
	knn = zeros(m,k);
    ht = zeros(k,n(2));
    hn = ones(m,1);
  
   % get the k nearest point
	for i=1:1:m
 	    for t=1:1:k
	        mink=t;
	        for j=t+1:1:n(1)
 	            if KDist(i,j)<KDist(i,mink)
	                mink=j;
	            end
            end      
	    	knn(i,t) = train_targets(mink);
            ht(t,:) = train_features(mink,:);
    
            temp=KDist(i,t);
            KDist(i,t)=KDist(i,mink);
            KDist(i,mink)=temp;
        end
        hn(i) = prod(max(ht) - min(ht)); % get V size
    end
    % get probability density
    destr= k./(double(n(1)).*hn);

end

