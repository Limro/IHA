function res = Posteriori(A, B, y)
% H(x_i / y_j)
%A = P(X) (all values)
%B = Channel describtion
%y = Which y to be calculated
% The probability that symbol x_i has been transmitted if symbol y_j is 
% received, is also referred to backward probability, or a posteriori 
% probability

val = 0;
tmp = 0; 
for x = 0 : length(B(:,1))-1
    tmp = Backward(A, B, x, y);
    val = val + tmp*log2(1/tmp);
end
res = val;

end
