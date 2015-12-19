% k是数据一共分多少类
% X是输入的是原始数据
function [re] = spectralCluster(X, k)
    knn = 10;
    delta = 10;
    [W, D, L] = simples2MatriceAadjacence(X, knn, delta);
    % 计算归一化Laplacian矩阵
    Lsym = D^-0.5*L*D^-0.5;
    [m n] = size(W);
    [V, B] = eig(Lsym);
    B = diag(B);
    % 获取前K个特征值对应的特征向量
    [value,index] = sort(B);
    indexs = index(1:k);
    U = [];
    for i = 1: k
        U = [U V(:,indexs(i))];
    end
    % 归一化矩阵
    T = U./repmat(sqrt(sum(U.^2,2)),1,size(U,2));
    % K均值聚类
    [u re]=k_means(T, k);
end
% 用来将初始数据转换为相似度矩阵的函数
% X 是输入的不带分类标号的数据
% k 是每个样本与多少点相似连接
% delta是计算相似度权重中的参数
% return 相似度矩阵，度矩阵，Laplacian矩阵
function [W, D, L] = simples2MatriceAadjacence(X, k, delta)
    [m n] = size(X);
    dist = zeros(m,m);
    W = zeros(m,m);
    D = zeros(m,m);
    k = 3;
    delta = 10;
    for i = 1: m
        for j = 1 : m
            dist(i,j) = sum((X(i,:) - X(j,:)).^2);
        end
    end
    for j = 1: m
        [value,index] = sort(dist(:,j));
        indexs = index(1:k+1);
        for i = 1:k+1
            if indexs(i) ~= j
                t = dist(j,indexs(i))/(2*delta*delta);
                W(j,indexs(i)) = exp(-t);
            end
        end
    end
    for j = 1:m
        for d = sum(W)
            D(j,j) = d;
        end
    end
    L = D - W;
end