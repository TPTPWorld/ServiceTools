fof(c_0_4,axiom,
    ! [X17,X18,X19] :
      ( ~ organization(X17)
      | external_ties(X17,X19) = external_ties(X17,X18) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[assumption_11])]),
    [verified(thm)] ).
fof(c_0_7,conjecture,
    ! [X3,X2,X1] :
      ( external_ties(X1,X2) = external_ties(X1,X3)
      | ~ organization(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_4]) ).
