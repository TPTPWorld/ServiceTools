fof(c_0_7,axiom,
    ! [X9,X10,X11] :
      ( ~ distinct_points(X9,X10)
      | distinct_points(X9,X11)
      | distinct_points(X10,X11) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[apart4])]),
    [verified(thm)] ).
fof(c_0_11,conjecture,
    ! [X2,X3,X1] :
      ( distinct_points(X1,X3)
      | distinct_points(X2,X3)
      | ~ distinct_points(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).
