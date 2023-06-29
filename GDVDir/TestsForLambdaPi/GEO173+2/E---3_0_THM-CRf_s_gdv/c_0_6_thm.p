fof(apart1,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',apart1),
    [verified(leaf)] ).
fof(c_0_6,conjecture,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(fof_simplification,[status(thm)],[apart1]) ).
