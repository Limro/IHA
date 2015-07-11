%% Lay 9,4 - 11
clc, clear

b = [16 10 20]';
A = [1 1 3 ; 2 1 2]';
A = [A eye(3)];
c = [4 5 0];
v = [3 4 5];

Arg = [ A b; -c 0 0 0];

c = [-c 0 0]';
[tab, res] = simplex(c, A, b, v, 1)
x1 = 7/4
x2 = 0
x3 = 3/4
M = 43

%% Lay 9,4 - 21
clc, clear

b = [1 1 1]';
A = [4 1 -2; %stocks
    1 3 0; %Bonds
    -1 0 4]; %Gold
A = [A] + 3
A = [A eye(3)];
c = [1 1 1];
v = [4 5 6];

Arg = [ A b; -c 0 0 0 0];

c = [-c 0 0 0]';
simplex(c, A, b, v, 1)
x1 = 1/13;
x2 = 9/143;
x3 = 15/143;
M = 35/143; %lambda
y1 = 14/143;
y2 = 8/143;
y3 = 1/11;

x_hat = [x1 x2 x3]' * (1/M)
y_hat = [y1 y2 y3]' * (1/M)

stocks = 35000 * x_hat(1,1)
bonds = 35000 * x_hat(2,1)
gold = 35000 * x_hat(3,1)
%% eksempel
clc, clear

A = [ 1 2 1;1 3 4]';
b = [ 60 60 60]';
c = [ 1 2]';
v = [3 4 5];

Arg = [ A eye(3) b; -c' 0 0 0 0]

Arg = [ Arg(1,:) ; Arg(2,:) ; Arg(3,:)/4 ; Arg(4,:) ]
Arg = [ Arg(1,:)-1*Arg(3,:) ; Arg(2,:)-3*Arg(3,:) ; Arg(3,:) ; Arg(4,:)+2*Arg(3,:) ]

Arg = [ Arg(1,:)/(1/3) ; Arg(2,:) ; Arg(3,:) ; Arg(4,:)]

ratio1 = Arg(1,end)/-0.5 %lowest
ratio2 = Arg(2,end)/-0.5
ratio3 = Arg(3,end)/-0.5

Arg = [ Arg(1,:)/2.25 ; Arg(2,:) ; Arg(3,:) ; Arg(4,:)]
Arg = [ Arg(1,:) ; Arg(2,:)-1.25*Arg(1,:) ; Arg(3,:)-0.25*Arg(1,:) ; Arg(4,:)+0.5*Arg(1,:)]

A =  [A eye(3)];
c = [-c' 0 0 0]';
simplex(c, A, b, v, 1)
