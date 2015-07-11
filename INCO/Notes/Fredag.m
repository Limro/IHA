clc, clear;
%Hamming weight:

c1 = [1 0 1 1] % weight = 3 (non-zero)
c2 = [1 0 0 0] 
%d(c1, c2 ) =2 %distance på to vektorer
%c1 + c2 = [0 0 1 1]

%weight og distance:
%d(ci, cj) = w(ci + cj)

%min distance:
%Codeword er 2^k i antal. Find minimumwight
%dmin = min{(ci ; cj ); ci ; cj in C_b; ci |= cj}

% syms h0 h1 h2 h3 c0 c1 c2 c3;
% c = [1 0 1 1 0 0 0] %weight = 3
% H = [h0 h1 h2 h3]
%Find 3 vektorer (weight), der tilsammen bliver til en zero-vektor (kun
%0'er)
C * H' = (c0 c1 c2 c3) * H'

%%
%Hvis der er corrupted mere end d_min, er det ikke brugbart. Kun < d_min er
%tillaft

%P_U(E) = sum( A_i * p^i *(1-p)^(n-1) )
syms p;
A = [ 1 0 7 7 0 0 1]
n = size(A);
tmp;
for i = 1:n
    tmp = tmp +  A(1,i) * pow(p,i) *(1-p)^(n-1);
end

