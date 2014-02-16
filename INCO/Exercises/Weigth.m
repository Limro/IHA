function dist = HammingWeigth(A, B)
% Calculate the Hamming weigth of a vector.

dist = 0;
temp = 0;
for i = 1:length(A)
    if A(1,i) ~=  B(1,i)
        temp = temp + 1;
    end
    
    if temp == 0
        %The zero vector
    elseif temp > dist
        dist = temp;
    elseif dist == 0 %First run goes here
        dist = temp;
    end
end

end