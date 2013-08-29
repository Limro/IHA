clf;

Data=[-6.5 -6.5 -6.5 -6.5 -2.5 -2.5 -.75 -.75 3.25 3.25 4.5 4.5 6.5 6.5 6.5 6.5;
    -2 -2 .5 .5 .5 .5 2 2 2 2 .5 .5 .5 .5 -2 -2;
    -2.5 2.5 2.5 -2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 2.5 -2.5;
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ];

Connections=[
    0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 1;
    1 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0;
    1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0;
    0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0;
    0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0;
    0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0;
    0 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0;
    0 0 0 0 0 0 0 1 1 0 0 1 0 0 0 0;
    0 0 0 0 0 0 0 0 1 0 0 1 1 0 0 0;
    0 0 0 0 0 0 0 0 0 1 1 0 0 1 0 0;
    0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1;
    0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 1;
    1 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0;];

%Synspunkt (-5, 10, 10)
b=-5;
c=10;
d=10;
P=[1 0 -b/d 0;0 1 -c/d 0;0 0 0 0;0 0 -1/d 1];
Data1 = P*Data; 

Data1(1,:)=Data1(1,:)./Data1(4,:);
Data1(2,:)=Data1(2,:)./Data1(4,:);
Data1 = Data1(1:2,:)';
figure(1)
gplot(Connections, Data1)

%Nyt synspunkt (0, 10, 25)
b=0;
c=10;
d=25;
P=[ 1   0   -b/d 0;
    0   1   -c/d 0;
    0   0   0    0;
    0   0   -1/d 1];
Data2 = P*Data; %Ny beregning af data

Data2(1,:)=Data2(1,:)./Data2(4,:);
Data2(2,:)=Data2(2,:)./Data2(4,:);
Data2 = Data2(1:2,:)';


%Rotate 30 degree with projection (1, 10, 25)
degree=30;
degree=(degree*2*pi/360);
Ay=[
    cos(degree)     0   sin(degree) 0;
    0               1   0           0;
    -sin(degree)    0   cos(degree) 0;
    0               0   0           1];
%Nyt synspunkt (0, 10, 25)
b=0;
c=10;
d=25;
P=[ 1   0   -b/d 0;
    0   1   -c/d 0;
    0   0   0    0;
    0   0   -1/d 1];

Data3 = P*Ay*Data; %rotation

Data3(1,:)=Data3(1,:)./Data3(4,:);
Data3(2,:)=Data3(2,:)./Data3(4,:);
Data3 = Data3(1:2,:)';
figure(2)
subplot(1,2,1)
gplot(Connections, Data3)
subplot(1,2,2)
gplot(Connections, Data2)


%Rotate 45 degree z-axis with projection (1, 10, 25)
degree=45;
degree=(degree*2*pi/360);
Az=[
    cos(degree) -sin(degree) 0 0;
    sin(degree) cos(degree) 0 0;
    0 0 1 0;
    0 0 0 1];
%Nyt synspunkt (0, 10, 25)
b=0;
c=10;
d=25;
P=[1 0 -b/d 0;0 1 -c/d 0;0 0 0 0;0 0 -1/d 1];

Data4 = P*Az*Data; %rotation

Data4(1,:)=Data4(1,:)./Data4(4,:);
Data4(2,:)=Data4(2,:)./Data4(4,:);
Data4 = Data4(1:2,:)';
figure(3)
subplot(1,2,1)
gplot(Connections, Data4)
subplot(1,2,2)
gplot(Connections, Data2)



%Zoom 150% with projection (1, 10, 25)
zoom=1000;
zoom=(zoom/100);
Azoom=[
    zoom    0   0   0;
    0   zoom    0   0;
    0       0  zoom 0;
    0       0   0   1];
%Nyt synspunkt (0, 10, 25)
b=0;
c=10;
d=25;
P=[1 0 -b/d 0;0 1 -c/d 0;0 0 0 0;0 0 -1/d 1];

Data5 = P*Azoom*Data; %zoom

Data5(1,:)=Data5(1,:)./Data5(4,:);
Data5(2,:)=Data5(2,:)./Data5(4,:);
Data5 = Data5(1:2,:)';
figure(4)
subplot(1,2,1)
gplot(Connections, Data5)
subplot(1,2,2)
gplot(Connections, Data2)