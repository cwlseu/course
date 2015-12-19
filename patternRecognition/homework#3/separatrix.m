X = -5:0.1:5
Y1 = X
Y2 = 1-X
Y3 = zeros(101,1)
plot(X,Y1,X,Y2,X,Y3),xlabel('x1'), ylabel('x2'),legend('g1(x) = 0', 'g2(x) = 0', 'g3(x) = 0')

ylim([-5 5]);
xlim([-5 5]);