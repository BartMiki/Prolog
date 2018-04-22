d(X, X, 1) :- !.
d(E, _, 0) :-
	atomic(E), !.
d(A+B, X, DA+DB) :- !,
	d(A, X, DA),
	d(B, X, DB).
d(A-B, X, DA-DB) :- !,
	d(A, X, DA),
	d(B, X, DB).
d(A*B,X,A*DB+DA*B):-!,
	d(A, X, DA),
	d(B, X, DB).
d(A/B,X,(DA*B-DB*A)/(B)^2):-!,
	d(A, X, DA),
	d(B, X, DB).

/*d(e^X,X,e^X):-!.*/
d(e(E),X,e(E)*DE):-!,
	d(E,X,DE).

d(ln(E),X,DE/E):-!,
	d(E,X,DE).

d(sin(E),X,DE*cos(E)):-!,
	d(E,X,DE).

d(cos(E),X,DE*(-1)*sin(E)):-!,
	d(E,X,DE).

d(tg(E),X,DE/(cos(E)*cos(E))):-!,
	d(E,X,DE).

d(ctg(E),X,(-1)*DE/(sin(E)*sin(E))):-!,
	d(E,X,DE).

s(X, X) :-
	atomic(X), !.
s(X, Y) :-
	X =.. [Op, A, B],!,
	s(A, A1),
	s(B, B1),
	r(Op, A1, B1, Y).

s(X,Y):-
	X =.. [Op,A],!,
	s(A,A1),
	r(Op,A1,Y).

r(e,0,1):-!.
r(ln,1,0):-!.
r(ln,e,1):-!.
r(sin,0,0):-!.
r(cos,0,1):-!.
r(tg,0,0):-!.
r(Op,X,Y):-
	Y =.. [Op,X].

r(+, X, 0, X) :-!.
r(+, 0, X, X) :-!.

r(-, X, X, 0) :-!.
r(-, 0, X, (-1)*X) :-!.
r(-, X, 0, X) :-!.

r(*, _, 0, 0) :-!.
r(*, 0, _, 0) :-!.
r(*, X, 1, X) :-!.
r(*, 1, X, X) :-!.

r(Op, X, Y, Z) :-
	Z =.. [Op, X, Y]. /*catch all remaining*/
