clc, clear
disp('Exercise 2.6')

G = [
    1 1 0 1 1 0 0 1 1 0 1 0 0;
    1 0 1 1 0 1 0 1 0 1 0 1 0;
    1 1 1 0 0 0 1 1 1 1 0 0 1];

%(a) Find the parity check matrix H and hence write down 
%    the parity check equations.
H = ParityMatrix(G)


%(b) Find the minimum Hamming distance of the code.
dmin = HammingDistance(H)

