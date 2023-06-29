fof(c_0_9,axiom,
    ! [X3,X2,X1] :
      ( position(X1,X2) = position(X1,X3)
      | ~ organization(X1) ),
    inference(csr,[status(thm)],[c_0_6,c_0_7]),
    [verified(thm)] ).
fof(c_0_10,axiom,
    organization(esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_12,conjecture,
    ! [X2,X1] : position(esk1_0,X1) = position(esk1_0,X2),
    inference(spm,[status(thm)],[c_0_9,c_0_10]) ).
