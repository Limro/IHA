syms n;
f(n) =n^2+n+41;
ArrSize = 40;
Array=[zeros(ArrSize,3)];

for i=1: ArrSize
    Array(i,1) = i;
    Array(i,2) =f(i);
    Array(i,3) = isprime(Array(i,2));
end
Array