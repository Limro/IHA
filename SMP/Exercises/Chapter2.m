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
fun(2)

% c) between 2 < X < inf
c = fun(inf)-fun(2)

% d) 1 < X <= 3
d = fun(3)-fun(1)

%% 2-3.2
clc, clear
fun = @(x) 1-exp(-(x-1));
syms y
fun2 = int(1-exp(-(y-1)), y)
fun3 = @(x) x+exp(1-x);
fun4 = y+exp(1-y)
fun5 = diff(fun4)
fun6 = @(x) 1-exp(1-x);

fsteps = 0.1:0.1:1;
ssteps = 1.1:0.1:5;
fp = zeros(1,size(fsteps,2));
sp = fun6(ssteps);

fSteps = horzcat( fsteps, ssteps);
fX = horzcat(fp, sp);

% plot(fSteps, fX) 
% hold on
% grid on
% axis([0, 5, 0, 3])

% b) Pr(2 < X <=3)
b = 1- integral(fun,2,3)
syms x;
diff(1-exp(-(x-1)),x)


