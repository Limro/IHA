% Problem 5-6.3

N = 200;  	% Antal samples
mu = 10;	% Den sande middelv�rdi af processen
sigma = 5;	% Den sande standard afvigelse af processen
variance = sigma^2;     % Den sande varians af processen
var_mu = variance/N     % Den sande varians af estimatet af middelv�rdien (=0.1250)
std_mu = sqrt(var_mu)   % Den sande standard afvigelsen af estimatet af middelv�rdien (=0.3536)

% Brug randn til at generere tilf�ldige normalfordelte data med middelv�rdi
% �mu� og standard afvigelse �sigma�. Se Example 1 i dokumentationen for randn
% >> doc randn
x = sigma*randn(1,N) + mu*ones(1,N);

% Plot
figure
plot(1:N,x,'k',...
     1:N,ones(1,N)*mu,'r',...
     1:N,ones(1,N)*(mu+sigma),'g',...
     1:N,ones(1,N)*(mu-sigma),'g',...
     1:N,ones(1,N)*(mu+var_mu),'b',...
     1:N,ones(1,N)*(mu-var_mu),'b')

% a) estimat af middelv�rdien (= gennemsnittet). Formel 5-8.
mu_est = sum(x)/N

% b) estimat af variansen. Formel 5-14.
var_est = sum(x.^2)/(N-1) - N/(N-1)*xmean^2

% c) Variansen af estimatet af middelv�rdien. Formel 5-13
var_mu_est = var_est/N

% c) Standard afvigelsen af estimatet af middelv�rdien:
std_mu_est = sqrt(var_mu_est)

