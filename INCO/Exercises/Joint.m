function res = Joint(A, B, x, y)
% P(x_i, y_j) = P(x_i/y_j) * P(y_j)
% Joint probability

res = Backward(A, B, x, y) * Py(A, B, y);

end