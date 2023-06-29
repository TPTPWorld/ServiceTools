fof(query,axiom,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',query),
    [verified(leaf)] ).
fof(c_0_2,conjecture,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    query ).
