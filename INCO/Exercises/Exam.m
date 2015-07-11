clc, clear
syms l u;

A = [0.5 ; 0.5];
B = [1-l-u,  u, l; l, u, 1-l-u];
C = [0.7 0.2 0.1; 0.1 0.2 0.7];

HY = Hy(A, B);
HY2 = Hy(A, C)

%H(Y/X)
HYX = Equivocation(A, B);
latex(HYX);
HYX = Equivocation(A, C)
%H(Y)
HY = Hy(A, B);

%Mutal information, I(X/Y)
IXY = HY2 - HYX

hm = Hmax(A, C)
Cs = hm - HYX

%% part2
clc, clear

P = [...
    0 1 1; 
    1 0 1; 
    1 1 0];

G = [P eye(3,3)]

[H P] = ParityMatrix(G)

% Systematic = mod(rref(P),2)
% [r,c] = size(Systematic)
% P = Systematic(:,r+1:c)
% Gsys = [P eye(r,r)]
% 
% [H P] = ParityMatrix(Gsys)

HammingMin = HammingDistance(H)

[5;1]*(10^(-3))^2

%% part 3
clc, clear
syms d;
val = (1+d+d^2+d^3)*(d)
expand(val)
mod(2*d,2)

%% part 4
clc, clear

g = [1 0 1 1]; %g(x)=1+x+x^4

[ E, V, P ] = gfPol2Table(g);
[E, P, V]

syms a;
cal = mod(expand((a+a^2)*(1+a^2)),2);
res = subs(cal, E, P);
res = mod(res,2)

m = log2(length(E));
syms a x;

b1 = conjugateRoots2(V, a)
b2 = conjugateRoots2(V, a^2)
b3 = conjugateRoots2(V, a^3)
b4 = conjugateRoots2(V, a^4)

phi(1,1) = minimumPoly(E,P,V,a^1);
phi(2,1) = minimumPoly(E,P,V,a^2);
phi(3,1) = minimumPoly(E,P,V,a^3);
phi(4,1) = minimumPoly(E,P,V,a^4);

pretty(phi)

pol = phi(1,1)*phi(2,1)*phi(3,1)*phi(4,1)

generator = mod(expand(pol),2)

% g = [1 1 1 1 1 1 1];
% r = [0 1 1 0 0 1];
% 
% t = 2;
% SyndromeVectors(E, P, r, t)








