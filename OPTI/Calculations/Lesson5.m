%% Golden section
clc, clear

syms N;
range = 0.2;
interval = [1 2];
p = (3-sqrt(5))/2;

res = solve(range/(interval(2) - interval(1)) == (1-p)^N);
ceiling = double(ceil(res));


f = @(x) x^2+4*cos(x);
M = zeros(abs(ceiling), 7); %Golden section
% iteration_k | a_k | b_k | f(a_k) | f(b_k) | [min uncertain interval | max uncertain interval  ]

M(1,:) = [ 0 interval(1) interval(2) f(M(1,2)) f(M(1,3)) interval(1) interval(2)];
for i = 2 : ceiling+1
    M(i,1) = i-1;
    M(i,2) = M(i-1,6) + p*(M(i-1,7) - M(i-1,6));
    M(i,3) = M(i-1,6) + (1-p)*(M(i-1,7) - M(i-1,6));
    M(i,4) = f(M(i,2));
    M(i,5) = f(M(i,3));
    if M(i,4) > M(i,5)
        M(i,6) = M(i,2);
        M(i,7) = M(i-1,7);
    else
        M(i,6) = M(i-1,6);
        M(i,7) = M(i,3);
    end
end

M
%% fibonacci
clc, clear
E = 0.05;

syms N;
range = 0.2;
interval = [1 2];
p = (3-sqrt(5))/2;
N = 4
range/(interval(2) - interval(1)) >= (1+2*E)/fibnum(N+1)


f = @(x) x^2+4*cos(x);
M = zeros(N, 8); % initialization
% iteration_k | p | a_k | b_k | f(a_k) | f(b_k) | [min uncertain interval | max uncertain interval  ]

M(1,:) = [ 0 0 interval(1) interval(2) f(M(1,2)) f(M(1,3)) interval(1) interval(2)];
for i = 2 : N+1
    M(i,1) = i-1;
    M(i,2) = 1-fibnum(N+2-i)/fibnum(N+1+2-i);
    M(i,3) = M(i-1,7) + M(i,2)*(M(i-1,8) - M(i-1,7));
    M(i,4) = M(i-1,7) + (1-M(i,2))*(M(i-1,8) - M(i-1,7));
    M(i,5) = f(M(i,3));
    M(i,6) = f(M(i,4));
    if M(i,5) >= M(i,6)
        M(i,7) = M(i,3);
        M(i,8) = M(i-1,8);
    else
        M(i,7) = M(i-1,7);
        M(i,8) = M(i,4);
    end
end

M