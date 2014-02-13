clc, clear
disp('Exercise 1.3')

A = [0.2 ; 0.8];
B = [0.75 0.25 ; 0.25 0.75];

%Entropy, H(X)
HX = sum(A(1:end,1) .* log2(1 ./ A(1:end,1)))

%H(Y/X)
HYX = Equivocation(A, B);

%H(Y)
HY = Hy(A, B);

%Mutal information, I(X/Y)
IXY = HY - HYX

%capacity of the BSC
Cs = 1 - HYX
%0.189