%% Eksempel
clc, clear    
%B = M
%Simplex table
A = [2 3 4; 3 1 5; 1 2 1];
B = [60 46 50]';
C = [25 33 18]';
    %               M     res
Mat3 = [2   3   4   1 0 0 60;
        3   1   5   0 1 0 46;
        1   2   1   0 0 1 50;
        -25 -33 -18 0 0 0 0];
    %  -C 0 0 0 0

MinC = -33; % col 2
ratioRes1 = Mat3(1,7)/Mat3(1,2) % min
ratioRes2 = Mat3(2,7)/Mat3(2,2)
ratioRes3 = Mat3(3,7)/Mat3(3,2)

%% Lay 9.2 - 3
clc, clear
c = [3 4 -2]'
A = [1 2 0;
     0 3 -5]
b = [20 -10]'

%% Lay 9.2 - 5
clc, clear
c = [-7 3 -1]'
A = [-1 4 0 ; 0 1 -2; 0 -1 2]
b = [-35 20 -20]'

%% Lay 9.2 - 15
clc, clear
syms x1 x2 x3 x4 x5 M;
format shortg
f = 20*x1 + 26*x2
x2_a = solve(f,x2)

A = [5 2; 0.2 0.4; 0.2 0.2];
A = [A eye(3)]
b = [200 16 10]'
c = [-20 -26 0 0 0]'

Arg = [5 2 1 0 0 0 200  ;
       0.2 0.4 0 1 0 0 16;
       0.2 0.2 0 0 1 0 10;
       -20 -26 0 0 0 1 0]
   
ratio1 = Arg(1,7)/Arg(1,2)
ratio2 = Arg(2,7)/Arg(2,2) %lowest
ratio3 = Arg(3,7)/Arg(3,2)


Arg = [Arg(1,:) ; Arg(2,:)/0.4 ; Arg(3,:) ; Arg(4,:)]
Arg = [Arg(1,:)-2*Arg(2,:) ; Arg(2,:) ; Arg(3,:)-0.2*Arg(2,:) ; Arg(4,:)+26*Arg(2,:)]
ratio1 = Arg(1,7)/Arg(1,1)
ratio2 = Arg(2,7)/Arg(2,1) 
ratio3 = Arg(3,7)/Arg(3,1)%lowest


Arg = [Arg(1,:) ; Arg(2,:) ; Arg(3,:)/0.1 ; Arg(4,:)]
Arg = [Arg(1,:)-4*Arg(3,:) ; Arg(2,:)-0.5*Arg(3,:) ; Arg(3,:) ; Arg(4,:)+7*Arg(3,:)]

x1 = Arg(3,7)
x2 = Arg(2,7)
maxPro = Arg(4,7)

v = [3 4 5]'
simplex(c, A, b, v, 1)


%% Lay 9.3 - 3
clc, clear
A = [5 1 1 0 0;3 2 0 1 0];
b = [20 30]';
c = [-4 -10 0 0 1]';
v = [3 4]';

Arg = [A b ; c' 0]
minC = min(Arg(end,:)) % row 2

ratio1 = Arg(1,end)/Arg(1,2)
ratio2 = Arg(2,end)/Arg(2,2) %lowest

Arg = [Arg(1,:) ; Arg(2,:)/2 ; Arg(3,:)]
Arg = [Arg(1,:)-1*Arg(2,:) ; Arg(2,:) ; Arg(3,:)+10*Arg(2,:)] 
%Ratio with lowest gives 5/0 - nono


%simplex(c, A, b, v, 1);

%% Lay 9.3 - 9
clc, clear

format shortg
A = [2 3 1 0 0; 5 4 0 1 0 ];
b = [36 55]';
c = [-10 -12 0 0 1]';
v = [3 4]';
Arg = [ A b; c' 0]
minC = min(Arg(end,:)) % row 2

ratio1 = Arg(1,end)/Arg(1,2) %lowest
ratio2 = Arg(2,end)/Arg(2,2) 

Arg = [Arg(1,:)/3 ; Arg(2,:) ; Arg(3,:)]
Arg = [Arg(1,:) ; Arg(2,:)-4*Arg(1,:) ; Arg(3,:)+12*Arg(1,:)]

minC = min(Arg(end,:)) % row 2

ratio1 = Arg(1,end)/Arg(1,1) 
ratio2 = Arg(2,end)/Arg(2,1)%lowest

Arg = [Arg(1,:) ; Arg(2,:)/(7/3) ; Arg(3,:)]
Arg = [Arg(1,:)-2/3*Arg(2,:) ; Arg(2,:) ; Arg(3,:)+2*Arg(2,:)]
%Ratio with lowest gives 5/0 - nono

simplex(c, A, b, v, 1)


%% Lay 9.3 - 10
clc, clear

%format shortg
A = [1 5 1 0 0 ;3 2 0 1 0 ];
b = [70 54]';
c = [-5 -4 0 0 1]';
v = [3 4]';
Arg = [ A b; c' 0]
minC = min(Arg(end,:)) % row 2

ratio1 = Arg(1,end)/Arg(1,1) 
ratio2 = Arg(2,end)/Arg(2,1) %lowest

Arg = [Arg(1,:) ; Arg(2,:)/3 ; Arg(3,:)]
Arg = [Arg(1,:)-1*Arg(2,:) ; Arg(2,:); Arg(3,:)+5*Arg(2,:)]

minC = min(Arg(end,:)) % row 2

ratio1 = Arg(1,end)/Arg(1,2) %lowest 
ratio2 = Arg(2,end)/Arg(2,2)

Arg = [Arg(1,:)/(13/3) ; Arg(2,:) ; Arg(3,:)]
Arg = [Arg(1,:) ; Arg(2,:)-(2/3)*Arg(1,:) ; Arg(3,:)+(2/3)*Arg(1,:)]
%Ratio with lowest gives 10/0 - nono

%simplex(c, A, b, v, 1)

