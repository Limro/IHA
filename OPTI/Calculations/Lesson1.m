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

%% 9.1, 15
clc, clear

Payoff = [4 6 2 0; 
     1 3 2 5];

t = 0:0.01:1;

z1 = Payoff(1,1)*(1-t) + Payoff(2,1)*t;
z2 = Payoff(1,2)*(1-t) + Payoff(2,2)*t;
z3 = Payoff(1,3)*(1-t) + Payoff(2,3)*t;
z4 = Payoff(1,4)*(1-t) + Payoff(2,4)*t;

%figure 1
hold on
plot(t, z1, 'r')
plot(t, z2, 'g')
plot(t, z3, 'b')
plot(t, z4, 'c')

syms t;

z1 = Payoff(1,1)*(1-t) + Payoff(2,1)*t;
z2 = Payoff(1,2)*(1-t) + Payoff(2,2)*t;
z3 = Payoff(1,3)*(1-t) + Payoff(2,3)*t;
z4 = Payoff(1,4)*(1-t) + Payoff(2,4)*t;

res1 = solve(z4 == z3, t)
res2 = solve(z3 == z1, t)
t = res1;
z3 = Payoff(1,3)*(1-t) + Payoff(2,3)*t;
M = [z3 res1]

x_hat = [ 1- t ; t]

syms c1 c2 c3 c4;
y_hat = [c1; 0; c3; 0]

eq1 = [1 0]*Payoff*y_hat == z3;
eq2 = c1+c3 == 1;

[a ,b] = solve(eq1,eq2);
c1 = a;
c3 = b;
y_hat = [c1; 0; c3; 0]

[1 0]*Payoff*y_hat
