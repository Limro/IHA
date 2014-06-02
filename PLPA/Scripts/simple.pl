assert((setX_sq(A) :- write(A), nl, A=1)).
assert((setX_sq(X) :- write(X), nl, X=1)).
assert(( setX_co(X) :- freeze(X, (write(X), nl)), X=1)).