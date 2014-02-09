function res = Equivocation(A, B)

summa = 0;
for x = 0:length(B(:,1))-1
    for y = 0:length(B(1,:))-1
        summa = summa + Joint(A, B, x, y) * log2(1 / Post(A, B, x, y));
    end
end

res = summa;
end