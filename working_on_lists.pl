reverse_list([],[]).
reverse_list([H|T],L):-
    reverse_list(T,L1),
    append(L1,[H],L).

set_from_list([],[]):-!.
set_from_list([Head|Tail],Set):-
    member(Set,Head),
    set_from_list(Tail,Set).
set_from_list([Head|Tail],Set):-
    append(SubSet,[Head],Set),
    set_from_list(Tail,SubSet).
