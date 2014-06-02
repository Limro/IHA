%% Eksempel 1 - middelværdien af alderen af universitetsstuderende

% Sand middelværdi og std. afvigelse
mu      = 24;
sigma   = 3;

% Samplede data
n       = 40;
x       = randn(1,n)*sigma + mu;

% Gennemsnit
xhat    = mean(x);

% Teststørrelse
mu_hyp = 50;
z = (xhat-mu_hyp)/(sigma/sqrt(n))

% Hypotese
zrange  = -3:0.1:3;
fz      = normpdf(zrange);

figure
plot(z,normpdf(z),'r.',...
     zrange,fz,'-')
xlabel('z')
ylabel('f_z(z)')

%% Mendels eksperiment
n = 580;    % Antal planter
p = 1/4;    % Sandsynlighed for gul bælg (under hypotesen)
x = 152;    % Mendels observation
num_sim = 100;
antal_gule_planter = zeros(1,num_sim);
for i = 1:num_sim
    counter = 0;
    for plante = 1:580
        if rand(1)<=p
            counter = counter + 1;
        end
    end
    antal_gule_planter(i) = counter;
end
plot(1:num_sim,antal_gule_planter,'.',...
     1:num_sim,ones(1,num_sim)*n*p,...
     1:num_sim,ones(1,num_sim)*x,':')
xlabel('Simuleret eksperiment nummer')
ylabel('Antal gule bælge')
legend('Resultat af simulation','Hypotese','Mendels observation')
find(antal_gule_planter>x)

%% Tæthedsfunktion i Mendels ærteeksperiment
n = 580;
p = 1/4;
x = 0:n;
fx = binopdf(x,n,p);    % Tæthedsfunktion
bar(x,fx);
xlabel('x = antal successer');
ylabel('f_x(x) = sandsynlighed');

%% P-værdi
n = 580;
p = 1/4;
x = 152;    % Observation
lower = n*p-abs(n*p-x)
upper = n*p+abs(n*p-x)
pval = binocdf(lower,n,p) + (1 - binocdf(upper,n,p))

%% Approksimativ P-værdi
n = 580;
p = 1/4;
x = 152;    % Observation
lower = n*p-abs(n*p-x)
upper = n*p+abs(n*p-x)
z_lower = (lower-n*p)/sqrt(n*p*(1-p))
z_upper = (upper-n*p)/sqrt(n*p*(1-p))
pval = normcdf(z_lower) + (1 - normcdf(z_upper))
