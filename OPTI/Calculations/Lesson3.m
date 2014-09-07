%% Lay 9,4 - 11
clc, clear

c = [16 10 20]';
A = [1 1 3 ; 2 1 2]';
b = [4 5]';

Arg = [ A eye(3) c; -b' 0 0 0 0]

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
simpelx(c, A, b, v, 1)
