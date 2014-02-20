function c = codeTable(G)
% Calculate the code table given the generator matrix
% codeTable(G) returns the code table
[k,n] = size(G);
m = zeros(2^k,k);
c = zeros(k,1);


for i = 0:2^k-1
    m(i+1,:) = rot90(dec2binvec(i,k),2);
end

c = mod(m*G,2);

end