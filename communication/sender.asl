all(
[receiver1,receiver2,receiver3,receiver4,receiver5,receiver6,receiver7,receiver8,receiver9,receiver10,receiver11,receiver12,receiver13,receiver14,receiver15,receiver16,receiver17,receiver18,receiver19,receiver20,receiver21,receiver22,receiver23,receiver24,receiver25,receiver26,receiver27,receiver28,receiver29,receiver30
//,sender1,sender2,sender3,sender4,sender5,sender6,sender7,sender8,sender9,sender10,sender11,sender12,sender13,sender14,sender15,sender16,sender17,sender18,sender19,sender20,sender21,sender22,sender23,sender24,sender25,sender26,sender27,sender28,sender29,sender30
]).

!send(100).

+!send(0).
+!send(X)
  <- //.print("sending ",X);
     //?all(Ags);
     //.send(Ags,tell,vl(X));
	 .broadcast(tell,vl(X));
     !send(X-1).

//+?everybody(X) <- .all_names(X); +everybody(X).
