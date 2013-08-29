%2013 Q2.5

% %P1
% A=[1 2 -2;1 -1 1];
% b=[4;1];
% Arg=[A b]
% 
% rref(Arg)
% q = 3;
% A2=[2 2 q; 1 1 1;-1 1 3];
% b2=[1;2;4];
% Arg2=[A2 b2];
% rref(Arg2)


% %P2
% syms a b c d;
% y=[-13 2 3 4]';
% x=[1 2 -1 3]';
% dot(x,y)
% z=[1 2 14 3]';
% d=[ -26 4 6 8]';
% Arg=[x y z [0 0 0 0]'];
% rref(Arg)



% %P3
% %Hjælp fundet http://www.math.odu.edu/~bogacki/cgi-bin/lat.cgi?c=rref
% A=[1 1 1;0 1 1;1 1 0];
% x=[1 0 1]';
% mod(A*x,2)
% 
% A1=[A eye(3)];
% mod(inv(A),2)
% mod(rref(A1),2)


% %P4
% X1=[1 1 1 1 1 1 1;
%     1 2 3 4 5 6 7 ]';
% y=[17 15 11 10 8 7 7]';
% B1=inv(X1'*X1)*X1'*y
% yHat1=X1*B1
% norm(y-yHat1)
% 
% 1^(-1)
% 2^(-1)
% 3^(-1)
% 4^(-1)
% 5^(-1)
% 6^(-1)
% 7^(-1)
% 
% format bank
% X2=[1 1 1 1 1 1 1; 1^(-1) 2^(-1) 3^(-1) 4^(-1) 5^(-1) 6^(-1) 7^(-1)]';
% B2=inv(X2'*X2)*X2'*y
% yHat2=X2*B2
% norm(y-yHat2)


% %P5
% A=[7 -3;9 -5];
% [V,d]=eig(A)
% Arg=[
%     V(1,1) V(1,2) 1;
%     V(2,1) V(2,2) 2];
% rref(Arg)


% %P6
% P=[1;0;-1];
% norm(P)
% Q=[1 2 3]';
% R=[0^2 1^2 2^2]';
% 
% pqr=[P Q R];
% gs(pqr)
% 
% 







