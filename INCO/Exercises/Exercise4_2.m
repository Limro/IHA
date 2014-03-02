clc, clear
disp('Exercise 4.2')

% Construct the Galois field GF(2^5) generated by p(X) = 1 + X^2 + X^5, 
% showing a table with the polynomial and binary representations of its 
% elements.

pol = [1 0 1 0 0 1];
[ E, V, P ] = gfPol2Table(pol);

[E, P, V]

disp('Exercise 4.3')

% Determine the minimal polynomials of the elements of the Galois field 
%   GF(2^5) constructed in Problem 4.2.


%[E, V, P] = gfPol2Table(pol);
%f = [E P V];

syms a;
[minPol, b] = minimumPoly(E,P,a)

