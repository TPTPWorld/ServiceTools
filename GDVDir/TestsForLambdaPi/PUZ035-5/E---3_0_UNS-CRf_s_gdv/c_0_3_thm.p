fof(everyone_a_knight_or_knave,axiom,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',everyone_a_knight_or_knave) ).
fof(c_0_3,conjecture,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    everyone_a_knight_or_knave ).
