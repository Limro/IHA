function res = CodingRate(M)
%Coding rate for a matrix
%message: x. 2^x = #rows
%Coding rate = #rows/matrixColumns

[r c] = size(M);

messageLength = log2(r);
res = messageLength / c;

end