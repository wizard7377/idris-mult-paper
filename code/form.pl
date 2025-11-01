%!  eval(Formula, Input, Result) is semidet.
%
%   Evaluates a formula, and returns the result
eval(add(A,B),X,R) :-
    once(eval(A,X,RA)),
    once(eval(B,X,RB)),
    R is RA + RB.
eval(mul(A,B),X,R) :-
    once(eval(A,X,RA)),
    once(eval(B,X,RB)),
    R is RA * RB.
eval(var,X,R) :-
    R is X.

eval(min(A,B),X,R) :-
	once(eval(A,X,RA)),
	once(eval(B,X,RB)),
	R is min(RA,RB).
eval(max(A,B),X,R) :-
    	once(eval(A,X,RA)),
	once(eval(B,X,RB)),
	R is max(RA,RB).
eval(app(F,G),X,R) :-
    once(eval(G,X,Y)),
    once(eval(F,Y,R)).

solve(F,G) :-
    forall(eval(F,X,R),eval(G,Y,R)).
