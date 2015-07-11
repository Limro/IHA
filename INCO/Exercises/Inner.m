function res = Inner(a,b)
% This is a MatLab function to compute the inner product of
% a vectors a, and matrix b.  
% Call syntax: y = inner(a,b) or inner(a,b)
% Input: a vector and a matrix
% Output: The value of the inner product of a and b.

    res = zeros(1,size(b,2));
    for k=1:size(b,2)
        c = 0;
        for i = 1:size(a,2)
            tmp = a(1,i)*b(i,k);
            c = c + tmp;
        end
        res(1,k) = mod(c,2);
    end

end