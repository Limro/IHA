clear;
close all;

%Define then World
world_size = 100.0;
landmarks  = [[20.0; 20.0], [0.0; 80.0], [80.0; 80.0], [80.0; 20.0]];

%Define robot
Z=[30;50; 0];%[world_size*rand;world_size*rand;2*pi*rand];
Zdist=[];
for j=1: size(landmarks,2)
    dx = (Z(1) - landmarks(1,j));
    dy = (Z(2) - landmarks(2,j));
    Zdist =[Zdist sqrt(dx*dx+dy*dy)];
end

%Particles
N=5;
p=[world_size*rand(1,N);world_size*rand(1,N);2*pi*rand(1,N)];

%Move particles
turn=.1;%.8;
forward=.01;
forward_noise_std=.1;
for k=1:size(p,2)
    %turn, and add randomness to the turning command
    p(3,k) = p(3,k) + turn + 2*pi*rand;%turn_noise_std*randn;
    p(3,k)= mod(p(3,k),2*pi);
    
    %move, and add randomness to the motion command
    dist = forward + forward_noise_std*randn;
    p(1,k)= p(1,k) + (cos(p(3,k)) * dist);
    p(1,k)= mod(p(1,k),world_size);
    
    p(2,k) = p(2,k) + (sin(p(3,k)) * dist);
    p(2,k)= mod(p(2,k),world_size);    
end

%Resample
%Calculates how likely a measurement should be
sense_noise=20;
w=[];
for k=1:size(p,2)
    prob = 1.0;
    for j=1:2% size(landmarks,2)
        dx = (p(1, k) - landmarks(1,j));
        dy = (p(2, k) - landmarks(2,j));
        dist = sqrt(dx*dx+dy*dy);
        prob = prob*(1/sqrt(2*pi*sense_noise^2))*exp(-(dist-Zdist(j))^2/(2*sense_noise^2));
    end
    w = [w,prob];
end
alfa=w/sum(w);

p
alfa

%Draw the world
figure(2)
plot(landmarks(1,:), landmarks(2,:), 'ob', Z(1,:),Z(2,:),'og', p(1,:),p(2,:),'.r');
axis([0 world_size 0 world_size]);

