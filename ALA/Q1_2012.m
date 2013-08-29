%2012 Q1

% %P1
% A=[2 2;3  4];
% B=[1 2;-1 2];
% C=[4 -2 ;1 0];
% 
% X=inv(A)*B
% X=inv(A^2)*(-B)
% X=inv(A)*C*inv(B)
% X=inv(A+B)*C
% X=0


% %P2
% A=[1 1 0 1;1 0 1 0;0 1 1 1;1 1 1 1];
% mod(rref(A),2)

% %P4
% X1=[ 1 1 1 1;
%     0 4 25 36]';
% y=[ 1 6 17 19]';
% 
% B1=inv(X'*X)*X'*y
% y1Hat=X1*B1
% Fit1=norm(y-y1Hat)
% 
% 
% X2=[ 0 2 5 6;
%     0 4 25 36]';
% B2=inv(X2'*X2)*X2'*y
% y2Hat=X2*B2
% Fit2=norm(y-y2Hat)


% %P5
% A=[1 2;3 4];
% B=[2 3;4 1];
% 1*2+2*3+3*4+4*1
% 
% v1=A
% 
% v2=B-(sum(dot(B,v1))/sum(dot(v1,v1))*v1)


%P6
A=[3 -3 4;6 -6 5;9 -9 10];
b=[1 2 4]';
Arg=[A b];
rref(Arg)
[U,S,V]=svd(A)
Rank=rank(A)
Ap = V(:,1:Rank)*inv(S(1:Rank,1:Rank))*U(:,1:Rank)'
xHat=Ap*b