/*---------------------------------------------*
*     fichier syracuse.pl
*-----------------------------------------------*/

/*--------------------------------------------*
*    première version syr0/3                  *
*    juste mais pas efficace                  *
*---------------------------------------------*/
syr0(U0,0,U0).
syr0(U0,N,UN) :-
    N >0, Np is N-1,
    syr0(U0,Np, UNp),
    UNp mod 2 =:= 1,!,
    UN is 3*UNp+1.
syr0(U0,N,UN) :-
    N >0, Np is N-1,
    syr0(U0,Np, UNp),
    UNp mod 2 =:= 0,!,
    UN is UNp // 2.

/*--------------------------------------------*
*    deuxième version syr0/3                  *
*    mise en facteur du prédicat de choix     *
*---------------------------------------------*/
syr1(U0,0,U0).
syr1(U0, N, UN):-
    N >0, Np is N-1,
    syr1(U0,Np, UNp),
    cases(UNp,UN).
cases(UNp,UN) :-
    UNp mod 2 =:= 1, !, UN is 3*UNp+1.
cases(UNp, UN) :-
    UN is UNp // 2.

/*--------------------------------------------*
*    troisième version syr0/3                  *
*    utilisation d'un ou dans la clause        *
*    attention à la présentation :             *
*    l'alternative doit être en évidence       *
*---------------------------------------------*/
syr2(U0,0, U0).
syr2(U0,N,UN) :-
    N >0, Np is N-1,
    syr2(U0,Np, UNp),
    (
    UNp mod 2 =:= 1,!,
    UN is 3*UNp+1
    ;
    UN is UNp // 2
    ).

/*--------------------------------------------*
*    quatrième version syr0/3                  *
*    en avant !                                *
*    le Nème terme de la suite commençant      *
*    par U0 est le n-1 ème terme               *
* de la suite commençant par U1                *
*---------------------------------------------*/
syr3(U0,0,U0).
syr3(U0, N, R) :- N > 0,
    (
    U0 mod 2 =:= 1, !, U1 is 3*U0+1
    ;
    U1 is U0//2
    ),
    Np is N-1, 
    syr3(U1,Np,R).

/*--------------------------------------------------*
*       temps de vol : tv/2                         *
*    On reprend l'idée précédente, mais cette fois  * 
*    le test d'arrêt est que la valeur de UN == 1   *
*    du coup, il n'y a presque rien à mémoriser     *
*---------------------------------------------------*/
tv(1, 0).
tv(U0, I):- 
    U0 > 1,
    (U0 mod 2 =:= 1, !, U1 is 3*U0+1 ; U1 is U0//2),
    tv(U1,Ip),
    I is Ip+1.
