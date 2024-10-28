# Chapitre 1

## Prolog, le chaînage-arrière

### 1. L'inspecteur Maigret

L'inspecteur veut connaître les suspects qu'il doit interroger pour un certain nombre de faits : il tient un individu pour suspect dès qu'il était présent dans un lieu, un jour où un vol a été commis et s'il a pu voler la victime.

Un individu a pu voler, soit parce qu'il était sans argent, soit par jalousie. On dispose de faits sur les vols : par exemple, Marie a été volée lundi à l'hippodrome, Jean, mardi au bar, Luc, jeudi au stade.

Il sait que Max est sans argent et qu'Eve est très jalouse de Marie. Il est attesté par ailleurs que Max était au bar mercredi, Éric au bar mardi et qu'Eve était à l'hippodrome lundi (on ne prend pas en compte la présence des victimes comme possibilité qu'ils aient été aussi voleurs ce jour-là).

Écrire le programme Prolog qui, à la question $suspect(X)$, renverra toutes les réponses possibles et représenter l'arbre de recherche de Prolog.

```prolog
suspect(X) :-
    present(X, L, J),
    vol(L, J, V),
    apuvoler(X, V).
    
apuvoler(X, _) :-
    sansargent(X).

apuvoler(X, Y) :-
    jaloux(X, Y).

vol(hipp, lundi, marie).
vol(bar, mardi, jean).
vol(stade, jeudi, luc).

sansargent(max).

jaloux(eve, marie).

present(max, bar, mercredi).
present(eric, bar, mardi).
present(eve, hipp, lundi).

/** <examples>

?- suspect(X).
% X = eve.

*/
```