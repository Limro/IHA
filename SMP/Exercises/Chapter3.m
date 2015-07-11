%% Chapter 3
%% 3-1.1
clc, clear

% a) sketch distributed function
[X,Y] = meshgrid(0:.1:1, 0:.1:1);
Z = X.*Y;
%surf(X,Y,Z);

% b) Sketch probability function

% x=0:0.1:1;
% y=nan*ones(size(x));
% 
% y(x<0) = 0;
% y(0<=x & 
% 
% % compute each epoch
% y(x<2)=x(x<2).^2;
% y(2<=x&x<=7)=x(2<=x&x<=7)+2;
% y(8<x)=x(8<x).^3-6*x(8<x);
% plot(x,y);

% c) joint probability: X <= 3/4, Y > 1/4
syms x y;
Pr = int(1,x,0,3/4) * int(1,y,1/4,1)

%% 3-1.2
clc, clear

syms k x y u v;

% a) find k
val = int(k*x*int(y,y,0,1),x,0,1); %Double integral
k = solve( val == 1, k) %Must be equal 1 (p. 122, rule 2)

% b) joint probability distribution function
% F(x,y)

val = int(k*u*int(v,v,0,y),u,0,x)


% c) joint probability of X <= 1/2 and Y > 1/2

Pr_x = int(k*x*int(y,y,0.5,1),0,0.5)



% d) Marginal function, f_X(x)
val = int(k*x*y,y,0,1)

%% 3-1.3
syms x y;
f_xy = 1;

% a)
E_XY = int(int(x*y*f_xy,x,0,1),y,0,1)

f_xy = 4*x*y;
% b)
E_XY = int(int(x*y*f_xy,x,0,1),y,0,1)


%% 3-2.2
clc, clear
syms x y;
f_xy = 4*x*y;

% a) conditional probability density function, f(x|y)
f_y = int(f_xy,x,0,1);
f_Xy = f_xy/f_y


% b) conditional probability density function, f(y|x)
f_x = int(f_xy,y,0,1);
f_Yx = f_xy/f_x

%% 3-2.4
clc, clear;

% a) generel expression
syms K x y;
f_xy = K*exp(-(x^2+y^2+4*x*y));

diff(f_xy,x)

val = solve((2*x+4*y) == 0, x)

% b) If y = 3, estimate X
X = -2*3
