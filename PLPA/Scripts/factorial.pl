factorial(0,Res) :-
    Res is 1.

factorial(N,Res) :-
    N > 0,
    N1 is N-1,
    factorial(N1,Res1),
    Res is Res1*N.

fact(N) :-
	factorial(N, Val),
	writeln(Val).