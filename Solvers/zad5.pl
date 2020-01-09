% http://www.pwlzo.pl/download/PWLZO_zab.pdf, page (PDF 188, book 152)
:- use_module(library(clpfd)).

visit(sol(fs:FS, hs:HS, j:J, m:M, t:T)) :-
    Vars = [FS, HS, J, M, T],
    Vars ins 0..1,
    HS #<==> FS,
    M #\/ J,
    FS #\ T,
    T #<==> J,
    M #==> (J #/\ HS),
    labeling([ff],Vars).

horse(sol(pf: PF, nm: NM, wp: WP, hgl: HGL, sg: SG)) :-
    Vars = [PF, NM, WP, HGL, SG],
    Vars ins 1..6,
    (PF #< NM) #\/ (PF #> WP),
    (WP #= PF) #<==> (HGL #\= SG),
    ((PF - SG) #<==> (SG - WG)) #<==> (WP > NM),
    labeling([ff], Vars).

