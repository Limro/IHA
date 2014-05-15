function [min, max] = poissKonfi(x, t)
% Poisson 95% konfident interval.
%
% [min, max] = poissKonfi(x, t)
% input values:
%   x = Observation count
%   t = time interval

u = norminv(1- (0.05/2));

min = 1/t * (x+ u^2/2 - u*sqrt(x+u^2/4));
max = 1/t * (x+ u^2/2 + u*sqrt(x+u^2/4));

end