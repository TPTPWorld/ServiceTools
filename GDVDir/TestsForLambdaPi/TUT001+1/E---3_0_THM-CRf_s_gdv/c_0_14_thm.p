fof(c_0_11,axiom,
    ! [X5] :
      ( ~ big_city(X5)
      | city(X5) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[big_city_city])]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_14,conjecture,
    ! [X1] :
      ( city(X1)
      | ~ big_city(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_11]),
    [nnpp(c_0_5)] ).
