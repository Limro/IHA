clc, clear

disp('Exercise 1.6')

A = [0.5 0.5]';
B = [0.9 0.1; 0.1 0.9];

E = B*B

%C^max_p(x_1)
%H(Y/X)
HYX = Equivocation(A, E);

%H(Y)
HY = Hy(A, E);

%Mutal information, I(X/Y)
IXY = HY - HYX

%capacity of the BSC
Cs = 1 - HYX

%Answer: 0.3199

