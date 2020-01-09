:- use_module(library(clpfd)).

% solve(N) :-
%    latin_square(N,Square),
%    maplist(writeln,Square).

% latin_square(N,Square) :-
%    length(Square,N),			% Square = [[X11,...,X1N],...,[XN1,...,XNN]]
%    maplist(same_length(Square),Square),	%
%    append(Square,AllVars),
%    AllVars ins 1..N,
%    maplist(all_different,Square),	% All different in a row.
%    transpose(Square,TSquare),		% All different in a column.
%    maplist(all_different,TSquare),	%
%    labeling([ff],AllVars).

% diagonal_to_lst([[H]],[H]).
% diagonal_to_lst([[H|_]|T],[H|L]) :-
%    maplist(tail,T,T1),
%    diagonal_to_lst(T1,L).

% tail([_|T],T).

%% Kwadrat super łaciński - elementy są parami różne, dla każdych przekątnych

solve(N) :-
   latin_super_square(N,Square),
   maplist(writeln,Square).

latin_super_square(N,Square) :-
   length(Square,N),			% Square = [[X11,...,X1N],...,[XN1,...,XNN]]
   maplist(same_length(Square),Square),	%
   append(Square,AllVars),
   AllVars ins 1..N,
   maplist(all_different,Square),	% All different in a row.
   transpose(Square,TSquare),		% All different in a column.
   maplist(all_different,TSquare),	%
   diagonal_to_lst(Square, Diagonal),
   all_different(Diagonal),
   maplist(reverse, Square, ReversedSquare),
   diagonal_to_lst(ReversedSquare, AntiDiagonal),
   all_different(AntiDiagonal),
   labeling([ff],AllVars).

diagonal_to_lst([[H]],[H]).
diagonal_to_lst([[H|_]|T],[H|L]) :-
   maplist(tail,T,T1),
   diagonal_to_lst(T1,L).

tail([_|T],T).