fof(everyone_a_knight_or_knave_0001,axiom,
    ! [P] :
      ( truth(isa(P,knight))
      | truth(isa(P,knave)) ) ).
fof(not_both_a_knight_and_knave_0002,axiom,
    ! [P] :
      ( ~ truth(isa(P,knight))
      | ~ truth(isa(P,knave)) ) ).
fof(knights_make_true_statements1_0003,axiom,
    ! [P,S] :
      ( truth(S)
      | ~ truth(isa(P,knight))
      | ~ says(P,S) ) ).
fof(knights_make_true_statements2_0004,axiom,
    ! [S,P] :
      ( truth(isa(P,knight))
      | ~ truth(S)
      | ~ says(P,S) ) ).
fof(or1_0005,axiom,
    ! [B,A] :
      ( truth(A)
      | truth(B)
      | ~ truth(or(A,B)) ) ).
fof(or2_0006,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(A) ) ).
fof(or3_0007,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(B) ) ).
fof(says_yes_0008,axiom,
    says(asked,or(isa(asked,knight),isa(other,knight))) ).
