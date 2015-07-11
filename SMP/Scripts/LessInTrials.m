function res = LessInTrials(n, k, p)
% 'A' occurs less than k times in n trials
% 'n' = trials
% 'k' = occurrence
% 'p' = probability of 'A', Pr(A)

q = 1-p;
val = 0;
for i = 0:k-1
    tmp = nchoosek(n,i) * p^i * q^(n-i);
    val = val + tmp;
end
res = val;
end