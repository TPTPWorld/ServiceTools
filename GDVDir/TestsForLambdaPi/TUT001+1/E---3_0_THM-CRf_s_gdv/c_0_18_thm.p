fof(c_0_15,axiom,
    ! [X1] :
      ( big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_16,axiom,
    ! [X1] :
      ( ~ big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_12,c_0_13]),c_0_14]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_18,conjecture,
    ! [X1] : ~ country(X1),
    inference(csr,[status(thm)],[c_0_15,c_0_16]),
    [nnpp(c_0_5)] ).
