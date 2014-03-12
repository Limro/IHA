clc, clear

syms a X;

eq =  X^6 + 2*X^5*a^3 + 3*X^5*a^2 + 3*X^5*a + X^5 + 11*X^4*a^3 + 12*X^4*a^2 + 16*X^4*a + 9*X^4 + 28*X^3*a^3 + 36*X^3*a^2 + 39*X^3*a + 23*X^3 + 41*X^2*a^3 + 39*X^2*a^2 + 36*X^2*a + 36*X^2 + 19*X*a^3 + 20*X*a^2 + 25*X*a + 22*X + 5*a^3 + 7*a^2 + 8*a + 4;

a = strtrim(strsplit(char(eq),'+'));
y = 0;
for i=1:length(a)
    tmp = 1;
    R = 1;
    
    b = strtrim(strsplit(char(a(i)),'*'));
    if length(b) == 3
        tmp = mod(sym(char(b(1)))*sym(char(b(2))), 2);
        R = sym(char(b(3)))*tmp;
    else
        for j=1:length(b)
            tmp = tmp*sym(char(b(j)));
        end
        R = mod(sym(char(tmp)),2);
    end
        
    y = y + R;
end

y