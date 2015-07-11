f(X,g(Y)) = f(g(Z),Z). #X = g(g(Y)), Z = g(Y)

f(X,g(X),b) = f(a,g(Z),Z). #no

f(X,g(X)) = f(Z,Z). #X=Z=g(g(**))
# ** means "infinite"

assert(( gf(X,Z) :- f(X,Y), p(Y,Z) )).
assert(( p(X,Y) :- f(X,Y) )).
assert(( p(X,Y) :- m(X,Y) )).
assert(f(tom,eve)).
assert(m(eve,tim)).
trace .
gf(tom, X).