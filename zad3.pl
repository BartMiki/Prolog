nalezy(E,[E|_]).
nalezy(E,[H|T]):-
	E\=H,
	nalezy(E,T).


polacz([],X,X).
polacz([H|T1],Y,[H|T2]):-
	polacz(T1,Y,T2).

odwroc([],[]).
odwroc([H|T],L):-
	odwroc(T,T1),
	append(T1,[H],L).

dodajNaPoczatek(X,L,[X|L]).

iOdwroc(L1,L2):-
	odwroc(L1,[],L2).
odwroc([],L,L).
odwroc([H|T],A,L):-
	odwroc(T,[H|A],L).

/* Zamien wszystkie ujemne na 0*/
ujemnaTo0(X,Y):-
	X<0,
	Y is 0.
ujemnaTo0(X,X).

zamienNa0([],[]).
zamienNa0([H1|T1],[H2|T2]):-
	ujemnaTo0(H1,H2),
	zamienNa0(T1,T2).

iZamienNa0(L1,L2):-
	iZamienNa0(L1,[],L2).

iZamienNa0([],L,L).
iZamienNa0([H1|T1],A,L):-
	H1<0,
	append(A,[0],A1),
	iZamienNa0(T1,A1,L).
iZamienNa0([H1|T1],A,L):-
	H1>=0,
	append(A,[H1],A1),
	iZamienNa0(T1,A1,L).











