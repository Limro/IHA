clc, clear
disp('Exercise 4.4')

% Determine the generator polynomial of the binary BCH code 
% C_BCH(31, 16) able to correct error patterns of size t =< 3 

n = 31; %C_BCH(n,k) | n = 2^m-1
k = 16;
t_max = 3;
r = n-k; %degree of generator polynomial

