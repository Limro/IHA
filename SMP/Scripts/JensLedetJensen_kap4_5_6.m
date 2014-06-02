%% Eksempel 1 - den centrale gr�nsev�rdis�tning
%   Vi udtager "n" samples fra en normalfordelt population med middelv�rdi "mu"
%   og varians "sigma^2", og bruger gennemsnittet "mu_hat" som estimat af
%   middelv�rdien. Eksperimentet gentages 1000 gange, s� vi kan se p�
%   histogrammet (den empiriske t�thedsfunktion) for "mu_hat". If�lge den
%   centrale gr�nsev�rdis�tning, skal mu_hat v�re normalfordelt med samme
%   middelv�rdi som populationen, mens variansen skal v�re populationens
%   varians divideret med antal samples "n". 
mu      = 5;
sigma   = 2;
n       = 10;
num_experiments = 1000;
mu_hat  = zeros(1,num_experiments);
for i = 1:num_experiments
    x = randn(1,n)*sigma + mu;
    mu_hat(i) = mean(x);
end

% Histogram over estimatet af middelv�rdien (mu_hat)
x_bin = linspace(mu-2*sigma,mu+2*sigma,round(num_experiments/50));
histogram = hist(mu_hat,x_bin);

% Empirisk t�thedsfunktion for estimatet af middelv�rdien (mu_hat). 
dx = x_bin(2)-x_bin(1);
fx_empirical = histogram / num_experiments / dx;

% Teoretisk t�thedsfunktion for estimatet af middelv�rdien (mu_hat). Her
% bruger vi den centrale gr�nsev�rdis�tning, som siger, at mu_hat skal v�re
% normalfordelt med samme middelv�rdi som populationen, mens variansen
% er populationens varians divideret med antal samples "n".
var_muhat = sigma^2/n;
sigma_muhat = sqrt(var_muhat);
fx = normpdf(x_bin,mu,sigma_muhat);

% Plot
stem(x_bin,fx_empirical)
hold on
plot(x_bin,fx,'r')
hold off
xlabel('muhat')
ylabel('f_{muhat}')
legend('fx_{empirical}','fx_{theoretical}')


%% Eksempel 2 - den empiriske varians i normalfordelte data
%   Vi udtager "n" samples fra en normalfordeling med middelv�rdi "mu"
%   og varians "sigma^2", og bruger den empiriske varians s^2 
%   middelv�rdien. Eksperimentet gentages 1000 gange, s� vi kan se p�
%   histogrammet (den empiriske t�thedsfunktion) for "mu_hat".

%   Vi udtager "n" samples fra en normalfordelt population med middelv�rdi "mu"
%   og varians "sigma^2", og bruger den empiriske varians s^2 som estimat af
%   variansen. Eksperimentet gentages 1000 gange, s� vi kan se p�
%   histogrammet (den empiriske t�thedsfunktion) for s^2. If�lge teorien
%   skal s^2 v�re X^2 (Ki-i-anden) fordelt med n-1 frihedsgrader. Mere
%   pr�cist g�lder der, at 
%
%       s^2*(n-1)/sigma^2 ~ X^2(n-1)
%
%   (Se Jens Ledet Jensen, formel 6.12)
mu      = 5;
sigma   = 2;
n       = 10;
num_experiments = 1000;
s2      = zeros(1,num_experiments);
for i = 1:num_experiments
    x = randn(1,n)*sigma + mu;
    s2(i) = sum((x-mean(x)).^2)/(n-1);
end

% Histogram over estimatet af variansen (s^2)
s2_normalized = s2*(n-1)/sigma^2;
s2_bin = 0:ceil(max(s2_normalized));
histogram = hist(s2_normalized,s2_bin);

% Empirisk t�thedsfunktion for estimatet af variansen (s^2). 
ds2 = s2_bin(2)-s2_bin(1);
fs2_empirical = histogram / num_experiments / ds2;

% Teoretisk t�thedsfunktion for estimatet af variansen (s^2).
fs2 = chi2pdf(s2_bin,n-1);

% Plot
stem(s2_bin,fs2_empirical)
hold on
plot(s2_bin,fs2,'r')
hold off
xlabel('s^2*(n-1)/\sigma^2')
ylabel('f')
legend('fx_{empirical}','fx_{theoretical}')

%% Eksempel 3 - t-fordelingens konvergens mod standard normalfordelingen
f = [ 2 10 40 160 ];
x = linspace(-10,10,1000);
fx_gauss = normpdf(x);
for i = 1:length(f)
    fx_t(i,:) = tpdf(x,f(i));
end
plot(x,fx_t')
hold on
plot(x,fx_gauss,'k:')
hold off
xlabel('x')
ylabel('f_x')
legend('t_{pdf}(2)','t_{pdf}(10)','t_{pdf}(40)','t_{pdf}(160)','\phi(0,1)')

%% Eksempel 4 - t-test: jordens massefylde
% Tabel 6.1: Henry Cavendishs m�linger af jordens masset�thed i 1797.
x = [ 5.36 5.29 5.58 5.65 5.57 5.53 5.62 5.29 ...
      5.44 5.34 5.79 5.10 5.27 5.39 5.42 5.47 ...
      5.63 5.34 5.46 5.30 5.75 5.68 5.85 ];
n = length(x);
mu0 = 5.517;
s2 = var(x)

% Testst�rrelse
x_hat = mean(x)
t = (x_hat-mu0)/sqrt(s2/n)
pval = 2*(1-tcdf(abs(t),n-1))

% 95% konfidensinterval
t0 = tinv(0.975,n-1)
mu_nedre = x_hat - t0*sqrt(s2/n)
mu_oevre = x_hat + t0*sqrt(s2/n)

%% Eksempel 5 - QQ plot
qqplot(x)
