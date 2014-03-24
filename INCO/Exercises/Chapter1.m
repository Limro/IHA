clc, clear
%%Chapter 1

%% 1.1
a = 0.4;
b = 0.2;
c = b;
d = 0.1;
e = 0.05;
f = e;

Ia = log2(1/a)
Ib = log2(1/b)
Id = log2(1/d)
Ie = log2(1/e)

sum = a*Ia + 2*b*Ib + d*Id + 2*e*Ie

M = 6;%Count from A to F
Hmax = log2(M) 

eff = sum/Hmax * 100

%% 1.2
a = 1/2;
b = 1/4;
c = 1/8;
d = 1/16;
e = d;

H = a*log2(1/a) + b*log2(1/b) +c*log2(1/c) +2* d*log2(1/d)
I = log2(2) + 4*log2(16)

%% 1.3

A = [0.2 ; 0.8];
B = [0.75 0.25 ; 0.25 0.75];

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
