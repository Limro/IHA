%% Eksempel 1 - Uniform fordeling for st�rrelsen af en tr�plade.
%   Marginale t�thedsfunktioner:
%       fx(x) = U(9.5,10.5)
%       fy(y) = U(9.5,10.5);
%   Simultan t�thedsfunktion:
%       f(x,y) = fx*fy;
%
x=0:0.1:20;
y=0:0.1:20;
non_zero_indexes = find(x>=9.5 & x<=10.5);

% fx
fx = zeros(length(x));
fx(non_zero_indexes) = 1;
% Normalisering
fx = fx/sum(fx);

% fy
fy = zeros(length(y));
fy(non_zero_indexes) = 1;
% Normalisering
fy = fy/sum(fy);

% f(x,y);
f = fx*fy';

% Fordelingsfunktion
F = zeros(size(f));
for i = 1:size(f,1)
    for j = 1:size(f,2)
        F(i,j)=sum(sum(f(1:i,1:j)));
    end
end

% Plot
plot_ix = non_zero_indexes(1)-10:non_zero_indexes(end)+10;
figure
subplot(1,2,1)
mesh(x(plot_ix),y(plot_ix),f(plot_ix,plot_ix))
xlabel('X')
ylabel('Y');
zlabel('f(x,y)')
title('T�thedsfunktion')
subplot(1,2,2)
mesh(x(plot_ix),y(plot_ix),F(plot_ix,plot_ix))
xlabel('X')
ylabel('Y');
zlabel('F(x,y)')
title('Fordelingsfunktion')

%% Eksempel 2 - Bivariat Gaussian
%   Marginale t�thedsfunktioner:
%       fx(x) = N(mu_x,sigma_x)
%       fy(y) = N(mu_y,sigma_y)
%   Korrelation
%       -1 <= rho <= 1
%   Simultan t�thedsfunktion:
%       f(x,y) = 1/(2*pi*sigma_x*sigma_y*sqrt(1-rho^2))*...
%                exp(-1/(2*(1-rho^2))*( (x-mu_x)^2/sigma_x^2) + (y-mu_y)^2/sigma_y^2) - (2*rho*(x-mu_x)*(y-mu_y))/(sigma_x*sigma_y) );
%
%   Wikipedia:
%   http://en.wikipedia.org/wiki/Multivariate_normal_distribution
%
mu_x = 0;
mu_y = 0;
sigma_x = 1;
sigma_y = 1;
rho = 0.0;  % Korrelationskoefficient (pr�v selv at s�tte den til 0.8)
N = 101;

x=linspace(mu_x-2*sigma_x^2,mu_x+2*sigma_x^2,N);
y=linspace(mu_y-2*sigma_y^2,mu_y+2*sigma_y^2,N);

% Simultan t�thedsfunktion, f(x,y):
f = 1/(2*pi*sigma_x*sigma_y*sqrt(1-rho^2)) *...
    exp( -1/(2*(1-rho^2)) * ( (repmat(x',1,N)-mu_x).^2./sigma_x^2 + ...
                             (repmat(y,N,1)-mu_y).^2./sigma_y^2 - ...
                             (2*rho*(x'-mu_x)*(y-mu_y))/(sigma_x*sigma_y) ) ...
       );
% Normalisering
f = f/sum(f(:));

% Simultan fordelingsfunktion
F = zeros(size(f));
for i = 1:size(f,1)
    for j = 1:size(f,2)
        F(i,j)=sum(sum(f(1:i,1:j)));
    end
end

% Plot
figure
subplot(1,2,1)
mesh(x,y,f)
xlabel('X')
ylabel('Y');
zlabel('f(x,y)')
title('T�thedsfunktion')
subplot(1,2,2)
mesh(x,y,F)
xlabel('X')
ylabel('Y');
zlabel('F(x,y)')
title('Fordelingsfunktion')

% Marginale t�thedsfunktioner
fx = sum(f,2);
fy = sum(f,1);

% Marginale fordelingsfunktioner
Fx = F(:,end);
Fy = F(end,:);

% Betingede t�thedsfunktioner
x_eval = x(round(2/3*N)); % x = et punkt til h�jre for middelv�rdien
y_eval = y(ceil(N/2));    % y = middelv�rdien
xi = find(x==x_eval);
yi = find(y==y_eval);
fx_givet_y = f(:,yi)/fy(yi);
fy_givet_x = f(xi,:)/fx(xi);

figure
mesh(x,y,f)
hold on
plot3(ones(size(y))*x_eval,y,f(xi,:),'k.-')
hold off
xlabel('X')
ylabel('Y');
zlabel('f(x,y)')
title(['Betinget t�thed f(y|x=' num2str(x_eval) ')'])

figure
mesh(x,y,f)
hold on
plot3(x,ones(size(x))*y_eval,f(:,yi),'k.-')
hold off
xlabel('X')
ylabel('Y');
zlabel('f(x,y)')
title(['Betinget t�thed f(x|y=' num2str(y_eval) ')'])

% Plot marginale, betingede og simultane t�thedsfunktioner og check uafh�ngighed
figure,
subplot(2,2,1)
plot(x,fx,x,fx_givet_y)
xlabel('X'),ylabel('fx'),title(['Betinget t�thed vs marginal t�thed (y=' num2str(y_eval) ')']),legend('Marginal f_x','Betinget f(x|y)')
subplot(2,2,2)
plot(x,f(:,yi),x,fx*fy(yi))
xlabel('X'),ylabel('fx'),title('Simultan t�thed vs produkt af marginale t�theder'),legend('Simultan f(x,y)','Produkt f_x(x)*f_y(y)')
subplot(2,2,3)
plot(y,fy,y,fy_givet_x)
xlabel('Y'),ylabel('fy'),title(['Betinget t�thed vs marginal t�thed (x=' num2str(x_eval) ')']),legend('Marginal f_y','Betinget f(y|x)')
subplot(2,2,4)
plot(y,f(xi,:),y,fx(xi)*fy)
xlabel('Y'),ylabel('fy'),title('Simultan t�thed vs produkt af marginale t�theder'),legend('Simultan f(x,y)','Produkt f_x(x)*f_y(y)')

%% Eksempel 3 - Hvor er robotten?
% T�thedsfunktion for usikkerhed (st�j n) p� positionsm�ling
n       = -50:50;
sigma_n = 5;
mu_n    = 0;
fn      = 1/(sqrt(2*pi)*sigma_n)*exp(-(n-mu_n).^2./(2*sigma_n^2));
fn      = fn/sum(fn);

% T�thedsfunktion for initiel position (sand position x)
x   = 0:100;
fx  = ones(size(x));
fx  = fx/sum(fx);

% Initiel positionsm�ling (m�lt position y)
y       = 23;
xtrue   = 20;
noise   = y - xtrue;

% Betinget t�thed - hvad er det bedste bud p� x, givet m�lingen y?
% Implementation af formel 3-17 i bogen
% 1) F�rst beregnes produktet fn(y-x)*fx(x) for alle x.
%       Resultat gemmes i variablen, prod_fn_fx
% 2) Dern�st beregnes den betingede sandsynlighed for alle x (formel 3-17).
%       Resultat gemmes i variablen, f_x_given_y
integration_indexes = zeros(size(x));
prod_fn_fx = zeros(size(x));
for xi = 1:length(x)
    n_current = y - x(xi);
    n_i = find(n==n_current);
    if not(isempty(n_i))
        prod_fn_fx(xi) = fn(n_i)*fx(xi);
        integration_indexes(xi)=1;
    end
end
f_x_given_y = zeros(size(fx));
for xi = 1:length(x)
    if integration_indexes(xi)==1
        f_x_given_y(xi) = prod_fn_fx(xi)/sum(prod_fn_fx);
    end
end
plot(x,fx,...
     x,f_x_given_y,...
     [xtrue xtrue],[0 max(f_x_given_y)])
axis([0 max(x) 0 max([0.5 max(f_x_given_y)])])
xlabel('Position X');
ylabel('Sandsynlighed')
legend('A priori t�thedsfunktion for positionen (f�r m�ling)',...
       'A posteriori t�thedsfunktion for positionen (efter m�lingen)',...
       'Den sande posiion',...
       'Location','NorthOutside');
pause

% Lad os se, hvad der sker, n�r robotten begynder at bev�ge sig. I hver
% iteration g�r robotten �t skridt til h�jre:
%
%       xtrue = xtrue+1;
%
% Bem�rk, at n�r vi m�ler den nye position (m�ling = y), s� er der st�j!
%
% Vores nye a priori estimat for robottens position er givet ved a
% posteriori estimatet for det forrige tidsskridt. Bem�rk, at vi m�
% opdatere dette det nye a priori estimat, s� vi tager h�jde for
% bev�gelsen. Dette g�res ved at "shifte" t�thedsfunktionen �t skridt til
% h�jre (svarende til bev�gelsen).

% Dette er vores nye a priori estimat for positionen. Effekten af
% foldningen er at shifte a posteriori estimatet fra det forrige
% tidsskridt �t skridt til h�jre (tjek selv...).
fx = conv(f_x_given_y,[0 0 1],'same');

% Vi k�rer nu 50 tidsskridt
for step = 1:50
    
    % Opdater den sande position
    xtrue = xtrue+1;
    
    % Simuler en ny m�ling med st�j!
    noise = round(randn(1)*sigma_n);
    y = xtrue + noise;
    
    % Beregn den betingede t�thedsfunktion for positionen x, givet m�lingen
    % y. Koden er copy-pastet fra f�r
    integration_indexes = zeros(size(x));
    prod_fn_fx = zeros(size(x));
    for xi = 1:length(x)
        n_current = y - x(xi);
        n_i = find(n==n_current);
        if not(isempty(n_i))
            prod_fn_fx(xi) = fn(n_i)*fx(xi);
            integration_indexes(xi)=1;
        end
    end
    f_x_given_y = zeros(size(fx));
    for xi = 1:length(x)
        if integration_indexes(xi)==1
            f_x_given_y(xi) = prod_fn_fx(xi)/sum(prod_fn_fx);
        end
    end
    
    % Plot det nye estimat
    plot(x,fx,x,f_x_given_y,[xtrue xtrue],[0 max(f_x_given_y)])
    axis([0 max(x) 0 max([0.5 max(f_x_given_y)])])
    xlabel('Position X');
    ylabel('Sandsynlighed')
    legend('A priori t�thedsfunktion for positionen (f�r m�ling)',...
           'A posteriori t�thedsfunktion for positionen (efter m�lingen)',...
           'Den sande posiion',...
           'Location','NorthOutside');
    pause
    
    % Opdater a priori estimatet for positionen
    fx = conv(f_x_given_y,[0 0 1],'same');
end


%% Eksempel 4 - Sum af stokastiske variable (foldning)
% Uniform fordeling
funiform = ones(1,10)/10;
f = funiform;
subplot(3,3,1)
plot(f)
title('Number of terms: 1')
axis([0 length(f) 0 1.1*max(f)])
for iteration = 1:8
    f = conv(f,funiform);
    subplot(3,3,iteration+1)
    plot(f);
    title(['Number of terms: ' num2str(iteration+1)])
    axis([0 length(f) 0 1.1*max(f)])
end

% Random fordeling
frandom = rand(1,10);
frandom = frandom/sum(frandom);
f = frandom;
subplot(3,3,1)
plot(f)
title('Number of terms: 1')
axis([0 length(f) 0 1.1*max(f)])
for iteration = 1:8
    f = conv(f,frandom);
    subplot(3,3,iteration+1)
    plot(f);
    title(['Number of terms: ' num2str(iteration+1)])
    axis([0 length(f) 0 1.1*max(f)])
end
