fof(c_0_17,axiom,
    country(usa),
    inference(split_conjunct,[status(thm)],[country_usa]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_18,axiom,
    ! [X1] : ~ country(X1),
    inference(csr,[status(thm)],[c_0_15,c_0_16]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_19,conjecture,
    $false,
    inference(sr,[status(thm)],[c_0_17,c_0_18]),
    [proof,nnpp(c_0_5)] ).
