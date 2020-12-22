% fichier singe_et_bananes.pl


move(etat(aucentre,surlaboite,aucentre,napas),
       aggripper,
       etat(aucentre, surlaboite,aucentre, possede)).
       
  move(etat(P, surlesol, P, H),
       grimper,
       etat(P, surlaboite,P,H)).
       
  move(etat(P1, surlesol, P1, H),
       pousser(P1,P2),
       etat(P2, surlesol, P2, H)).
       
  move(etat(P1, surlesol, B, H),
       marcher(P1, P2),
       etat(P2, surlesol, B, H)).
       
 peutprendre(etat(_,_,_,possede)).
 peutprendre(E1) :- move(Etat1, Act, E2),peutprendre(E2).
 
 
 /*-----------------------------------------------------
 Question
 
 ?- peutprendre(etat(alaporte, ausol, alafenetre,napas)).
 
 --------------------------------------------------------*/