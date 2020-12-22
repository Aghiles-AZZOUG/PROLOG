 /* fichier famille.pl  */

/*-------------------------------------------------------*
*     une simple base de données généalogique            *
*     avec une solution pour le pr&dicat                 *
*     arbre_gen/1 qui affiche horizontalement            *
*     l'arbre généalogique de la personne donnée         *
*--------------------------------------------------------*/
homme(pierre).
homme(paul).
homme(amaury).
homme(pedro).
homme(matthieu).
homme(martin).
homme(henri).
homme(alain).
homme(antoine).
homme(hector).
homme(yves).
homme(thierry).
homme(nicolas).
homme(hugues).
homme(antonin).
homme(sylvain).


femme(martine).
femme(sophie).
femme(agnes).
femme(charlotte).
femme(aida).
femme(marie).
femme(lucie).
femme(louise).
femme(manon).
femme(lea).
femme(gaelle).
femme(sylvie).
femme(henriette).
femme(muriel).


enfant(louise,paul).
enfant(louise,marie).
enfant(henri,paul).
enfant(henri,marie).
enfant(manon,paul).
enfant(manon,marie).
enfant(alain,matthieu).
enfant(alain,lucie).
enfant(antoine,matthieu).
enfant(antoine,lucie).
enfant(lea,matthieu).
enfant(lea,lucie).
enfant(hector,martin).
enfant(hector,sophie).
enfant(pierre,louise).
enfant(pierre,alain).
enfant(sylvie,manon).
enfant(sylvie,antoine).
enfant(henriette,manon).
enfant(henriette,antoine).
enfant(muriel,lea).
enfant(muriel,hector).
enfant(thierry,lea).
enfant(thierry,hector).
enfant(nicolas,gaelle).
enfant(nicolas,yves).
enfant(hugues,gaelle).
enfant(hugues,yves).
enfant(pedro,aida).
enfant(pedro,pierre).
enfant(amaury,aida).
enfant(amaury,pierre).
enfant(charlotte,amaury).
enfant(charlotte,agnes).
enfant(martine,henriette).
enfant(martine,thierry).
enfant(antonin,muriel).
enfant(antonin,nicolas).
enfant(sylvain,muriel).
enfant(sylvain,nicolas).

:- op(500, xfx, parent_de).

X parent_de Y :- enfant(Y,X).
pere(X,Y) :- X parent_de Y, homme(X).
mere(X,Y) :- X parent_de Y, femme(X).

meme_fratrie(X,Y) :- enfant(X,Z), enfant(Y,Z), X\==Y.

un_enfant(X,Y) :- enfant(X,Y), !.

meme_fratrie_bis(X,Y) :- un_enfant(X,Z), enfant(Y,Z), X\==Y.

ancetre(X,X).
ancetre(X,Y) :- X parent_de Z, ancetre(Z,Y).

arbre_gen(Nom) :-
    affiche_tab(Nom,0).

affiche_tab(none,_) :- !.

affiche_tab(Nom,N) :-
    (pere(X, Nom), NN is N+1,! ; X = none),
    affiche_tab(X,NN),
    write3Nspaces(N), write(Nom), nl, 
    (mere(Y,Nom), NN is N+1,! ; Y = none),
    affiche_tab(Y,NN).



write3Nspaces(0) :- !.
write3Nspaces(N) :- N > 0, write("         "), NN is N-1, write3Nspaces(NN).



    
