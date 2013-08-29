function hat(A, y)
% HAT  Project the vector y onto the matrix A
%   A = Plane or space to be projected onto
%   y = Vector you what the 'hat' of.
%
%   See also SUM, PLUS.

yHat=zeros(size(A(:,1)));
for n=1:size(A(1,:))
    yHat=yHat + (dot(y, A(:,n))/dot(A(:,n), A(:,n)))*A;
end
yHat