// Agent terminator in project CommPerformance.mas2j

/* Initial beliefs and rules */

c(0).

/* Initial goals */

!start.

/* Plans */

+!start <- +init_time(system.time). //; .print("init at ",T).

@l[atomic]
+all <- ?c(M); -+c(M+1); !end(M+1).

+!end(X)
   : X=30 // .all_names(LAgs) & X = (.length(LAgs)-1)/2
  <- ?init_time(Init);
     .print("** finished in ",(system.time-Init)/1000," seconds **");
     .stopMAS;
     .
+!end(X)
  <- .print(X, " agents has finished");
     .
