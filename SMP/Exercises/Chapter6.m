%% chapter 6
clc, clear

%% 6-1.1
clc, clear

% E{[Y(t)]^2} = E{[X(t) - b*X(t+tau)]^2 }
% om_Y^2 = om_X^2-2*b*R_X(tau) + b^2*om_X^2
tau = -0.1;

R1=5*exp(-5*0.1);
sigmax=5*exp(0);
syms b

funk = sigmax + 2.*b.*R1 + b.^2.*sigmax;

a = solve(diff(funk) == 0,b);

double(a)
