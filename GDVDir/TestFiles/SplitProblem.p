cnf(a1,axiom,
    p(X) | ~q(Y)  ).

cnf(a2,axiom,
    p(X) | q(Y) ).

cnf(a3,axiom,
    ~p(X) | ~q(Y)  ).

cnf(a4,negated_conjecture,
    ~p(X) | q(Y) ).
