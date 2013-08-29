%  A=[3 2 1 -1;4 -1 0 7;3 5 2 2];
%  ATA=A'*A;
%  [V,D]=eig(ATA)
%  gs(ATA)
% 
% A=zeros(2);
% b=zeros(2,1);
% 
% [U, D, V]=svd(A);
% Ur = U(:,1:2);
% D=S(1:2,1:2);
% Vr=V;
% xhat=Vr*inv(D)*Ur'*b

% A=[-3 0 ; 0 0];
% ATA=A'*A;
% rref([0 0 0;0 -9 0])

% A=[2 -1;2 2];
% ATA=A'*A
% l1=(13+sqrt(13^2-4*36))/2
% l2=(13-sqrt(13^2-4*36))/2
% rref1=rref([ATA-[l1 0;0 l1] [0;0]])
% rref2=rref([ATA-[l2 0;0 l2] [0;0]])
% 
% syms la;
% A=[7 0 5;1 0 5]';
% ATA=A'*A
% 74*26-100*la+la^2-1024
% d1=(100+sqrt(100^2-4*900))/2
% d2=(100-sqrt(100^2-4*900))/2
% la1=sqrt(d1)
% la2=sqrt(d2)


A=[1/sqrt(2) 0 1/sqrt(2)]';
b=[ 1 1 1]';
gs2(A,b)