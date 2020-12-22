homme(pierre).
homme(paul).
homme(amaury).
homme(pedro).
femme(martine).
femme(sophie).
femme(agnes).
femme(charlotte).
femme(aida).

caroule :- write('donnez un nom :'), read(Nom), run(Nom).

run(quit) :- halt.
run(Nom) :- homme(Nom), write(Nom),  write(" est un homme\n"), !, caroule.
run(Nom) :- femme(Nom), write(Nom), write(" est une femme\n"), !, caroule.
run(Nom):- write('je ne connais pas '), write(Nom), write("\n"),!, caroule.

:- caroule.
