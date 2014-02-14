function pos = Post(A, B, x, y)
%P(x_i/y_j)

pos = B(x+1,y+1)*A(x+1)/sum(B(1:end,y+1) .* A(1:end,1));
end