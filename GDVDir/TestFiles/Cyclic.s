cnf(fact,axiom,
    ( p(a) )   ).

cnf(cycle1,derived,
    ( ~p(X) | q(X) ),
    inference(sr,[status(thm)],[fact,cycle3])).

cnf(cycle2,derived,
    ( ~p(X) | q(X) ),
    inference(sr,[status(thm)],[cycle1])).

cnf(cycle3,derived,
    ( q(a) ),
    inference(sr,[status(thm)],[fact,cycle2])).

cnf(root,derived,
    ( q(a) ),
    inference(sr,[status(thm)],[fact,cycle1])).
