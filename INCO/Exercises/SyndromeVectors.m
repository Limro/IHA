function res = SyndromeVectors(E, P, r, t)

s = sym(zeros(t^2,1));
syms a;
row = size(r,2); %columns of receive vector
f = size(E,1)-2; %rows of alphas +1

for j = 1:2*t
    e = sym(r(1,1));
    for i = 2:row
        k = j*(i-1);
        if k > f
           val(1,i) = k;
           k = mod((i-1)*j,f+1); 
        end
        tmp = r(1,i)*a^(k);
        tmp = subs(tmp, E, P);
        e = e + tmp;
    end
    s(j,1)= mod(e,2);
end
res = s;
end