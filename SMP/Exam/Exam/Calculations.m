% plot

A = rand(1,3)*2-1;
B = rand(1,3);

N = 3;

t= 0 : 0.1 : 5;

figure
hold on; %bliv ved med at plotte

for i = 1:N
    X = A(i)*t+B(i)
    plot(t, X)
end
axis([0 2 0 2])
hold off;

%%
% Eksempel
clc, clear

N = 3;
%Normalfordeling, N(0,1): 0 = µ, 1 = standarafvigelsen
mu = 0;
sigma = 1;
A = randn(1,N)

% B ~N(2,4)
mu = 2;
sigma = sqrt(4);
B = randn(1,N)*sigma + mu

t= 0 : 0.1 : 5;

figure
hold on; %bliv ved med at plotte

for i = 1:N
    X = A(i)*t+B(i);
    plot(t, X)
end
hold off;



