/* 4. Opérations sur une base de données

Étant donnée une relation notée rel à 3 arguments, définir la relation pr « 
projection » de rel sur les 2 premiers arguments, puis la « sélection » sr des 
objets dont les deux premiers arguments vérifient une propriété prop. Si r et s 
sont deux relations à deux arguments, définir leur « jointure » jrs comme 
l'ensemble des triplets (x, y, z) vérifiant r(x, y) et s(x, z), enfin, leur 
union, comme l'union des couples de r et de s.

*/

% La projection d’une relation à trois arguments sur les deux premiers est 
% l’ensemble des couples (X, Y) tels qu’un triplet au moins vérifie la relation 
% rel.
% C’est donc la définition mathématique aussi bien que celle utilisée en base de 
% données.
% ------------------------------------------------------------------------------

pr(X, Y) :-
    rel(X, Y, _).

sr(X, Y, Z) :-
    rel(X, Y, Z),
    prop(X, Y).

jrs(X, Y, Z) :-
    r(X, Y),
    s(X, Z).

urs(X, Y) :-
    r(X, Y).

urs(X, Y) :-
    s(X, Y).