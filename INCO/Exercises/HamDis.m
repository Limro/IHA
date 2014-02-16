function res = HamDis(Matrix)
%Hammering distance
%Matrix to analyse

min = length(Matrix(:,1));
for i = 1 : size(Matrix(:,1))
    for j = i+1 : size(Matrix(:,1))
       tmp = HamWeight(Matrix(i,:), Matrix(j,:));
       if tmp < min
           min = tmp;
       end
    end
end
res = min;