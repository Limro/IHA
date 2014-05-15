function [min, max] = binoKonfi(x, n)
% Binomial 95% konfident interval.
%
% [min, max] = binoKonfi(x, n)
% input values:
%   x = Observation count
%   n = time interval

u = norminv(1- (0.05/2));

min = 1/(n+u^2) * (x+ u^2/2 - u*sqrt((x*(n-x)/n) + (u^2/4)));
max = 1/(n+u^2) * (x+ u^2/2 + u*sqrt((x*(n-x)/n) + (u^2/4)));

end