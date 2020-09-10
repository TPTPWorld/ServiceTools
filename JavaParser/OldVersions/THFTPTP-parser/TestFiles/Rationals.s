cnf(1, negated_conjecture,
    $to_int(1115139/20000.22) != $to_int(5567631/100000),
    file('foo+tff2fof.tptp',a)).
cnf(2, plain,
    $false,
    inference('REWRITE',[status(thm)],[1,'CODE-FOR-$to_int',theory(equality)])).

