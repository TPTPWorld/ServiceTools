fof(c_0_4,axiom,
    ! [X1] : ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]),
    [verified(thm)] ).
fof(c_0_3,axiom,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    everyone_a_knight_or_knave,
    [verified(thm)] ).
fof(c_0_5,conjecture,
    $false,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_4,c_0_3]),c_0_4]),
    [proof] ).
