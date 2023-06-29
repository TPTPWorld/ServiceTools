fof(c_0_3,axiom,
    ! [X9,X10,X11] :
      ( ( ~ greater(external_ties(X9,X11),external_ties(X9,X10))
        | greater(position(X9,X11),position(X9,X10))
        | ~ organization(X9) )
      & ( external_ties(X9,X11) != external_ties(X9,X10)
        | position(X9,X11) = position(X9,X10)
        | ~ organization(X9) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[assumption_6])])]),
    [verified(thm)] ).
fof(c_0_6,conjecture,
    ! [X3,X2,X1] :
      ( position(X1,X2) = position(X1,X3)
      | external_ties(X1,X2) != external_ties(X1,X3)
      | ~ organization(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).
