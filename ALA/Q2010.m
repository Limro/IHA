% %P1
% syms q p;
% A=[1 2 3 1;1 3 1 2;2 1 q 1];

% % P2
% A=[1 2;2 2];
% B=[1 -2;3 0];
% C=[-1 2;1 3];
% 
% x1=inv(A)*(C-B)
% x2=inv(A-B)*C
% x3=(C-B)*inv(A)

% %P3
% A=[-1 6 6 ;
%     3 -8 3 ;
%     1 -2 6 ;
%     1 -4 -3];
% b=[4 6 3 3]';
% rref([A b])
% gs(A)

% %P4
% A=[%x1  x2  x3  x4  x5  i/o
%     1   -1  0   0   0   -10;
%     0   1   -1  -1  0   -20;
%     -1  0   0   1   1   15;
%     0   0   1   0   -1  15];
% 
% rref(A)



% %P5
% A=[-1 1;4 2];
% [v,d]=eig(A)
% 0.24/0.97
% rref([A [-2;3]])


%P6
A=[1 1 2 -1 3;3 -1 3 2 1;1 1 4 0 1]';
b=[4 6 3 3 4]';
rref([A b])
x=inv(A'*A)*(A'*b)