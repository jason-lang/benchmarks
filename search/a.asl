
/* search: version rules */

search( [p([GoalState|Path]) | _], GoalState, p([GoalState|Path]), Closed).

search( [p([State|Path])|Open], GoalState, Solution, Closed) :-
    State \== GoalState &
    .findall(
	     p([NewState, State|Path]), // new paths
		   ( suc(State,NewState) &
         not .member(NewState, [State|Path]) /*& // turn closed off, otherwise it is too fast
         not .member(NewState, Closed) &
         .set.add(Closed, NewState)*/
       ),
       Suc
    ) &
    .concat( Open, Suc, NewOpen) &
    //.print("open nodes #",.length(NewOpen)) & //," new open = ",NewOpen) &
    search( NewOpen, GoalState, Solution, Closed).

suc(C,C2) :- C2 = C + 2.
suc(C,C1) :- C1 = C + 1.

!start.


/* version plans */

+!search( [p([GoalState|Path]) | _], GoalState, p([GoalState|Path])).

+!search( [p([State|Path])|Open], GoalState, Solution)
   :  State \== GoalState
   <- .findall(
	       p([NewState, State|Path]), // new paths
		     ( suc(State,NewState) & not .member(NewState, [State|Path]) ),
		     Suc
      );
      .concat( Open, Suc, NewOpen);
      //.print("open nodes #",.length(NewOpen));
      !search( NewOpen, GoalState, Solution).



+!start
   <- Goal = 15;
      for (.range(I,1,10)) {
        !do_rule(I,Goal)
      };
      .println;
      for (.range(I,1,10)) {
        !do_plan(I,Goal)
      };
      .println;
      .println("Consider the following:");
      for (.range(I,1,5)) {
        !do_rule(I,Goal)
      };
      .println;
      for (.range(I,1,5)) {
        !do_plan(I,Goal)
      };

      .stopMAS.
-!start
   <- .print("no solution found"); .stopMAS.

+!do_rule(I,Goal)
   <- InitRule = system.time;
      .set.add_all(Closed,[]);
      ?search( [p([0])], Goal, LRule, Closed);
      .print(I," solution rule=", LRule, " in ", (system.time - InitRule), " ms.").
+!do_plan(I,Goal)
   <- InitPlan = system.time;
      !search( [p([0])], Goal, LPlan);
      .print(I," solution plan=", LPlan, " in ", (system.time - InitPlan), " ms.").
