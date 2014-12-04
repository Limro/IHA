%% ToTal algorithm
clc, clear, clf

figure(1)
for k = 1 : 6
	subplot(3,2,k)
	% R's coordinates
	R = [1 1]';
	rad = pi/180;
	Rphi = rad * (40*k); %Direction in radians (change degree at the end)

	% B's coordinates
	B1 = [7.5+0.6*k -5+0.4*k]';
	B2 = [-5-0.5*k -5+0.2*k]';
	B3 = [0+0.5*k 5-0.2*k]';

	%All B's
	Bs = [B1 B2 B3];

	%Beacons' angles
	P1 = atan2(B1(2)-R(2), B1(1)-R(1)) - Rphi;
	P2 = atan2(B2(2)-R(2), B2(1)-R(1)) - Rphi;
	P3 = atan2(B3(2)-R(2), B3(1)-R(1)) - Rphi;

	%Safety checks
	if P1 < 0 
		P1=P1+2*pi;
	end
	if P2 < 0 
		P2=P2+2*pi;
	end
	if P3 < 0 
		P3=P3+2*pi;
	end

	% Algoritm
	% Step 1

	% B'1 = [x'1 ; y'1];
	x1 = B1(1) - B2(1);
	y1 = B1(2) - B2(2);
	x3 = B3(1) - B2(1); 
	y3 = B3(2) - B2(2);

	% Step 2
	T12 = cot(P2-P1);
	T23 = cot(P3-P2);
	T31 = (1 - T12*T23) / (T12 + T23);

	% Step 3:
	x12 = x1 + T12*y1; 
	y12 = y1 - T12*x1;
	x23 = x3 - T23*y3; 
	y23 = y3 + T23*x3;
	x31 = (x3 + x1) + T31*(y3 - y1);
	y31 = (y3 + y1) - T31*(x3 - x1);

	% Step 4:
	km31 = x1*x3 + y1*y3 + T31*(x1*y3 - x3*y1);

	% Step 5:
	D = (x12 - x23)*(y23 - y31) - (y12 - y23)*(x23 - x31);

	% Step 6:
	Rm = [ B2(1) + (km31*(y12 - y23))/D ; ...
			B2(2) + (km31*(x23 - x12))/D ];

	% C = [ [x12 y12]' [x23 y23]' [x31 y31]' ];
	C = [ ...
		[ (B1(1) + B2(1) + cot(P2-P1)*(B1(2)-B2(2)))/2 ...
		(B1(2) + B2(2) - cot(P2-P1)*(B1(1)-B2(1)))/2 ]' ...
		[ (B2(1) + B3(1) + cot(P3-P2)*(B2(2)-B3(2)))/2 ...
		(B2(2) + B3(2) - cot(P3-P2)*(B2(1)-B3(1)))/2 ]' ...
		[ (B3(1) + B1(1) + cot(P1-P3)*(B3(2)-B1(2)))/2 ...
		(B3(2) + B1(2) - cot(P1-P3)*(B3(1)-B1(1)))/2 ]' ];

	%Plot all coords
	figure(1)
	hold on
	grid on
	axis equal
	axis([-20 15 -15 20]);

	plot( Bs(1,:), Bs(2,:), 'bx', ...
		R(1,:), R(2,:), 'b+', ...
		C(1,:), C(2,:), 'rx')
	% Draw circle centers

	%Draw the direction
	line('XData', [R(1) R(1)+4*cos(Rphi)], ...
		'YData', [R(2) R(2)+4*sin(Rphi)], ...
		'LineStyle', '-', ...
		'LineWidth', 1, ...
		'Color','g')

	% Draw circles
	circle(C(1,1), C(2,1), ...
		sqrt(( (B1(1)-B2(1))^2 + (B1(2)-B2(2))^2)/(4*sin(P2-P1).^2)), 'r') 
	circle(C(1,2), C(2,2), ...
		sqrt(( (B2(1)-B3(1))^2 + (B2(2)-B3(2))^2)/(4*sin(P3-P2).^2)), 'r') 
	circle(C(1,3), C(2,3), ...
		sqrt(( (B3(1)-B1(1))^2 + (B3(2)-B1(2))^2)/(4*sin(P1-P3).^2)), 'r') 

end