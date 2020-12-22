/* fichier fib.pl */
/*------------------------------------------*
*   Une version de la suite de Fibonacci    *
*   avec accumulateur :                     *
*  fib/4 : fib(u0, u1, indice, résultat)    *
fibbis/5 :                                  *
     fib(u"indice n-1",u"indice n", indice du terme voulu, indice du terme courant, Résultat )
     l'accumulateur est u"indice n"         *
*-------------------------------------------*/
fib(U0,_,0,U0).
fib(_,U1,1,U1).
fib(U0,U1,N,R) :- N >1, U2 is U1+U0, fibbis(U1,U2,N,2,R).


fibbis(_,U1,N,N,U1).
fibbis(U0,U1,N,I,R):- 
    I < N,
    I1 is I+1,
    U2 is U0+U1,
    fibbis(U1,U2,N,I1,R).


    

