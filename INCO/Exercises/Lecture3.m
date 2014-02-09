%Exercise 1.3

A = [0.2 ; 0.8];
B = [0.75 0.25 ; 0.25 0.75];

% totalSum = 0;
% for n = 1:length(B(:,1))
%     totalSum = totalSum + (-log2(B(n,1)) -log2(B(n,2)));
% end
% totalSum

%Entropy, H(X)
sum(A(1:end,1) .* log2(1 ./ A(1:end,1)))

%H(Y/X)

%H(Y)
Hy(A, B)

%Mutal information, I(X/Y)
IXY = HY - HYX

%Answers: 0.722, 0.123, 0.189

