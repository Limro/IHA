clc
%Exercise 1.3

A = [0.5 ; 0.5];
B = [0.8 0.15 0.05 ; 0.05 0.15 0.8];


% Equivocation, H(Y/X)
HYX = Equivocation(A, B)
% 
% %H(Y)
% HY = Hy(A, B)
% 
% 
% %Mutal information, I(X/Y)
% IXY = HY - HYX
% 
% 
