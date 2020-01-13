:- use_module(library(clpfd)).

przyklad(Sol) :-
    X in 2..8,
    Y in 7..9,
    Vars=[X, Y],
    Sol=sol(x:X, y:Y),
    X*Y#<29,
    2*X+Y#>13,
    labeling([leftmost], Vars).

magic_triangle([a:A, b:B, c:C, d:D, e:E, f:F, g:G, h:H, i:I], Sum) :-
    Triangle=[A, B, C, D, E, F, G, H, I],
    Triangle ins 1..9,
    all_different(Triangle),
    A*A+B*B+C*C+D*D#=Sum,
    D*D+E*E+F*F+G*G#=Sum,
    G*G+H*H+I*I+A*A#=Sum,
    A#<D,
    D#<G,
    labeling([ff], Triangle).

safe(Sol) :-
    Vars=[C1, C2, C3, C4, C5, C6, C7, C8, C9],
    Vars ins 1..9,
    Sol=sol(C1, C2, C3, C4, C5, C6, C7, C8, C9),
    all_different(Vars),
    C4-C6#=C7,
    C1*C2*C3#=C8+C9,
    C2+C3+C6#<C8,
    C9#<C8,
    diffromind(Vars, 1),
    labeling([ff], Vars).
   
diffromind([], _) :- !.
diffromind([X|Xs], I) :-
    X#\=I,
    I1 is I+1,
    diffromind(Xs, I1).
   
solve(N) :-
    latin_square(N, Square),
    maplist(writeln, Square).
   
latin_square(N, Square) :-
    length(Square, N),
    maplist(same_length(Square), Square),	% Square = [[X11,...,X1N],...,[XN1,...,XNN]].
    append(Square, AllVars),
    AllVars ins 1..N,
    maplist(all_different, Square),	% Elementy każdego wiersza majš być parami różne.
    transpose(Square, TSquare),
    maplist(all_different, TSquare),	% Elementy każdej kolumny majš być parami różne.
    labeling([ff], AllVars).

visit(sol(fs:FS, hs:HS, j:J, m:M, t:T)) :-
    Vars=[FS, HS, J, M, T],
    Vars ins 0..1,
    HS#<==FS,
    M#\/J,
    FS#\T,
    T#<==>J,
    M#==>J#/\HS,
    labeling([ff], Vars).

   money(Root) :-
      Vars=[S, E, N, D, M, O, R, Y],
      Vars ins 0..9,
      Root=sol(s:S, e:E, n:N, d:D, m:M, o:O, r:R, y:Y),
      all_different(Vars),
      M#\=0,
      S#\=0,
      S*1000+E*100+N*10+D + M*1000+O*100+R*10+E#=M*10000+O*1000+N*100+E*10+Y,
      labeling([leftmost], Vars).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        % Rozwiązania zadań %                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bójka * 6 = Wyrok

zad(Sol) :-
   Vars = [B, U, J, K, A, W, Y, R, O],
   Vars ins 0..9,
   B #\= 0,
   W #\= 0,
   Sol = sol(b:B, u:U, j:J, k:K, a:A, w:W, y:Y, r:R, o:O),
   all_different(Vars),
   (B*10000 + U*1000 + J*100 + K*10 + A)*6 #= W * 10000 + Y * 1000 + R * 100 + O * 10 + K,
   labeling([leftmost], Vars).
