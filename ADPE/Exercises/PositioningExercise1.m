% Clear everything
clc, clear, wmclose

% Coordinates for Department of Engineering (Finlandsgade 22)
doeCord = [56.17216 10.19151];
% wmmarker(doeCord(:,1), doeCord(:,2))

% Coordinates for Railway Station (Banegaardspladsen 1)
tsCord = [56.15013 10.20420];
% wmmarker(tsCord(1), tsCord(2))

% Plot direct line
combinedCord = [doeCord; tsCord];
% wmline(combinedCord(:,1), combinedCord(:,2), 'Color', 'red')

% Coordinates for path
pathCords = [
  56.168818 10.189059;
  56.164624 10.197151;
  56.159665 10.196228;
  56.158201 10.198084;
  56.156474 10.199264;
  56.154526 10.199736;
  56.153481 10.201743;
  56.153217 10.202379;
  56.152966 10.202229;
  56.152823 10.202594;
  56.151855 10.202057;
  56.151305 10.203087;
  56.150412 10.203173
];

% Plot Path
combinedPath = [doeCord; pathCords; tsCord];
% wmline(combinedPath(:,1), combinedPath(:,2), 'Color', 'blue')
% wmmarker(pathCords(:,1), pathCords(:,2), 'Color', 'blue')

% Show Length
archDirect = distance(doeCord(1), doeCord(2), tsCord(1), tsCord(2));
directLength = distdim(archDirect, 'deg', 'm')

% Calculate length of path
archPath = 0;
for i = 1 : (size(combinedPath) - 1)
   archPath = archPath + distance( ...
    combinedPath(i,1), ...
    combinedPath(i, 2), ...
    combinedPath(i + 1,1), ...
    combinedPath(i + 1,2));
end

pathLength = distdim(archPath, 'deg', 'm')

% Calculate difference between direct and path
lengthDiff = pathLength - directLength

% Find Dead Reckoning Points
dreckPoints = dreckon2(combinedPath, 12, 2.7);
% wmmarker(dreckPoints(:,1), dreckPoints(:,2), 'Color', 'green');

for i = 1 : size(dreckPoints)
    
    fraction = getfraction(dreckPoints(i,3));
    
    if ((fraction == 0.0) || (fraction == 0.25) || (fraction == 0.50) || (fraction == 0.75))
        type = 'Quarter Stamp';
    else
        type = 'Turn';
    end
    
%     wmmarker(dreckPoints(i,1), dreckPoints(i,2), 'Color', 'green', ...
%         'FeatureName', sprintf('Node: %d. Type: %s. Time %d', i, type, dreckPoints(i,3)));
    
end

% Calculate time it will take. Hour, Minute, Second
timestamp = dreckPoints(size(dreckPoints, 1),3);
hour = timestamp - 12;
minute = getfraction(hour) * 60;
seconds = getfraction(minute) * 60;
time = [floor(hour); floor(minute); floor(seconds)]








