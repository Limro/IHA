function [H, P] = ParityMatrix(G)
% Parity check matrix.
% Construct a ParityMatrix from a generator matrix, G

[r, c] = size(G);
nk = c - log2(r);
P = G(:,1:nk);
EyeSize = length(P(1,:));
H = [eye(EyeSize) P'];

end