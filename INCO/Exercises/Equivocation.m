function res = Equivocation(A, B)
%Equivocation, H(X/Y)
%A = P(X) (all values)
%B = Channel describtion
%Sum(P(x_i, y_j)*log2(1/P(x_i/y_J)))

summa = 0;
for x = 0:length(B(:,1))-1
    for y = 0:length(B(1,:))-1
        summa = summa + Joint(A, B, x, y) * log2(1 / B(x+1,y+1));
    end
end

res = summa;
end