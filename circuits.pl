and(1,1,1). 
and(X, Y, 0) :- X = 0; Y=0. 

or(0, 0, 0).
or(X,Y,1) :- X=1 ; Y=1.

neg(1,0).
neg(0,1).

xor(X,X,0).
xor(X,Y,1) :- X \= Y.
    
circuit3(A,B,C, or(and(A,B),C)).
add(A, B, C, xor(A,xor(B,C))).

eval(0,0).
eval(1,1).
eval(and(X,Y),R) :- eval(X,R1), eval(Y,R2), and(R1,R2,R).
eval(or(X,Y), R) :- eval(X,R1), eval(Y,R2), or(R1,R2,R).
eval(xor(X,Y), R) :- eval(X,R1), eval(Y,R2), xor(R1,R2,R).
eval(neg(X), R) :- eval(X,R1), neg(R1,R).

bin(0).
bin(1).