fof(lemma_6,axiom,
    ! [X,T0,T] :
      ( ( organization(X)
        & greater(age(X,T),age(X,T0)) )
     => position(X,T) = position(X,T0) ) ).
fof(lemma_6,conjecture,
    ! [X1,X4,X5] :
      ( ( organization(X1)
        & greater(age(X1,X5),age(X1,X4)) )
     => position(X1,X5) = position(X1,X4) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',lemma_6) ).
