:- use_module(library(clpfd)).

alpha(Sol) :-
    Vars = [B, O1, W, J, Y, A, R, O, K],
    Vars ins 0..9,
    B #\= 0,
    W #\= 0,
    Sol = sol(b:B, o1:O1, w:W, j:J, y:Y, a:A, r:R, o:O, k:K),
    all_different(Vars),
    (B*10000 + O1*1000 + J*100 + K*10 + A) * (6) #= W*10000 + Y*1000 + R*100 + O*10 + K,
    labeling([ff], Vars).
