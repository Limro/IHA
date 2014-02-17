clc, clear;
disp('Exercise 2.4')
%(a) What is the rate of the code?
%Coding rate: R = k/n
% M_{k x n}
M = [
    0 0 0 0 0 0;
    0 1 1 1 0 0;
    1 0 1 0 1 0;
    1 1 0 1 1 0;
    1 1 0 0 0 1;
    1 0 1 1 0 1;
    0 1 1 0 1 1;
    0 0 0 1 1 1];

R = CodingRate(M)

%%
%(b) Write down the generator and parity check matrices of this 
%    code in systematic form.

%Generator: G = 
%Modulo 2 multiplication (black dot)
%result=mod(conv(G,u),2);
Parity = ParityMatrix(M)

%%
%(c) What is the minimum Hamming distance of the code?
dmin = HammingDistance(M)

%(d) How many errors can it correct, and how many can it detect?

Detect = dmin - 1
CanCorrection = Correction(dmin)


%%
%(e) Compute the syndrome vector for the received vector 
%   r = (101011) and hence find the location of any error.
r = [ 1 0 1 0 1 1];
H = [
    1 0 0 0 1 1;
    0 1 0 1 0 1;
    0 0 1 1 1 0];
s = mod(r * H',2)

Pattern = [ 0 0 0 0 0 0 ; eye(6)]
hTemp = [0 0 0 ; H']
f = [Pattern hTemp]
syndtable(H)
