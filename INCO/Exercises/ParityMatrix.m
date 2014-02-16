function [res] = ParityMatrix(G)
%Parity check matrix.

nk = length(G(1,:))-3;
P = G(:,1:nk);
EyeSize = length(P(1,:));
[res] = [eye(EyeSize) P'];

end