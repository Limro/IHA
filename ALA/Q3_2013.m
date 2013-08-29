% 2013-Q3
% P1

% A=[1 2  0 0 -1;
%     0 0 1 2 7;
%     -1 1 0 0 -2;
%     0 0 -1 1 1];
% rref(A)


% %P2
% A=[1 -1 3 5 0;-1 -3 1 -1 0 ;2 6 -2 2 0];
% ref=rref(A)

% 
% %P3
% A=[2 2 1;2 -1 4;0 1 -1];
% x1=[1 1 2]';
% x2=[1 1 0]';
% b=[1;1;1];
% refA=rref(A)
% ax1=A*x1
% ax2=A*x2
% b1=ax1-b
% b2=ax2-b
% norm(b1)
% norm(b2)

% %P4
% A=[exp(-1) 0 0; 0 exp(-2) 0];
% rref(A)
% syms x;
% int(exp(-x)*exp(-2*x)*x,x,0,1)

%P5
format bank
A=[ 4   -1  1;
    -2  5   1;
    2   -1  3];
[v,d]=eig(A)
