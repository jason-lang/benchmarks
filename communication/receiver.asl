
c(0).

@l[atomic]
+vl(_) <- ?c(M); -+c(M+1); !end(M+1). //; .print("rec ",M+1).

+!end(X)
   : X = 3000 //.all_names(LAgs) & X = 10 * (.length(LAgs)-1)/2
              // all names in Jade performs very bad!
  <- .send(terminator,tell,all). //; .print("received all").
+!end(_).
