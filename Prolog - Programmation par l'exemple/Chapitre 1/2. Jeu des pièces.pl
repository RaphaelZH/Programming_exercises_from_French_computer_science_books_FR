/* 2. Jeu des pièces

Un jeu consiste à mettre trois pièces du même côté en en retournant 
simultanément, et ceci trois fois exactement. On devra demander par exemple 
jeu(pile, face, pile) et les trois modifications devront être affichées.

Voir [F. Giannesini, H. Kanoui, R. Pasero, M. Van Caneghem, Prolog, 
InterÉditions, 1985]

*/

opp(pile, face).
opp(face, pile).

modif(X, Y1, Z1, X, Y2, Z2) :- 
    opp(Y1, Y2), 
    opp(Z1, Z2).

modif(X1, Y, Z1, X2, Y, Z2) :- 
    opp(X1, X2), 
    opp(Z1, Z2).

modif(X1, Y1, Z, X2, Y2, Z) :- 
    opp(Y1, Y2), 
    opp(X1, X2).

jeu(X1, Y1, Z1) :- 
    modif(X1, Y1, Z1, X2, Y2, Z2), 
    modif(X2, Y2, Z2, X3, Y3, Z3), 
    modif(X3, Y3, Z3, R, R, R), 
    aff(X1, Y1, Z1), 
    aff(X2, Y2, Z2), 
    aff(X3, Y3, Z3), 
    aff(R, R, R).

aff(X, Y, Z) :- 
    write(X), 
    write(' '), 
    write(Y), 
    write(' '), 
    write(Z), 
    nl.

/** <examples>

?- jeu(pile, face, pile).
pile face pile
pile pile face
pile face pile
face face face
true ;
pile face pile
pile pile face
face pile pile
face face face
true ;
pile face pile
face face face
face pile pile
face face face
true ;
pile face pile
face face face
pile face pile
face face face
true ;
pile face pile
face face face
pile pile face
face face face
true ;
pile face pile
face pile pile
pile pile face
face face face
true ;
pile face pile
face pile pile
pile face pile
face face face
true ;
false.

*/