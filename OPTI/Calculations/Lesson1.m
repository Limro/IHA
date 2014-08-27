clear, clc
%% 9.1, 9
M = [1 2 -2; 0 1 4; 3 -1 1];
x1 = [1/3 1/2 1/6]';
y1 = [1/4 1/2 1/4]';

x2 = [1/4 1/2 1/4]';
y2 = [1/2 1/4 1/4]';

E1 = x1'* M * y1
E2 = x2'* M * y2

vax1 = 1/3+0+1/2
vax2 = 2/3+1/2+-1/6
vax3 = -2/6+2+1/6
minVac = vax1

Vax = minGame(M, x1)
Vay = maxGame(M, y1)
Vbx = minGame(M, x2)
Vby = maxGame(M, y2)