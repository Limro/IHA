function res = Bayes(Weigth, Data, row, column)
% Bayers regel, Pr(A_i | B) = (Pr(B|A_i) * Pr(A_i) )/Pr(B)
% Weight = weight of the data occoring
% Data = Data in a matrix
% row = What row to calculate from
% column = which column to calculate from

PrB = TotalProb(Weigth, Data, row)
PrA_i = Data(row, column)/sum(Data(:, column))

res = (Weigth(1,column) * PrA_i)/PrB;

end