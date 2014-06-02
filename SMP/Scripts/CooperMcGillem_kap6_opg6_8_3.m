% Problem 6-8.3
t1 = 0.0:0.001:0.099;
s1 = sin(100*pi*t1);
s = zeros(1,1000);
s(700:799) = s1;
n1 = randn(1,1000);
x = s + n1;

N = length(t1);
y = fliplr(s1);
z = conv(y,x)/(N+1);
z = z((1:1000)+length(y)/2);
tt = 0:0.001:0.999;
subplot(3,1,1); plot(tt,s); ylabel('Signal without noise');
subplot(3,1,2); plot(tt,x); ylabel('X');
subplot(3,1,3); plot(tt,z(1:1000)); xlabel('Time'); ylabel('R');