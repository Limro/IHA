function res = minGame(Payoff, Minima)

cols = size(Payoff,2);
rows = size(Payoff,1);
buffer = zeros(1,rows);

for x = 1:cols
%    for y = 0:rows
    res(1,x) = Minima' * Payoff(:,x);
%    end
end
end