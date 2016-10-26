
% search: version rules

search( [p([GoalState|Path]) | _], GoalState, p([GoalState|Path])).

search( [p([State|Path])|Open], GoalState, Solution) :-
    findall(
	    p([NewState, State|Path]),
	    ( suc(State,NewState), not(member(NewState, [State|Path]))), 
	    Suc),
    append( Open, Suc, NewOpen),
    search( NewOpen, GoalState, Solution).

suc(C,C2) :- C2 is C + 2.
suc(C,C1) :- C1 is C + 1.

:-    search( [p([0])], 15, LRule),
      write(LRule), nl, halt.
	  
