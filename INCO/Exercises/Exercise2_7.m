clc, clear
disp('Exercise 2.7')

G = [ 
    1 1 0 0 1 1 1 0;
    0 0 1 1 1 1 0 1];
%(a) Write down the parity check equations of the code.
Equations = ParityEquations(G)


%(b) Determine the code rate and minimum Hamming distance.
[r c] = size(G);

CodingRate = r/c
dmin = HammingDistance(G)


%(c) If the error rate at the input of the decoder is 10^(?3), estimate the 
%   error rate at the output of the decoder.