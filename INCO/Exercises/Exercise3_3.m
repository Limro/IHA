clc, clear
disp('Exercise 3.3')

n = 7;
g = [1 0 1 1 1 0 0];

r = 4;
k = n-r;


pol = cyclpoly(n,k);
[parmat, genmat, length] = cyclgen(n, pol, 'system');

codingrate = k/n
H = ParityMatrix(parmat)
dmin = HammingDistance(H)

g = [1 1 1 1 1 1 1];
r2 = 4;
k2 = n-r2;
pol2 = cyclpoly(n,k2);
[parmat, genmat, length] = cyclgen(n, pol2, 'system');
pol2
parmat
valid_code = encode(g, n, k2, 'cyclic', pol2)