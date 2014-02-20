clc, clear
disp('Exercise 3.6')

g = [1 1 0 1 1];
n = 6;
k = 2;

[parmat,genmat,h] = cyclgen(n,g,'system');
pattern = [ 0 0; 0 1; 1 0; 1 1];
ct = codeTable(genmat)
table = [ pattern ct]


dmin = HammingDistance(ct)
l = dmin -1
t = floor((dmin - 1)/2)