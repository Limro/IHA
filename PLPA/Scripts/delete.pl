/* delete(a, [a,b,a], [b]). 	 */
/* delete(a, [a|[b,a]], [b])  */
/* :-	delete(aa, [b, a], [b]). */

/* delete(a, [b,a], [b]).		 */
/* delete(a, [b|[a]], [b|[]]) */
/* :- delete(a, [a], []). */

/* delete(a, [], []). */

delete(X, [], []).

delete(X, [X|L], M)
:- 	delete(X,L,M).

/* if X != Y*/
delete(X, [Y|L],[Y|M])
:- delete(X, L, M).
