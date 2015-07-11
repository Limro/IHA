%% Compulsory
clc, clear

format shortg
A = [1 2 0; 
    2 0 4;
    0 1 1];
A = [A eye(3)]; %Add slack variables

b = [28 16 12]';
c = [-2 -5 -3 0 0 0]'; %With slack variables
v = [4 5 6]'; %slack columns

Arg = [ A b; c' 0];
minC = min(Arg(end,:)); % column 2

ratio1 = Arg(1,end)/Arg(1,2); %14
ratio2 = Arg(2,end)/Arg(2,2); %Inf
ratio3 = Arg(3,end)/Arg(3,2); %12 - lowest

Arg = [Arg(1,:)-2*Arg(3,:) ; Arg(2,:) ; Arg(3,:) ; Arg(4,:)];
Arg = [Arg(1,:) ; Arg(2,:) ; Arg(3,:) ; Arg(4,:)+5*Arg(3,:)];

minC = min(Arg(end,:)); % column 2

ratio1 = Arg(1,end)/Arg(1,1); %4 - lowest
ratio2 = Arg(2,end)/Arg(2,1); %8
ratio3 = Arg(3,end)/Arg(3,1); %12

Arg = [Arg(1,:) ; Arg(2,:)-2*Arg(1,:) ; Arg(3,:) ; Arg(4,:)];
Arg = [Arg(1,:) ; Arg(2,:) ; Arg(3,:) ; Arg(4,:) + 2*Arg(1,:)];

minC = min(Arg(end,:)); % column 3

% ratio1 = Arg(1,end)/Arg(1,3) %-2 - lowest
% ratio2 = Arg(2,end)/Arg(2,3) %1
% ratio3 = Arg(3,end)/Arg(3,3) %12

Arg = [Arg(1,:) ; Arg(2,:)/8; Arg(3,:) ; Arg(4,:)]
Arg = [Arg(1,:)+2*Arg(2,:) ; Arg(2,:) ; Arg(3,:) ; Arg(4,:)]
Arg = [Arg(1,:) ; Arg(2,:) ; Arg(3,:)-1*Arg(2,:) ; Arg(4,:)]
Arg = [Arg(1,:) ; Arg(2,:) ; Arg(3,:) ; Arg(4,:)+2*Arg(2,:)]
%Ratio with lowest gives 5/0 - nono

simplex(c, A, b, v, 1);

%% Exercise 2
clc, clear

[x1, x2] = meshgrid(-10:1:10, -10:1:10);
x = [x1;x2];
f1 = x1.^2 + 3*x2.^2 - 2*x1.*x2 + 3*x2;
[C,h1] = contour(x1, x2, f1, [0 3 10 50 100 200 400]);
set(h1, 'ShowText', 'on', 'TextStep', get(h1,'LevelStep') * 2)
colormap cool
title('Level sets of f(x)')
xlabel('x1')
ylabel('x2')

%%
clc, clear
Q = [2 -2;-2 6];
b = [0;3];
Q* [1;1] - [0;3]
eigs(Q)

syms x1 x2;

[val1, val2] = solve(Q*[x1;x2]-b == 0)

%%
clc, clear, close all

syms x;
f = 1/2*x.^2 -cos(x);

%figure(1);
%ezplot(f);

fm = diff(f)
fmm = diff(fm)

fm = @(x) x+sin(x);
fmm = @(x) cos(x)+1;

x0 = 0.25;
x1 = x0 - (fm(x0)/fmm(x0))
x2 = x1 - (fm(x1)/fmm(x1))
x3 = x2 - (fm(x2)/fmm(x2))
%%
clc ,clear
syms xx1 xx2 a;
x = [xx1;xx2];

Q = [2 -2;-2 6];
b = [0;3];
f(x) = 1/2*x.' * Q * x - x.' * b;
g(x) = Q*x-b;
x0 = [1;1];

arg = x0 - a*g(x0(1),x0(2));
Phi0(a) = f(arg(1), arg(2));

a0 = solve(diff(Phi0(a)) == 0);
x1 =  x0-a0*g(x0(1),x0(2));

arg = x1 - a*g(x1(1),x1(2));
Phi1(a) = f(arg(1), arg(2))

a1 = solve(diff(Phi1(a)) == 0)
x2 =  x1-a1*g(x1(1),x1(2))

arg = x2 - a*g(x2(1),x2(2));
Phi2(a) = f(arg(1), arg(2))

a2 = solve(diff(Phi2(a)) == 0)
x3 =  x2-a2*g(x2(1),x2(2))

ezsurf(f(xx1,xx2))

lamMax = max(eigs(Q))

%%
clc, clear
syms yi A ti s;
r = yi - A*exp(-(ti^2/s^2));
J1 = diff(r, A)
J2 = diff(r, s)
%%

%Newton Gauss data fitting
%HKa sep. 2013
clear close all  clc;
%simulate dataset
t=(-2:.01:2);
x_gold=[1;.1];
y=x_gold(1)*exp(-(t).^2/x_gold(2)^2);
y=y+.03*randn(size(y));
figure(1)
plot(y,'.b'); 
hold on;
%pause
xx = [];
x = x_gold+[.9;.9];
for k = 1:75
    %Jacobian
    J = [ 
        -exp(-t.^2/x(2)^2) ; 
        -(2*x(1)*t.^2.*exp(-t.^2/x(2)^2))/x(2)^3 ].';
    
    % The function
    f = x(1)*exp(-(t).^2/x(2)^2);
    
    % r
    r = y - f;
    x = x - (J.'*J)^(-1) * (J.' * r.');
    xx = [xx,x];
    plot(f)  
end
figure(2)
plot(xx(1,:),'.r');hold on;
plot(xx(2,:),'.g');
xlabel('Iterations')



%%
clc ,clear
syms xx1 xx2 a;
x = [xx1;xx2];

Q = [2 -2;-2 6];
b = [0;3];
f(x) = 1/2*x.' * Q * x - x.' * b;
g(x) = Q*x-b;
x0 = [1;1];

gr(x) = Q*x-b;

g0 = gr(x0(1), x0(2))
d0 = -g0;
a0 = -(g0.'*d0)/(d0.'*Q*d0)
x1 = x0+a0*d0

g1 = gr(x1(1), x1(2))
b0 = g1.'*Q*d0/(d0'*Q*d0)
d1 = -g1+b0*d0
a1 = -(g1.'*d1)/(d1.'*Q*d1)
x2 = x1+a1*d1
% d1 = -g1;
% a1 = -(g1.'*d1)/(d1.'*Q*d1)
% x2 = x1+a1*d1




