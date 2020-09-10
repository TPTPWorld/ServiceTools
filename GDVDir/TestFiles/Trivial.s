cnf(fact,axiom,
    ( p(a) ),
    inference(split_conjunct,[status(thm)],[1])).

cnf(opposite,axiom,
    ( ~p(X) | q(X) ),
    inference(split_conjunct,[status(thm)],[1])).

cnf(result,derived,
    ( q(a) ),
    inference(sr,[status(thm)],[fact,opposite,theory(equality)])).
