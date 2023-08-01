fof(c_0_12,axiom,
    ! [X1] :
      ( ~ has_crime(capital_of(X1))
      | ~ city(capital_of(X1))
      | ~ country(X1) ),
    inference(spm,[status(thm)],[c_0_8,c_0_9]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_13,axiom,
    ! [X1] :
      ( has_crime(X1)
      | ~ big_city(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_14,axiom,
    ! [X1] :
      ( city(X1)
      | ~ big_city(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_11]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_16,conjecture,
    ! [X1] :
      ( ~ big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_12,c_0_13]),c_0_14]),
    [nnpp(c_0_5)] ).
