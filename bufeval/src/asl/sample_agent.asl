// Agent sample_agent in project bufeval

/* Initial beliefs and rules */

/* Initial goals */

!start(50).

/* Plans */

+!start(0) <- .stopMAS.
+!start(X) <- 
   //.wait(2000); 
   ok; .print(X); !start(X-1).
