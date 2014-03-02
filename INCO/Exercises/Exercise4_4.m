clc, clear
disp('Exercise 4.4')

% Determine the generator polynomial of the binary BCH code 
% C_BCH(31, 16) able to correct error patterns of size t = 3 
% or less.

n = 31; %C_BCH(n,k) | n = 2^m-1
k = 16;
t = 3;