fof(query_0009_0009,axiom,
    ! [Y,X] :
      ( ~ truth(isa(asked,X))
      | ~ truth(isa(other,Y)) ) ).
fof(query,conjecture,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',query) ).
