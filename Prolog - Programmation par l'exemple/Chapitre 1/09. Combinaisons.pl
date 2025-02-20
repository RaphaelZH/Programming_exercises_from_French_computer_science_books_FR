/* 9. Combinaisons

Faire une programmation de complexité linéaire pour le coefficient C_n^p. 
Dessiner l’arbre de résolution de comb(5, 3, X). par la méthode naïve, puis par 
celle-ci en comptant le nombre de nœuds de chacune.

*/

% ------------------------------------------------------------------------------
% La relation de Pascal (hors les bords du triangle de Pascal) 
% C_n^p = C_(n - 1)^p + C_(n - 1)^(p - 1) donnerait lieu à un arbre de recherche 
% exponentiel où la plupart des calculs sont refaits plusieurs fois, c’est 
% pourquoi, pour donner un arbre de recherche réduit à une branche, il vaut 
% mieux utiliser la relation de récurrence C_n^p = (n⋅C_(n - 1)^(p - 1)) / p.
% 
% On a donc dans l’ordre, pour ce calcul, à poser M = N – 1 et Q = P – 1, 
% appeler le calcul de C_M^Q puis le multiplier par N et le diviser par P.
% ------------------------------------------------------------------------------

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