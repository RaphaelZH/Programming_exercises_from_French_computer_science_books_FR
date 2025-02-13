/* 10. Suite de Fibonacci

*/

/*
 
fib(0, 0).

fib(1, 1).

fib(X, Y) :-
    X > 1,
    XS1 is X - 1,
    XS2 is X - 2,
    fib(XS1, YS1),
    fib(XS2, YS2),
    Y is YS1 + YS2.
    
*/

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
