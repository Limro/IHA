function res = Hy(A, B)
% Output entropy, H(Y)
% H(Y) = P(y_1)*log2(1/P(y_1)) + ... + P(y_n)*log2(1/P(y_n))
% A = P(X) (all values)
% B = Channel describtion

val = 0;
for i = 0:size(B,2)-1
    tmp = Py(A, B, i) * log2(1/Py(A, B, i));
    val = val + tmp;
end
res = val;
end