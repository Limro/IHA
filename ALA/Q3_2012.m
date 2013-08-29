%2012 Q3
format short
% %P1
% A=[-1 2 1 4 ;
%     1 2 2 6 ];
% arg=[A [0;0]];
% rref(arg)


% %P2
% syms a;
% rod=power(-(a+2),2)-4*1*(2*a-2);
% d1=((2+a)+sqrt(rod))/2
% d2=((2+a)-sqrt(rod))/2
% 
% 
% A=[3 2; 1 2];
% [v,d]=eig(A)


% %P3
% A=[-2 1 2 0;-8 6 4 0;-15 3 15 0];
% rref(A)


% %P4
% format shortg;
% X=[1 1 1 1 1 1;0 1 4 9 16 25]';
% y=[1 3 7 11 16 24]';
% syms b1 b2;
% [solu1, solu2]=solve(X'*X*[b1;b2]==X'*y)


%P6
syms a x;
f=exp(-x);
g=exp(-2*x);
fxf=int(f*f,0,inf)

v2=g-(dot(g,f)/dot(f,f))*f
solve(a-dot(a,f)/dot(f,f)*f,a)