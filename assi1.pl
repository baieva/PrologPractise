%Mingjia Shi 104467237 Assi1
result(X) :- unify(Y, [[a,b,c],[b,c,e],[c,b,a]]),reverse(Y,X,[[a,b,c],[b,c,e],[c,b,a]]).

unify(_,[]).
unify(X,[H|T]) :- unify(Y,T),\+list_empty(T,true), uni(H,Y,X).
unify(X,[H|T]) :- unify(Y,T),list_empty(T,true), uni(H,[],X).
uni([],L,L).
uni(L,[],L).
uni([H|T],L,[H|X]) :- \+member(H,L), uni(T,L,X).
uni([H|T],L,X) :- member(H,L), uni(T,L,X).

list_empty([], true).
list_empty([_|_], false).

toempty(E,E).
reverse([],T,L):-toempty(T,[]).
reverse([X|T],[Y|Z],L):-reverse(T,Z,L),reversed(X,Y,L).
reversed(X,Y,L) :- single_reverse(L,X,Y).
rev([H|_],L,X):-merge(L,H,X).
single_reverse([],X,[X]).
single_reverse([H|T],X,Y):- \+memberf(X,H),single_reverse(T,X,Y).
single_reverse([H|T],X,Y):- memberf(X,H),single_reverse(T,X,Z),rev(H,Z,Y).

member(X, [X|_]).
member(X, [_|T]) :- member(X, T).
memberf(X, [_|T]) :- member(X, T).

merge([],C,[C]).
merge([H|T],C,[H|X]):-merge(T,C,X).
