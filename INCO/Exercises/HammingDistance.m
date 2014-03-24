function dmin = HammingDistance(A)
% Calculate the Hamming distance of every two vectors of a matrix.

s = length(A(:,1));
dmin = 0;
temp = 0;
for i = 1:s
    for j = i+1 : s
        temp = HammingWeight(A(i,:), A(j,:));
    end
    
    if temp < dmin
        dmin = temp;
    elseif dmin == 0 %First run goes here
        dmin = temp;
    end
end

end


