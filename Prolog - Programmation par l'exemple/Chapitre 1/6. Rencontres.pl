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

parent(P, E) :-
    pere(P, E);
    mere(P, E).





/** <examples>

oncle(O, bure).

ancetre(A, mod).

*/