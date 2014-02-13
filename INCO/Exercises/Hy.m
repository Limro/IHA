function res = Hy(A, B)
% Output entropy, H(Y)
% H(Y) = P(y_1)*log2(1/P(y_1) + P(y_n)*log2(1/P(y_n)
%A = P(X) (all values)
%B = Channel describtion

val = 0;
for i = 0:length(B(1,:))-1
    val = val + Py(A, B, i) * log2(1/Py(A, B, i));
end
res = val;
end