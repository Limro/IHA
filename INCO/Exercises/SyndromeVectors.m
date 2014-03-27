function res = SyndromeVectors(E, P, r, t)
% Calculates the syndrome vectors for a receive vector based on 
% how many errors can be corrected.
% Input: E (from gfPol2Table)
%        P (from gfPol2Table)
%        r - the receive vector
%        t - amount of errors

syndromes = sym(zeros(t^2,1)); % Prepare the matrix
syms a;
columns = size(r,2); %columns of receive vector
rows = size(E,1)-2; %rows of alphas +1

for j = 1:2*t % #syndrome to calculate
    synTmp = sym(r(1,1)); %The first value is as it comes
    for i = 2:columns % For each column of the receive vector
        factor = j*(i-1); % Calculate the factor
        if factor > rows % If the factor is more than the alphas can account for
           factor = mod((i-1)*j,rows+1); %Modulo max alpha
        end
        
        tmp = r(1,i)*a^(factor); % Store the result
        tmp = subs(tmp, E, P); % Substitude an alpha with correct alphas
        synTmp = synTmp + tmp; % Store new result for later
    end
    syndromes(j,1)= mod(synTmp,2); % Modulo2 for
end
res = syndromes;
end