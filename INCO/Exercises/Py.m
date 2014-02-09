function res = Py(A, B, y)

    value = 0;
    for i = 1:length(A(:))
        value = value + B(i, y+1)*A(i);
    end
    
    res = value;
end