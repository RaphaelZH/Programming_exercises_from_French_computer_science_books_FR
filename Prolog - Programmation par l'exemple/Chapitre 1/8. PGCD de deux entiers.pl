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






divise(A, B, 0, A) :-
    A < B.

divise(A, A, 1, 0).

divise(A, B, Q, R) :-
    B < A,
    AS is A - B,
    divise(AS, B, QS, R),
    Q is QS + 1.

pgcd_2(X, X, X).

pgcd_2(X, Y, Z) :-
    X < Y,
    pgcd_2(Y, X, Z).

pgcd_2(X, Y, Z) :-
    X > Y,
    write(X),
    nl,
    write(Y),
    nl,
    write('======'),
    nl,
    XS is X div Y,
    YS is X mod Y,
    write(XS),
    nl,
    write(YS),
    nl,
    R \= 0,
    divise(XS, YS, Z, R).