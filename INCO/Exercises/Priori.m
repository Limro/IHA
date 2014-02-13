function pri = Priori(A)
%Entropy, H(X)
%H(X) = Sum(P(x_i) * log2(1/P(x_i)))

priSum = 0;
for j = 1:length(A(:,1))
   priSum =  priSum + A(j,1) .* log2(1./A(j,1));
end
pri = priSum;

end