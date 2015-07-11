function res = Correction(distance)
%Error Correction Capability of a Block Code
% res = (distance - 1)/2) and rounded down

tmp = (distance-1)/2;
rnd = round(tmp);
if tmp < rnd
    res = rnd-1;
else
    res = rnd;
end
end