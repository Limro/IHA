n=-7:1:7;
f=power(n,3)-5*n-8;
figure(1)
subplot(1,1,1)
plot(n, f, 's', n, f)
axis([-5 5 -25 100])
title('f(n)')
set(gca, 'XTick', [0:1:7])
set(gca, 'YTick', [0])
grid on