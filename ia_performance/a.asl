// Agent a in project ia_performance.mas2j

/* Initial beliefs and rules */

/* Initial goals */

!start(200000).

/* Plans */

+!start(0) : begin(S)         <- .print("Time: ", (system.time - S)/1000, " seg"); .stopMAS.
+!start(X) : X = 200000       <- .print(start); +begin(system.time); !!start(X-1).
+!start(X) : X mod 10000 == 0 <- .print(X);     !!start(X-1).
+!start(X)                    <- !do(X); !!start(X-1).

+!do(X) <- my.testia("hello world.",10,atom,struc(1,a),X,X+10);
           my.testia("hello world.",10,atom,struc(1,a),X,X+10);
           my.testia("hello world.",10,atom,struc(1,a),X,X+10);
           my.testia("hello world.",10,atom,struc(1,a),X,X+10);
           my.testia("hello world.",10,atom,struc(1,a),X,X+10).

