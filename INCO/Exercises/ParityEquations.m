function [res] = ParityEquations(M)
%Systematic form for block code parity equations

[r, c] = size(M);
mv = sym(zeros(1, r));
cv = sym(zeros(1, c));

for k=1:r
    mv(k) = sym(sprintf('m%d', k-1));
end

for l=1:c
    cv(l) = sym(sprintf('c%d', l-1));
end

for i = 1:length(M(1,1:end))
    tmp = 0;
    for j = 1:r
        tmp = tmp + mv(j)*M(j,i);
    end
    res(i,1) = cv(i) == tmp;
end

end