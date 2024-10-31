/* 5. Mythologie germanique

Au commencement était Ginungap ou le chaos, au nord était l’amas de glaces 
Niffelheim, et au sud le Muspelheim embrasé. De ces deux contraires naquirent 
Ymer, ancêtre de tous les géants, et la vache Audumbla, qui engendra Bure père 
de Bôr. Ce dernier épousa la géante Bestla, qui le rendit père d’Odin (Wotan), 
de Vil et de Vé. Odin tua Ymer, dont le sang provoqua le fameux déluge, et, 
grâce à Frigga, engendra Thor (la guerre), Balder (la lumière), Braga (la 
sagesse), Heimdal (sentinelle). Thor eut deux fils Mod (le courage) et Magni (la 
force). Compléter éventuellement en introduisant les Valkyries, Hilda, Mista, 
Rota, des Elfes, Trolls et autres Nornes, puis faire l’arbre généalogique, et 
définir des relations diverses, telles qu’oncle, grand-oncle, cousin, etc.

*/

parent(P, E) :-
    pere(P, E);
    mere(P, E).

ancetre(A, D) :-
    parent(A, D).

ancetre(A, D) :-
    parent(A, D),
    ancetre(A, D).

homme(H) :-
    pere(H, _).

pere(niffelham, ymer).
pere(niffelham, audumbla).

mere(muspelheim, ymer).
mere(muspelheim, audumbla).

homme(ymer).
ancetre(ymer, G) :-
    geant(G).

mere(audumbla, bure).

pere(bure, bor).

pere(bor, odin).
pere(bor, vil).
pere(bor, ve).

geant(bestla).
mere(bestla, odin).
mere(bestla, vil).
mere(bestla, ve).

pere(odin, thor).
pere(odin, balder).
pere(odin, brage).
pere(odin, sentinelle).

mere(frigga, thor).
mere(frigga, balder).
mere(frigga, brage).
mere(frigga, sentinelle).

pere(thor, mod).
pere(thor, magni).

oncle(O, N) :-
    parent(P, O),
    homme(O),
    parent(P, E),
    parent(E, N).



/** <examples>

*/