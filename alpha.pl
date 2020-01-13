:- use_module(library(clpfd)).

alpha(Sol) :-
    Vars = [Y, O, B, O1, W, K, R, A, J],
    Vars ins 0..9,
    B #\= 0,
    W #\= 0,
    Sol = sol(y:Y, o:O, b:B, o1:O1, w:W, k:K, r:R, a:A, j:J),
    all_different(Vars),
    (B*10000 + O1*1000 + J*100 + K*10 + A) * (6) #= W*10000 + Y*1000 + R*100 + O*10 + K,
    labeling([ff], Vars).
