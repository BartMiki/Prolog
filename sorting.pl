del(E,[E|T],T).
del(E,[H|T],[H|T1]):-
	del(E,T,T1).

perm([],[]).
perm(L,[H|T]):-
	del(H,L,L1),
	perm(L1,T).

sorted([]).
sorted([_]).
sorted([X,Y|T]):-
	X=<Y,
	sorted([Y|T]).

slowsort(L1,L2):-
	perm(L1,L2),
	sorted(L2).

l1(X):-
	append([78,321,45,31],[12,321,13,10,1],X).
l2(X):-
	append([34,324,46],[4,197,24],X).

s_ws([],[]).
s_ws([H],[H]).
s_ws([H|T],L):-
	s_ws(T,T1),
	wstaw(H,T1,L).

wstaw(Elem,[],[Elem]).
wstaw(Elem,[H|T],[H|T1]):-
	Elem>H,wstaw(Elem,T,T1).
wstaw(Elem,[H|T],[Elem,H|T]):-
	Elem=<H.

selectionSort([],[]).
selectionSort([H],[H]).
selectionSort(L,[Min|T]):-
	min1(L,Min,L1),
	selectionSort(L1,T).

min1([E],E,[]).
min1([H|T],M,[H|T1]):-
	min1(T,M,T1),
	H>=M.
min1([H|T],H,[M|T1]):-
	H=<M,
	min1(T,M,T1).

qsort([],[]).
qsort([H],[H]).
qsort([H|T],L):-
	rozdziel(H,T,T1,T2),
	qsort(T1,T11),
	qsort(T2,T22),
	append(T11,[H|T22],L).

rozdziel(_,[],[],[]).
rozdziel(H,[X|T],[X|L],G):-
	X<H,
	rozdziel(H,T,L,G).
rozdziel(H,[X|T],L,[X|G]):-
	X>=H,
	rozdziel(H,T,L,G).


merge([],[],[]).
merge(L,[],L).
merge([],L,L).
merge([Head1|Tail1],[Head2|Tail2],Result):-
	Head1 > Head2,
	merge(Tail1,[Head2|Tail2],Result1),
	append(Result1,[Head1],Result).
merge([Head1|Tail1],[Head2|Tail2],Result):-
	Head1 =< Head2,
	merge([Head1|Tail1],Tail2,Result1),
	append(Result1,[Head2],Result).
