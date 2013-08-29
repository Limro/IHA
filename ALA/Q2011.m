%2011

% %P1
% A=[1 3 2 1 3;2 1 -1 2 1];
% rref(A)


% %P2
% A=[1 2;3 -1];
% B=[1 0;3 1];
% AB=A*B
% rref([B AB])


% %P3
% syms x;
% f=x^2;
% g=x^4;
% inner = int(f*g,0,1)
% 
% v1=f
% v2=g-(inner/int(f*f,0,1))*v1

% 
% %P4
% syms a;
% A=[a a 0; 0 a 0; 0 a a];
% [v,d]=eig(A)


%P6
A=[5 2 -2;2 3 4;-2 4 1];
[v,d]=eig(A)