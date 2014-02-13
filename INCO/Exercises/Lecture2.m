clc, clear
% Exercise 1.1
disp('Exercise 1.1')
disp('Problem 1')
M = zeros(6,2);

M(1,1) = 0.4;
M(2,1) = 0.2;
M(3,1) = 0.2;
M(4,1) = 0.1;
M(5,1) = 0.05;
M(6,1) = 0.05;

% (a)   Find the self-information associated with each symbol, 
%       and the entropy of the source.

%Column 1 = probability
%Column 2 = Information, -log2(probability)

%entropy, sum P(a)*I(a)
for n = 1:6
    M(n,2) = -log2(M(n,1));
end
disp(M)
H = sum(M(1:end,1).*M(1:end,2))

% (b)   Calculate the maximum possible source entropy, 
%       and hence determine the source efficiency.
MaxSourceEntropy = log2(6) %log2(MaxArraySize)


%%%%%---------------------------------------------
%Problem 1.2

% (a)   Calculate the entropy of a DMS that generates five symbols 
%       {A, B, C, D, E } with probabilities PA = 1/2, PB = 1/4, 
%       PC = 1/8, PD = 1/16 and PE = 1/16.
disp('Problem 2')
M = zeros(5,2);
M(1,1) = 1/2;
M(2,1) = 1/4;
M(3,1) = 1/8;
M(4,1) = 1/16;
M(5,1) = 1/16;


%Entropy (DMS)
H = sum(M(1:end,1).*log2(1./M(1:end,1)))

% (b)   Determine the information contained in the emitted 
%       sequence DADED.

%Information (probability)
for n = 1:5
   M(n,2) = -log2(M(n,1)); 
end
Bits = 3*M(4,2)+M(1,2)+M(5,2)
disp(M)

%-------------------------------------------------
disp('Problem 3')
%   Consider a binary channel with input and output 
%   alphabets {0, 1} and the transition probability matrix:
%   P(0) = 0.5, P(1) = 0.5
Weight = [1/2 ; 1/2];
Pch = [3/5 2/5 ; 1/5 4/5];

%   Determine the a priori and the two a posteriori entropies 
%   of this channel.

pri = Priori(Weight)
pos0 = Posteriori(Weight, Pch, 0)
pos1 = Posteriori(Weight, Pch, 1)

%1, 0.8112, 0.9182
