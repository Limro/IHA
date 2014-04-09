clc, clear
%Chapter 2

%% 2-1.2
% a
% Diskret (absolutte værdier), 2-12

%b
% Continuous (no absolutte vædier),  0-12V

% c
% Diskret, 0000 0000 - 9999 9999

% d
% Kontinuært, 50 -150 kg

%% 2-2.2
clc
% syms x;
% 
% fsteps = -2:0.1:-1.1;
% ssteps = -1:0.1:1;
% tsteps = 1.1:0.1:2;
% fp = zeros(1,10);
% sp = 0.5+0.5.*ssteps;
% tp = ones(1,10);
% 
% fSteps = horzcat( fsteps, ssteps, tsteps);
% fX = horzcat(fp,sp,tp);

% plot(fSteps, fX)
% hold on;
% axis = [-2, 2, 0 1.5];

% a
% Pr(X = 1/4) = 0 ... sådan er det altid

% b
% Pr(x > 3/4) = 1 - Pr(X <= x) = 1- F_X(x)

func = @(x) 0.5+0.5 .* x;
Pr_x = 1 - integral(func, -1, 3/4)

% c
% Mellem -0.5 < x <= 0.5
Pr_x2 = integral(func,-1,0.5) - integral(func,-1,-0.5)

%% 2-2.3
% a) For what value of A is this a valid probability distributed function

% A{1- exp(-(x-1))}. F_X = 1 => A{1-0} = 0

% b) F_X(2)
fun = @(x) 1-exp(-(x-1));
b = fun(2)

% c) between 2 < X < inf
c = fun(inf)-fun(2)

% d) 1 < X <= 3
d = fun(3)-fun(1)

%% 2-3.2
clc, clear
syms x
f = diff(1-exp(-(x-1)),x)

t = 0.1 : 0.1 : 10;
f1 = subs(f, x, t); %Replace sym, x, with real values, t

% plot(t,f1) 
% hold on
% grid on
% axis([0, 6, 0, 3])

format long
% b) Pr(2 < X <=3)
b = int(f,x,2,3)

% c) less than 2
c = int(f,x,1,2)

%% 2-3.3
clear, clc
fx = @(x) exp(-2*abs(x)); % from -inf < x < inf

syms x;
fx = exp(-2*x);
fy = fx.^2;
dx = diff(fx)
dy = diff(fy)
dydx = dy./dx
dxdy = dx./dy

plotfigure(x,y)

syms x y;
fxSym = exp(-2*abs(x));
fy = diff(fxSym)


%% 2-4.1
clc, clear 
% A{1- exp(-(x-1))}. F_X = 1 => A{1-0} = 0

% a) F_X(2)
Fx = @(x) 1-exp(-(x-1));

syms x;
fxS = subs(diff(Fx,x));
a = int(x*fxS, x, 1, Inf)


% b)
%b = int(x^2*fxS, x)
b = int(x^2*fxS, x, 1, Inf)

% c)
c = b - a^2

%% 2-5.1
clear, clc
% a)
x = 0:0.1:20;
mean        = 5;
variance    = 16;
stddev      = sqrt(variance);   % Standard deviation
fx = normpdf(x,mean,stddev);
Fx = normcdf(x,mean,stddev);
% figure
% subplot(2,2,1)
% plot(x,fx), title('f_X(x)')
% subplot(2,2,2)
% plot(x,Fx), title('F_X(x)')

syms x;
fx = normcdf(0,mean,stddev);

a = 1 - fx

% b) 0 < x < mean
fx_5 = normcdf(5,mean,stddev);
b = fx_5 - fx

% c) x > mean*2
c = 1 - normcdf(mean*2,mean,stddev)

%% 2-5.3
clc, clear 
% a) find mean value
% mean = Pr(X <= bar(X)) = 0.5
mean = 1

% b)
format 
Pr_greater_5 = 0.0228;
Pr_leq_5 = 1-Pr_greater_5;

% opslag på 2.0

% arr = zeros(1,40);
% for i = 1:40
%     arr(1,i) = 1/(sqrt(2*pi)) * intexp(;
% end
% arr








