% k������һ���ֶ�����
% X���������ԭʼ����
function [re] = spectralCluster(X, k)
    knn = 10;
    delta = 10;
    [W, D, L] = simples2MatriceAadjacence(X, knn, delta);
    % �����һ��Laplacian����
    Lsym = D^-0.5*L*D^-0.5;
    [m n] = size(W);
    [V, B] = eig(Lsym);
    B = diag(B);
    % ��ȡǰK������ֵ��Ӧ����������
    [value,index] = sort(B);
    indexs = index(1:k);
    U = [];
    for i = 1: k
        U = [U V(:,indexs(i))];
    end
    % ��һ������
    T = U./repmat(sqrt(sum(U.^2,2)),1,size(U,2));
    % K��ֵ����
    [u re]=k_means(T, k);
end
% ��������ʼ����ת��Ϊ���ƶȾ���ĺ���
% X ������Ĳ��������ŵ�����
% k ��ÿ����������ٵ���������
% delta�Ǽ������ƶ�Ȩ���еĲ���
% return ���ƶȾ��󣬶Ⱦ���Laplacian����
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