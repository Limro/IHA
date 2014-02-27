function [res] = ParityMatrix(G)
%Parity check matrix.

[r, c] = size(G)
nk = c - log2(r)
P = G(:,1:nk)
EyeSize = length(P(1,:))
[res] = [eye(EyeSize) P']

end