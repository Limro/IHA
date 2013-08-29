%Case 4
clear
% %------ Start of example 2 -----%
% A = [0 0; 1 2];
% x0 = 0;
% B=[1;3];
% u0 = 1;
% u1= u0;
% y_target=[3;5];
% 
% x1 = (B*u0);
% x2 = A*x1+B*u1;
% 
% M=[B A*B];
% Mrref = rref(M);
% 
% if Mrref == eye(rank(M))  
%     disp('Controlable') 
% else
%     disp('NOT controlable') 
% end
% 
% y=A*B*u0+B*u1;
% 
% AM=[M y_target];
% AM_rref=rref(AM);
% y2=A*B*AM_rref(2,3)+B*AM_rref(1,3);
% 
% if y2 == y_target
%    disp('controlvalues: ')
%    disp(AM_rref(:,3))
% else
%     disp('numbers does not fit')
% end
% %------ End of example 1 -----%


% %------ Start of example 2 -----%
% clear
% A=[ 1 1 2 ; 1 -1 -2; 2 2 4];
% x0=[1;0;2];
% 
% x1=A*x0
% x2=A*x1
% x3=A*x2
% 
% B=[1 ; 1; 2];
% u0=1;
% u1=-1;
% 
% x1=B*u0
% x2=A*x1+B*u1
% M=[ B A*B A^2*B]
% M_rref = rref(M)
% 
% if M_rref == eye(rank(M))
%     disp('Controlable') 
% else
%     disp('NOT controlable') 
% end
% 
% %------ Partial end of example 2 -----%


%------ Start of exercise 2 -----%
clear
A=[ 1 1 2 ; 2 3 4; 1 2 2];
B=[1 ; 0; 1];
u0=0;
u1=1;

x1=B*u0;
x2=A*x1+B*u1;
M=[ B A*B A^2*B]
M_rref = rref(M)

if M_rref == eye(rank(M))
    disp('Controlable') 
else
    disp('NOT controlable') 
end

% Result: Controlable
%------ End of exercise 2 -----%



%------ Start of exercise 3 -----%
clear
A=[ 1 1 2 ; 2 3 4; 1 2 2];
B=[1 ; 0; 1];
u0=0;
u1=1;

x1=B*u0;
x2=A*x1+B*u1;
M=[ B A*B A^2*B]
M_rref = rref(M)

if M_rref == eye(rank(M))
    disp('Controlable') 
else
    disp('NOT controlable') 
end

% Result: Controlable
%------ End of exercise 3 -----%