function [pri,pos0,pos1] = Posteriori(A, B)

priSum = 0;
for j = 1:length(A(:,1))
   priSum =  A(j,1) .* log2(1./A(j,1));
end
pri = priSum;

TotalSum = 0;
for i = 1:length(A(:,1))
    TotalSum = TotalSum + sum(B(1:end,i) .* A(1:end));
end

TotalSum = roundn(TotalSum,-2); %round down

%if PY ~= 1
if TotalSum ~= 1
    disp('First matrixs sum != 1')
    disp('!Please check the matrix input!')
    error('Error in sum of output!')
end

PY0 = sum(B(1:end,1) .* A(1:end,1));
PY1 = sum(B(1:end,2) .* A(1:end,1));

P00 = B(1,1)*A(1,1)/PY0;
P01 = B(1,2)*A(1,1)/PY1;
P11 = B(2,2)*A(2,1)/PY1;
P10 = B(2,1)*A(2,1)/PY0;

pos0 = P00*log2(1/P00) + P10*log2(1/P10);
pos1 = P01*log2(1/P01) + P11*log2(1/P11);
