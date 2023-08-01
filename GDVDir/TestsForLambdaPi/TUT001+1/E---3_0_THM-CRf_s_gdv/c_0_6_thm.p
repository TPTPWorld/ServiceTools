fof(c_0_5,axiom,
    ~ ? [X1] :
        ( city(X1)
        & beautiful(X1)
        & has_crime(X1) ),
    inference(assume_negation,[status(cth)],[some_beautiful_crime]),
    [nnpp(c_0_5),verified(cth)] ).
fof(c_0_6,conjecture,
    ! [X2] :
      ( ~ city(X2)
      | ~ beautiful(X2)
      | ~ has_crime(X2) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])]),
    [nnpp(c_0_5)] ).
