fof(definition_smaller_or_equal,axiom,
    ! [X,Y] :
      ( smaller_or_equal(X,Y)
    <=> ( smaller(X,Y)
        | X = Y ) ) ).
fof(definition_greater_or_equal,axiom,
    ! [X,Y] :
      ( greater_or_equal(X,Y)
    <=> ( greater(X,Y)
        | X = Y ) ) ).
fof(definition_smaller,axiom,
    ! [X,Y] :
      ( smaller(X,Y)
    <=> greater(Y,X) ) ).
fof(meaning_postulate_greater_strict,axiom,
    ! [X,Y] :
      ~ ( greater(X,Y)
        & greater(Y,X) ) ).
fof(meaning_postulate_greater_transitive,axiom,
    ! [X,Y,Z] :
      ( ( greater(X,Y)
        & greater(Y,Z) )
     => greater(X,Z) ) ).
fof(meaning_postulate_greater_comparable,axiom,
    ! [X,Y] :
      ( smaller(X,Y)
      | X = Y
      | greater(X,Y) ) ).
fof(assumption_6,axiom,
    ! [X,T0,T] :
      ( organization(X)
     => ( ( greater(external_ties(X,T),external_ties(X,T0))
         => greater(position(X,T),position(X,T0)) )
        & ( external_ties(X,T) = external_ties(X,T0)
         => position(X,T) = position(X,T0) ) ) ) ).
fof(assumption_11,axiom,
    ! [X,T0,T] :
      ( organization(X)
     => external_ties(X,T) = external_ties(X,T0) ) ).
fof(assumption_6,conjecture,
    ! [X1,X4,X5] :
      ( organization(X1)
     => ( ( greater(external_ties(X1,X5),external_ties(X1,X4))
         => greater(position(X1,X5),position(X1,X4)) )
        & ( external_ties(X1,X5) = external_ties(X1,X4)
         => position(X1,X5) = position(X1,X4) ) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',assumption_6) ).