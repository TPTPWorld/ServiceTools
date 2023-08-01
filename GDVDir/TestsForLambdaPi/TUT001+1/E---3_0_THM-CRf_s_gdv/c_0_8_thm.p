fof(c_0_6,axiom,
    ! [X2] :
      ( ~ city(X2)
      | ~ beautiful(X2)
      | ~ has_crime(X2) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_8,conjecture,
    ! [X1] :
      ( ~ city(X1)
      | ~ beautiful(X1)
      | ~ has_crime(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_6]),
    [nnpp(c_0_5)] ).
