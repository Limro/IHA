function res = TotalProb(Weight, Data, row)
% Total probability, Pr(B) = Sum( Pr(B|A_i)*Pr(A_i) )
% Weight = weight of the data occoring
% Data = Data in a matrix
% row = What row to calculate from

val = 0;
for i = 1:size(Data,2)
    val = val + (Data(row,i) / sum(Data(:,i))) * Weight(1,i);
end

res = val;
end