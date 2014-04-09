function res = AtLeastInTrials(n, k, p)
% 'A' occurs at least k times in n trials
% 'n' = trials
% 'k' = occurrence
% 'p' = probability of 'A', Pr(A)

q = 1-p;
val = 0;
for i = k:n
    tmp = nchoosek(n,i) * p^i * q^(n-i);
    val = val + tmp;
end
res = val;
end