function res = CodingRate(M)
%Coding rate for a matrix
%message: x. 2^x = #rows
%Coding rate = #rows/matrixColumns

messageLength = log2(length(M(:,1)));
res = messageLength / length(M(1,:));

end