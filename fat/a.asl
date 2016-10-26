// Agent a in project fat.mas2j

/* Initial beliefs and rules */

/* Initial goals */

!start(400).

/* Plans */

+!start(N) 
   <- Init = system.time;
      for (.range(I,1,1000)) {
           !fat(N,1,X); //.print(N,"! = ",X)
      }
	  .println( (system.time - Init)/1000," seconds");
	  .stopMAS.

// version with tail recursion
+!fat(1,X,X).
+!fat(N,A,X) <- !fat(N-1,N*A,X).
