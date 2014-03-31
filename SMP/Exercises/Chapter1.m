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




