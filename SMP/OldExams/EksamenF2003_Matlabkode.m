x=[0 -1 0 0 -1 0 1 0 0 0];
y=[0 0 0 -1 0 1 0 1 0 0];

figure(1);
subplot(1,2,1);
stem(x,'filled');title('X');
subplot(1,2,2);
stem(y,'filled');title('Y');
pause;

%svar 1
mean(x)

%svar 2
var(x) %unbiased
mean(x.*x)-mean(x)^2 %biased

%svar 3
rxx=xcorr(x,'biased');
figure(2)
stem(rxx);title('rxx');
pause;
ryy=xcorr(y,'biased');
figure(3)
stem(ryy);title('ryy');
pause;

%svar 4.
rxy=xcorr(x,y,'biased');
figure(4);
subplot(1,2,1);
stem(rxy);title('rxy');

ryx=xcorr(y,x,'biased');
subplot(1,2,2);
stem(ryx);title('ryx');
