clc, clear

%% 1-2.1
% a) flipped two coins:
syms h t;
outcomes = [h h;
    h t;
    t h;
    t t]
% All are equal likely

% b) Last digit in phone book
%Last digit is random and equal likely

% c) sum of two digits
%Sum is NOT equal, since few combinations will give 2 and more will give 7

%% 1-4.1

% a)
A= [1];
die = [ 1 2 3 4 5 6];
Py([1], die, 5);

P5 = 1/sum(die)*100
P456 = 3/sum(die)*100
P246 = 3/sum(die)*100

%% 1-4.2
% Two dices
% a) sum = 11
res = zeros(6,6);

for i = 1:6
   for j = 1:6
       res(i,j) = i+j;
   end
end

sum = 0;
for i = 1:size(res,1)
   for j = 1:size(res,2)
      if res(i,j) == 11
          sum = sum+1;
      end
   end
end

P11 = sum/36

% b) less than 5

sum = 0;
for i = 1:size(res,1)
   for j = 1:size(res,2)
      if res(i,j) < 5
          sum = sum+1;
      end
   end
end

Pl5 = sum/36

% c) even number

sum = 0;
for i = 1:size(res,1)
   for j = 1:size(res,2)
      if mod(res(i,j),2) == 0
          sum = sum+1;
      end
   end
end

P_even = sum/36

%% 1-4.3
clear
box = [ ...
    200; %hex
    100; %AND
    50; %flip
    25; %decade
    25]; %shift

% a) flip
flipflop = box(3,1)/sum(box,1)

% b) not hex
notHex = (box(2)+box(3)+box(4)+box(5))/sum(box)

% c) first is shit + second is shift
P_shift1 = box(5)/sum(box);
box(5) = box(5)-1;

P_shift2 = box(5)/sum(box) * P_shift1

%reset
box(5) = box(5)+1;
%% 1-4,4
bad = [ ...
    0.1; % hex
    0.15; % AND
    0.18; % flip
    0.2;
    0.2];

% a) decade and good
decade = box(4)/sum(box);
Good_Decade = decade * (1-bad(4))

% b) Flip flop and good
flipflop = box(3)/sum(box);
Good_flip =  (1-bad(3))

% c) good IC and decade
good = zeros(5,1);
for i = 1:5
   good(i,1) = (1-bad(i))*box(i); 
end

Good_decade = good(4)/sum(good)

%% 1-4,7
clear
box = 25;
bad = 4;

% a) Bad transistor
badTran = bad/box

% b) second bad too
box = box-1;
bad = bad-1;

badTran_2 = (bad/box)

% c) first good, second bad
first_good = (25-4)/25;
second_bad = (4)/24

%% 1-5,2
clear

S = [1 3 5 7 9 11];
A = [1 3 5];
B = [7 9 11];
C = [1 3 9 11];

AuB = union(A,B)
BuC = union(B,C)
AuC = union(A,C)
AiB = intersect(A,B)
AiC = intersect(A,C)
BiC = intersect(B,C)

AiBiC = intersect(intersect(A,B),C) 
cA = setdiff(S, A)
cB = setdiff(S, B)
cC = setdiff(S, C)
cAiB = intersect(setdiff(S,A),B)
AicB = intersect(setdiff(S,B),A)

cBiC = setdiff(S,intersect(B,C))
A_C = setdiff(A,C)
C_A = setdiff(C,A)
A_B = setdiff(A,B)

disp('(A-B) U B')
union(A_B,B)

disp('(A-B) U C')
union(A_B,C)


%% 1-6,1
% all have 1/6 of occuring

% a) Pr(A)
PrA = (size(A,2)* 1/6) / size(S,1)

% b) Pr(B)
PrB = (size(B,2)* 1/6) / size(S,1)

% c) Pr(C)
PrC = (size(C,2)* 1/6) / size(S,1)

% d) Pr(AuB)
PrAuB = (size(union(A,B),2)* 1/6) / size(S,1)

% e) Pr(AuC)
PrAuB = (size(union(A,C),2)* 1/6) / size(S,1)

% f) Pr[(A-C)uB]
PrA_CuB = size(union(setdiff(A,C),B),2) * 1/6 / size(S,1)


%% 1-6.2
clc

Cards = 52;
King = 4/Cards; % 
Spade = 13/Cards; % 
Spades_10 = 1/Cards; % 

% a) AuB: Kings + spades
AuB = (13+3)/52

% b) AiB: Spades and a king
AiB = 1/52

% c) AucB: Not spade but kings + rest
AucB = (52-13+1)/52

% d) AuC: A king or spade 10
AuC = 5/52

% e) BuC: Spade or 10 spade
BuC = 13/52

% f) AiC: A king AND spade 10
AiC = 0

% g) BiC: A spade AND spade 10
BiC = 1/52

% h) (AiB)uiC: (king and spade) + not spade 10 (+ rest)
AiBuiC = 51/52

% i) AiBiC: king and spade and spade10
AiBiC = 0

%% 1-7.1
clc
A = [0.4 ; 0.6];

B = [1-0.08 0.08; 
    0.05 1-0.05];

% a) 0 from a 0
P_00 = A(1,1)*B(1,1); % Pr(r_0|t_0)
P_10 = A(2,1)*B(2,1); % Pr(r_0|t_1)

res = (P_00)/(P_00+P_10)

% b) 1 from a 1
P_01 = A(1,1)*B(1,2);
P_11 = A(2,1)*B(2,2);
res = P_11/(P_01+P_11)

% c) Any is error
%res = received 0 from 1 + received 1 from 0
res = P_10 + P_01

%% 1-7,3
clc
% 10 buttons, 7 works, 2 works 50%, 1 does not

% a) no candy
res = 1 - (7/10 + (2*0.5)/10)

% b) No => never work
res = (1/10) / (2*(0.5*1/10) + 1/10)

% c) Yes => half time work
res = (2*(0.5)*1/10)/(7/10 + 2*(0.5)*1/10)

%% 1-9,1
clc
%syms A B C D E F ;
A = ['A' 'B' 'C' 'D' 'E' 'F'];
B = [1 2 3 4 5 6];

% A1 B1 C1 D1 E1 F1
% A2 B2 C2 D2 E2 F2
% A3 B3 C3 D3 E3 F3
% A4 B4 C4 D4 E4 F4
% A5 B5 C5 D5 E5 F5
% A6 B6 C6 D6 E6 F6

%% 1-10,1
n = 3;
k = 2;
p = 1/2;
q = 1-p;

% a) Both 2 heads
dude = nchoosek(n, k)*p^k*q^(n-k)
both = dude*dude

% b) 0 heads and 3 heads

n = 3;
k = 0;
p = 1/2;
q = 1-p;
dude_non = nchoosek(n, k)*p^k*q^(n-k)

n = 3;
k = 3;
p = 1/2;
q = 1-p;
dude_all = nchoosek(n, k)*p^k*q^(n-k)

both = dude_all * dude_non

%% 1-10,2
clc
% a)
n = 7;
k = 4;
p = 1/2;
%q = 1-p;
W_47 = ExactInTrials(n, k, p)

n = 9;
k = 5;
p = 1/2;
W_59 = ExactInTrials(n, k, p)
% res 1 higher

% b)
n = 7;
k = 4;
p = 1/2;

W_47 = AtLeastInTrials(n, k, p)


n = 9;
k = 5;
p = 1/2;

W_59 = AtLeastInTrials(n, k, p)
%Same size

%% 1-10,6
clc
ErrorC = 0.062;

% a) 6 trials, no error
n = 6;
k = 0;
p = ErrorC;
Ex_6 = ExactInTrials(n, k, p)

% b) 6 trials, 1 error
n = 6;
k = 1;
p = ErrorC;
Ex_6 = ExactInTrials(n, k, p)

% c) 6 trials, more than 1 error
n = 6;
k = 1;
p = ErrorC;
Ex_6 = MoreInTrials(n, k, p)

% d) 6 trials, 1 or more than 1 error
n = 6;
k = 1;
p = ErrorC;
Ex_6 = AtLeastInTrials(n, k, p)