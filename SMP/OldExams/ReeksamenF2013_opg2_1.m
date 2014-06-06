
% ReeksamenF2013 opg. 2.1
N = 10;

% A~U(-1,1)
A = rand(1,N)*2 - 1;
% A = [ -0.5 0 0.5 ];

% B~U(-2,2)
B = rand(1,N)*4 - 2;
% B = [ -1.5 0.1 1.4 ];

t = 0:0.1:5;

figure
hold on
for i = 1:N
    X = A(i)*t+B(i);
    plot(t,X)
end
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksempel med normalfordeling
%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 3;

% A~N(0,1)
mu = 0;
sigma = 1; % Standardafvigelsen (ikke variansen!)
A = randn(1,N);

% B~N(2,4)
mu = 2;
sigma = sqrt(4); % Standardafvigelsen (ikke variansen!)
B = randn(1,N)*sigma + mu;

t = 0:0.1:5;

figure
hold on
for i = 1:N
    X = A(i)*t+B(i);
    plot(t,X)
end
hold off
