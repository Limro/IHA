#!'C:\Program Files (x86)\Yap\bin\yap' -L --

:- assert((append([], Xs,Xs))).
:- assertz((append([X|Ys],Zs,[X|Ws]):-append(Ys, Zs,Ws))).

:- assert( rev([],[]) ).
:- assertz(( rev([X|Xs], Output) :- rev(Xs,RevXs), append(RevXs, [X], Output) )).

:- rev([1,4],X).
:- write(X),nl.