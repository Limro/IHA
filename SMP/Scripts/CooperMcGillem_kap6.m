t = 0:399;
tau = -399:399;

% Autokorrelation: deterministisk signal
x = ones(1,400);
for i = 11:20
    x(i:20:end) = -1;
end
Rx = conv(x,fliplr(x));
figure
subplot(2,1,1)
stairs(t,x)
xlabel('t')
ylabel('X(t)')
axis([0 400 -1.5 1.5])
subplot(2,1,2)
plot(tau,Rx)
xlabel('tau')
ylabel('R_X(tau)')

% Autokorrelation: non-deterministisk signal
x = ones(1,400);
r = rand(1,length(x)/10);
ix = find(r<=0.5);
for i = 1:length(ix)
    start = (ix(i)-1)*10+1;
    stop = start+9;
    x(start:stop) = -1;
end
Rx = conv(x,fliplr(x));
figure
subplot(2,1,1)
stairs(t,x)
xlabel('t')
ylabel('X(t)')
axis([0 400 -1.5 1.5])
subplot(2,1,2)
plot(tau,Rx)
xlabel('tau')
ylabel('R_X(tau)')

% Autokorrelation: non-deterministisk signal
% Sample autokorrealtionsfunktionen 1000 gange med et ny non-deterministisk
% signal hver gang. Plot til sidst den midlede autokorrelationsfunktion.
Rx_all = zeros(size(Rx));
for iter = 1:1000
    x = ones(1,400);
    r = rand(1,length(x)/10);
    ix = find(r<=0.5);
    for i = 1:length(ix)
        start = (ix(i)-1)*10+1;
        stop = start+9;
        x(start:stop) = -1;
    end
    Rx = conv(x,fliplr(x));
    Rx_all = Rx_all + Rx;
end
figure,
plot(tau,Rx_all,'.-')
xlabel('tau')
ylabel('R_X(tau)')

% Autokorrelation af hvid støj
t = 0:999;
tau = -999:999;
x = randn(1,1000);
Rx = conv(x,fliplr(x));
figure
subplot(2,1,1)
stairs(t,x)
xlabel('t')
ylabel('X(t)')
subplot(2,1,2)
plot(tau,Rx)
xlabel('tau')
ylabel('R_X(tau)')

% Autokorrelation af filtreret hvid støj
t = 0:999;
tau = -999:999;
x = randn(1,1000);
h = ones(1,51)/51;
x = conv(x,h,'same');
Rx = conv(x,fliplr(x));
figure
subplot(2,1,1)
stairs(t,x)
xlabel('t')
ylabel('X(t)')
subplot(2,1,2)
plot(tau,Rx)
xlabel('tau')
ylabel('R_X(tau)')

% Example of autocorrelation calcuation (sine wave + noise)
% Conclusion: Difficult to see that the autocorrelation is periodic.
t = 0:0.001:0.5;
N = length(t);
omega = 50;
x = 2*sin(2*omega*pi*t + 0.25*pi*ones(1,N));
x = x + randn(size(x))*10;
Rx = conv(x,fliplr(x));
figure
subplot(2,1,1); plot(t,x)
subplot(2,1,2); plot(Rx)

% Example 4 of crosscorrelation calcuation
% Conclusion: Easy to see that the crosscorrelation is periodic.
y = 2*sin(2*omega*pi*t);
Rxy = conv(x,fliplr(y));
figure
subplot(2,1,1); plot(t,x)
subplot(2,1,2); plot(Rxy)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eksempel med en state-space model (Markov chain)
% (http://en.wikipedia.org/wiki/Markov_chain)
% For en Markov model afhænger den nuværende state x(t) kun af den forrige
% state, x(t-1).
% Dette bør man kunne se i autokorrelationsfunktionen.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
allRx = zeros(1,1999);
N = 5; % Antal states

% Transitionsmatrix
P = eye(N)+rand(N);
P = P./repmat(sum(P,2),1,N);
    
% Start i state 1
states = [];
states(1,:) = zeros(1,N);
states(1,1) = 1;

for t = 2:1000
    % Tæthedsfunktion for mulige state-overgange
    % (Svarer til udvælgelse af en bestemt række i P).
    f = states(t-1,:)*P;
    
    % Fordelingsfunktion
    F = cumsum(f);
    
    % Tilfældigt tal mellem 0 og 1 (uniform), som vi skal bruge til at
    % bestemme den næste state i tidsserien.
    r = rand(1);
    
    % Fin næste state vha. histogram matching:
    % Givet en sandsynlighed (r) og en fordelingsfunktion (F), hvilken
    % state står jeg så i?
    res = find(r>F);
    if isempty(res)
        new_state = 1;
    else
        new_state = length(res)+1;
    end
    states(t,new_state) = 1;
end

% Generer state tidsserie
x = [];
for s = 1:N
    x(find(states(:,s)==1)) = s;
end
xm = mean(x);
x = x - xm;

% Autokorrelationsfunktion
Rx = conv(x,fliplr(x));
figure,plot(Rx,'.-')

% State-space tidsserie
figure,plot(x+xm,'.')
