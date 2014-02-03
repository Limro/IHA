function [pri,pos0,pos1] = Posteriori(A, B)

PrioriA = A(1,1)*log2(1/A(1,1)) + A(2,1)*log2(1/A(2,1));
pri = PrioriA;

PY0 = B(1,1)*A(1) + B(2,1)*A(2);
PY1 = B(1,2)*A(1) + B(2,2)*A(2);
PY = PY0+PY1;

if PY ~= 1
    disp('P(y=0) + P(y=1) != 1')
    disp('!Please check the matrix input!')
    error('Error in sum of output!')
end

P00 = B(1,1)*A(1)/PY0;
P01 = B(1,2)*A(1)/PY1;
P11 = B(2,2)*A(2)/PY1;
P10 = B(2,1)*A(2)/PY0;

PosterioriA = P00*log2(1/P00) + P10*log2(1/P10);
PosterioriB = P01*log2(1/P01) + P11*log2(1/P11);
pos0 = PosterioriA;
pos1 = PosterioriB;
a = 0;