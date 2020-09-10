cnf(fact,axiom,
    ( p(a) )   ).

cnf(opposite,axiom,
    ( ~p(X) | q(X) )   ).

cnf(another,derived,
    ( q(a) ),
    inference(sr,[status(thm)],[fact,opposite,missing,theory(equality)])).
