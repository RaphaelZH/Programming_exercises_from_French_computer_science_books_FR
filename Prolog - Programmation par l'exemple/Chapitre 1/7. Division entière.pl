/* 7. Division entière

On cherche le quotient entier et le reste de la division de A par B.

*/

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