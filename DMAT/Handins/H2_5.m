n=0.1:1:10;
f=power(n,3)-5*n-8;
figure(1)
subplot(1,1,1)
plot(n, f, 's', n, f)
axis([0 5 -25 100])
title('f(n)')
set(gca, 'XTick', [0:1:6])
set(gca, 'YTick', [0])
grid on


