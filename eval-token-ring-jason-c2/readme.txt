This benchmark is published in the paper

Rafael C. Cardoso, Maicon R. Zatelli, Jomi F. Hübner, and Rafael
H. Bordini. Towards benchmarking actor- and agent-based programming
languages. In Proceedings of the 2013 Workshop on Programming Based on
Actors, Agents, and Decentralized Control, AGERE! '13, pages 115-126,
New York, NY, USA, 2013. ACM.

On-line at: http://dx.doi.org/10.1145/2541329.2541339.


Configuration

- create 500 workers, named 1 to 500, and each linked to its
  successor;

- worker 500 should be linked back to worker 1, forming an unbroken
  ring;

- initially pass T tokens to workers randomly assigned to a worker;

- each worker passes the token to its neighbouring worker (i.e., the
  worker it is linked to);

- the program halts when all T tokens have been passed, between any
  two workers, N times each.
