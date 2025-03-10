/* 3. Exemple des carnivores

Écrire les clauses Prolog correspondant au fait que les animaux sont herbivores 
ou carnivores, l'antilope est un herbivore, le lion est féroce et d'ailleurs, 
tous les animaux féroces sont des carnivores. Les carnivores mangent de la 
viande et des herbivores, lesquels mangent de l'herbe. Tous boivent de l'eau.

Qui consomme quoi ? Développer l'arbre de recherche.

[J. L. Laurière Intelligence artificielle, Tomes I et II, Eyrolles 1986, 1987].

*/

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