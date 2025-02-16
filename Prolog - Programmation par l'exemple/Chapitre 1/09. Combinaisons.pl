/* 9. Combinaisons

Faire une programmation de complexité linéaire pour le coefficient C_{n}^p. 
Dessiner l’arbre de résolution de comb(5, 3, X). par la méthode naïve, puis par 
celle-ci en comptant le nombre de nœuds de chacune.

*/

comb(_, 0, 1).

comb(N, P, R) :-
    0 < N,
    M is N - 1,
    Q is P - 1,
    comb(M, Q, S),
    R is N * S / P.

/** <examples>

?- comb(6, 3, R).
R = 20 ;
false.

?- comb(7, 4, R).
R = 35 ;
false.

?- comb(8, 4, R).
R = 70 ;
false.

*/