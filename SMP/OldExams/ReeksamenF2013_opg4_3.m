x = [ 1 2 3 4 5 6 7 8 9 11 ];
y = [ 37.00 36.25 35.41 34.92 34.52 34.45 34.40 34.00 33.62 33.90 ];

t = x;
x = y;
n = length(t)

% plot
plot(t,x,'.')

% Parameterskøn
beta_hat = sum((t-mean(t)).*(x-mean(x)))/sum((t-mean(t)).^2)    % Hældning
gamma_hat = mean(x) - beta_hat*mean(t)                         % Skæring

tplot = [ 0 12 ]
xplot = beta_hat*tplot + gamma_hat

% plot
plot(t,x,'.',tplot,xplot)

% Residual plot
res = x - (beta_hat*t + gamma_hat)
plot(beta_hat*t+gamma_hat,res,'.')

% 95% konfidensinterval for hældningen
sr2 = sum((x-(gamma_hat+beta_hat*t)).^2)/(n-2)                 % Varians
sr = sqrt(sr2)
t0 = tinv(0.975,n-2)
beta_nedre = beta_hat - t0*sr*sqrt(1/sum((t-mean(t)).^2))
beta_oevre = beta_hat + t0*sr*sqrt(1/sum((t-mean(t)).^2))

