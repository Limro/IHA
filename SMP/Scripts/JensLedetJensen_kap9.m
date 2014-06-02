%% Eksempel 1 - Lineær regression - Hubble's målinger
Afstand = [ 0.032 0.034 0.214 0.263 0.275 0.275 0.450 0.500 ...
            0.500 0.630 0.800 0.900 0.900 0.900 0.900 1.000 ...
            1.100 1.100 1.400 1.700 2.000 2.000 2.000 2.000 ];

Hastighed = [ 170 290 -130 -70 -185 -220 200 290 ...
              270 200 300 -30 650 150 500 920 ...
              450 500 500 960 500 850 800 1090 ];
          
% Plot data
figure
scatter(Afstand,Hastighed)
xlabel('Afstand')
ylabel('Hastighed')

t = Afstand;
x = Hastighed;
n = length(t)

% Parameterskøn
beta_hat = sum((t-mean(t)).*(x-mean(x)))/sum((t-mean(t)).^2)    % Hældning
lambda_hat = mean(x) - beta_hat*mean(t)                         % Skæring
sr2 = sum((x-(lambda_hat+beta_hat*t)).^2)/(n-2)                 % Varians
sr = sqrt(sr2)

% Plot den fittede linje
figure
t_min = min(t);
t_max = max(t);
scatter(t,x)
hold on
plot([t_min t_max],[lambda_hat+beta_hat*t_min lambda_hat+beta_hat*t_max],'r')
hold off
xlabel('Afstand')
ylabel('Hastighed')

% Hypotesetest for hældningen (H: beta = 57)
beta0 = 57;
t_teststoerrelse = (beta_hat-beta0)/(sr*sqrt(1/sum((t-mean(t)).^2)))
pval = 2*(1-tcdf(abs(t_teststoerrelse),n-2))

% 95% konfidensinterval for hældningen
t0 = tinv(0.975,n-2)
beta_nedre = beta_hat - t0*sr*sqrt(1/sum((t-mean(t)).^2))
beta_oevre = beta_hat + t0*sr*sqrt(1/sum((t-mean(t)).^2))

% Hypotesetest for skæringen (H: lambda = 0)
lambda0 = 0;
t_teststoerrelse = (lambda_hat-lambda0)/(sr*sqrt(1/n+mean(t)^2/sum((t-mean(t)).^2)))
pval = 2*(1-tcdf(abs(t_teststoerrelse),n-2))

% 95% konfidensinterval for skæringen
t0 = tinv(0.975,n-2)
lambda_nedre = lambda_hat - t0*sr*sqrt(1/n+mean(t)^2/sum((t-mean(t)).^2))
lambda_oevre = lambda_hat + t0*sr*sqrt(1/n+mean(t)^2/sum((t-mean(t)).^2))

% Residualtegning
figure
scatter(t,x-(lambda_hat+beta_hat*t))
hold on
plot([t_min t_max],zeros(1,2))
hold off
xlabel('t_i')
ylabel('Residualer (r_i)')
