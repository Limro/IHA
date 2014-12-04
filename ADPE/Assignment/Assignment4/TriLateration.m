clc, clear, clf

syms v u;
syms x y K;
format shortg

%Circles
C1 = [5 ; 5];
C2 = [5 ; 80];
C3 = [90 ; 80];
C4 = [90 ; 5];

%Device's actual location
Dev = [75 ; 30];

%starting point
st = [C4 ; 0];

%distance to C4:
K = sqrt( (C4(1)-Dev(1))^2 + (C4(2)-Dev(2))^2 );

%Actual radii (radius)
%distance to Dev - K
R1 = sqrt( (C1(1)-Dev(1))^2 + (C1(2)-Dev(2))^2 ) - K;
R2 = sqrt( (C2(1)-Dev(1))^2 + (C2(2)-Dev(2))^2 ) - K;
R3 = sqrt( (C3(1)-Dev(1))^2 + (C3(2)-Dev(2))^2 ) - K;

%reset K
syms K;

S1 = sqrt( (x-C1(1))^2 + (y- C1(2))^2 );
S2 = sqrt( (x-C2(1))^2 + (y- C2(2))^2 );
S3 = sqrt( (x-C3(1))^2 + (y- C3(2))^2 );

r1 = S1-(R1 + K);
r2 = S2-(R2 + K);
r3 = S3-(R3 + K);

Ts  = [C1 C2 C3 C4 ; R1 R2 R3 0];

Dr = [
    (x-C1(1))/S1 (y-C1(2))/S1 -1
    (x-C2(1))/S2 (y-C2(2))/S2 -1
    (x-C3(1))/S3 (y-C3(2))/S3 -1 ];

MaxIterations = 5;

M = zeros(MaxIterations,4);

%Load data into matrix
M(1,1) = 0;
M(1,2) = st(1);
M(1,3) = st(2);
M(1,4) = st(3);

world_size = 100.0;
figure(1)
hold on
axis equal
axis([0 world_size 0 world_size]);
plot(Ts(1,:), Ts(2,:), 'x', Dev(1,:), Dev(2,:),'+');
allS = zeros(MaxIterations,3);
i = 2;
stop = false;
while stop == false
    M(i,1) = i-1;   %step counter
    x = M(i-1,2);   %use the previous x-value
    y = M(i-1,3);   %use the previous y-value
    K = M(i-1,4);   %use the previous k-value
    
    J = eval(Dr)

    %s-value
    s = J\ -[eval(r1) ; eval(r2) ; eval(r3)];
    allS(i,:) = s';
    
    %Assign values into M (last M + s)
    for j = 2 : 4
        M(i,j) = M(i-1,j) + s(j-1);
    end

    plot(M(i,2), M(i,3), 'or')
    
    i = i+1;
    if i > MaxIterations || abs(M(i-1,2) - M(i-2,2)) < 0.1
        stop = true;
    end
end

M

for j = 1 : i-2
	circle(C1(1), C1(2), M(j,4), ':r')
end
