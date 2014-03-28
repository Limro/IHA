function res = Backward(A, B, x, y)
%Backward probability: P(x_i/y_j)
%A = P(X) (all values)
%B = Channel describtion
%x = Which x to be transmitted
%y = Which y is the condition
% The probability that symbol x_i has been transmitted if symbol y_j is 
% received, is also referred to backward probability, or a posteriori 
% probability

% TotalSum = 0;
% for i = 1:length(B(1,:))
%     TotalSum = TotalSum + sum(B(1:end,i) .* A(1:end));
% end
% 
% TotalSum = roundn(TotalSum,-2); %round down
% 
% %if PY ~= 1
% if TotalSum ~= 1
%     %disp('First matrixs sum != 1')
%     disp('!Please check the matrix input!')
%     error('Error in sum of output!')
% end

res = B(x+1,y+1)*A(x+1)/Py(A, B, y);
end