silnia(N,X):-
	N>0,
	silnia(N,1,X).
silnia(0,Acc,Acc).
silnia(N,A,X):-
	N>0,
	A1 is A * N,
	N1 is N - 1,
	silnia(N1,A1,X).

parzysta(0).
parzysta(X):-
	X>1,
	X1 is X-2,
	parzysta(X1).
parzysta(X):-
	X<1,
	X1 is X+2,
	parzysta(X1).

nieparzysta(1).
nieparzysta(X):-
	X>2,
	X1 is X - 2,
	nieparzysta(X1).

iparzysta(X):-
	iparzysta(X,0).
iparzysta(X,X).
iparzysta(X,Acc):-
	X > Acc,
	Acc1 is Acc + 2,
	iparzysta(X,Acc1).

fib(0,1).
fib(1,1).
fib(NrWyrazu,Wartosc):-
	NrWyrazu1 is NrWyrazu - 1,
	fib(NrWyrazu1,Wartosc1),
	NrWyrazu2 is NrWyrazu - 2,
	fib(NrWyrazu2,Wartosc2),
	Wartosc is Wartosc1 + Wartosc2.

ifib(N,X):-
	ifib(N,0,1,X).
ifib(0,X,_,X).
ifib(N,Var1,Var2,X):-
	N > 0,
	NewVar is Var1+Var2,
	N1 is N - 1,
	ifib(N1,Var2,NewVar,X).

