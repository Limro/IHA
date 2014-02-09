function res = Posteriori(A, B, y)

val = 0;
pos = 0;
for x = 0 : length(B(:,1))-1
    pos = Post(A, B, x, y);
    val = val + pos*log2(1/pos);
end
res = val;