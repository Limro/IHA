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


