function [minPol b] = minimumPolyReed(E,P,b)

m = log2(length(E));

syms a X;
minPol = 1;

for i=1:length(b)
    minPol = minPol * (X+a^i);
end

% Substitute all exponential forms with polynomial form and reduce:
while degree(subs(minPol,X,1)) > m-1
    minPol = subs(minPol,E,P);
    minPol = expand(minPol);
end

minPol = mod2partly(minPol);
end