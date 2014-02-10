clc, clear;
disp('Exercise 1.8')
%Answers 1, 0.25, 0.75, 
%Posteriori = 1, ?
%equivocation = 0.38, 
% transinfo = 0.431, 
%Cs = 0.531

ep = 0.469;
A = [0.25 0.75]';
B = [1-ep ep ; ep 1-ep];

pos0 = Posteriori(A, B, 0)
pos1 = Posteriori(A, B, 1)

%H(Y/X)
HYX = Equivocation(A, B)

%H(Y)
HY = Hy(A, B)

%Mutal information, I(X/Y)
IXY = HY - HYX

%capacity of the BSC
Cs = 1 - HYX
