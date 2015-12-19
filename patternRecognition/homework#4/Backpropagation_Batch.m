function [J, Wh, Wo] = Backpropagation_Batch(train_features, train_targets, Nh, Theta, eta)

% Classify using a backpropagation network with a batch learning algorithm
% Inputs:
% 	features- Train features
%	targets	- Train targets
%	Nh  - Number of hidden units 
%   Theta - Convergence criterion
%   eta - Convergence rate
%
% Outputs
%   Wh          - Hidden unit weights
%   Wo          - Output unit weights

iter	= 0;
DispIter = 10;

[Ni, M] = size(train_features);
No		  = 1;

train_targets = (train_targets>0)*2-1;
means			  = mean(train_features')';
train_features= train_features - means*ones(1,M);

%Initialize the net: In this implementation there is only one output unit, so there
%will be a weight vector from the hidden units to the output units, and a weight matrix
%from the input units to the hidden units.
%The matrices are defined with one more weight so that there will be a bias
w0		= max(abs(std(train_features')'));
Wh		= rand(Nh, Ni+1).*w0*2-w0;  %Hidden weights
Wo		= rand(No,  Nh+1).*w0*2-w0; %Output weights

Wo    = Wo/mean(std(Wo'))*(Nh+1)^(-0.5);
Wh    = Wh/mean(std(Wh'))*(Ni+1)^(-0.5);

rate	= 10*Theta;
J       = 1e3;

while (rate > Theta),
    deltaWo	= 0;
    deltaWh	= 0;
    
    for m = 1:M,
        Xm = train_features(:,m);
        tk = train_targets(m);
        
        %Forward propagate the input:
        %First to the hidden units
        gh		= Wh*[Xm; 1];
        [y, dfh]= activation_tanh(gh);
        %Now to the output unit
        go			= Wo*[y; 1];
        [zk, dfo]	= activation_sigmoid(go);
        
        %Now, evaluate delta_k at the output: delta_k = (tk-zk)*f'(net)
        delta_k		= (tk - zk).*dfo;
        
        %...and delta_j: delta_j = f'(net)*w_j*delta_k
        delta_j		= dfh'.*Wo(1:end-1).*delta_k;
        
        %delta_w_kj <- w_kj + eta*delta_k*y_j
        deltaWo		= deltaWo + eta*delta_k*[y;1]';
        
        %delta_w_ji <- w_ji + eta*delta_j*[Xm;1]
        deltaWh		= deltaWh + eta*delta_j'*[Xm;1]'; 
    end
    %w_kj <- w_kj + eta*delta_Wo
    Wo	= Wo + deltaWo;  
    %w_ji <- w_ji + eta*delta_Wh
    Wh	= Wh + deltaWh;
    %Calculate total error
    OldJ  = J;
    J     = 0;
    for i = 1:M,
        J = J + (train_targets(i) - activation_sigmoid(Wo*[activation_tanh(Wh*[train_features(:,i); 1]); 1])).^2;
    end
    J     = J/M; 
    rate  = abs(J - OldJ)/OldJ*100;
    iter 			= iter + 1;

    if (iter/DispIter == floor(iter/DispIter)),
        disp(['Iteration ' num2str(iter) ': Total error is ' num2str(J)])
    end 
end

disp(['Backpropagation converged after ' num2str(iter) ' iterations.'])

function [f, df] = activation_tanh(x)
    f	= tanh(x);
    df	= sech(x).^2;
function [f, df] = activation_sigmoid(x)
    f  = 1/(1+ exp(-x));
    df = (1 - f)*f;
