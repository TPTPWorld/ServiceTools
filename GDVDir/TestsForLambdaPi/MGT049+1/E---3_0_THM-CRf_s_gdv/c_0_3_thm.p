fof(assumption_6,axiom,
    ! [X1,X4,X5] :
      ( organization(X1)
     => ( ( greater(external_ties(X1,X5),external_ties(X1,X4))
         => greater(position(X1,X5),position(X1,X4)) )
        & ( external_ties(X1,X5) = external_ties(X1,X4)
         => position(X1,X5) = position(X1,X4) ) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',assumption_6),
    [verified(leaf)] ).
fof(c_0_3,conjecture,
    ! [X9,X10,X11] :
      ( ( ~ greater(external_ties(X9,X11),external_ties(X9,X10))
        | greater(position(X9,X11),position(X9,X10))
        | ~ organization(X9) )
      & ( external_ties(X9,X11) != external_ties(X9,X10)
        | position(X9,X11) = position(X9,X10)
        | ~ organization(X9) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[assumption_6])])]) ).
