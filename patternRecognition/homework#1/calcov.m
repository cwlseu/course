function [sigma] = calcov( M )
%Maximize likelihood envaluation for Matrix M
% M every line is a simple , the length of line is the number of features
% line number is the number of simple
    m = mean(M);
    s = size(M);
    CT = zeros(s(2));
    for i =1: 1 : s(1)
       CT = CT + (M(i,:)' - m')*(M(i,:)' - m')';
    end
    sigma = 1/s(1) * CT;
end

