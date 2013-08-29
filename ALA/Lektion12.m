% syms t;
% v1 = 1
% v2 = t- ( int(t,t,-1,1)/int(1,t,-1,1))*1
% v3 = t^2- (int(t^2*v2,t,-1,1)/(int(v2*v2,t,-1,1)))*t-(int(t^2*v1,t,-1,1)/int(v1*v1,t,-1,1))*1


%Chap 6.8
%exer 1
X=[1 1 1 1 1;-2 -1 0 1 2]'
y=[0 0 2 4 4]'
W=[1 0 0 0 0;
   0 2 0 0 0;
   0 0 2 0 0;
   0 0 0 2 0;
   0 0 0 0 1]


WX=W*X
Wy=W*y
NormEqu1 = (W*X)'*W*X
NormEqu2 = (W*X)'*W*y
syms b1 b0;
[b0, b1] = solve(NormEqu1*[b0;b1]==NormEqu2)