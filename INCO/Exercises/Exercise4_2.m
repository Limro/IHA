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

m = log2(length(E));
syms a x;


b1 = conjugateRoots(a, m);
b2 = conjugateRoots(a^3, m);
b3 = conjugateRoots(a^5, m);
b4 = conjugateRoots(a^7, m);
b5 = conjugateRoots(a^11, m);
b6 = conjugateRoots(a^13, m);
b7 = conjugateRoots(a^15, m);


phi(1,1) = minimumPoly(E,P,a^1);
phi(2,1) = minimumPoly(E,P,a^3);
phi(3,1) = minimumPoly(E,P,a^5);
phi(4,1) = minimumPoly(E,P,a^7);
phi(5,1) = minimumPoly(E,P,a^11);
phi(6,1) = minimumPoly(E,P,a^13);
phi(7,1) = minimumPoly(E,P,a^15);

pretty(phi)

%%
disp('Exercise 4.4')

% Determine the generator polynomial of the binary BCH code 
% C_BCH(31, 16) able to correct error patterns of size t =< 3 

n = 31; %C_BCH(n,k) | n = 2^m-1
k = 16;
t = 3;
r = n-k; %degree of generator polynomial

% Find r elements. phi consist of 5 elements each
pol = phi(3,1)*phi(4,1)*phi(5,1)

% Minimum amount of elements in the generator polynomial
d_min = 2*t+1

% Expand the expression and remove even elements
generator = mod(expand(pol),2)

disp('Generator contains 11 elements > d_min')


%% Exercise 4.5
disp('Exercise 4.5')

% Determine the generator polynomial of a binary BCH code of code 
% length n = 31 able to correct error patterns of size t = 2 or less. 

% Also, determine the value of k and the minimum Hamming distance of 
% the code.

t = 2;

% minimum amount of elements needed
d_min = 2*t+1

% Polynomial with atleast d_min big
pol = phi(7,1)*phi(2,1)

% Expand and remove even elements
generator = mod(expand(pol),2)

%Degree (r) of the generator
r = degree(generator)

% column count calculated
k = n-r


%% Exercise 4.6
%Answer: (a)6
disp('Exercise 4.6')

% A binary cyclic BCH code C BCH (n, k) has code length n = 15 and 
% generator polynomial 
% g(X) = (X + 1)(1 + X + X 4 )(1 + X + X 2 + X 3 + X 4 ). 

% (a) What is the minimum Hamming distance of the code?

n = 15;
syms x;
g = (x+1)*(1+x+x^4)*(1+x+x^2+x^3+x^4);

% exp = expand(g)
% mod = mod(exp,2)

m = 5;
syms a x;


%t = (n-k)/m
%Because both k and t is a real number the following must apply
k = 5;
t = (n-k)/m
dmin = 2*t+1


pol = [1 1 1 1 1 1];
[ E, V, P ] = gfPol2Table(pol);


%% Exercise 4.7
% (a) Show that the shortest binary cyclic BCH code with the generator 
% polynomial g(X) = (1 + X + X4)(1 + X + X2 + X3 + X4) has code 
% length n = 15 and minimum Hamming distance dmin = 5.

clear
disp('Exercise 4.7')

syms x;
g = (1+x+x^4)*(1+x+x^2+x^3+x^4);


exp = expand(g);
modu = mod(exp,2)

%Amount of elements = m
m = 5;

%Since n = 2^m-1
n=2^m-1


%% Exercise 4.8
clear
disp('Exercise 4.8')
% Use the BCH bound to show that the minimum Hamming distance of the cyclic
% code with block length n = 7 and g(X) = (X + 1)(1 + X + X3) is 4.
% (a) What is the minimum Hamming distance if n = 14 and why?

syms x;
n = 7;
g = (x+1)*(1+x+x^3);

% expa = expand(g)
% modu = mod(expa,2)

pol = [1 1 0 1];
[ E, V, P ] = gfPol2Table(pol);

[E, P, V]

m = log2(length(E));

%t = (n-k)/m
k = 4;
t = (n-k)/m;
dmin = 2*t+1

%BUT IT'S WRONG!


%% Exercise 4.9
clear
disp('Exercise 4.9')

% The binary cyclic BCH code C_BCH(15, 7) is able to correct error patterns 
% of size t = 2 or less, and has a generator polynomial of the form 
% g(X) = (1 + X + X4)(1 + X + X2 + X3 + X4) = 1 + X4 + X6 + X7 + X8, 
% which operates over the Galois field GF(24) (Appendix B, Table B.4).
% Assume that the received vector is r = (100000001000000) and decode it
% using the Euclidean algorithm.

r = [1 0 0 0 0 0 0 0 1 0 0 0 0 0 0];
g = [1 0 0 0 1 0 1 1 1];
t = 2;
n = 15;
k = 7;

%Calculate Syndrom vector
[parmat,genmat,h] = cyclgen(n,g,'system');
syndrome = mod(r*parmat',2)

syms a x;
s1 = a^4;
s2 = a^7;
s3 = a^8;

%Calculate syndrom polynomial
%S(x)= ...
S(x) = s1 + s2*x + s3*x^3

%Initialize process in Euclidean algorithm
% r_(-1) = A = ...
% r_0 = B = S(x)
%r_i(x) =s_i(x)*x^(2*t) + t_i(x)*S(x)
A = x^(2*t)
B = S(x)

%Do table
%table = symvar(zeros(4,4));
% table(1,1) = symvar(-1)
% table(2,1) = symvar(0);
% table(3,1) = symvar(1);
% table(4,1) = symvar(2)
% 
% table(1,2) = symvar(A)
% table(2,2) = symvar(B)
% table(3,2) = symvar(table(1,2)/table(2,2))
% table(4,2) = table(2,2)/table(3,2)


%t_i(x) should be monic polynomial

%Error location polynomial:
%sigma(x) = lambda * t_i(x)


%Error evaluation polynomial:
%W(x) = -lambda*r_i(x)


%GF(2^m), n = 2^m-1, a^-h = a^(n-h), C_BCH(n,k)


%Perform Chien search on sigma(x) gives two roots


%% Exercise 4.10
clear
disp('Exercise 4.10')


% Show that for a double-error-correcting cyclic code,
% s_3 = s_1^3 + s1_^2*?_l + s_1*?_1^2 where ?_l = ?^jl
% and hence find the errors in the received vector 
% r = (000100111111011), given that the transmitted vector is from 
% the cyclic BCH code C_BCH (15, 7) generated by 
% g(X) = (1 + X + X 4 )(1 + X + X 2 + X 3 + X 4 )

tau = 2;







