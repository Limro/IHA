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


