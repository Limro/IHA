clc, clear
disp('Ecercise 3.7')

n = 14;
g = [1 0 1 0 0 0 1]; %g(x)=1+x^2+x^6

[parmat,genmat,h] = cyclgen(n,g,'system')

dmin = HammingDistance(genmat)