function V= gs2(A,V)

for i = 1:size(A,2)
    V(:,i)=A(:,i);
    if i > 1
        for n=i-1:1
            V(:,i)=V(:,i)- (dot(A(:,i), V(:,n))/dot(V(:,n),V(:,n)));
        end
    end
end