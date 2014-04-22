
:- assert(( append([], Xs, Xs) )).
:- assertz(( append([X|Ys],Zs,[X|Ws]) :- append(Ys, Zs, Ws) )).

:- assert(( room([X|Xs]) :- append(X, Xs) )).

% Stefan's' solution

door(a,b).
door(b,c).
door(b,e).
door(c,d).
door(d,e).
door(e,f).
door(g,e).

assert(( go(X,Y) :- door(X,Z), go(Z,Y) )).

assert(( go(X,Y,P) :- door(X,Z), 
						\+member(Z,P), 
						go(Z,Y,[Z|P]) )).
