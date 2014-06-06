%% Eksamen i ETSMP-01

clc, clear

syms x u;
int((1/8)*u^2+(1/3),u,0,x)

1- (1/24 * 1^3 + 1/3*1)

EX = int(x*(1/8*x^2 + 1/3), x, 0, 2)
EX2 = int(x^2*(1/8*x^2 + 1/3), x, 0, 2)

Var = EX2 - EX^2

syms y;
diff(y/2, y)

(1/2)*(1/8)*(y/2)^2 +1/3

%% Del 3
x = 15;
n = 1000;
p0 = 0.15;

z = (x-n*p0)/(sqrt(n*p0*(1-p0)))

val = (2/10) *0.01


u = norminv(1- (0.05/2));

min = 1/(n+u^2) * (x+ u^2/2 - u*sqrt((x*(n-x)/n) + (u^2/4)))
max = 1/(n+u^2) * (x+ u^2/2 + u*sqrt((x*(n-x)/n) + (u^2/4)))

%% opg 4
X = [ 330 334 328 330 330 331 335 330 331 330 ...
    331 330 332 329 335 330 326 331 330 332 ];

mean(X)
var(X)


(sqrt(