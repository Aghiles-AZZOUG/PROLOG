/*----------------------------------------------------------------*
*      fichier table_verite.pl                                    *
*      Une manière de faire une table de vérité sans trop         *
*      utiliser de choses compliquées ...                         *
*      ça n'est sans doute pas la solution la plus élégante       *
*                                                                 *
*       exemple : (X ou X et non(Y)) s'évalue avec                *
*       evalbool(X + X* -Y,R)                                     * 
*       et ça doit donner :                                       *
*       ?- evalbool(X+ X* -Y,R).                                  *
*          X = Y, Y = R, R = 0 ;                                  *
*          X = R, R = 0,                                          *
*          Y = 1 ;                                                *
*          X = R, R = 1,                                          *
*          Y = 0 ;                                                *
*          X = Y, Y = R, R = 1 ;                                  *
*          false.                                                 *
*-----------------------------------------------------------------*/

eval_b(0+E,E).
eval_b(1+_,1).
eval_b(0*_,0).
eval_b(1*E,E).
eval_b(- 0, 1).
eval_b(- 1, 0).

evalbool(X,0) :- X==0.
evalbool(X,1) :- X==1.
evalbool(X,R) :- var(X), !, eval_var(X,R), X=R.
evalbool(E1+E2,B) :- evalbool(E1,B1), evalbool(E2,B2), eval_b(B1+B2, B).
evalbool(E1*E2,B) :- evalbool(E1,B1), evalbool(E2,B2), eval_b(B1*B2, B).
evalbool(- E1,B) :- evalbool(E1,B1), eval_b(- B1, B).
eval_var(_,0).
eval_var(_,1).