
/* search: version rules */

search( [ [GoalState|Path] | _], GoalState, [GoalState|Path], Closed).

search( [[State|Path]|Open], GoalState, Solution, Closed) :-
    State \== GoalState &
    .findall(
	     [NewState, State|Path], // new paths
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

/* search with queue */

searchO( Open, GoalState, [GoalState|Path], Closed) :-
    .queue.head(Open,[GoalState|Path]).

searchO( Open, GoalState, Solution, Closed) :-
    //.length(Open,NNN) & .print(NNN) &
    .queue.remove(Open,[State|Path]) &
    State \== GoalState &
    .findall(
	     [NewState, State|Path], // new paths
		   ( suc(State,NewState) &
         not .member(NewState, [State|Path]) //& // turn closed off, otherwise it is too fast
         //not .member(NewState, Closed) &
         //.set.add(Closed, NewState)
       ),
       Suc
    ) &
    .queue.add_all(Open, Suc) &
    searchO( Open, GoalState, Solution, Closed).

suc(C,C2) :- C2 = C + 2.
suc(C,C1) :- C1 = C + 1.

/* version plans */

+!search( [[GoalState|Path] | _], GoalState, [GoalState|Path]).

+!search( [[State|Path]|Open], GoalState, Solution)
   :  State \== GoalState
   <- .findall(
	       [NewState, State|Path], // new paths
		     ( suc(State,NewState) &
           not .member(NewState, [State|Path]) ),
		     Suc
      );
      .concat( Open, Suc, NewOpen);
      //.print("open nodes #",.length(NewOpen));
      !search( NewOpen, GoalState, Solution).

// queue version
+!searchO( Open, GoalState, [GoalState|Path])
   : .queue.head(Open,[GoalState|Path]).

+!searchO( Open, GoalState, Solution)
   :  .queue.remove(Open,[State|Path]) &
      State \== GoalState
   <- .findall(
	       [NewState, State|Path], // new paths
		     ( suc(State,NewState) &
           not .member(NewState, [State|Path]) ),
		     Suc
      );
      .queue.add_all(Open, Suc);
      !searchO( Open, GoalState, Solution).

//!test.
+!test
   <- //!do_planO(0,30);
      !do_ruleO(0,26);
      .stopMAS;
   .

!start.
+!start
   <- Goal = 19;
      for (.range(I,1,10)) {
        !do_rule(I,Goal)
      };
      .println;
      for (.range(I,1,10)) {
        !do_ruleO(I,Goal)
      };
      .println;
      for (.range(I,1,10)) {
        !do_plan(I,Goal)
      };
      .println;
      for (.range(I,1,10)) {
        !do_planO(I,Goal)
      };
      .println;
      .println("Consider the following:");
      for (.range(I,1,5)) {
        !do_rule(I,Goal)
      };
      .println;
      for (.range(I,1,5)) {
        !do_ruleO(I,Goal)
      };
      .println;
      for (.range(I,1,5)) {
        !do_plan(I,Goal)
      };
      .println;
      for (.range(I,1,5)) {
        !do_planO(I,Goal)
      };

      .stopMAS.
-!start
   <- .print("no solution found"); .stopMAS.

+!do_rule(I,Goal)
   <- InitRule = system.time;
      .set.add_all(Closed,[]);
      ?search( [[0]], Goal, LRule, Closed);
      .print(I," solution rule=", LRule, " in ", (system.time - InitRule), " ms.").
+!do_ruleO(I,Goal)
   <- InitRule = system.time;
      .set.add_all(Closed,[]);
      .queue.create(Open);
      .queue.add(Open,[0]);
      ?searchO( Open, Goal, LRule, Closed);
      .print(I," solution rule queue=", LRule, " in ", (system.time - InitRule), " ms.").
+!do_plan(I,Goal)
   <- InitPlan = system.time;
      !search( [[0]], Goal, LPlan);
      .print(I," solution plan=", LPlan, " in ", (system.time - InitPlan), " ms.").
+!do_planO(I,Goal)
   <- InitPlan = system.time;
      .queue.create(Open);
      .queue.add(Open,[0]);
      !searchO( Open, Goal, LPlan);
      .print(I," solution plan queue=", LPlan, " in ", (system.time - InitPlan), " ms.").
