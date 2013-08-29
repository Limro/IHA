function [V,Q,R] = gs(A)

V=zeros(size(A));

for i = 1:size(A,2)
    V(:,i)=A(:,i);
    if i > 1
        for n=i-1:-1:1
            V(:,i)=V(:,i)- ((dot(A(:,i), V(:,n))/dot(V(:,n),V(:,n)))*V(:,n));
        end
    end
end

format bank

[m, n]=size(A); 
Q=zeros(m,n);
R=zeros(n,n);

for j=1:n
    v=A(:,j);
    for i=1:j-1
        R(i,j)=Q(:,i)'*A(:,j);
        v=v-R(i,j)*Q(:,i);
    end
    R(j,j)=norm(v);
    Q(:,j)=v/R(j,j);
end
