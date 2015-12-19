function [m, sigma]=rand2gaussian(totle)
    R = zeros(1, totle + 1000);
    count = 0;
    while count < totle
        xl = fix(rand(1)*200)- 100 ;    % get random xu and xl
        xu = fix(rand(1)*200) - 100;
        n = fix(rand(1)*1000);            %get random number n
        if xu > xl
            T = unidrnd(xu-xl,1,n) + xl;
        else
            T = unidrnd(xl-xu,1,n) + xu;
        end
        R = [R(1:count),T];       % save the generate data sequences
        count =count + n;
    end
    R = R(1, 1:count);
    X = -100:5:100;
    figure(1)
    hist(R(1, :),X);
    %bar(a,b/count);
    m = mean(R(1, :));
    sigma = std(R(1, :));
end