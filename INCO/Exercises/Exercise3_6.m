clc, clear
disp('Exercise 3.6')

g = [1 1 0 1 1 0];
n = 6;
k = 2;
pol = cyclpoly(n,k);

[parmat,genmat,h] = cyclgen(n,pol,'system');
C = ParityMatrix(genmat)

% if genmat(1,:) == g
%     disp('Equal')
% else
%     disp('Not equal')
% end

%%
[r,c] = size(genmat')
s = mod(g * genmat',2)
Pattern = [ zeros(1,r) ; eye(r)]
hTemp = [zeros(1,c) ; genmat']
f = [Pattern hTemp]
syndtable(genmat)