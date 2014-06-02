%% Eksempel 1 - sammenligning af to middelværdier (kendt varians)
mu1 = 3;
n1  = 20;
mu2 = 4;
n2  = 10;
sigma = 1;
u   = 1.96;

% Data
x1 = randn(1,n1)*sigma + mu1;
x2 = randn(1,n2)*sigma + mu2;

% Parameterskøn
x1_bar = mean(x1);
x2_bar = mean(x2);

% Teststørrelse (H: mu1 = mu2)
z = (x1_bar-x2_bar)/(sigma*sqrt(1/n1+1/n2))
pval = 2*(1-normcdf(abs(z)))

% 95% konfidensinterval
d_nedre = x1_bar-x2_bar - u*sigma*sqrt(1/n1+1/n2)
d_oevre = x1_bar-x2_bar + u*sigma*sqrt(1/n1+1/n2)

figure
plot(1,x1,'b.',2,x2,'r.',1,x1_bar,'b+',2,x2_bar,'r+')
axis([0.5 2.5 1.1*min([x1 x2]) 1.1*max([x1 x2])])

%% Eksempel 2 - sammenligning af to middelværdier (ukendt varians)
mu1 = 3;
n1  = 20;
mu2 = 4;
n2  = 10;
sigma = 1;

% Data
x1 = randn(1,n1)*sigma + mu1;
x2 = randn(1,n2)*sigma + mu2;

% Parameterskøn
x1_bar  = mean(x1);
x2_bar  = mean(x2);
s2_1    = var(x1)
s2_2    = var(x2)
s2      = 1/(n1+n2-2)*((n1-1)*s2_1+(n2-1)*s2_2)
s       = sqrt(s2)

% Teststørrelse (H: mu1 = mu2)
t = (x1_bar-x2_bar)/(s*sqrt(1/n1+1/n2))
pval = 2*(1-tcdf(abs(t),n1+n2-2))

% 95% konfidensinterval
t0 = tinv(0.975,n1+n2-2)
d_nedre = x1_bar-x2_bar - t0*s*sqrt(1/n1+1/n2)
d_oevre = x1_bar-x2_bar + t0*s*sqrt(1/n1+1/n2)

figure
plot(1,x1,'b.',2,x2,'r.',1,x1_bar,'b+',2,x2_bar,'r+')
axis([0.5 2.5 1.1*min([x1 x2]) 1.1*max([x1 x2])])


%% Eksempel 3 - effekt af akupunkter på graden af åndenød
% Akupunktur gruppe
x1_before = [ 0.25 1.00 1.33 2.00 2.25 2.33 3.00 3.33 3.75 4.00 ...
              4.25 5.00 5.00 5.50 5.67 6.00 6.50 7.25 9.25 ];
x1_after  = [ 0.00 1.00 2.00 1.00 3.00 0.50 3.00 2.25 2.25 3.00 ...
              4.00 5.00 4.50 3.67 2.75 5.25 6.00 5.67 9.00 ];
x1_effect = x1_before - x1_after;
% Placebo gruppe
x2_before = [ 0.00 0.50 0.67 1.00 1.33 2.00 2.50 3.25 4.33 4.33 ...
              4.50 7.33 7.75 8.25 ];
x2_after  = [ 0.00 0.00 0.00 0.00 0.00 2.50 2.50 1.00 2.75 3.50 ...
              1.33 7.25 7.00 6.00 ];
x2_effect = x2_before - x2_after;

n1 = length(x1_effect);
n2 = length(x2_effect);
          
% Parameterskøn
x1_bar  = mean(x1_effect)
x2_bar  = mean(x2_effect)
s2_1    = var(x1_effect)
s2_2    = var(x2_effect)
s2      = 1/(n1+n2-2)*((n1-1)*s2_1+(n2-1)*s2_2)
s       = sqrt(s2)

% Teststørrelse (H: mu1 = mu2)
t = (x1_bar-x2_bar)/(s*sqrt(1/n1+1/n2))
pval = 2*(1-tcdf(abs(t),n1+n2-2))

% 95% konfidensinterval
t0 = tinv(0.975,n1+n2-2)
d_nedre = x1_bar-x2_bar - t0*s*sqrt(1/n1+1/n2)
d_oevre = x1_bar-x2_bar + t0*s*sqrt(1/n1+1/n2)

figure
plot(1,x1_effect,'b.',2,x2_effect,'r.',1,x1_bar,'b+',2,x2_bar,'r+')
axis([0.5 2.5 1.1*min([x1_effect x2_effect]) 1.1*max([x1_effect x2_effect])])
          

%% Eksempel 3 - effekt af akupunkter på graden af åndenød (uparrede data)
% Akupunktur gruppe
x1_before = [ 0.25 1.00 1.33 2.00 2.25 2.33 3.00 3.33 3.75 4.00 ...
              4.25 5.00 5.00 5.50 5.67 6.00 6.50 7.25 9.25 ];
x1_after  = [ 0.00 1.00 2.00 1.00 3.00 0.50 3.00 2.25 2.25 3.00 ...
              4.00 5.00 4.50 3.67 2.75 5.25 6.00 5.67 9.00 ];
x1_effect = x1_before - x1_after;
% Placebo gruppe
x2_before = [ 0.00 0.50 0.67 1.00 1.33 2.00 2.50 3.25 4.33 4.33 ...
              4.50 7.33 7.75 8.25 ];
x2_after  = [ 0.00 0.00 0.00 0.00 0.00 2.50 2.50 1.00 2.75 3.50 ...
              1.33 7.25 7.00 6.00 ];
x2_effect = x2_before - x2_after;

n1 = length(x1_effect);
n2 = length(x2_effect);
          
% Parameterskøn
x1_bar  = mean(x1_effect)
x2_bar  = mean(x2_effect)
s2_1    = var(x1_effect)
s2_2    = var(x2_effect)
s2      = 1/(n1+n2-2)*((n1-1)*s2_1+(n2-1)*s2_2)
s       = sqrt(s2)

% Teststørrelse (H: mu1 = mu2)
t = (x1_bar-x2_bar)/(s*sqrt(1/n1+1/n2))
pval = 2*(1-tcdf(abs(t),n1+n2-2))

% 95% konfidensinterval
t0 = tinv(0.975,n1+n2-2)
d_nedre = x1_bar-x2_bar - t0*s*sqrt(1/n1+1/n2)
d_oevre = x1_bar-x2_bar + t0*s*sqrt(1/n1+1/n2)

figure
plot(1,x1,'b.',2,x2,'r.',1,x1_bar,'b+',2,x2_bar,'r+')
axis([0.5 2.5 1.1*min([x1 x2]) 1.1*max([x1 x2])])


%% Eksempel 4 - illustration af personeffekt i graden af åndenød
figure
plot(x1_before,x1_after,'bo',x2_before,x2_after,'r+',-1:9,-1:9,'k')
axis([-1 9 -1 9])
xlabel('Grad af åndenød før behandling')
ylabel('Grad af åndenød efter behandling')
legend('Akupunktur','Placebo')


%% Eksempel 5 - Markforsøg: uparret sammenligning
data = [
    8.0 5.6 2.4
    8.4 7.4 1.0
    8.0 7.3 0.7
    6.4 6.4 0.0
    8.6 7.5 1.1
    7.7 6.1 1.6
    7.7 6.6 1.1
    5.6 6.0 -0.4
    5.6 5.5 0.1
    6.2 5.5 0.7 ];
x1 = data(:,1);
x2 = data(:,2);

n1 = length(x1);
n2 = length(x2);

% Parameterskøn
x1_bar  = mean(x1);
x2_bar  = mean(x2);
s2_1    = var(x1)
s2_2    = var(x2)
s2      = 1/(n1+n2-2)*((n1-1)*s2_1+(n2-1)*s2_2)
s       = sqrt(s2)

% Teststørrelse (H: mu1 = mu2)
t = (x1_bar-x2_bar)/(s*sqrt(1/n1+1/n2))
pval = 2*(1-tcdf(abs(t),n1+n2-2))

% 95% konfidensinterval
t0 = tinv(0.975,n1+n2-2)
d_nedre = x1_bar-x2_bar - t0*s*sqrt(1/n1+1/n2)
d_oevre = x1_bar-x2_bar + t0*s*sqrt(1/n1+1/n2)


%% Eksempel 6 - Markforsøg: parret sammenligning
data = [
    8.0 5.6 2.4
    8.4 7.4 1.0
    8.0 7.3 0.7
    6.4 6.4 0.0
    8.6 7.5 1.1
    7.7 6.1 1.6
    7.7 6.6 1.1
    5.6 6.0 -0.4
    5.6 5.5 0.1
    6.2 5.5 0.7 ];
x1 = data(:,1);
x2 = data(:,2);
d = x1-x2;

n = length(d);

% Parameterskøn
d_bar   = mean(d)
sd2     = var(d)
sd      = sqrt(s2)

% Teststørrelse (H: mu1 = mu2)
t = d_bar/(sd*sqrt(1/n))
pval = 2*(1-tcdf(abs(t),n-1))

% 95% konfidensinterval
t0 = tinv(0.975,n-1)
d_nedre = d_bar - t0*sd*sqrt(1/n)
d_oevre = d_bar + t0*sd*sqrt(1/n)
