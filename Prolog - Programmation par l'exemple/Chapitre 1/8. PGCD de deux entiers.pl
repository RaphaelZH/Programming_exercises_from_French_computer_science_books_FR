/* 8. PGCD de deux entiers

L’algorithme d’Euclide peut se faire par divisions successives ou, ce qui 
revient au même, par soustractions successives entre le plus grand et le plus 
petit, jusqu’à obtenir deux entiers identiques.

*/

% Le PGCD de deux nombres identiques est lui-même, sinon, dans l’hypothèse où 
% X < Y, c’est le même que celui du plus petit X avec la différence des deux, et 
% la troisième clause renvoyant à ce cas.

% Ainsi, par soustractions successives, on peut montrer que cet algorithme 
% aboutit obligatoirement au résultat.
% ------------------------------------------------------------------------------

pgcd(X, X, X).

pgcd(X, Y, Z) :-
    X < Y,
    YS is Y - X,
    pgcd(X, YS, Z).

pgcd(X, Y, Z) :-
    Y < X,
    pgcd(Y, X, Z).

/** <examples>

?- pgcd(12, 16, X).
X = 4 ;
false.

?- pgcd(12, 20, X).
X = 4 ;
false.

?- pgcd(27, 16, X).
X = 1 ;
false.

*/