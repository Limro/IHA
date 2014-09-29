clear;
close all;

%Define then World
world_size = 100.0;
landmarks  = [[20.0; 20.0], [0.0; 80.0], [80.0; 80.0], [80.0; 20.0]];

%Define robot
Z=[30;30; 0];%[world_size*rand;world_size*rand;2*pi*rand];
Zdist=[];
for j=1: size(landmarks,2)
    dx = (Z(1) - landmarks(1,j));
    dy = (Z(2) - landmarks(2,j));
    Zdist =[Zdist sqrt(dx*dx+dy*dy)];
end

%Particles
N=500;
p=[world_size*rand(1,N);world_size*rand(1,N);2*pi*rand(1,N)];

%Move particles
turn=.1;
forward=.01;
forward_noise_std=.1;

%%%
%Fill in code here that 
% - turns a particle (add random uniform distributed noise in interval
% 0-2*pi)
% - moves a particle forward in the current direction add gaussin noise with
%  std = forward_noise_std
% - The above should be done on all particles
%%%

%Draw the world
figure(2)
plot(landmarks(1,:), landmarks(2,:), 'ob', Z(1,:),Z(2,:),'og', p(1,:),p(2,:),'.r');
axis([0 world_size 0 world_size]);