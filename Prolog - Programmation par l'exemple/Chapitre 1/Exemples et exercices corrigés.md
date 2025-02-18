# Chapitre 1

## Prolog, le chaînage-arrière

### 1. L'inspecteur Maigret

L'inspecteur veut connaître les suspects qu'il doit interroger pour un certain nombre de faits : il tient un individu pour suspect dès qu'il était présent dans un lieu, un jour où un vol a été commis et s'il a pu voler la victime.

Un individu a pu voler, soit parce qu'il était sans argent, soit par jalousie. On dispose de faits sur les vols : par exemple, Marie a été volée lundi à l'hippodrome, Jean, mardi au bar, Luc, jeudi au stade.

Il sait que Max est sans argent et qu'Eve est très jalouse de Marie. Il est attesté par ailleurs que Max était au bar mercredi, Éric au bar mardi et qu'Eve était à l'hippodrome lundi (on ne prend pas en compte la présence des victimes comme possibilité qu'ils aient été aussi voleurs ce jour-là).

Écrire le programme Prolog qui, à la question $suspect(X)$, renverra toutes les réponses possibles et représenter l'arbre de recherche de Prolog.

```Prolog
% ------------------------------------------------------------------------------
% Le programme Prolog ci-dessous est très simple.
% 
% On prend les phrases du texte dans l’ordre où elles viennent, tout en décidant 
% de noms de prédicats les plus explicites possibles.
% 
% Seule, la première phrase peut présenter une difficulté, car elle doit être 
% décomposée dans les faits d’une présence, d’un vol commis et d’une propriété 
% de susceptibilité qu’un individu X soit voleur sur la personne d’une autre V.
% 
% La difficulté réside aussi souvent dans le nombre, l’ordre, mais surtout la 
% signification des paramètres d’une relation.
% 
% Ainsi, la présence met en jeu un individu X en un lieu L un jour J et un vol 
% attesté met en jeu également trois paramètres, la victime V, le lieu L et le 
% jour J.
% 
% Naturellement, il est possible de nuancer et de compliquer à loisir un tel 
% exercice, il y a l’objet du vol, le mobile, certes, ici, très simplifié et 
% bien d’autres choses.
% ------------------------------------------------------------------------------

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

Un jeu consiste à mettre trois pièces du même côté en en retournant simultanément, et ceci trois fois exactement. On devra demander, par exemple, $jeu(pile, face, pile)$ et les trois modifications devront être affichées.

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

Qui consomme quoi ? Développer l'arbre de recherche.

[[J. L. Laurière *Intelligence artificielle, Tomes I et II*, Eyrolles 1986, 1987]](../R%C3%A9f%C3%A9rences/2.%20Intelligence%20artificielle,%20Tomes%20I%20et%20II.pdf).

```Prolog
% ------------------------------------------------------------------------------
% L’arbre de recherche de Prolog se parcourt dans le sens « racine-gauche-droite 
% ».
% 
% Remarque, la clause animal(X) :- herbivore(X) ; carnivore(X). résume deux 
% règles grâce au point-virgule, et on pourrait faire de même pour consomme.
% ------------------------------------------------------------------------------

% animal(X) :-
%     herbivore(X).
% 
% animal(X) :-
%     carnivore(X).

animal(X) :-
    herbivore(X) ;
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

% consomme(X, Y) :-
%     mange(X, Y).
% 
% consomme(X, Y) :-
%     boit(X, Y).

consomme(X, Y) :-
    mange(X, Y) ;
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

Étant donnée une relation notée $rel$ à 3 arguments, définir la relation $pr$ « projection » de $rel$ sur les 2 premiers arguments, puis la « sélection » $sr$ des objets dont les deux premiers arguments vérifient une propriété $prop$. Si $r$ et $s$ sont deux relations à deux arguments, définir leur « jointure » $jrs$ comme l'ensemble des triplets $(x, y, z)$ vérifiant $r(x, y)$ et $s(x, z)$, enfin, leur union, comme l'union des couples de $r$ et de $s$.

```Prolog
% ------------------------------------------------------------------------------
% La projection d’une relation à trois arguments sur les deux premiers est 
% l’ensemble des couples (X, Y) tels qu’un triplet au moins vérifie la relation 
% rel.
% 
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
```

### 5. Mythologie germanique

Au commencement était Ginungap ou le chaos, au nord était l’amas de glaces Niffelheim, et au sud le Muspelheim embrasé. De ces deux contraires naquirent Ymer, ancêtre de tous les géants, et la vache Audumbla, qui engendra Bure père de Bôr. Ce dernier épousa la géante Bestla, qui le rendit père d’Odin (Wotan), de Vil et de Vé. Odin tua Ymer, dont le sang provoqua le fameux déluge, et grâce à Frigga, engendra Thor (la guerre), Balder (la lumière), Braga (la sagesse), Heimdal (sentinelle). Thor eut deux fils Mod (le courage) et Magni (la force).

Compléter éventuellement en introduisant les Valkyries, Hilda, Mista, Rota, des Elfes, Trolls et autres Nornes, puis faire l’arbre généalogique, et définir des relations diverses, telles qu’oncle, grand-oncle, cousin, etc.

---

---

### 6. Rencontres

Eve est une petite femme blonde qui désire rencontrer un homme, Irma est une brune mesurant 1m55 favorable à tout homme qui veut bien d’elle. Julie la rousse mesure 1m65 et cherche un homme plus grand qu’elle. Carmela est une blonde de 1m59 qui ne sait pas ce qu’elle veut.

Luc fait 1m70, est très attiré par une rousse, mais ne sait plus son prénom. Max adore les petites femmes brunes. Marc mesure 1m90 et aimerait aussi rencontrer une brune, Hector cherche une petite blonde. En admettant que $petit$ signifie moins de 1m60, peut-on les aider ?

```Prolog
% ------------------------------------------------------------------------------
% On prend les phrases, dans l’ordre où elles sont données, en prenant garde que 
% taille est un prédicat à deux arguments et que, pour simplifier, le désir de 
% chacun soit exprimé par une liste de conditions évaluables, par exemple pour 
% les tailles.
% 
% À la fin, le prédicat possible est construit comme traduisant deux désirs 
% compatibles, mais il faut éviter que la recherche de Prolog tourne en rond, 
% simplement en précisant le sexe des arguments.
% ------------------------------------------------------------------------------

femme(eve).
femme(irma).
femme(julie).
femme(carmela).

homme(luc).
homme(max).
homme(marc).
homme(hector).

petit(X) :-
    taille(X, T),
    T < 160.

petit(eve).

taille(irma, 155).
taille(julie, 165).
taille(carmela, 159).
taille(luc, 170).
taille(marc, 190).

cheveux(eve, blond).
cheveux(irma, brun).
cheveux(julie, roux).
cheveux(carmela, blond).

voudrait(eve, H) :-
    homme(H).

voudrait(irma, H) :-
    homme(H),
    voudrait(H, irma).

voudrait(julie, H) :-
    taille(julie, TJ),
    homme(H),
    taille(H, TH),
    TJ < TH.

voudrait(luc, F) :-
    femme(F),
    cheveux(F, roux).

voudrait(max, F) :-
    femme(F),
    petit(F),
    cheveux(F, brun).

voudrait(marc, F) :-
    femme(F),
    cheveux(F, brun).

voudrait(hector, F) :-
    femme(F),
    petit(F),
    cheveux(F, blond).

possible(H, F) :-
    homme(H),
    voudrait(H, F),
    voudrait(F, H).

/** <examples>

?- possible(H, F).
H = luc,
F = julie ;
H = max,
F = irma ;
H = marc,
F = irma ;
H = hector,
F = eve ;
false.

*/
```

### 7. Division entière

On cherche le quotient entier et le reste de la division de $A$ par $B$.

```Prolog
divise(A, B, 0, A) :-
    A < B.

divise(A, A, 1, 0).

divise(A, B, Q, R) :-
    B < A,
    AS is A - B,
    divise(AS, B, QS, R),
    Q is QS + 1.

/** <examples>

?- divise(23, 7, Q, R).
Q = 3,
R = 2 ;
false.

?- divise(58, 3, Q, R).
Q = 19,
R = 1 ;
false.

*/
```

### 8. PGCD de deux entiers

L’algorithme d’Euclide peut se faire par divisions successives ou, ce qui revient au même, par soustractions successives entre le plus grand et le plus petit, jusqu’à obtenir deux entiers identiques.

```Prolog
% ------------------------------------------------------------------------------
% Le PGCD de deux nombres identiques est lui-même, sinon, dans l’hypothèse où X 
% < Y, c’est le même que celui du plus petit X avec la différence des deux, la 
% troisième clause renvoyant à ce cas.
% 
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

% ******************************************************************************
% On peut utiliser un raccourci en remplaçant des soustractions successives par 
% une division euclidienne.
% ******************************************************************************

pgcd_Euclide(X, 0, X).

pgcd_Euclide(X, Y, Z) :-
    X < Y,
    pgcd_Euclide(Y, X, Z).

pgcd_Euclide(X, Y, Z) :-
    X >= Y,
    Y > 0,
    YS is X mod Y,
    pgcd_Euclide(Y, YS, Z).

/** <examples>

?- pgcd_Euclide(12, 16, X).
X = 4 ;
false.

?- pgcd_Euclide(12, 20, X).
X = 4 ;
false.

?- pgcd_Euclide(27, 16, X).
X = 1 ;
false.

*/
```

### 9. Combinaisons

Faire une programmation de complexité linéaire pour le coefficient $C_{n}^p$. Dessiner l’arbre de résolution de $comb(5, 3, X).$ par la méthode naïve, puis par celle-ci en comptant le nombre de nœuds de chacune.

```Prolog
% ------------------------------------------------------------------------------
% La relation de Pascal (hors les bords du triangle de Pascal) C_{n}^{p} = C_{n 
% - 1}^{p} + C_{n - 1}^{p - 1} donnerait lieu à un arbre de recherche 
% exponentiel où la plupart des calculs sont refaits plusieurs fois, c’est 
% pourquoi, pour donner un arbre de recherche réduit à une branche, il vaut 
% mieux utiliser la relation de récurrence C_{n}^{p} = (n • C_{n - 1}^{p - 1}) / 
% p.
% 
% On a donc dans l’ordre, pour ce calcul, à poser M = N – 1 et Q = P – 1, 
% appeler le calcul de C_{M}^{Q} puis le multiplier par N et le diviser par P.
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
```



