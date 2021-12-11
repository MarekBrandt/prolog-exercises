gnomesort([],_).
gnomesort(List, Wynikowa) :-
    gnomesort([], List, Wynikowa).


gnomesort(Sorted, [], Wynikowa) :-
    Sorted=Wynikowa,
    gnomesort([],Wynikowa).
gnomesort([], [N | Ns], Wynikowa) :-
    gnomesort([N], Ns, Wynikowa).
gnomesort([S | Ss], [N | Ns], Wynikowa) :-
    N >= S,
    gnomesort([N, S | Ss], Ns, Wynikowa).
gnomesort([S | Ss], [N | Ns], Wynikowa) :-
    N < S,
    gnomesort(Ss, [N, S | Ns], Wynikowa).

dekrementuj([],_,Wynik,Wynik2):-
    Wynik2 = Wynik.
dekrementuj(L,0,Wynik,Wynik2):-
    append(Wynik,L,Wynik2).
dekrementuj([L|_],_,_,Wynik2):-
    L =< 0,
    Wynik2 = [].
dekrementuj([L|Ls],I,Wynik,Wynik2):-
    P is L-1,
    Q is I-1,
    dekrementuj(Ls,Q,[P|Wynik],Wynik2).

odejmij([],0).
odejmij([0|_],1).
odejmij([X|Xs],Y):-
    length(Xs,Dlugosc),
    X =< Dlugosc,
    dekrementuj(Xs,X,_,Wynik2),
    gnomesort(Wynik2,Z),
    odejmij(Z,Y),!.
    	
odejmij([X|Xs],Y):-
   length(Xs,Dlugosc),
   X > Dlugosc,
   odejmij([],Y).

    
    
czy_graficzny([],0).
czy_graficzny(L,Odp) :-
    gnomesort(L,X),
    odejmij(X,Odp).


    

czy_spojny([],"N").
czy_spojny(L,Odp):-
    czy_graficzny(L,X),
    X =:= 0,
    Odp = "N".
czy_spojny(L,Odp):-
    member(0,L),
    Odp = "N".   
czy_spojny(L,Odp):-
    sum_list(L,Suma),
    S is Suma / 2,
	length(L,Dlugosc),
    D is Dlugosc-1,
    S >= D,
    Odp = "T".
czy_spojny(L,Odp):-
    sum_list(L,Suma),
    S is Suma / 2,
	length(L,Dlugosc),
    D is Dlugosc-1,
    S < D,
    Odp = "N".