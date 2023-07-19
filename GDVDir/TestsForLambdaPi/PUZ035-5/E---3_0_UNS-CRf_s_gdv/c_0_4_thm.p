fof(c_0_2,axiom,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    query,
    [verified(thm)] ).
fof(c_0_3,axiom,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    everyone_a_knight_or_knave,
    [verified(thm)] ).
fof(c_0_4,conjecture,
    ! [X1] : ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]) ).
