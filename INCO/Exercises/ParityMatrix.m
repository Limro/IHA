function [res] = ParityMatrix(G)
%Parity check matrix.

nk = length(G(1,:))-log2(length(G(:,1)));
P = G(:,1:nk);
EyeSize = length(P(1,:));
[res] = [eye(EyeSize) P'];

end