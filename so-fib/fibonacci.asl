// An agent that computes Fibonacci numbers

/* Initial beliefs and rules */
fib(0,1).
fib(1,1).
//fib(N,Z) :- fib(N-1,Z1) & fib(N-2,Z2) & Z = Z1+Z2.

/* Initial goals */
// we want to compute Fibonacci number...
!calcFib(28).

/* Plans */
// simply call the rule
+!calcFib(N) <- 
   I=system.time;  !fib(N,Z);    .print(N,"!=",Z," in ",  (system.time - I)/1000," seconds"); .stopMAS.


+!fib(0, 1).
+!fib(1, 1).
+!fib(N, Z) <- !fib(N-1, Z1); !fib(N-2,Z2); Z = Z1+Z2.


+?fib(N, Z) <- ?fib(N-1, Z1); ?fib(N-2,Z2); Z = Z1+Z2; +fib(N,Z).


// more efficient implementation; comment first !fib rule above.
//+!fib(N, F) : N > 1 <- !fib(N, 1, 1, F).
//+!fib(2, F1, F2, F) <- F = F1 + F2.
//+!fib(N, F1, F2, F) : N > 2 <- N1 = N - 1; NF1 = F1 + F2; !fib(N1, NF1, F1, F).


