function [H, P] = ParityMatrix(G)
% Parity check matrix.
% Construct a ParityMatrix from a generator matrix, G

[r, c] = size(G);
nk = c - r;
P = G(:,1:nk);
EyeSize = eye(nk, nk);
H = [EyeSize P'];

end