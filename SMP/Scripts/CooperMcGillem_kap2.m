% Eksempel 1 - binomialfordeling
n = 100;    % Antal trials
p = 0.5;    % Sandsynlighed for succes
k = 0:n;    % k-værdier
Pn = binopdf(k,n,p);
figure
bar(0:100,Pn)
axis([0 100 0 0.1])
xlabel('k')
ylabel('P_n(k)')

% Eksempel 2.1 - PDF og CDF for binomialfordeling
%   PDF: Probability Density Function (tæthedsfunktion)
%   CDF: Cumulative Distribution Function (fordelingsfunktion)
x = k;
fx = Pn;
Fx = cumsum(fx);
figure
subplot(2,2,1)
plot(x,fx), title('f_X(x)')
subplot(2,2,2), title('F_X(x)')
plot(x,Fx), title('F_X(x)')

% Eksempel 2.2 - PDF og CDF for uniformfordeling
x = 0:0.1:10;
fx = zeros(length(x));
a = 2.;
b = 6.;
fx(find(x==a):find(x==b))=1;
fx = fx/sum(fx);    % Normaliser areal under kurven til 1
Fx = cumsum(fx);    % Akkumuleret sum af elementerne i fx
subplot(2,2,3)
plot(x,fx), title('f_X(x)')
subplot(2,2,4)
plot(x,Fx), title('F_X(x)')

% Eksempel 3.1 - PDF og CDF for standard normalfordeling:
%   Middelværdi = 0
%   Varians = 1
x = -5:0.1:5;
mean        = 0;
variance    = 1;
stddev      = sqrt(variance);   % Standard deviation
fx = normpdf(x,mean,stddev);
Fx = normcdf(x,mean,stddev);
figure
subplot(2,2,1)
plot(x,fx), title('f_X(x)')
subplot(2,2,2)
plot(x,Fx), title('F_X(x)')

% Eksempel 3.2 - PDF og CDF for normalfordeling med
%   Middelværdi = 1
%   Varians = 2
x = -5:0.1:5;
mean        = 1;
variance    = 2;
stddev      = sqrt(variance);   % Standard deviation
fx = normpdf(x,mean,stddev);
Fx = normcdf(x,mean,stddev);
subplot(2,2,3)
plot(x,fx), title('f_X(x)')
subplot(2,2,4)
plot(x,Fx), title('F_X(x)')

% Eksempel 4 - Histogram matching
% Lav standard normalfordelte data ud fra uniformt fordelte data.
N = 1000;
x = rand(1,N);          % N datapunkter, som er uniformt fordelte på intervallet [0,1]
Fx = unifcdf(x,0,1);    % Værdien af fordelingsfunktionen (CDF) for hvert x
                        % Bemærk, at for en uniform fordeling på
                        % intervallet [0,1], så er Fx(x) = x;
yrange = -5:0.1:5;      % Range af y-værdier, som vi skal bruge til at beregne den inverse af Fy.
Fy = normcdf(yrange,0,1); % En slags lookup table
% Invers mapping:
%   For hvert x, beregn Fx(x) og søg efter den værdi af Fy(y), som ligger
%   tættest på Fx(x).
for i = 1:N
    distance = abs(Fx(i)-Fy);
    [min_val,min_ix] = min(distance);
    y(i) = yrange(min_ix);
end
% Verificer, at de generede y-værdier følger en standard normalfordeling
step = 0.5;
yrange = -5:step:5;
h = hist(y,yrange);
fy = normpdf(yrange,0,1);
figure
bar(yrange,h/N/step)
hold on
plot(yrange,fy,'r')
hold off
legend('Data histogram','Teoretisk PDF')

% Eksempel 5 - Histogram udligning i et billede
I = imread('camera.png');
x = 0:255;
num_pixels = prod(size(I));
fx = hist(I(:),x)/num_pixels;
Fx = cumsum(fx);
yrange = 0:255;
I_histeq = zeros(size(I),'uint8');
for i = 1:length(x)
    ix = find(I==x(i));
    distance = abs(Fx(i)-Fy);
    [min_val,min_ix] = min(distance);
    y = yrange(min_ix);
    I_histeq(ix) = y;
end
fy = hist(I_histeq(:),yrange)/num_pixels;
Fy = cumsum(fy);
figure,
subplot(2,3,1),plot(x,fx),title('f_x')
subplot(2,3,2),plot(x,Fx),title('F_x')
subplot(2,3,3),imshow(I)
subplot(2,3,4),plot(yrange,fy),title('f_y')
subplot(2,3,5),plot(yrange,Fy),title('F_y')
subplot(2,3,6),imshow(I_histeq)

