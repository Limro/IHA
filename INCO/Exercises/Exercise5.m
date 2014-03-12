%% Exercise 5.3
clc, clear
disp('Exercise 5.3')

%Answer:  
%(a) g(X) = X 6 + a^10 X^5 + a^14 X^4 + a^4 X^3 + a^6 X^2 + a^9 X + a^6 
%(b) (15,9)

%(a) Determine the generator polynomial of an RS code that operates 
% over the field GF(2^4) and is able to correct any error pattern 
% of size t = 3 or less.

%g(x) is a factor of x^n+1
%Roots for g(x) a, a^2, ..., a^2t

%phi_i(x) = minimal polynomial of a^i
%g(x) = LCM{phi_1(x), phi_2(x), ..., phi_2t(x)}
%GF(q^m)

q = 2;
t = 3;
pol = [1 1 0 0 1];
[ E, V, P ] = gfPol2Table(pol);
[E, P, V]

m = log2(length(E));
syms a X; 

minPol = 1;
for i = 1:2*t
    minPol = minPol * (a^i + X);
end
minPol 

% Substitute all exponential forms with polynomial form and reduce:
while degree(subs(minPol,X,1)) >= m
    minPol = subs(minPol,E,P);
    minPol = expand(minPol);
end

% Modulo 2:
ModuOfminPol = mod2partly(minPol)
rewritten = X^6 + a^2*X^10 + X*a^3 + X^2*a^6 + X^3*a + X^4*a^3 + a^3 + a^2;
equal(ModuOfminPol, rewritten)

%(b) Determine the values of n and k.
