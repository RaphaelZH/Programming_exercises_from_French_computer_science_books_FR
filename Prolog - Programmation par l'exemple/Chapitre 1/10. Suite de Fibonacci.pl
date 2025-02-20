/* 10. Suite de Fibonacci

Programmer de manière astucieuse pour ne pas refaire les mêmes calculs la suite 
u_0 = 0, u_1 = u_2 = 1, u_(n + 2) = u_(n + 1) + u_n. L’arbre de recherche doit 
être réduit à une branche de N + 1 nœuds pour l’appel de fibo(N, R). Par exemple 
fibo(6, X). → X = 8 avec 7 nœuds.

*/

/*



/*

fibo(N, R) :- 
    fibo(R, 0, 1, N).

fibo(R, _, R, 0).

fibo(R, U, V, N):- 
    0 < N, 
    M is N - 1, 
    W is U + V, 
    fibo(R, V, W, M).
    
 */


fibo(N, R) :- 
    fibo(R, 0, 1, N).

fibo(R, R, _, 0).

fibo(R, _, R, 1).

fibo(R, U, V, N):- 
    1 < N, 
    M is N - 1, 
    W is U + V, 
    fibo(R, V, W, M).
