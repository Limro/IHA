function pri = Priori(A)

priSum = 0;
for j = 1:length(A(:,1))
   priSum =  priSum + A(j,1) .* log2(1./A(j,1));
end
pri = priSum;