clc, clear

A = [0.2 ; 0.8];
B = [0.8 0.1 0.1 ; 0.1 0.1 0.8];

%Entropy, H(X)
Hx = 0;
for i = 1:size(A,1)
    Hx = Hx + (A(i,1) * log2(1 / A(i,1)));
end
Hx

%H(Y/X)
HYX = Equivocation(A, B)

%H(Y)
HY = Hy(A, B)

%Mutal information, I(X/Y)
IXY = HY - HYX

%capacity of the BSC
Cs = 1 - HYX

%%
P = [0 1 1 1; 1 1 1 0; 1 1 0 1;1 0 1 1];
G = [P eye(4,4)]
[H P] = ParityMatrix(G)

HammingMin = HammingDistance(H)

r = [0 1 1 1 0 1 1 0];
syndrome = mod(r*H',2)

%% P3

G = [ ...
    1 1 1 0 1 1 0 0 1 0 1 0 0 0 0;
    0 1 1 1 0 1 1 0 0 1 0 1 0 0 0;
    0 0 1 1 1 0 1 1 0 0 1 0 1 0 0;
    0 0 0 1 1 1 0 1 1 0 0 1 0 1 0;
    0 0 0 0 1 1 1 0 1 1 0 0 1 0 1]

Systematic = mod(rref(G),2)
[r,c] = size(Systematic);
P = Systematic(:,r+1:c);
Gsys = [eye(r,r) P]

m = [1 0 1 1 0];
c = mod(m * Gsys,2)

%% P4

n = 15;
g = [1 1 0 0 1]; %g(x)=1+x+x^4

[ E, V, P ] = gfPol2Table(g);
[E, P, V]

m = log2(length(E));
syms a x;

b1 = conjugateRoots2(V, a)
b2 = conjugateRoots2(V, a^3)
b3 = conjugateRoots2(V, a^5)
b4 = conjugateRoots2(V, a^7)

phi(1,1) = minimumPoly(E,P,V,a^1);
phi(2,1) = minimumPoly(E,P,V,a^3);
phi(3,1) = minimumPoly(E,P,V,a^5);
phi(4,1) = minimumPoly(E,P,V,a^7);

pretty(phi)

pol = phi(1,1)*phi(2,1)
generator = mod(expand(pol),2)

g = [1 0 0 0 1 0 1 1 1];
r = [0 0 0 1 1 1 1 1 1 1 0 0 0 1 1];

%Calculate Syndrom vector
[parmat,genmat,h] = cyclgen(n,g,'system');
syndrome = mod(r*parmat',2)

















