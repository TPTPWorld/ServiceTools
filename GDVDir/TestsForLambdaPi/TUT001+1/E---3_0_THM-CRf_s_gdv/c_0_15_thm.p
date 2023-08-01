fof(c_0_7,axiom,
    ! [X4] :
      ( ( big_city(capital_of(X4))
        | ~ country(X4) )
      & ( beautiful(capital_of(X4))
        | ~ country(X4) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[country_big_city])])]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_15,conjecture,
    ! [X1] :
      ( big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [nnpp(c_0_5)] ).
