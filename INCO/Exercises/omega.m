function hYX = omega(A, M)

% p(x1)*(p(y1/x1)*log2(1/p(y1/x1)) + p(y2/x1)*log(1/p(y2/x1)) + ...)
% p(x2)*(p(y1/x2)*log2(1/p(y1/x2)) + p(y2/x2)*log(1/p(y2/x2)) + ...)
hYX = A(1,1)* (M(1,1)*log2(1/M(1,1)) + M(1,2)*log2(1/M(1,2))) + A(2,1)* (M(2,1)*log2(1/M(2,1)) + M(2,2)*log2(1/M(2,2)));