del(E,[E|T],T).
del(E,[H|T],[H|T1]):-
	del(E,T,T1).

perm([],[]):-!.
perm(L,[H|T]):-
	del(H,L,L1),
	perm(L1,T).

sorted([]):-!.
sorted([_]):-!.
sorted([X,Y|T]):-
	X=<Y,!,
	sorted([Y|T]).

slowsort(L1,L2):-
	perm(L1,L2),
	sorted(L2).

lista(X) :-
	append([78,321,45,31],[12,321,13,10,1],X).

s_ws([],[]).
s_ws([H],[H]).
s_ws([H|T],L):-
	s_ws(T,T1),
	wstaw(H,T1,L).

wstaw(Elem,[],[Elem]).
wstaw(Elem,[H|T],[H|T1]):-
	Elem>H,!,
	wstaw(Elem,T,T1).
wstaw(Elem,[H|T],[Elem,H|T]):-
	Elem=<H.

s_wy([],[]).
s_wy([H],[H]).
s_wy(L,[Min|T]):-
	min1(L,Min,L1),
	s_wy(L1,T).

min1([E],E,[]).
min1([H|T],M,[H|T1]):-
	min1(T,M,T1),
	H>=M,!.
min1([H|T],H,[M|T1]):-
	H=<M,!.
	min1(T,M,T1).

s_q([],[]).
s_q([H],[H]).
s_q([H|T],L):-
	rozdziel(H,T,T1,T2),
	s_q(T1,T11),
	s_q(T2,T22),
	append(T11,[H|T22],L).

rozdziel(H,[],[],[]).
rozdziel(H,[X|T],[X|L],G):-
	X<H,!,
	rozdziel(H,T,L,G).
rozdziel(H,[X|T],L,[X|G]):-
	X>=H,!,
	rozdziel(H,T,L,G).


