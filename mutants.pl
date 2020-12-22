/*---------------------------------------------------*
*         fichier mutants.pl                         *
*    mutant/1 calcule les "croissements" des noms    *
*    des espèces animales stockées avec le prédicat  *
*    animal/1  et ça devrait produire les noms       *
*    suivants                                        *
*    ?- mutant(X).                                   *
      X = alligatortue ;                             *
      X = lapintade ;                                *
      X = chevalligator ;                            *
      X = chevalapin ;                               *
      false.                                         *
*    Si vous le faites en classe, vous pouvez        *
*    utiliser le nom ou le prénom des élèves ...     *
*----------------------------------------------------*/

non_vide([_|_]).

mutant(S) :-
    animal(MotD), animal(MotF),
    name(MotD,D),name(MotF,F),
    append(Debut,Milieu,D),
    non_vide(Debut),
    non_vide(Milieu),
    append(Milieu,_,F),
    append(Debut,F,M),
    name(S,M).

animal("alligator").
animal("lapin").
animal("tortue").
animal("pintade").
animal("cheval").