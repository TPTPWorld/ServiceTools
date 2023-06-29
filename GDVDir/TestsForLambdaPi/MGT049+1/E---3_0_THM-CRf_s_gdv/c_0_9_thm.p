fof(c_0_6,axiom,
    ! [X3,X2,X1] :
      ( position(X1,X2) = position(X1,X3)
      | external_ties(X1,X2) != external_ties(X1,X3)
      | ~ organization(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_3]),
    [verified(thm)] ).
fof(c_0_7,axiom,
    ! [X3,X2,X1] :
      ( external_ties(X1,X2) = external_ties(X1,X3)
      | ~ organization(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_4]),
    [verified(thm)] ).
fof(c_0_9,conjecture,
    ! [X3,X2,X1] :
      ( position(X1,X2) = position(X1,X3)
      | ~ organization(X1) ),
    inference(csr,[status(thm)],[c_0_6,c_0_7]) ).
