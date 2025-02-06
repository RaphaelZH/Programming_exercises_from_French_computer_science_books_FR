/* 6. Rencontres

Eve est une petite femme blonde qui désire rencontrer un homme, Irma est une 
brune mesurant 1m55 favorable à tout homme qui veut bien d’elle. Julie la rousse 
mesure 1m65 et cherche un homme plus grand qu’elle. Carmela est une blonde de 
1m59 qui ne sait pas ce qu’elle veut.

Luc fait 1m70, est très attiré par une rousse, mais ne sait plus son prénom. Max 
adore les petites femmes brunes. Marc mesure 1m90 et aimerait aussi rencontrer 
une brune, Hector cherche une petite blonde. En admettant que petit signifie 
moins de 1m60, peut-on les aider ?

*/

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

% Le prédicat « possible » est construit comme traduisant deux désirs 
% compatibles, il faut éviter que la recherche de Prolog tourne en rond, 
% simplement en précisant le sexe des arguments.
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