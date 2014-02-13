function res = Forward(A, B, x, y)
%P(y_i/x_j) - Forward probability
%A = P(X) (all values)
%B = Channel describtion
%x = Which x is the condition
%y = Which y to be calculated
% the probability that the channel converts the input symbol
% x_i into the output symbol y_j ; is referred to as forward probability;

TotalSum = 0;
for i = 1:length(B(1,:))
    TotalSum = TotalSum + sum(B(1:end,i) .* A(1:end));
end

TotalSum = roundn(TotalSum,-2); %round down

%if PY ~= 1
if TotalSum ~= 1
    %disp('First matrixs sum != 1')
    disp('!Please check the matrix input!')
    error('Error in sum of output!')
end

res = Backward(A, B, x, y)*PY(A, B, x) / A(x+1);
end