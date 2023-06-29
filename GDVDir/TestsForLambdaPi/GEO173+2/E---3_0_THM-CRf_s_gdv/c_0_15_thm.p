fof(c_0_10,axiom,
    ! [X6] : ~ distinct_points(X6,X6),
    inference(variable_rename,[status(thm)],[c_0_6]),
    [verified(thm)] ).
fof(c_0_15,conjecture,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]) ).
