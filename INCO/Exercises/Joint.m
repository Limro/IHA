function res = Joint(A, B, x, y)

res = Post(A, B, x, y) * Py(A, B, y);
end