# Chapitre 1

## Prolog, le chaînage-arrière

### 1. L'inspecteur Maigret

L'inspecteur veut connaître les suspects qu'il doit interroger pour un certain nombre de faits : il tient un individu pour suspect dès qu'il était présent dans un lieu, un jour où un vol a été commis et s'il a pu voler la victime.

Un individu a pu voler, soit parce qu'il était sans argent, soit par jalousie. On dispose de faits sur les vols : par exemple, Marie a été volée lundi à l'hippodrome, Jean, mardi au bar, Luc, jeudi au stade.

Il sait que Max est sans argent et qu'Eve est très jalouse de Marie. Il est attesté par ailleurs que Max était au bar mercredi, Éric au bar mardi et qu'Eve était à l'hippodrome lundi (on ne prend pas en compte la présence des victimes comme possibilité qu'ils aient été aussi voleurs ce jour-là).

Écrire le programme Prolog qui, à la question $suspect(X)$, renverra toutes les réponses possibles et représenter l'arbre de recherche de Prolog.

```Prolog
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
X = eve.

*/
```

### 2. Jeu des pièces

Un jeu consiste à mettre trois pièces du même côté en en retournant simultanément, et ceci trois fois exactement. On devra demander par exemple $jeu(pile, face, pile)$ et les trois modifications devront être affichées.

Voir [[F. Giannesini, H. Kanoui, R. Pasero, M. Van Caneghem, *Prolog*, InterÉditions, 1985]](../R%C3%A9f%C3%A9rences/1.%20Prolog,%20Inter%C3%89ditions,%201985.pdf).

```Prolog
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
```

### 3. Exemple des carnivores

Écrire les clauses Prolog correspondant au fait que les animaux sont herbivores ou carnivores, l'antilope est un herbivore, le lion est féroce et d'ailleurs, tous les animaux féroces sont des carnivores. Les carnivores mangent de la viande et des herbivores, lesquels mangent de l'herbe. Tous boivent de l'eau.

Qui consomme quoi ? Développer l'arbre de recherche.

[[J. L. Laurière *Intelligence artificielle, Tomes I et II*, Eyrolles 1986, 1987]](../R%C3%A9f%C3%A9rences/2.%20Intelligence%20artificielle,%20Tomes%20I%20et%20II.pdf).

```Prolog
% animal(X) :-
%     herbivore(X).

% animal(X) :-
%     carnivore(X).

animal(X) :-
    herbivore(X);
    carnivore(X).

herbivore(antilope).

feroce(lion).

carnivore(X) :-
    feroce(X).

mange(X, viande) :-
    carnivore(X).

mange(X, Y) :-
    carnivore(X),
    herbivore(Y).

mange(X, herbe) :-
    herbivore(X).

boit(X, eau) :-
    animal(X).

consomme(X, Y) :-
    mange(X, Y).

consomme(X, Y) :-
    boit(X, Y).

/** <examples>

?- consomme(X, Y).
X = lion,
Y = viande ;
X = lion,
Y = antilope ;
X = antilope,
Y = herbe ;
X = antilope,
Y = eau ;
X = lion,
Y = eau.

*/
```

### 4. Opérations sur une base de données

Étant donnée une relation notée $rel$ à $3$ arguments, définir la relation $pr$ « projection » de $rel$ sur les $2$ premiers arguments, puis la « sélection » $sr$ des objets dont les deux premiers arguments vérifient une propriété $prop$. Si $r$ et $s$ sont deux relations à deux arguments, définir leur « jointure » $jrs$ comme l'ensemble des triplets $(x, y, z)$ vérifiant $r(x, y)$ et $s(x, z)$, enfin, leur union, comme l'union des couples de $r$ et de $s$.

```Prolog
% La projection d’une relation à trois arguments sur les deux premiers est 
% l’ensemble des couples (X, Y) tels qu’un triplet au moins vérifie la relation 
% rel.

% C’est donc la définition mathématique aussi bien que celle utilisée en base de 
% données.

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
```



