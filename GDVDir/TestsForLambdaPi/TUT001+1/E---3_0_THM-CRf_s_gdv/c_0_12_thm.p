fof(c_0_8,axiom,
    ! [X1] :
      ( ~ city(X1)
      | ~ beautiful(X1)
      | ~ has_crime(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_6]),
    [verified(thm)] ).
fof(c_0_9,axiom,
    ! [X1] :
      ( beautiful(capital_of(X1))
      | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [verified(thm)] ).
fof(c_0_12,conjecture,
    ! [X1] :
      ( ~ has_crime(capital_of(X1))
      | ~ city(capital_of(X1))
      | ~ country(X1) ),
    inference(spm,[status(thm)],[c_0_8,c_0_9]) ).
