send_more_money :-
X = [S,E,N,D,M,O,R,Y],
Digits = [0,1,2,3,4,5,6,7,8,9],
assign_digits(X, Digits),
M > 0,
S > 0,
1000*S + 100*E + 10*N + D +
1000*M + 100*O + 10*R + E =:=
10000*M + 1000*O + 100*N + 10*E + Y,
write(X).
select(X, [X|R], R).
select(X, [Y|Xs], [Y|Ys]):- select(X, Xs, Ys).
assign_digits([], _List).
assign_digits([D|Ds], List):-
select(D, List, NewList),
assign_digits(Ds, NewList).