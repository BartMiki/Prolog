rsilnia(0,1):-!.
rsilnia(N,S):-
	N>0,
	N1 is N - 1,
	silnia(N1,S1),
	S is N*S1.

silnia(0,1):-!.
silnia(N,X):-
	N>0,!,
	silnia(N,1,X).
silnia(0,Acc,Acc).
silnia(N,A,X):-
	N>0,!,
	A1 is A * N,
	N1 is N - 1,
	silnia(N1,A1,X).

parzysta(0):-!.
parzysta(X):-
	X>1,!,
	X1 is X-2,
	parzysta(X1).
parzysta(X):-
	X<1,
	X1 is X+2,
	parzysta(X1).

nieparzysta(1):-!.
nieparzysta(X):-
	X>2,!,
	X1 is X - 2,
	nieparzysta(X1).

iparzysta(X):-
	iparzysta(X,0).
iparzysta(X,X).
iparzysta(X,Acc):-
	X > Acc,
	Acc1 is Acc + 2,
	iparzysta(X,Acc1).

fib(0,1):-!.
fib(1,1):-!.
fib(NrWyrazu,Wartosc):-
	NrWyrazu1 is NrWyrazu - 1,
	fib(NrWyrazu1,Wartosc1),
	NrWyrazu2 is NrWyrazu - 2,
	fib(NrWyrazu2,Wartosc2),
	Wartosc is Wartosc1 + Wartosc2.

ifib(Nr,W):-
	ifib(Nr,W,Wp,1).
ifib(Nr,W,Wp,Nr).
ifib(Nr,W,Wp,Acc):-
	Nr < Acc,
	Acc1 is Acc+1.
