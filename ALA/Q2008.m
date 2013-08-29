%Q1_2008

% %P1
% A=[2 3 2 3;2 1 -1 1];
% rref(A)

% %P2
% Data=[1 3 3 1;1 1 2 2;1 1 1 1];
% T=[1 .25 1.25;0 1 1;0 0 1];
% Connections=[ 
%     0 1 0 1;
%     1 0 1 0;
%     0 1 0 1;
%     1 0 1 0];
% 
% Data1 = T*Data; 
% 
% Data2=Data;
% Data2(1,:)=Data2(1,:)./Data2(3,:);
% Data2(2,:)=Data2(2,:)./Data2(3,:);
% Data2 = Data2(1:2,:)';
% 
% Data1(1,:)=Data1(1,:)./Data1(3,:);
% Data1(2,:)=Data1(2,:)./Data1(3,:);
% Data1 = Data1(1:2,:)';
% 
% figure(1)
% subplot(1,2,1)
% gplot(Connections, Data2)
% axis([0.5 5.5 0 3.5]);
% title('Før')
% subplot(1,2,2)
% gplot(Connections, Data1)
% axis([0.5 5.5 0 3.5]);
% title('Efter')



% %P4
% A=[ 
%     3 -3 3 1 0;
%     4 -3 4 1 0;
%     2 -2 2 1 0];
% rref(A)


%P6
A=[3 0 0;
    -4 6 2;
    16 -15 -5];
[v,e]=eig(A)
P=[1 0 0;0 -1 1;2 2.5 -3]
P1=inv(P)
D=[3 0 0; 0 1 0; 0 0 0]

syms k;
Ak=P*D^k*P1

