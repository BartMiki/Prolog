kobieta(ewa).
kobieta(ala).
kobieta(ola).
kobieta(marta).
kobieta(anna).
kobieta(iza).

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

matka(Rodzic,Dziecko):-
	kobieta(Rodzic),
	rodzic(Rodzic,Dziecko).
	
ojciec(Rodzic,Dziecko):-
	mezczyzna(Rodzic),
	rodzic(Rodzic,Dziecko).
	
syn(Dziecko,Rodzic):-
	mezczyzna(Dziecko),
	rodzic(Rodzic,Dziecko).
	
corka(Dziecko,Rodzic):-
	kobieta(Dziecko),
	rodzic(Rodzic,Dziecko).
	
brat(Brat,Dziecko):-
	rodzic(Rodzic,Brat),
	rodzic(Rodzic,Dziecko),
	mezczyzna(Brat).
	
siostra(Siostra,Dziecko):-
	rodzic(Rodzic,Dziecko),
	rodzic(Rodzic,Siostra),
	corka(Siostra,Rodzic).
	
rodzenstwo(Dziecko1,Dziecko2):-
	brat(Dziecko1,Dziecko2).
	
rodzenstwo(Dziecko1,Dziecko2):-
	siostra(Dziecko1,Dziecko2).
	
ciocia(Ciocia,Dziecko):-
	rodzic(Rodzic,Dziecko),
	siostra(Ciocia,Rodzic).
	
wujek(Wujek,Dziecko):-
	rodzic(Rodzic,Dziecko),
	brat(Wujek,Rodzic).
	
kuzynka(Kuzynka,Dziecko):-
	ciocia(Ciocia,Dziecko),
	corka(Kuzynka,Ciocia).
	
kuzynka(Kuzynka,Dziecko):-
	wujek(Wujek,Dziecko),
	corka(Kuzynka,Wujek).
	
kuzyn(Kuzyn,Dziecko):-
	ciocia(Ciocia,Dziecko),
	syn(Kuzyn,Ciocia).
	
kuzyn(Kuzynka,Dziecko):-
	wujek(Wujek,Dziecko),
	syn(Kuzyn,Wujek).
	
babcia(Babcia,Dziecko):-
	rodzic(Rodzic,Dziecko),
	matka(Babcia,Rodzic).
	
dziadek(Dziadek,Dziecko):-
	rodzic(Rodzic,Dziecko),
	ojciec(Dziadek,Rodzic).
	
przodek(X,Y):-
	rodzic(X,Y).
przodek(X,Y):-
	rodzic(X,Z),
	przodek(Z,Y).