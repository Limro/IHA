function pos = Post(A, B, x, y)

% 100% probalbility on input
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

pos = B(x+1,y+1)*A(x+1)/sum(B(1:end,y+1) .* A(1:end,1));
end