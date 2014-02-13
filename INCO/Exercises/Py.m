function res = Py(A, B, y)
%A = P(X) (all values)
%B = Channel describtion
%y = Which y to be calculated
%P(Y) = P_11 * P(x_1) + P_21 * P(x_2) +...+ P_u1 * P(x_u)
% Probability that a given sumbol is present at the channel ouput

    value = 0;
    for i = 1:length(A(:))
        value = value + B(i, y+1)*A(i);
    end
    
    res = value;
end