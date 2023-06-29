fof(c_0_6,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(fof_simplification,[status(thm)],[apart1]),
    [verified(thm)] ).
fof(c_0_10,conjecture,
    ! [X6] : ~ distinct_points(X6,X6),
    inference(variable_rename,[status(thm)],[c_0_6]) ).
