% Problem 6_8_4
dt  = 1e-5;
f   = 1/dt;
T   = 1/400;
t   = -4*T:dt:4*T;
N   = length(t);

% a)
x1  = zeros(size(t));
x1(find(abs(t)<T/2))=1;
y1  = sin(2000*pi*t).*x1;
R1=conv(x1,fliplr(y1))/(N+1);
t1=(-(N-1):N-1)*1/f;
subplot(2,2,1), plot(t,x1,t,fliplr(y1)),xlabel('t'),ylabel('x(t) og y(t)')
subplot(2,2,2), plot(t1,R1); xlabel('tau'),ylabel('Ra');

% b)
x2  = sin(2000*pi*t).*x1;
y2  = cos(2000*pi*t).*x1;
R2=conv(x2,fliplr(y2))/(N+1);
t2=(-(N-1):N-1)*1/f;
subplot(2,2,3), plot(t,x2,t,fliplr(y2)),xlabel('t'),ylabel('x(t) og y(t)')
subplot(2,2,4), plot(t2,R2); xlabel('tau'),ylabel('Rb');
