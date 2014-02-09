function resu = Hy(A, B)

resu = 0;
val = 0;
for i = 0:length(B(1,:))-1
    val = val + Py(A, B, i) * log2(1/Py(A, B, i));
end
resu = val;
end