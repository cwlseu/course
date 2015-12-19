% feature is a set will use in trainset
% for example: feature = [1 3], then we will only use trainset(:,1) and trainset(:,3)
function [KDist, knn, prob]=kNNE(n,trainset,m,test,k,feature)
	KDist=zeros(m, n);
	for i=1:1:m
 	    for t=1:1:n
 	        for j = feature
	            KDist(i,t)=KDist(i,t)+[test(i,j) - trainset(t,j)]^2;
	        end
	        KDist(i,t)=sqrt(KDist(i,t));
	    end
	end
	%sort and get the K Nearest Neighbor
	knn = zeros(m,k);
	for i=1:1:m
 	    for t=1:1:k
	        min=t;
	        for j=t+1:1:n
 	            if KDist(i,j)<KDist(i,min)
	                min=j;
	            end
            end
            train.id = min
           
	    	knn(i,t) = min;
            temp=KDist(i,t);
            KDist(i,t)=KDist(i,min);
            KDist(i,min)=temp;
	    end
    end
    
	prob = double(zeros(m,1));
	for i=1:1:m
        prob(i)= max(hist(knn(i,1:k)))/double(k);
	end
end

