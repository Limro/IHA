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
syndrome = r*(H')