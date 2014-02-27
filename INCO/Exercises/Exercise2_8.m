clc, clear
disp('Exercise 2.8')

P =[
    0 0 1 0 1 1 0 1 1 1 1;
    0 1 0 1 0 1 1 1 1 0 1;
    1 0 0 1 1 0 1 1 0 1 1;
    1 1 1 0 0 0 1 0 1 1 1;]';

%(a) Construct the parity check matrix of the code.
%Parmat = ParityMatrix(P);
H = [eye(length(P(1,:))) P']



%(b) Construct the error pattern syndrome table.
synd = syndtable(H); %useless...

%(c) Apply syndrome decoding to the received vector r = (011111001011011).
r = [0 1 1 1 1 1 0 0 1 0 1 1 0 1 1];
mod(r*H',2)