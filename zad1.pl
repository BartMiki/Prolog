kobieta(ewa).
kobieta(ala).
kobieta(ola).
kobieta(marta).
kobieta(anna).
kobieta(iza).

kobiety:-
	kobieta(X),
	write(X),nl,
	fail.
kobiety.

kobietySet:-
	setof(X,kobieta(X),L),
	write(L).

mezczyzna(adam).
mezczyzna(piotr).
mezczyzna(pawel).
mezczyzna(jan).
mezczyzna(tomasz).
mezczyzna(roman).

rodzic(adam,ala).
rodzic(adam,piotr).
rodzic(adam,ola).
rodzic(adam,pawel).
rodzic(ewa,ala).
rodzic(ewa,piotr).
rodzic(ewa,ola).
rodzic(ewa,pawel).
rodzic(jan,tomasz).
rodzic(jan,anna).
rodzic(marta,tomasz).
rodzic(marta,anna).
rodzic(ola,roman).
rodzic(tomasz,roman).
rodzic(pawel,iza).
rodzic(anna,iza).

matka(X,Y):-
	kobieta(X),
	rodzic(X,Y).

ojciec(X,Y):-
	mezczyzna(X),
	rodzic(X,Y).

syn(Rodzic,Syn):-
	mezczyzna(Syn),
	rodzic(Rodzic,Syn).

corka(X,Y):-
	kobieta(Y),
	rodzic(X,Y).

brat(X,Y):-
	rodzic(Z,X),
	rodzic(Z,Y),
	mezczyzna(Y).

mr:-
	read(X),
	write(X),
	nl,
	X \= stop,
	mr.
mr.

%wszystkich braci którzy maja siostry
brosis:-
	setof(X,brosis(X),L),
	write(L).
brosis(X):-
	brat(Y,X),
	siostra(X,Y).


siostra(X,Y):-
	rodzic(Z,X),
	rodzic(Z,Y),
	kobieta(Y).

rodzenstwo(X,Y):-
	brat(X,Y).

rodzenstwo(X,Y):-
	siostra(X,Y).

przodek(X,Y) :-
	rodzic(X,Y).
przodek(X,Y) :-
	rodzic(X,Z),
	przodek(Z,Y).
