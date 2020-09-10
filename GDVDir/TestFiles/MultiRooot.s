cnf(fact,axiom,
    ( p(a) )   ).

cnf(opposite,axiom,
    ( ~p(X) | q(X) )   ).

cnf(not_fact,axiom,
    ( ~p(a) )   ).

cnf(another,derived,
    ( q(a) ),
    inference(sr,[status(thm)],[fact,opposite,theory(equality)])).

cnf(refutation,derived,
    ( $false ),
    inference(sr,[status(thm)],[fact,not_fact])   ).
