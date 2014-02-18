clc, clear
disp('Exercise 3.2')
%Verify that the generator polynomial g(X) = 1 + X + X2 + X3 generates 
%   a binary cyclic code Ccyc(8, 5) and determine the code polynomial 
%   for the message vector m = (10101) in systematic form.

% http://www.mathworks.se/help/comm/ref/cyclgen.html
g = [1 1 1 1 0 0 0 0];
m = [ 1 0 1 0 1]; %message vector
pol = cyclpoly(8,5);

[parmat,genmat,k] = cyclgen(8,pol,'all');
genmat

if genmat(1,:) == g
    disp('Equal')
else
    disp('Not equal')
end

valid_code = encode(m, 8, 5, 'cyclic', pol)
