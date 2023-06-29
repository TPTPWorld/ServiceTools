fof(assumption_11,axiom,
    ! [X1,X4,X5] :
      ( organization(X1)
     => external_ties(X1,X5) = external_ties(X1,X4) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',assumption_11),
    [verified(leaf)] ).
fof(c_0_4,conjecture,
    ! [X17,X18,X19] :
      ( ~ organization(X17)
      | external_ties(X17,X19) = external_ties(X17,X18) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[assumption_11])]) ).
