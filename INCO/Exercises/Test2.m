clc, clear
disp('example 2.10')

G1 = [
    1 1 0; 
    0 1 1; 
    1 1 1;
    1 0 1];

I = eye(4);
G = [G1 I];
P = G(:,1:3)
Ik = G(:,4:7)
H = [Ik(1:3,1:3) P']