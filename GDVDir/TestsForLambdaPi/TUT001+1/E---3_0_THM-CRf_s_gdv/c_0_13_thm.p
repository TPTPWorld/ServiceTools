fof(c_0_10,axiom,
    ! [X3] :
      ( ~ big_city(X3)
      | has_crime(X3) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[crime_axiom])]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_13,conjecture,
    ! [X1] :
      ( has_crime(X1)
      | ~ big_city(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [nnpp(c_0_5)] ).
