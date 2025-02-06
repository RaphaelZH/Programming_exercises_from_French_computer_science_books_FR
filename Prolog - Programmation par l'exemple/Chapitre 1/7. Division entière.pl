/* 7. Division entière

On cherche le quotient entier et le reste de la division de A par B.

*/

divise(A, B, 0, A) :-
    A < B.

divise(A, A, 1, 0).

divise(A, B, Q, R) :-
    B < A,
    AS is A - B,
    write(A),
    write(", "),
    write(AS),
    nl,
    divise(AS, B, QS, R),
    write(QS),
    write(", "),
    write(R),
    nl,
    Q is QS + 1,
    write(QS),
    write(", "),
    write(Q),
    nl.



/** <examples>

oncle(O, bure).

ancetre(A, mod).

*/