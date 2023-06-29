fof(lemma_6,axiom,
    ! [X1,X4,X5] :
      ( ( organization(X1)
        & greater(age(X1,X5),age(X1,X4)) )
     => position(X1,X5) = position(X1,X4) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',lemma_6),
    [verified(leaf)] ).
fof(c_0_5,conjecture,
    ~ ~ ! [X1,X4,X5] :
          ( ( organization(X1)
            & greater(age(X1,X5),age(X1,X4)) )
         => position(X1,X5) = position(X1,X4) ),
    inference(assume_negation,[status(cth)],[lemma_6]) ).
