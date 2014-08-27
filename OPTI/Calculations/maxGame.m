function res = maxGame(Payoff, Minima)

cols = size(Payoff,2);
rows = size(Payoff,1);
buffer = zeros(1,rows);

for x = 1:cols
%    for y = 0:rows
    res(1,x) = Payoff(x,:) * Minima;
%    end
end
end