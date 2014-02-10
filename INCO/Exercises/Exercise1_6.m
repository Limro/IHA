clc, clear

disp('Exercise 1.6')

A = [0.5 0.5]';
B = [0.9 0.1; 0.1 0.9];

C(1,1) = Py(A, B, 0)
C(2,1) = Py(A, B, 1)
D = [0.9 0.1; 0.1 0.9];


%H(Y/X)
HYX = Equivocation(C, D);

%H(Y)
HY = Hy(C, D);

%Mutal information, I(X/Y)
IXY = HY - HYX

%capacity of the BSC
Cs = 1 - HYX

%Answer: 0.3199


