fof(assumption_6,axiom,
    ! [X1,X4,X5] :
      ( organization(X1)
     => ( ( greater(external_ties(X1,X5),external_ties(X1,X4))
         => greater(position(X1,X5),position(X1,X4)) )
        & ( external_ties(X1,X5) = external_ties(X1,X4)
         => position(X1,X5) = position(X1,X4) ) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',assumption_6),
    [verified(leaf)] ).
fof(assumption_11,axiom,
    ! [X1,X4,X5] :
      ( organization(X1)
     => external_ties(X1,X5) = external_ties(X1,X4) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',assumption_11),
    [verified(leaf)] ).
