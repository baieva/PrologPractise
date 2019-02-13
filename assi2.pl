%Mingjia Shi 104467237
result(X):- color([a,b,c,d,e,f],[[a,b],[a,c],[a,d],[a,f],[b,c],[b,e],[b,f],[c,d],[c,e],[d,e],[d,f],[e,f]],[green,yellow,blue,red],X).
color([],_,_,[]).
color([H|T],A,C,X):-color(T,A,C,Y),
    length(T,L),
    M is L + 1,
    length(C,Mc),
    coloring(H,A,C,Z,M,Y,Mc),
    merge(Y,Z,X).
coloring(N,_,[H|T],[N,H],1,_,_).
coloring(N,A,C,X,M,List,Mc):-findcolor(Mc,N,A,Cf,M,List,0),coloredf(N,Cf,C,X,Mc).
findcolor(Mc,_,_,Cf,M,[],Counter):- M > Mc, Cf is M - Counter + 1.
findcolor(_,_,_,Cf,M,[],Counter):- Cf is Counter + 1.
findcolor(Mc,N,A,Cf,M,[[E,C]|T],Counter):-F is M,
    member([N,E],A),
    NC is Counter + 1,
    findcolor(Mc,N,A,Cf,F,T,NC).
findcolor(_,N,A,Cf,M,[[E,C]|_],Counter):-F is Counter + 1,
    \+member([N,E],A),
    Cf is F.
colored(N,1,[H|_],[N,H]).
colored(N,Cf,[_|T],X):-M is Cf - 1,colored(N,M,T,X).
coloredf(N,Cf,C,X,Mc):-Cf > Mc, M is Cf mod Mc, colored(N,M,C,X).
coloredf(N,Cf,C,X,Mc):-T is Mc + 1,Cf < T,colored(N,Cf,C,X).

member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

merge([],C,[C]).
merge([H|T],C,[H|X]):-merge(T,C,X).
