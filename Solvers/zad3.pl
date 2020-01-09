:- use_module(library(clpfd)).

%% Bójka * 6 = Wyrok

%% MROK^2 = CIEMNOŚĆ
zad1(Sol) :-
    Vars = [M, R, O, K, C, I, E, N, S1, C1],
    Vars ins 0..9,
    M #\= 0,
    C #\= 0,
    Sol = sol(m:M, r:R, o:O, k:K, c:C, i:I, e:E, n:N, s1:S1, c1:C1),
    all_different(Vars),
    (M*1000 + R*100 + O*10 + K)*(M*1000 + R*100 + O*10 + K) #= C * 10000000 + I * 1000000 + E * 100000 + M * 10000 + N*1000 + O*100 + S1*10 + C1,
    labeling([ff], Vars).

zad2(Sol) :-
    Sol. 