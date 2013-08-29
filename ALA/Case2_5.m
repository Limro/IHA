%Case 2_5
%De 3 øverste indløb bliver samlet til ét, da der ikke vil kunne
%måles forskel på dem.
%De 5 nederste indløb bliver samlet til ét også.
%De fem venstre indløb bliver også samlet
format shortg;
syms x1 x2 x3 x4 x5 x6 x7 x8 x9;

Left=2+1.3125+2.625+2.25+1.5;
Bottom=3.0625+3.3125+2.75+0.75+0.1875;
RightLower=1.4375+1.8125;
Top=1.8125+2.1875+2.3125;

A=-x1+x9+964.75;
B=x1-x2-Top;
C=x2-x3+1005.25;
D=x3-x4-1.375;
E=x4-x5-RightLower;
F=x5-x6-965.5;
G=x6-x7-Bottom;
H=x7-x8-973.8125;
I=x8-x9-Left;

%   1   2   3   4   5   6   7   8   9   10
A=[
    -1  0   0   0   0   0   0   0   1   -964.75;   %A
    1   -1  0   0   0   0   0   0   0   Top;       %B
    0   1   -1  0   0   0   0   0   0   -1005.25;  %C
    0   0   1   -1  0   0   0   0   0   1.375;     %D
    0   0   0   1   -1  0   0   0   0   RightLower %E
    0   0   0   0   1   -1  0   0   0   965.5;     %F
    0   0   0   0   0   1   -1  0   0   Bottom;    %G
    0   0   0   0   0   0   1   -1  0   973.8125   %H
    0   0   0   0   0   0   0   1   -1  Left];     %I

NotBroke=rref(A)

%   1   2   3   4   5   6   7   8   9   10
B=[
    -1  0   0   0   0   0   0   0   1   -964.75;   %A
    1   -1  0   0   0   0   0   0   0   Top;       %B
    0   1   -1  0   0   0   0   0   0   -1005.25;  %C
    0   0   1   0   0   0   0   0   0   1.375;     %D
    0   0   0   0   -1  0   0   0   0   RightLower %E
    0   0   0   0   1   -1  0   0   0   965.5;     %F
    0   0   0   0   0   1   -1  0   0   Bottom;    %G
    0   0   0   0   0   0   1   -1  0   973.8125   %H
    0   0   0   0   0   0   0   1   -1  Left];     %I

Broke=rref(B)    