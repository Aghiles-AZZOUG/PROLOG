:- op(550, xfx, in).
   X in [X|_].
   X in [_|L] :- X in L.
    
:- op(550, xfx, estdans).
:- op(500, xfx, reste).
   
   X estdans [X|L] reste L.
   X estdans [Y|L] reste [Y|L1] :- X estdans L reste L1.
   
:-op(550, xfx, [estinclus, >=<]).
   [] estinclus _.
   [X|L] estinclus L1 :- X estdans L1 reste L2, L estinclus L2.
   
   [] >=< [].
   [X|L] >=< L1 :- X estdans L1 reste L2, L >=< L2.

eg(L1,L2) :- L1 estinclus L2, L2 estinclus L1.

/*
  TEN
  TEN
  TEN
  TEN
FORTY
-----------
SIXTY
*/
chiffre(X) :- X in  [0,1,2,3,4,5,6,7,8,9].

ttf(T,E,N,F,O,R,Y,S,I,X) :-
    chiffre(N), chiffre(Y), N \= Y,
    Som1 is 4*N+Y, Y =:= Som1 mod 10, R1 is Som1 // 10,
    chiffre(E), chiffre(T), tousdiff([E,N,T,Y]),
    Som2 is 4*E+T+R1, T =:= Som2 mod 10, R2 is Som2 // 10,
    chiffre(R), chiffre(X), 
    not(R in [E,N,T,Y]),
    not(X in [R,E,N,T,Y]),
    Som3 is 4*T + R + R2, X =:= Som3 mod 10, R3 is Som3 // 10,
    chiffre(O), chiffre(I), 
    not(O in [X, R,E,N,T,Y]),
    not(I in [O, X, R,E,N,T,Y]),
    I =:= (O + R3) mod 10, 1 is (O + R3) // 10,
    chiffre(F), not(F in [I, O, X, R,E,N,T,Y]),
    chiffre(S),not(S in [F, I, O, X, R,E,N,T,Y]),
    S =:= F+1.
    
ttf2 :-
    [T,E,N,F,O,R,Y,S,I,X] >=< [0,1,2,3,4,5,6,7,8,9],
    Som1 is 4*N+Y, Y =:= Som1 mod 10, R1 is Som1 // 10,
    Som2 is 4*E+T+R1, T =:= Som2 mod 10, R2 is Som2 // 10,
    Som3 is 4*T + R + R2, X =:= Som3 mod 10, R3 is Som3 // 10,
    I =:= (O + R3) mod 10, 1 is (O + R3) // 10,
    S =:= F+1,
    put(' '), put(' '),write(T),write(E),writeln(N),
    put(' '), put(' '),write(T),write(E),writeln(N),
    put(' '), put(' '),write(T),write(E),writeln(N),
    put(' '), put(' '),write(T),write(E),writeln(N),
    write(F), write(O), write(R), write(T), writeln(Y),
    writeln('-----------'),
    write(S), write(I), write(X), write(T), writeln(Y).
    
ttf3 :-
    [T,E,N,F,O,R,Y,S,I,X] >=< [0,1,2,3,4,5,6,7,8,9],
   T1 is  (T*100+E*10+N),
   T2 is  F*10000+O*1000+R*100+T*10+Y ,
   T3 is S*10000+I*1000+X*100+T*10+Y,
   4*T1+T2 =:= T3,
    put(' '), put(' '),writeln(T1),
    put(' '), put(' '),writeln(T1),
    put(' '), put(' '),writeln(T1),
    put(' '), put(' '),writeln(T1),
     writeln(T2),
    writeln('-----------'),
    writeln(T3).
    