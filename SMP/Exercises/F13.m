syms x u;
f = 3/8*u^2;

Fx = int( f, u, 0, x)

1^3/8

Ex = int( u* f, u, 0, 2)
Ex2 = int( u^2 * f, u, 0, 2)
Var = Ex2 - Ex^2

% diff:
syms y;
diff(y^2+1)