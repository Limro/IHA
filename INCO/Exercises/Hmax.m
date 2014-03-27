function res = Hmax(A, B)
%BEC code only. Set A to equal input

    %find amoutn of rows
    rows = size(A,1);

    %Set equal size on all rows
    for i = 1:rows
       A(i,1) = 1/rows; 
    end
    
    %Find 
    res = Hy(A, B);
end